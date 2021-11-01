// This is an example of a formula codeunit

Codeunit 69001 "PTE Example Formula"
{

    trigger OnRun()
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
        end;

        SingleInstance.Set_Current_CalcUnitDetailRec(JobCalculationDetail); // Push back the result
    end;

    var
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

        SingleInstance.Get_SheetRecTmp(JobSheetTemp); // Use this if you need information from the sheet
        SingleInstance.Get_ProcessRecTmp(JobProcessTemp); // Use this if you need information from the process

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
}

