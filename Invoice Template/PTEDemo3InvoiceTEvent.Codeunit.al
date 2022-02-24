codeunit 50103 "PTE Demo 3 Invoice T Event"
{

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"PVS Invoice Template Mgmt", 'BuildInvoiceTemplateHeader', '', false, false)]
    local procedure BuildInvoiceTemplateHeader(var SalesHeader: Record "Sales Header"; var InvoiceTemplateHeader: Record "PVS Invoice Template Header");
    var
        SalesLine: Record "Sales Line";
    begin
        if InvoiceTemplateHeader.Code <> 'EX3' then
            exit;

        SalesLine.Init();
        SalesLine."Document Type" := SalesHeader."Document Type";
        SalesLine."Document No." := SalesHeader."No.";
        SalesLine."Line No." := 10000;
        SalesLine.Insert(true);
        SalesLine.Validate(Type, SalesLine.Type::" ");
        SalesLine.Description := 'Text line';
        SalesLine.Modify(true);

        SalesLine.Init();
        SalesLine."Document Type" := SalesHeader."Document Type";
        SalesLine."Document No." := SalesHeader."No.";
        SalesLine."Line No." := 20000;
        SalesLine.Insert(true);
        SalesLine.Validate(Type, SalesLine.Type::"G/L Account");
        SalesLine.Validate("No.", '6110');
        SalesLine.Description := 'Invoice Line';
        SalesLine.Validate(Quantity, 100);
        SalesLine.Validate("Unit Price", 10);
        SalesLine.Modify(true);


    end;

}
