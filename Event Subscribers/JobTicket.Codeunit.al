Codeunit 69000 "PTE Example Modify JobTicket"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"PVS JobTicket Management", 'OnAfterGetReportBuffer', '', true, true)]
    local procedure OnAfterGetReportBuffer(var in_JobRec: Record "PVS Job"; var in_VERSION_COUNTER: Integer; var Out_BufferRecTmp: Record "PVS Sorting Buffer" temporary; var Result: Boolean)
    var
        FilterMgt: Codeunit "PVS Table Filters";
        JobItemRec: Record "PVS Job Item";
        ProcessRec: Record "PVS Job Process";
    begin

        exit;//Remove this when using the event;

        // the generated dataset is in Out_BufferRecTmp
        // this can now be manipulated

        // the field report section in the Buffer table describes which linetype the record will trigger in the layout
        // LineType:
        //   1 : Delimiter Line
        //   2 : Header (Department Name etc.)
        //   3 : Comment Text (Full Width)
        //   4 : Side by Side: Comment Text (Half Width) + UserFields
        //   5 : UserFields
        //   6 : Side by Side: Comment Text (Half Width) + UserFields  (Same as 4)
        //   7 : UserFields                                            (Same as 5)
        //  20 : Calc. Unit Details
        //  50 : Press - Process Head
        //  51 : Press - Process Subject Body
        //  52 : Press - Process Body
        //  55 : Press - Plate Change Head
        //  57 : Press - Plate Change Body
        //  60 : Postpress - Process Head
        //  61 : Postpress - Process Subject Body
        //  62 : Postpress - Process Body
        //  70 : Press Continuous - Process Head
        //  71 : Press Continuous - Process Subject Body
        //  72 : Press Continuous - Process Body
        //
        //  80 : Shipments

        // Depending on the line type, the buffer record will have a reference to the relevant table/record relevant for this section

        // Line Type: 20 : Calc. Unit Details
        // ------------------------------------------
        // Could have these table/record references:
        // "Report TableNo" := 6010321;
        // "Report TableID1" := CalcUnitRec."Entry No.";

        // "Report TableNo" := 6010322;
        // "Report TableID1" := CalcUnitDetailRec."Unit Entry No.";
        // "Report TableID2" := CalcUnitDetailRec."Entry No.";

        // "Report TableNo" := 6010323;
        // "Report TableID1" := PlanUnitRec."Plan ID";
        // "Report TableID2" := PlanUnitRec."Entry No.";

        // Line Type: 51 : Press - Process Subject Body
        // ------------------------------------------
        // "Report TableNo" := 6010316;
        // "Report TableID1" := JobItemRec."Job Item No.";

        // Line Type: 52 : Press - Process Body
        // ------------------------------------------
        // "Report TableNo" := 6010319;
        // "Report TableID1" := ProcesRec."Process ID";

        // Line Type: 57 : Press - Plate Change Body
        // ------------------------------------------
        // "Report TableNo" := 6010350;
        // "Report TableID1" := PlateChangesRec."Job Item No.";
        // "Report TableID2" := PlateChangesRec."Change No.";

        // Line Type: 80 : Shipments
        // ------------------------------------------
        // "Report TableNo" := 6010077;
        // "Report TableID1" := ShipmentRec.Shipment;

        // use the inspect page to see the dataset whilst working on the modification
        // Page.Run(69000, Out_BufferRecTmp);

        // in this example we want to do 3 customizations

        // 1. Add a field to the header section
        //   in this example we want to have the user who created the job somewhere in the header
        //   the first buffer record is used for the header, so we add the information for the new field there
        Out_BufferRecTmp.findfirst;
        Out_BufferRecTmp.Text15 := in_JobRec."Created By User";
        Out_BufferRecTmp.modify;
        // Now we just need to add the Filen "Details_Txt15" to the header section in the layput

        // 2. Change the Job Item Description
        //   In this example we simply want to replace the job item description generated with the description filed on the job item 
        //   The Job Item description is stored in "Text 1" in the records with section 51
        Out_BufferRecTmp.setrange("Report Section", 51);
        if Out_BufferRecTmp.findset then
            repeat
                // in the buffer record the Job Item No is stored in "Report TableID 1"
                FilterMgt.SELECT_JobItems2Job(JobItemRec, in_JobRec.ID, in_JobRec.Job, in_JobRec.Version, false);
                JobItemRec.SetRange("Job Item No.", Out_BufferRecTmp."Report TableID1");
                if JobItemRec.FindFirst() then begin
                    Out_BufferRecTmp.Text1 := JobItemRec.Description;
                    Out_BufferRecTmp.modify;
                end;
            until Out_BufferRecTmp.next = 0;
        Out_BufferRecTmp.reset;
        // No change of the layout is needed for this

        // 3. Add an extra line with more info for each printing process
        // In this example we want to add the "Created By User" as an extra line under each process description
        // the process lines are of linetype 52, so we will find these and add a new linetype below
        Out_BufferRecTmp.setrange("Report Section", 52);
        if Out_BufferRecTmp.findset then
            repeat
                // in the buffer record the ProcessID is stored in "Report TableID 1"
                if ProcessRec.get(Out_BufferRecTmp."Report TableID1") then begin
                    // Change the primary key 2 to get a new line below
                    Out_BufferRecTmp.PK1_Integer2 := 1;
                    // If one of the exsting sections in the layout can be used, you change the "Report Section" to this
                    // otherwise make a new report section value
                    Out_BufferRecTmp."Report Section" := 50000;
                    // put the values to be printed in the text fields
                    Out_BufferRecTmp.Text1 := ProcessRec."Created By User";
                    Out_BufferRecTmp.insert;
                end;
            until Out_BufferRecTmp.next = 0;
        Out_BufferRecTmp.reset;
        // In the layout you will now have to create a new section tht will be printed for "Details_Section" 50000
    end;

}

