Report 69008 "PTE Example MergeField 2"
{
    Caption = 'PrintVis Example MergeFields Report - Job (2)';
    ProcessingOnly = true;
    UseRequestPage = false;

    dataset
    {
        dataitem(DocRec; "PVS Document")
        {
            DataItemTableView = sorting("Entry No.");
            RequestFilterFields = "Entry No.";


            trigger OnAfterGetRecord()
            var
                ok: Boolean;
            begin
                case DocRec."Table ID" of
                    38:
                        ok := ok;
                    else
                        Error(Text002);
                end;

                FileContents := '';
                CreateMergeContents();
                MergeRec.Merge_Custom_Report_WriteContents(FileContents);
            end;
        }
    }

    var
        MergeRec: Record "PVS Merge Fields";
        TypeHelper: Codeunit "Type Helper";
        FileContents: Text;
        Text001: label '%1{t}%2{t}%3';
        Text002: label 'This report is only valid in connection with a Purchase';

    local procedure CreateMergeContents()
    var
        SalesLine: Record "Sales Line" temporary;
        TAB: Text[30];
    begin
        TAB := '[TAB]';

        // PO Lines
        SalesLine.SetRange("Document Type", 1);
        SalesLine.SetRange("Document No.", DocRec.Code1);

        if not SalesLine.Find('-') then
            exit;

        repeat
            AddContent(StrSubstNo(Text001, SalesLine.Type, SalesLine.Quantity, SalesLine.Description));
        until SalesLine.Next() = 0;
    end;

    local procedure AddContent(in_Txt: Text)
    begin
        FileContents += in_Txt + TypeHelper.NewLine();
    end;
}

