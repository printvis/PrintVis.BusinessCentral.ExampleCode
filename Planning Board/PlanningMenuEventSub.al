codeunit 50500 "PTE Planning Menu Event Sub"
{
    [EventSubscriber(ObjectType::Page, Page::"PVS Planning Board", 'OnMenuClickMenuAllocation', '', false, false)]
    local procedure OnMenuClickMenuAllocation(
PlanningBoardMenuAll: Enum "PVS Planning Board Menu All.";
                          PlanUnitRecordIDtxt: Text;
                          PlanningBoardData: Codeunit "PVS planning Board Data";
var ReloadPlanning: Boolean; var ReloadPlanningID: Integer; var ReloadPlanningIDList: List of [Integer]);
    var
        JobPlanningUnit: Record "PVS Job Planning Unit";
    begin
        case PlanningBoardMenuAll of
            PlanningBoardMenuAll::CustomerList:
                begin
                    ReloadPlanningIDList.Add(1);  //add Case ID that should be refreshed
                    ReloadPlanningIDList.Add(2);//add Case ID that should be refreshed
                    ReloadPlanning := true;
                end;
            PlanningBoardMenuAll::JustMessage:
                begin
                    Message(PlanUnitRecordIDtxt);
                    if StrLen(PlanUnitRecordIDtxt) > 4 then
                        PlanUnitRecordIDtxt := CopyStr(PlanUnitRecordIDtxt, 5);
                    JobplanningUnit.SETPOSITION(PlanUnitRecordIDtxt);
                    JobPlanningUnit.CalcFields("Order No.");
                    Message(JobPlanningUnit."Order No.");
                end;
            PlanningBoardMenuAll::Reload:
                ReloadPlanning := true;
        end
    end;



}