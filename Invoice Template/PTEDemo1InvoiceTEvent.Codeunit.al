codeunit 50101 "PTE Demo 1 Invoice T Event"
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

        //add 1 extra invoice lines       

        if InvoiceTemplateLine."No." <> 'TEST' then
            exit;

        InvoiceTemplateLineTemp.Init();
        InvoiceTemplateLineTemp.Type := InvoiceTemplateLineTemp.Type::"G/L Account";
        InvoiceTemplateLineTemp.Description := 'This line is created by the event';
        InvoiceTemplateLineTemp."Manual Description" := true;
        InvoiceTemplateLineTemp.Quantity := 123;
        InvoiceTemplateLineTemp."Unit Price" := 100;
        InvoiceTemplateLineTemp.Insert();

        InvoiceTemplateMgmt.Insert_Salesline_New(SalesHeader, InvoiceTemplateLineTemp, InvoiceTemplateHeader, Job, Department, CostCenter, UnitOfMeasure, ProductGroup, '');

    end;




}
