Report 69003 "PTE Ex. Case Status Trigger"
{
    Caption = 'PrintVis Example Case Status Trigger';
    ProcessingOnly = true;

    dataset
    {
        dataitem("PVS Case"; "PVS Case")
        {
            DataItemTableView = sorting(ID);


            trigger OnAfterGetRecord()
            begin
                Trigger_Status("PVS Case");
                CurrReport.Break();
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        SingleInstance: Codeunit "PVS SingleInstance";

    procedure Trigger_Status(var in_OrderRec: Record "PVS Case")
    var
        StatusCode_New: Code[20];
        StatusCode_Old: Code[20];
    begin
        // Get the Status Code Rec before the status code change (current Case Rec)
        StatusCode_Old := in_OrderRec."Status Code";

        // Get the Status Code Rec after the status code change but before the Case is modified
        StatusCode_New := SingleInstance.Get_New_StatusCode();

        // do something here...
    end;
}

