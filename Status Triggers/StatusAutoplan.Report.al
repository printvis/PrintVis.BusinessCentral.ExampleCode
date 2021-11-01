Report 69010 "PTE Example Status Autoplan"
{
    Caption = 'PrintVis Example Status Autoplan';
    ProcessingOnly = true;
    UseRequestPage = false;

    dataset
    {
        dataitem("PVS Case"; "PVS Case")
        {


            trigger OnAfterGetRecord()
            begin
                Plan("PVS Case");
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        NextStatus: Code[20];

    local procedure Plan(var in_PVSCase: Record "PVS Case")
    var
        PVSJob: Record "PVS Job";
        PVStatusCode: Record "PVS Status Code";
    begin
        if PVStatusCode.Get('', in_PVSCase."Status Code") then
            NextStatus := PVStatusCode."Next Status";
        PVSJob.Reset();
        PVSJob.SetFilter(ID, '%1', in_PVSCase.ID);
        PVSJob.SetFilter(Active, '%1', true);
        PVSJob.SetFilter(Status, '%1', PVSJob.Status::Order);
        if PVSJob.FindSet() then
            repeat
                PlanJob(PVSJob);
                CheckJob(PVSJob);
            until PVSJob.Next() = 0;

        Commit(); //Before status change

        if NextStatus = '' then
            NextStatus := 'PLAN';
        if NextStatus <> '' then begin
            in_PVSCase.Validate("Status Code", NextStatus);
            in_PVSCase.Modify(true);
        end;
    end;

    local procedure PlanJob(var in_Job: Record "PVS Job")
    var
        PVSJobPlanningUnit: Record "PVS Job Planning Unit";
        PlanningMgt: Codeunit "PVS Planning Management";
    begin
        in_Job."Auto Leveling" := 1;
        in_Job.Modify();
        PVSJobPlanningUnit.Reset();
        PVSJobPlanningUnit.SetCurrentkey("Simulation Version", ID, Job, "Sorting Order");
        PVSJobPlanningUnit.SetFilter(ID, '%1', in_Job.ID);
        PVSJobPlanningUnit.SetFilter(Job, '%1', in_Job.Job);
        if PVSJobPlanningUnit.FindFirst() then;
        PlanningMgt.Auto_Plan_All(PVSJobPlanningUnit."Simulation Version", true, in_Job.ID, in_Job.Job, false, false);
    end;

    local procedure CheckJob(var in_Job: Record "PVS Job")
    var
        PVSJobPlanningUnit: Record "PVS Job Planning Unit";
    begin
        PVSJobPlanningUnit.Reset();
        PVSJobPlanningUnit.SetCurrentkey("Simulation Version", ID, Job, "Sorting Order");
        PVSJobPlanningUnit.SetFilter(ID, '%1', in_Job.ID);
        PVSJobPlanningUnit.SetFilter(Job, '%1', in_Job.Job);
        PVSJobPlanningUnit.SetFilter("Calc. Time", '<>%1', 0);
        PVSJobPlanningUnit.SetFilter("Capacity Unit", '<>%1', '');
        PVSJobPlanningUnit.SetFilter("Start Date", '%1', 0D);
        if PVSJobPlanningUnit.FindFirst() then
            NextStatus := 'PLAN'; // Not all lines are planned
    end;
}

