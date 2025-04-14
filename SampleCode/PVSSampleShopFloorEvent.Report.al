Report 69009 "PVS Sample Shop Floor Event"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/PVSSampleShopFloorEvent.rdlc';
    Caption = 'PrintVis Sample Shop Floor Event';

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
        Journal_Event();
    end;

    var
        Text001: label 'Journal Entry Event. %1-%2';

    procedure Journal_Event()
    var
        Journal_EntryRec: Record "PVS Shop Floor Journal Entry";
        ShopFloor_SingleInstance: Codeunit "PVS Shop Floor Single Instance";
    begin
        // Get the Current Journal Entry from the Single Instance
        if not ShopFloor_SingleInstance.Get_Current_Entry(Journal_EntryRec) then
            exit;

        // Do something with the Current Journal Entry
        Message(Text001, Journal_EntryRec.Journal, Journal_EntryRec."Entry No.");
    end;
}

