codeunit 83020 "PT DevHours Test"
{
    Subtype = test;

    var
        CaseLibrary: Codeunit "PV Case Library";
        UserLibrary: Codeunit "PT PrintVis User Lib.";
        LibraryVariableStorage: Codeunit "Library - Variable Storage";
        Assert: Codeunit Assert;
        IsInitialized: Boolean;
        InitFailedMsg: Label 'Initialization failed';

    [Test]
    [HandlerFunctions('StringMenuHandler,OrderCopiedMessageHandler')]
    procedure VerifyDataOnCopyAction()
    var
        CaseRec: Record "PVS Case";
        Job: Record "PVS Job";
        CaseCard: TestPage "PVS Case Card";
        ID: Integer;
    begin
        // [SCENARIO] Verify data on Case and Job on after Copy Case action
        // [GIVEN] 
        Initialize();

        // [GIVEN] Create New Case and save case ID
        ID := CaseLibrary.CreateNewCase(CaseCard);

        // [WHEN] Copy Case to new Order
        // [HANDLER] StringMenuHandler, OrderCopiedMessageHandler        
        CaseCard.CopyTo.Invoke();

        // [THEN] Verify Data on Case and Job
        CaseRec.Get(ID);
        Assert.IsTrue(CaseCard.ID.Value = Format(ID + 1), InitFailedMsg);
        Assert.IsTrue(CaseCard.SellToNo.Value = CaseRec."Sell-To No.", InitFailedMsg);

        // Verify Job Data
        Job.SetRange(ID, ID);
        if Job.FindFirst() then;
        Assert.IsTrue(CaseCard.SUB_JOBS.OrderedQty.Value = Format(Job."Ordered Qty."), InitFailedMsg);
    end;

    local procedure Initialize()
    begin
        LibraryVariableStorage.Clear();

        if IsInitialized then
            exit;

        UserLibrary.AsignBcUserToPrintVisUser();
        IsInitialized := true;
        Commit();
    end;


    [StrMenuHandler]
    procedure StringMenuHandler(Options: Text[1024]; var Choice: Integer; Instructions: Text[1024])
    begin
        Choice := 3;
    end;

    [MessageHandler]
    procedure OrderCopiedMessageHandler(Msg: Text)
    begin
    end;
}