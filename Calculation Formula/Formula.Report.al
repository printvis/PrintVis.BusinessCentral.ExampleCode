// This is an example of a formula report (it could also be made as a codeunit)
Report 69005 "PTE Example Formula"
{

    Caption = 'PrintVis Example Formula Report';
    ProcessingOnly = true;
    ShowPrintStatus = false;
    UseRequestPage = false;

    trigger OnPreReport()
    begin
        SingleInstance.Get_Current_CalcUnitDetailRec(JobCalculationDetail); // Get the Current Calc. Detail record

        // only use this if needed - this can take performance if formula is called many times
        // SingleInstance.Get_CalcUnitDetailsRecTmp(JobCalculationDetailTemp); // Maybe get all the Calc. Detail records if needed
        // SingleInstance.Get_SheetRecTmp(JobSheetTemp); // Use this if you need information from the sheet
        // SingleInstance.Get_JobProcessTemp(JobProcessTemp); // Use this if you need information from the process
        // SingleInstance.Get_JobItemRecTmp(JobItemTemp);

        JobCalculationDetail."Qty. Calculated" := 0; // Clear the field to be calculated

        // If the same report is used for multible formulas:

        case JobCalculationDetail."Formula Code" of
            // Example Formulas
            1000:
                Formula_1000();
            1001:
                Formula_1001();
            1002:
                Formula_1002();

            // Label Demo Company Formulas
            1060:
                Formula_1060(); // Inks
            1062:
                Formula_1062(); // Inks 2
            1064:
                Formula_1064(); // Inks 3
            1065:
                Formula_1065(); // Mark Andy Tool
            1070:
                Formula_1070(); // Paper
            1075:
                Formula_1075(); // No. of Inks
            1080:
                Formula_1080(); // No. of Substrates
            1084:
                Formula_1084(); // Number of substrates with colors on the Backside
            1090:
                Formula_1090(); // Label Caliper
            1092:
                Formula_1092(); // JobItemWeight
            1095:
                Formula_1095(); // Outside Diameter
            1450:
                Formula_1450(); // Outside Diameter
            1900:
                Formula_1900(); // Changes on jobitem
        end;

        SingleInstance.Set_Current_CalcUnitDetailRec(JobCalculationDetail); // Push back the result
    end;

    var
        JobItemTemp: Record "PVS Job Item" temporary;
        JobSheetTemp: Record "PVS Job Sheet" temporary;
        JobProcessTemp: Record "PVS Job Process" temporary;
        JobCalculationDetail: Record "PVS Job Calculation Detail";
        JobCalculationDetailTemp: Record "PVS Job Calculation Detail" temporary;
        SingleInstance: Codeunit "PVS SingleInstance";

    local procedure Formula_1000()
    var
        Job: Record "PVS Job";
    begin
        // Find the job quantity (same result as formula 1)

        if Job.Get(JobCalculationDetail.ID, JobCalculationDetail.Job, JobCalculationDetail.Version) then
            JobCalculationDetail."Qty. Calculated" := Job.Quantity; // Assign value
    end;

    local procedure Formula_1001()
    begin
        // Find the sum of quantity of all calculationlines with 'PVS' in "Formula Class"
        // (could be done by setup of af formula of the type "Lookup")

        JobCalculationDetailTemp.SetFilter("Formula Class", 'XX');
        if JobCalculationDetailTemp.FindSet() then
            repeat
                JobCalculationDetail."Qty. Calculated" := JobCalculationDetail."Qty. Calculated" + JobCalculationDetailTemp.Quantity;
            until JobCalculationDetailTemp.Next() = 0;
    end;

    local procedure Formula_1002()
    var
        PaperItem: Record Item;
        Local_Job: Record "PVS Job";
        Dummy_PriceUnit: Record "PVS Job Calculation Unit";
        UnitConversion: Codeunit "PVS Unit Conversion";
        CalcMgt: Codeunit "PVS Formula Management";
        Factor: Decimal;
        Quantity_Result: Decimal;
    begin
        // This formula will work as a combination of formula 14, 240, 250 and 260
        // The item no. on the calc. line will be changed to the paper no. from the sheet
        // depending on the price unit on the paper, the quantity will be calculated in either pcs, weight etc.
        // The example also shows how the value of a standard formula to be retrieved

        if not JobSheetTemp.Get(JobCalculationDetail."Sheet ID") then
            exit;

        if not PaperItem.Get(JobSheetTemp."Paper Item No.") then
            exit;

        if not JobProcessTemp.Get(JobSheetTemp."First Process ID") then
            exit;

        // This will change the item no. on the calc. line
        JobCalculationDetail."Item No." := PaperItem."No.";

        // This will get the result of formula 16 (amount of paper - same as formula 14 but without changing the item no.)
        if not CalcMgt.Standard_Formula_Rutine(16, JobCalculationDetail, Dummy_PriceUnit, Local_Job, JobSheetTemp, JobProcessTemp, false) then
            exit;

        Quantity_Result := JobCalculationDetail."Qty. Calculated";

        // Now the amount is transformed into weight, area or lenght

        case PaperItem."PVS Price Unit" of
            2:
                begin
                    // Weight of paper with scrap
                    // Calculate Area
                    Quantity_Result := JobSheetTemp."Full Sheet Format 1" * JobSheetTemp."Full Sheet Format 2" * Quantity_Result;

                    // Transform from area to weight
                    Factor :=
                      UnitConversion.Weight2SqFormat(JobSheetTemp.Weight, JobSheetTemp."Weight Unit", JobSheetTemp."Full Sheet Format 1", JobSheetTemp."Full Sheet Format 2");
                    if Factor = 0 then
                        Quantity_Result := 0
                    else
                        Quantity_Result := Quantity_Result / Factor;
                end;

            3:
                // Area of paper with scrap
                // Calculate Area
                Quantity_Result := JobSheetTemp."Full Sheet Format 1" * JobSheetTemp."Full Sheet Format 2" * Quantity_Result;
            4:
                // Lenght of paper with scrap
                Quantity_Result := JobSheetTemp."Print Sheet" * JobSheetTemp.Length / UnitConversion.Lenght2Format() * Quantity_Result;
        end;

        JobCalculationDetail."Qty. Calculated" := Quantity_Result;

        // This will change the unit on the calc. line IF the unit on the user formula is set to "Custom"
        JobCalculationDetail.Unit := PaperItem."PVS Price Unit";
    end;

    local procedure "--Label-Demo-Company-Formulas--"()
    begin
        // FORMULAS BELOW ARE USED IN THE DEMO LABEL COMPANY
    end;

    local procedure Formula_1060()
    var
        Item: Record Item;
        ItemTmp: Record Item temporary;
        High: Integer;
    begin
        if JobCalculationDetail."Process ID" = 0 then
            exit;

        SingleInstance.Get_CalcUnitDetailsRecTmp(JobCalculationDetailTemp);
        JobCalculationDetailTemp.SetRange("Process ID", JobCalculationDetail."Process ID");
        JobCalculationDetailTemp.SetRange("Line Type", JobCalculationDetailTemp."line type"::Normal);
        JobCalculationDetailTemp.SetRange(Type, JobCalculationDetailTemp.Type::Material);
        JobCalculationDetailTemp.SetRange("Item Type", JobCalculationDetailTemp."item type"::Ink);
        if JobCalculationDetailTemp.FindSet() then
            repeat
                if JobCalculationDetailTemp."Item No." <> '' then begin
                    ItemTmp."No." := JobCalculationDetailTemp."Item No.";
                    if ItemTmp.Insert() then;
                end;
            until JobCalculationDetailTemp.Next() = 0;

        High := 0;
        if ItemTmp.FindFirst() then
            repeat
                if Item.Get(ItemTmp."No.") then begin
                    case Item."PVS Item Quality Code" of
                        '', 'UV_COATING_GLOSS', 'WB_INK_CUSTOM', 'WB_INK_NON_STD', 'WB_INK_STD', 'WB_PRIMER', 'UV_INK_ADDITIVE', 'WB_INK_ADDITIVE':
                            if High < 1 then
                                High := 1;

                        'UV_INK_CUSTOM', 'UV_INK_NON_STD', 'UV_INK_STD':
                            if High < 2 then
                                High := 2;
                        'UV_COATING_OTHER', 'UV_INK_PREMIUM', 'WB_VARNISH':
                            if High < 3 then
                                High := 3;
                        'WB_INK_PREMIUM':
                            if High < 4 then
                                High := 4;
                        'UV_RELEASE', 'UV_PRIMER':
                            if High < 5 then
                                High := 5;
                        'WB_ADH_FOLDOUT', 'WB_ADH_DEADENER':
                            if High < 6 then
                                High := 6;
                        'UV_COAT_IMPRINTABLE':
                            if High < 7 then
                                High := 7;
                        'UV_LAMINATE_ADHESIVE', 'UV_PSA_ADHESIVE', 'WB_ADHESIVE_IRC':
                            High := 8;
                        'UV_ADH_DEADENER', 'HOTMELT_ADH', 'SOLVENT_INK':
                            High := 9;
                    end;
                end;
            until ItemTmp.Next() = 0;

        JobCalculationDetail."Qty. Calculated" := High;
    end;

    local procedure Formula_1070()
    var
        Item: Record Item;
        ItemTmp: Record Item temporary;
        High: Integer;
    begin
        if JobCalculationDetail."Process ID" = 0 then
            exit;

        SingleInstance.Get_CalcUnitDetailsRecTmp(JobCalculationDetailTemp);
        JobCalculationDetailTemp.SetRange("Process ID", JobCalculationDetail."Process ID");
        JobCalculationDetailTemp.SetRange("Line Type", JobCalculationDetailTemp."line type"::Normal);
        JobCalculationDetailTemp.SetRange(Type, JobCalculationDetailTemp.Type::Material);
        JobCalculationDetailTemp.SetRange("Item Type", JobCalculationDetailTemp."item type"::Paper);
        if JobCalculationDetailTemp.FindSet() then
            repeat
                if JobCalculationDetailTemp."Item No." <> '' then begin
                    ItemTmp."No." := JobCalculationDetailTemp."Item No.";
                    if ItemTmp.Insert() then;
                end;
            until JobCalculationDetailTemp.Next() = 0;

        High := 0;
        if ItemTmp.FindFirst() then
            repeat
                if Item.Get(ItemTmp."No.") then begin
                    case Item."PVS Item Quality Code" of
                        'DIRECTTHERMAL', 'HIGLOSS', 'LITHO', 'MIDGLOSS', 'SEMIGLOSS', 'SMUDGEPROOF', 'THERMALTRANSFER', 'FLUORESCENT',
                      'HOLOGRAPHIC', 'KRAFT', 'LASER', 'PIGGYBACK_FILM_MID', 'PIGGYBACK_PAPER_MID':
                            if High < 1 then
                                High := 1;
                        'BOPP', 'PLA', 'POLYESTER', 'POLYETHYLENE', 'FELT', 'POLYSTYRENE', 'POLYOLEFIN', 'VINYL_PS', 'METAL_BRIGHT',
                      'METAL_DULL', 'TYVEK_MATTE', 'TYVEK_GLOSS', 'MDO', 'HOT_STAMP_FOIL', 'VINYL_CLING', 'COLD_FOIL', 'SYNTH_TAG_GLOSS', 'SYNTH_TAG_MATTE':
                            if High < 2 then
                                High := 2;
                        'TAG':
                            if High < 3 then
                                High := 3;
                        'METAL_F_BRIGHT', 'METAL_F_DULL':
                            if High < 4 then
                                High := 4;
                        'MAGNETIC':
                            High := 5;
                    end;
                end;
            until ItemTmp.Next() = 0;

        JobCalculationDetail."Qty. Calculated" := High;
    end;

    local procedure Formula_1062()
    var
        Item: Record Item;
        ItemTmp: Record Item temporary;
        High: Integer;
    begin
        if JobCalculationDetail."Process ID" = 0 then
            exit;

        SingleInstance.Get_CalcUnitDetailsRecTmp(JobCalculationDetailTemp);
        JobCalculationDetailTemp.SetRange("Process ID", JobCalculationDetail."Process ID");
        JobCalculationDetailTemp.SetRange("Line Type", JobCalculationDetailTemp."line type"::Normal);
        JobCalculationDetailTemp.SetRange(Type, JobCalculationDetailTemp.Type::Material);
        JobCalculationDetailTemp.SetRange("Item Type", JobCalculationDetailTemp."item type"::Ink);
        if JobCalculationDetailTemp.FindSet() then
            repeat
                if JobCalculationDetailTemp."Item No." <> '' then begin
                    ItemTmp."No." := JobCalculationDetailTemp."Item No.";
                    if ItemTmp.Insert() then;
                end;
            until JobCalculationDetailTemp.Next() = 0;

        High := 0;
        if ItemTmp.FindFirst() then
            repeat
                if Item.Get(ItemTmp."No.") then begin
                    case Item."PVS Item Quality Code" of
                        'UV_COATING_GLOSS':
                            if High < 1 then
                                High := 1;
                        'WB_INK_STD', 'WB_PRIMER':
                            if High < 2 then
                                High := 2;
                        'WB_INK_NON_STD':
                            if High < 3 then
                                High := 3;
                        'WB_VARNISH', 'WB_INK_PREMIUM':
                            if High < 4 then
                                High := 4;
                        'UV_INK_STD', 'WB_ADH_FOLDOUT', 'WB_ADHESIVE_IRC':
                            if High < 5 then
                                High := 5;
                        'WB_INK_CUSTOM', 'UV_INK_NON_STD', 'UV_COATING_OTHER', 'UV_INK_PREMIUM', 'UV_RELEASE',
                      'UV_COAT_IMPRINTABLE', 'UV_PSA_ADHESIVE', 'UV_PRIMER', 'UV_INK_ADDITIVE', 'WB_INK_ADDITIVE':
                            if High < 6 then
                                High := 6;
                        'UV_INK_CUSTOM', 'WB_ADH_DEADENER', 'UV_LAMINATE_ADHESIVE':
                            if High < 7 then
                                High := 7;
                        'UV_ADH_DEADENER', 'HOTMELT_ADH', 'SOLVENT_INK':
                            if High < 8 then
                                High := 8;
                    end;
                end;
            until ItemTmp.Next() = 0;

        JobCalculationDetail."Qty. Calculated" := High;
    end;

    local procedure Formula_1064()
    var
        Item: Record Item;
        ItemTmp: Record Item temporary;
        High: Integer;
    begin
        if JobCalculationDetail."Process ID" = 0 then
            exit;

        SingleInstance.Get_CalcUnitDetailsRecTmp(JobCalculationDetailTemp);
        JobCalculationDetailTemp.SetRange("Process ID", JobCalculationDetail."Process ID");
        JobCalculationDetailTemp.SetRange("Line Type", JobCalculationDetailTemp."line type"::Normal);
        JobCalculationDetailTemp.SetRange(Type, JobCalculationDetailTemp.Type::Material);
        JobCalculationDetailTemp.SetRange("Item Type", JobCalculationDetailTemp."item type"::Ink);
        if JobCalculationDetailTemp.FindSet() then
            repeat
                if JobCalculationDetailTemp."Item No." <> '' then begin
                    ItemTmp."No." := JobCalculationDetailTemp."Item No.";
                    if ItemTmp.Insert() then;
                end;
            until JobCalculationDetailTemp.Next() = 0;

        High := 0;
        if ItemTmp.FindFirst() then
            repeat
                if Item.Get(ItemTmp."No.") then begin
                    case Item."PVS Item Quality Code" of
                        'UV_COATING_GLOSS', 'UV_INK_ADDITIVE', 'WB_INK_ADDITIVE':
                            if High < 1 then
                                High := 1;
                        'WB_INK_STD', 'WB_PRIMER', 'WB_INK_NON_STD', 'WB_INK_CUSTOM':
                            if High < 2 then
                                High := 2;
                        'WB_VARNISH', 'WB_INK_PREMIUM', 'WB_ADH_FOLDOUT', 'WB_ADHESIVE_IRC', 'WB_ADH_DEADENER':
                            if High < 3 then
                                High := 3;
                        'UV_COATING_OTHER', 'UV_RELEASE', 'UV_COAT_IMPRINTABLE', 'UV_PSA_ADHESIVE', 'UV_PRIMER':
                            if High < 4 then
                                High := 4;
                        'UV_INK_STD', 'UV_INK_NON_STD', 'UV_INK_CUSTOM':
                            if High < 5 then
                                High := 5;
                        'UV_LAMINATE_ADHESIVE':
                            if High < 6 then
                                High := 6;
                        'UV_INK_PREMIUM':
                            if High < 7 then
                                High := 7;
                        'UV_ADH_DEADENER', 'HOTMELT_ADH', 'SOLVENT_INK':
                            High := 8;
                    end;
                end;
            until ItemTmp.Next() = 0;

        JobCalculationDetail."Qty. Calculated" := High;
    end;

    local procedure Formula_1065()
    var
        High: Integer;
    begin
        // For Mark Andy Operation 110 : No. of Tools Used for the current JobItem (1 to 3)
        if JobCalculationDetail."Sheet ID" = 0 then
            exit;

        SingleInstance.Get_JobItemRecTmp(JobItemTemp);
        JobItemTemp.SetRange("Sheet ID", JobCalculationDetail."Sheet ID");
        if not JobItemTemp.FindFirst() then
            exit;

        High := 0;
        if JobItemTemp.Tool <> '' then
            High += 1;

        if JobItemTemp."Tool 2" <> '' then
            High += 1;

        if JobItemTemp."Tool 3" <> '' then
            High += 1;

        JobCalculationDetail."Qty. Calculated" := High;
    end;

    local procedure Formula_1075()
    var
        Item: Record Item;
        Consumable: Record "PVS Job Item Color Entry";
        High: Integer;
    begin
        // 1075; No of Inks from the Inks/Consumables Page

        if JobCalculationDetail."Sheet ID" = 0 then
            exit;

        SingleInstance.Get_JobItemRecTmp(JobItemTemp);
        JobItemTemp.SetRange("Sheet ID", JobCalculationDetail."Sheet ID");
        if not JobItemTemp.FindFirst() then
            exit;

        Consumable.SetRange(ID, JobItemTemp.ID);
        Consumable.SetRange(Job, JobItemTemp.Job);
        Consumable.SetRange(Version, JobItemTemp.Version);
        Consumable.SetRange("Job Item No.", JobItemTemp."Job Item No.");

        High := 0;
        if Consumable.FindSet(false, false) then
            repeat
                if Item.Get(Consumable."Item No.") then
                    if Item."PVS Item Type" = Item."pvs item type"::Ink then
                        High += 1;
            until Consumable.Next() = 0;

        JobCalculationDetail."Qty. Calculated" := High;
    end;

    local procedure Formula_1080()
    var
        Item: Record Item;
        Consumable: Record "PVS Job Item Color Entry";
        High: Integer;
    begin
        // 1080; No of Paper-lines from the Consumables Page

        if JobCalculationDetail."Sheet ID" = 0 then
            exit;

        SingleInstance.Get_JobItemRecTmp(JobItemTemp);
        JobItemTemp.SetRange("Sheet ID", JobCalculationDetail."Sheet ID");
        if not JobItemTemp.FindFirst() then
            exit;

        Consumable.SetRange(ID, JobItemTemp.ID);
        Consumable.SetRange(Job, JobItemTemp.Job);
        Consumable.SetRange(Version, JobItemTemp.Version);
        Consumable.SetRange("Job Item No.", JobItemTemp."Job Item No.");

        High := 0;
        if Consumable.FindSet(false, false) then
            repeat
                if Item.Get(Consumable."Item No.") then
                    if Item."PVS Item Type" = Item."pvs item type"::Paper then
                        High += 1;
            until Consumable.Next() = 0;

        JobCalculationDetail."Qty. Calculated" := High;
    end;

    local procedure Formula_1084()
    var
        Item: Record Item;
        Consumable: Record "PVS Job Item Color Entry";
        High: Integer;
    begin
        // Formula (# 1082) to give a count of number of substrates with colors on the Backside.
        // Web/Job Item = First substrate
        // Consumables of type Paper = one substrate each

        if JobCalculationDetail."Sheet ID" = 0 then
            exit;

        SingleInstance.Get_JobItemRecTmp(JobItemTemp);
        JobItemTemp.SetRange("Sheet ID", JobCalculationDetail."Sheet ID");
        if not JobItemTemp.FindFirst() then
            exit;

        if JobItemTemp."Colors Back" = 0 then
            High := 0
        else
            High := 1;

        Consumable.SetRange(ID, JobItemTemp.ID);
        Consumable.SetRange(Job, JobItemTemp.Job);
        Consumable.SetRange(Version, JobItemTemp.Version);
        Consumable.SetRange("Job Item No.", JobItemTemp."Job Item No.");
        Consumable.SetRange("Entry No.", JobItemTemp."Entry No.");
        Consumable.SetRange(Type, Consumable.Type::Other);

        if Consumable.FindSet(false, false) then
            repeat
                if Item.Get(Consumable."Item No.") then
                    if Item."PVS Item Type" = Item."pvs item type"::Paper then
                        if Consumable."Colors Back" <> 0 then
                            High += 1;
            until Consumable.Next() = 0;

        JobCalculationDetail."Qty. Calculated" := High;
    end;

    local procedure Formula_1090()
    begin
        // Formula (# 1082) to give a count of number of substrates with colors on the Backside.
        // Web/Job Item = First substrate
        // Consumables of type Paper = one substrate each

        if JobCalculationDetail."Sheet ID" = 0 then
            exit;

        SingleInstance.Get_JobItemRecTmp(JobItemTemp);
        JobItemTemp.SetRange("Sheet ID", JobCalculationDetail."Sheet ID");
        if not JobItemTemp.FindFirst() then
            exit;

        JobCalculationDetail."Qty. Calculated" := JobItemCaliper(JobItemTemp);
    end;

    local procedure Formula_1092()
    begin
        if JobCalculationDetail."Sheet ID" = 0 then
            exit;

        SingleInstance.Get_JobItemRecTmp(JobItemTemp);
        JobItemTemp.SetRange("Sheet ID", JobCalculationDetail."Sheet ID");
        if not JobItemTemp.FindFirst() then
            exit;

        JobCalculationDetail."Qty. Calculated" := JobItemWeight(JobItemTemp);
    end;

    local procedure Formula_1095()
    var
        CaliperValue: Decimal;
        Constant1: Decimal;
        Constant2: Decimal;
        DesiredFinishedRollQty_OP110: Decimal;
        FinishedCore_OP140: Decimal;
        StepAround: Decimal;
        Value1: Decimal;
        Value2: Decimal;
        Value3: Decimal;
        Value4: Decimal;
    begin
        if JobCalculationDetail."Sheet ID" = 0 then
            exit;

        if JobCalculationDetail."Process ID" = 0 then
            exit;

        SingleInstance.Get_JobItemRecTmp(JobItemTemp);
        JobItemTemp.SetRange("Sheet ID", JobCalculationDetail."Sheet ID");
        if not JobItemTemp.FindFirst() then
            exit;

        SingleInstance.Get_SheetRecTmp(JobSheetTemp);
        JobSheetTemp.SetRange("Sheet ID", JobCalculationDetail."Sheet ID");
        if not JobSheetTemp.FindFirst() then
            exit;

        // Calipger Value
        CaliperValue := JobItemCaliper(JobItemTemp);

        // Step Around
        if JobItemTemp.ImposeY <> 0 then
            StepAround := JobSheetTemp.Length / JobItemTemp.ImposeY;

        SingleInstance.Get_CalcUnitDetailsRecTmp(JobCalculationDetailTemp);
        JobCalculationDetailTemp.SetRange("Process ID", JobCalculationDetail."Process ID");
        JobCalculationDetailTemp.SetRange("Line Type", JobCalculationDetailTemp."line type"::Normal);
        JobCalculationDetailTemp.SetRange(Type, JobCalculationDetailTemp.Type::Hour);

        // Finished Core Value
        JobCalculationDetailTemp.SetRange(Operation, '140');
        if JobCalculationDetailTemp.FindSet() then
            FinishedCore_OP140 := JobCalculationDetailTemp.Quantity;

        // Finished Core Value
        JobCalculationDetailTemp.SetRange(Operation, '110');
        if JobCalculationDetailTemp.FindSet() then
            DesiredFinishedRollQty_OP110 := JobCalculationDetailTemp.Quantity;

        // Calculation
        Constant1 := 65.47;
        Constant2 := 1000;

        Value1 := (StepAround / 12) * DesiredFinishedRollQty_OP110 * CaliperValue * Constant2;
        Value2 := Constant1 * Power(FinishedCore_OP140, 2);
        Value3 := (Value1 + Value2) / Constant1;
        Value4 := Power(Value3, 1 / 2);

        if Value4 = FinishedCore_OP140 then
            JobCalculationDetail."Qty. Calculated" := 0
        else
            JobCalculationDetail."Qty. Calculated" := Value4;
    end;

    local procedure Formula_1900()
    begin
        // No. jobitems and sum of plate changes
        SingleInstance.Get_JobItemRecTmp(JobItemTemp);
        if JobItemTemp.FindFirst() then
            repeat
                JobCalculationDetail."Qty. Calculated" += (1 + JobItemTemp."Plate Changes");
            until JobItemTemp.Next() = 0;
    end;

    local procedure Formula_1450()
    var
        Caliper1000: Decimal;
        CoreOD: Decimal;
        RollOD: Decimal;
        SqCoreOD: Decimal;
        SqRollOD: Decimal;
        StepAround: Decimal;
    begin
        if JobCalculationDetail."Sheet ID" = 0 then
            exit;
        SingleInstance.Get_SheetRecTmp(JobSheetTemp);
        if not JobSheetTemp.Get(JobCalculationDetail."Sheet ID") then
            exit;

        SingleInstance.Get_JobItemRecTmp(JobItemTemp);
        JobItemTemp.SetRange("Sheet ID", JobCalculationDetail."Sheet ID");
        if not JobItemTemp.FindFirst() then
            exit;

        if JobItemTemp.ImposeY = 0 then
            exit;

        StepAround := JobSheetTemp.Length / JobItemTemp.ImposeY;
        if StepAround = 0 then
            exit;

        Caliper1000 := JobItemCaliper(JobItemTemp) * 1000;
        if Caliper1000 = 0 then
            exit;

        SingleInstance.Get_CalcUnitDetailsRecTmp(JobCalculationDetailTemp);
        JobCalculationDetailTemp.SetRange(ID, JobCalculationDetail.ID);
        JobCalculationDetailTemp.SetRange(Job, JobCalculationDetail.Job);
        JobCalculationDetailTemp.SetRange(Version, JobCalculationDetail.Version);
        JobCalculationDetailTemp.SetRange("Unit Entry No.", JobCalculationDetail."Unit Entry No.");
        JobCalculationDetailTemp.SetRange("Line Type", JobCalculationDetailTemp."line type"::Normal);
        if JobCalculationDetailTemp.FindSet() then
            repeat
                case JobCalculationDetail."Formula Class" of
                    'CORE_OD':
                        CoreOD += JobCalculationDetailTemp.Quantity;
                    'ROLL_OD':
                        RollOD += JobCalculationDetailTemp.Quantity;
                end;
            until JobCalculationDetailTemp.Next() = 0;

        SqRollOD := RollOD * RollOD;
        SqCoreOD := CoreOD * CoreOD;

        JobCalculationDetail."Qty. Calculated" := (65.47 * (SqRollOD - SqCoreOD)) / Caliper1000 * 12 / StepAround;
    end;

    local procedure JobItemCaliper(in_JobItem: Record "PVS Job Item") TotalCaliper: Decimal
    var
        Color: Record "PVS Job Item Color Entry";
        Consumable: Record "PVS Job Item Color Entry";
    begin
        in_JobItem.CalcFields("Paper Item No.");
        TotalCaliper := CalcItemCaliper(in_JobItem."Paper Item No.", in_JobItem."Liner Removed", 0);

        Color.SetRange(ID, in_JobItem.ID);
        Color.SetRange(Job, in_JobItem.Job);
        Color.SetRange(Version, in_JobItem.Version);
        Color.SetRange("Job Item No.", in_JobItem."Job Item No.");
        Color.SetRange("Entry No.", in_JobItem."Entry No.");
        Color.SetFilter(Type, '<>%1', Color.Type::Other);

        Color.SetRange("Material No.", 0);
        if Color.FindSet(false, false) then
            repeat
                TotalCaliper += CalcItemCaliper(Color."Item No.", in_JobItem."Liner Removed", 0);
            until Color.Next() = 0;

        Consumable.SetRange(ID, in_JobItem.ID);
        Consumable.SetRange(Job, in_JobItem.Job);
        Consumable.SetRange(Version, in_JobItem.Version);
        Consumable.SetRange("Job Item No.", in_JobItem."Job Item No.");
        Consumable.SetRange("Entry No.", in_JobItem."Entry No.");
        Consumable.SetRange(Type, Consumable.Type::Other);

        if Consumable.FindSet(false, false) then
            repeat
                TotalCaliper += CalcItemCaliper(Consumable."Item No.", Consumable."Liner Removed", Consumable."No. Of Panels");

                Color.SetRange("Material No.", Consumable."Line No.");
                if Color.FindSet(false, false) then
                    repeat
                        TotalCaliper += CalcItemCaliper(Color."Item No.", Consumable."Liner Removed", Consumable."No. Of Panels");
                    until Color.Next() = 0;
            until Consumable.Next() = 0;
    end;

    local procedure CalcItemCaliper(in_ItemCode: Code[20]; in_Liner: Integer; in_Panels: Integer) ItemCaliper: Decimal
    var
        Item: Record Item;
    begin
        ItemCaliper := 0;
        if in_ItemCode = '' then
            exit;

        if not Item.Get(in_ItemCode) then
            exit;

        ItemCaliper := Item."PVS Thickness";
        if ItemCaliper = 0 then
            exit;

        if in_Liner = 1 then
            ItemCaliper -= Item."PVS Ded. Middle Liner Caliper"
        else
            if in_Liner = 2 then
                ItemCaliper -= Item."PVS Ded. Base Liner Caliper";
        if in_Panels > 1 then
            ItemCaliper := ItemCaliper * in_Panels;
    end;

    local procedure JobItemWeight(in_JobItem: Record "PVS Job Item") TotalWeight: Decimal
    var
        Color: Record "PVS Job Item Color Entry";
        Consumable: Record "PVS Job Item Color Entry";
        SqFormat: Decimal;
    begin
        in_JobItem.CalcFields("Paper Item No.");
        SqFormat := in_JobItem.Length * in_JobItem.Width;
        if SqFormat = 0 then
            exit(0);

        TotalWeight := CalcItemWeight(in_JobItem."Paper Item No.", SqFormat, in_JobItem."Area Of Coverage Pct.", 0, 0);

        Color.SetRange(ID, in_JobItem.ID);
        Color.SetRange(Job, in_JobItem.Job);
        Color.SetRange(Version, in_JobItem.Version);
        Color.SetRange("Job Item No.", in_JobItem."Job Item No.");
        Color.SetRange("Entry No.", in_JobItem."Entry No.");
        Color.SetFilter(Type, '<>%1', Color.Type::Other);

        Color.SetRange("Material No.", 0);
        if Color.FindSet(false, false) then
            repeat
                TotalWeight += CalcItemWeight(Color."Item No.", SqFormat, in_JobItem."Area Of Coverage Pct.", Color."Coverage Pct.", 0);
            until Color.Next() = 0;

        Consumable.SetRange(ID, in_JobItem.ID);
        Consumable.SetRange(Job, in_JobItem.Job);
        Consumable.SetRange(Version, in_JobItem.Version);
        Consumable.SetRange("Job Item No.", in_JobItem."Job Item No.");
        Consumable.SetRange("Entry No.", in_JobItem."Entry No.");
        Consumable.SetRange(Type, Consumable.Type::Other);

        if Consumable.FindSet(false, false) then
            repeat
                TotalWeight += CalcItemWeight(Consumable."Item No.", SqFormat, Consumable."Area of coverage Pct.", 0, Consumable."No. Of Panels");

                Color.SetRange("Material No.", Consumable."Line No.");
                if Color.FindSet(false, false) then
                    repeat
                        TotalWeight += CalcItemWeight(Color."Item No.", SqFormat, Consumable."Area of coverage Pct.", Color."Coverage Pct.", Consumable."No. Of Panels");
                    until Color.Next() = 0;
            until Consumable.Next() = 0;
    end;

    local procedure CalcItemWeight(in_ItemCode: Code[20]; in_SquareFormat: Decimal; in_AreaCoverage: Decimal; in_InkCoverage: Decimal; in_Panels: Integer) ItemWeight: Decimal
    var
        Item: Record Item;
        UnitConversion: Codeunit "PVS Unit Conversion";
        Factor: Decimal;
        SqFormat: Decimal;
    begin
        ItemWeight := 0;
        if in_ItemCode = '' then
            exit;

        if not Item.Get(in_ItemCode) then
            exit;

        if in_AreaCoverage <> 0 then
            SqFormat := in_SquareFormat * in_AreaCoverage / 100;

        if in_Panels <> 0 then
            SqFormat := in_SquareFormat * in_Panels;

        if Item."PVS Item Type" = Item."pvs item type"::Ink then begin
            if Item."PVS Ink Coverage Area/Weight" <> 0 then begin
                if in_InkCoverage <> 0 then
                    SqFormat := in_SquareFormat * in_InkCoverage / 100;
                Factor := UnitConversion.Area2SqFormat();
                if Factor <> 0 then
                    ItemWeight := SqFormat / Factor / Item."PVS Ink Coverage Area/Weight";
                ItemWeight := ItemWeight * (100 - Item."PVS Ink Evaporation Pct.") / 100;
            end;
        end else begin
            Factor := UnitConversion.Weight2SqFormat(Item."PVS Weight", Item."PVS Weight Unit", Item."PVS Format 1", Item."PVS Format 2");
            if Factor <> 0 then
                ItemWeight := SqFormat / Factor;
        end;
    end;
}

