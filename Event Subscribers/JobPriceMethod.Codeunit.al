Codeunit 69012 "PTE Example Subscribers"
{
    // Assign KPI values to a job
    [EventSubscriber(ObjectType::Table, Database::"PVS Job", 'OnAfterValidate_Price_Method', '', true, false)]
    local procedure OnAfterValidate_Price_Method(var in_Rec: Record "PVS Job");
    var
        KPI_Value1, KPI_Value2, KPI_Value3 : Decimal;
    begin
        // If you only want to calculate for a certain prod group you can add this check
        if in_Rec."Product Group" <> 'POSTER' then
            exit;
        // Calculate up to 10 KPI values somehow 
        KPI_Value1 := 1;
        KPI_Value2 := 2;
        KPI_Value3 := KPI_Value1 + KPI_Value2;

        // Assign the KPI values to the Job
        in_Rec."Misc. 1" := KPI_Value1;
        in_Rec."Misc. 2" := KPI_Value2;
        in_Rec."Misc. 3" := KPI_Value3;

    end;
}