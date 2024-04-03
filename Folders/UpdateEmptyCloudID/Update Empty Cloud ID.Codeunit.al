/// 
/// Disclaimer - please use on 1 - 2 sample folders / case to see if it still only fills in Cloud ID and Cloud Link.
/// main thing that needs to be verified is if the existing files or subfolders still looks correct.
/// 
/// When to use?
/// When moving from OnPrem local files to sharepoint.
/// Cloud ID is not filled and needs to be fetched.
/// This codeunit will go through the defined filter for the Table "PVS Case"(filter can be adjusted)
/// Will go through all Folders where Cloud ID is blank(filter can be adjusted)
/// Should fill out Cloud ID and Cloud Link and is expected to not do anything else.
codeunit 50100 "PTE Update Empty Cloud ID"
{
    trigger OnRun()
    begin
        PrintVis_LoopCases();
    end;

    #Region Loop
    local procedure PrintVis_LoopCases()
    var
        PVSCase: Record "PVS Case";
    begin
        PrintVis_LoopCases_SetFilter(PVSCase);
        if PVSCase.IsEmpty then
            exit;
        if PVSCase.FindSet(false) then
            repeat
                PrintVis_SingleCase(PVSCase);
            until PVSCase.Next() = 0;

    end;

    local procedure PrintVis_SingleCase(var PVSCase: Record "PVS Case")
    var
        PVSFolder: Record "PVS Folder";
    begin
        PrintVis_SingleCaseOnLoopFolders_SetFilter(PVSCase, PVSFolder);
        if PVSFolder.IsEmpty then
            exit;
        if PVSFolder.FindSet(false) then
            repeat
                PrintVis_SingleCase_GetCloudIDForSingleFolder(PVSCase, PVSFolder)
            until PVSFolder.Next() = 0;
    end;
    #EndRegion Loop

    local procedure PrintVis_SingleCase_GetCloudIDForSingleFolder(var PVSCase: Record "PVS Case"; var PVSFolder: Record "PVS Folder")
    var
        PVSApplicationManagement: Codeunit "PVS Application Management";
        Result: Boolean;
        IsHandled: Boolean;
        CloudIDBefore: Text[50];
    begin
        PVSApplicationManagement.OnFolder_Create(PVSCase, PVSFolder, PVSFolder."Path Folder", PVSFolder."Path Root", Result, IsHandled);
        CloudIDBefore := PVSFolder."Cloud ID";
        if Result then
            if PVSFolder."Cloud ID" <> CloudIDBefore then
                PVSFolder.Modify();
    end;

    #region Filters
    local procedure PrintVis_LoopCases_SetFilter(var PVSCase: Record "PVS Case")
    begin
        PVSCase.SetRange(ID, 1885);
    end;

    local procedure PrintVis_SingleCaseOnLoopFolders_SetFilter(var PVSCase: Record "PVS Case"; var PVSFolder: Record "PVS Folder")
    begin
        PVSFolder.SetCurrentkey(ID);
        PVSFolder.SetRange(ID, PVSCase.ID);
        PVSFolder.SetRange("Cloud ID", '');
    end;

    #endregion Filters
}