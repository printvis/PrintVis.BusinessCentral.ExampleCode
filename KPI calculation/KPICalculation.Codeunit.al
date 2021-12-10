codeunit 69002 "PTE KPI Calculation"
{
    [EventSubscriber(ObjectType::Table, Database::"PVS Job", 'OnAfterValidate_Price_Method', '', true, false)]
    local procedure MyProcedure(var in_Rec: Record "PVS Job")
    var
        KPI_Value1, KPI_Value2, KPI_Value3 : Decimal;
    begin
        // if you only want to calculate for a certain product group you can add this check
        if in_Rec."Product Group" <> 'POSTER' then exit;

        // Calculate KPI values somehow
        KPI_Value1 := 13;
        KPI_Value2 := 23;
        KPI_Value3 := KPI_Value1 + KPI_Value2;

        // Assign the KPI values to the Job
        in_Rec."Misc. 1" := KPI_Value1;
        in_Rec."Misc. 2" := KPI_Value2;
        in_Rec."Misc. 3" := KPI_Value3;
    end;
}
