codeunit 50102 "PTE Demo 2 Invoice T Event"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"PVS Invoice Template Mgmt", 'BuildInvoiceTemplateLine', '', false, false)]
    local procedure BuildInvoiceTemplateLine(var SalesHeader: Record "Sales Header"; var InvoiceTemplateHeader: Record "PVS Invoice Template Header"; var InvoiceTemplateLine: Record "PVS Invoice Template Line"; var Job: Record "PVS Job");
    var
        InvoiceTemplateMgmt: Codeunit "PVS Invoice Template Mgmt";
        CostCenter: Code[50];
        Department: Code[50];
        ProductGroup: Code[50];
        UnitOfMeasure: Code[50];
        InvoiceTemplateLineTemp: Record "PVS Invoice Template Line" temporary;
    begin

        //add 2 extra invoice lines
        //add department 5000 to first line, 6000 to next line

        if InvoiceTemplateLine."No." <> 'TEST2' then
            exit;

        InvoiceTemplateLineTemp.Init();
        InvoiceTemplateLineTemp.Type := InvoiceTemplateLineTemp.Type::"G/L Account";
        InvoiceTemplateLineTemp.Description := 'This line is created by the event';
        InvoiceTemplateLineTemp."Manual Description" := true;
        InvoiceTemplateLineTemp.Quantity := 123;
        InvoiceTemplateLineTemp."Unit Price" := 100;
        InvoiceTemplateLineTemp.Comment := 'TEST2'; //used in this example for identify
        InvoiceTemplateLineTemp.Insert();

        InvoiceTemplateMgmt.Insert_Salesline_New(SalesHeader, InvoiceTemplateLineTemp, InvoiceTemplateHeader, Job, Department, CostCenter, UnitOfMeasure, ProductGroup, '');

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"PVS Invoice Template Mgmt", 'Insert_Salesline_New_OnBeforeModify', '', false, false)]
    local procedure Insert_Salesline_New_OnBeforeModify(var SalesHeader: Record "Sales Header"; var SalesLine: Record "Sales Line"; var InvoiceTemplateHeader: Record "PVS Invoice Template Header"; var InvoiceTemplateLine: Record "PVS Invoice Template Line"; var Job: Record "PVS Job");
    begin
        if InvoiceTemplateLine.Comment <> 'TEST2' then  //or something to identify the line that should be modified
            exit;
        SalesLine.Validate("Line Discount %", 10);
    end;



}
