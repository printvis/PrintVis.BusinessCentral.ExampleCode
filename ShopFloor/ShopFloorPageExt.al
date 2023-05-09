pageExtension 50100 "PTE Shop Floor Plan-Metro" extends "PVS Shop Floor Plan-Metro"
{
    actions
    {
        addAfter(JobTicket)
        {
            action(CaseIdMsg)
            {
                ApplicationArea = All;
                Caption = 'Show Case ID';
                trigger OnAction()

                begin
                    GetCaseID();
                end;
            }
        }
    }
    local procedure GetCaseID()
    var
        CaseRec: Record "PVS Case";
        JobPlanningUnitRec: Record "PVS Job Planning Unit";
    begin
        GetCurrentCasePlan(CaseRec, JobPlanningUnitRec);
        Message(Format(JobPlanningUnitRec.ID));
    end;
} 
