// When this report is called from the Copy function, these parameters are available:
//
// SingleInstance.Set_Current_OrderID(in_From_ID);
// SingleInstance.Set_Copy_To_ID(in_To_ID);

Report 69002 "PTE Example Case Copy Trigger"
{

    Caption = 'PrintVis Example Case Copy Trigger';
    ProcessingOnly = true;
    ShowPrintStatus = false;
    UseRequestPage = false;

    dataset
    {
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

    trigger OnPreReport()
    begin
        Execute_Copy_Function();
    end;

    var
        CaseRec_From: Record "PVS Case";
        CaseRec_To: Record "PVS Case";
        SingleInstance: Codeunit "PVS SingleInstance";

    procedure Execute_Copy_Function()
    begin
        // Get case from and to
        SingleInstance.Get_Current_OrderID(CaseRec_From.ID);
        if (CaseRec_From.ID = 0) or (not CaseRec_From.Get(CaseRec_From.ID)) then
            exit;

        CaseRec_To.ID := SingleInstance.Get_Copy_To_ID();
        if (CaseRec_To.ID = 0) or (not CaseRec_To.Get(CaseRec_To.ID)) then
            exit;

        // Perform Copy
    end;
}

