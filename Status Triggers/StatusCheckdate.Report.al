Report 69011 "PTE Example Status Check date"
{
    Caption = 'PrintVis Example Status Check date';
    ProcessingOnly = true;
    UseRequestPage = false;

    dataset
    {
        dataitem("PVS Case"; "PVS Case")
        {


            trigger OnAfterGetRecord()
            begin
                Check("PVS Case");
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

    local procedure Check(var in_PVSCase: Record "PVS Case")
    var
        PVSJob: Record "PVS Job";
    begin
        PVSJob.Reset();
        PVSJob.SetFilter(ID, '%1', in_PVSCase.ID);
        PVSJob.SetFilter(Active, '%1', true);
        PVSJob.SetFilter(Status, '%1', PVSJob.Status::Order);
        if PVSJob.FindSet() then
            repeat
                PVSJob.TestField("Requested Delivery DateTime");
                PVSJob.TestField("Earliest Start Date");
            until PVSJob.Next() = 0;
    end;
}

