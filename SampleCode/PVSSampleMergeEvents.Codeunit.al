// This is an example of a formula codeunit

Codeunit 69006 "PTE Sample MergeEvents"
{
    //MERGE FIEDS
    [EventSubscriber(ObjectType::Table, Database::"PVS Merge Fields", 'OnMergeCustomEvent', '', false, false)]
    local procedure PVSSamplePVSMergeFieldsOnMergeCustomEvent(var Global_DocRec: Record "PVS Document"; var outResultTxt: text; var IsHandled: Boolean; Bookmark: text)
    begin
        if IsHandled then exit;
        case Bookmark of
            'TESTMERGEEVENT':
                begin
                    outResultTxt += 'Custom Merge Event in AL';
                    IsHandled := true;
                end;
        end;
    end;
}
