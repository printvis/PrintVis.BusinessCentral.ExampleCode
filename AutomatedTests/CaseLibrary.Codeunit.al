codeunit 80012 "PV Case Library"
{
    procedure CreateNewCase(var CaseCard: TestPage "PVS Case Card"): Integer
    begin
        CaseCard.OpenNew();
        CaseCard.SellToNo.SetValue('10000');
        CaseCard.OrderType.SetValue('PRINTED');
        CaseCard.JobName.SetValue('Test Scenario 2000');

        // Add data to Job line 
        CaseCard.SUB_JOBS.JobField.Activate();
        CaseCard.SUB_JOBS.OrderedQty.SetValue('10000');
        CaseCard.SUB_JOBS.Pages.SetValue(32);
        CaseCard.SUB_JOBS.FormatCode.SetValue('8.5x11');
        CaseCard.SUB_JOBS.ColorsFront.SetValue(1);
        CaseCard.SUB_JOBS.ColorsBack.SetValue(1);

        exit(CaseCard.ID.AsInteger());
    end;
}
