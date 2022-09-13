codeunit 50189 "PTE Merge Field"
{
    [EventSubscriber(ObjectType::Table, Database::"PVS Merge Fields", 'OnMergeCustomEvent', '', false, false)]
    local procedure OnMergeCustomEvent(var Global_DocRec: Record "PVS Document";
   var outResultTxt: Text; var IsHandled: Boolean; Bookmark: Text)
    var
        CaseRec: Record "PVS Case";
    begin
        if Bookmark = 'SAMPLE' then begin //Bookmark from the mergefield setup
            ContentTxt := '';
            CaseRec.Get(Global_DocRec.ID1);
            outResultTxt := CaseRec."Quote No.";
        end;
    end;
}
