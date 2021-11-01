Report 69006 "PTE Example Job KPI"
{
    Caption = 'PrintVis Example Job KPI';
    ProcessingOnly = true;
    ShowPrintStatus = false;
    UseRequestPage = false;

    dataset
    {
        dataitem("PVS Job"; "PVS Job")
        {


            trigger OnAfterGetRecord()
            begin
                if (ID = 0) and (Job = 0) and (Version = 0) then
                    Setup_Report_KPI_Description()
                else
                    Update_Job_KPI_Values();
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
        Text001: label 'Price incl. paper';
        Text002: label '   - per 1.000 m²';
        Text003: label 'KPI Text 3';

    procedure Setup_Report_KPI_Description()
    begin
        // This function transport the KPI text definition from this report and back to the current Product Group
        // Up to 10 KPI fields is possible. This Setup function is called 1-10 times from Product Group Setup

        case "PVS Job"."Template ID" of
            1:
                "PVS Job"."Job Name" := Text001;
            2:
                "PVS Job"."Job Name" := Text002;
            3:
                "PVS Job"."Job Name" := Text003;
        end;

        if "PVS Job".Modify() then;
    end;

    procedure Update_Job_KPI_Values()
    var
        KPI_Value1: Decimal;
        KPI_Value2: Decimal;
        KPI_Value3: Decimal;
    begin
        // Calculate up to 10 KPI values somehow
        KPI_Value1 := 1;
        KPI_Value2 := 2;
        KPI_Value3 := KPI_Value1 + KPI_Value2;

        // Write the KPI values to the Job
        "PVS Job"."Misc. 1" := KPI_Value1;
        "PVS Job"."Misc. 2" := KPI_Value2;
        "PVS Job"."Misc. 3" := KPI_Value3;

        if "PVS Job".Modify() then;
    end;
}

