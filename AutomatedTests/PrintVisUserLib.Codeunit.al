codeunit 83006 "PT PrintVis User Lib."
{

    trigger OnRun()
    begin
        CreatePrintVisUser();
        writePrintVisUser();
        writeCapacityResource();
        writeJobCostingJournal();
        writeSalespersonPurchase();
    end;

    var
        TempUserSetupGlobal: Record "PVS User Setup" temporary;
        TempSalespersonPurchaserGlobal: Record "Salesperson/Purchaser" temporary;
        TempCapacityResourceGlobal: Record "PVS Capacity Resource" temporary;
        TempJobCostingJournalGlobal: Record "PVS Job Costing Journal" temporary;

    procedure CreatePrintVisUser()
    begin

        TempSalespersonPurchaserGlobal.Init();
        TempSalespersonPurchaserGlobal.Code := 'PVSTEST';
        TempSalespersonPurchaserGlobal.Insert();

        TempCapacityResourceGlobal.Init();
        TempCapacityResourceGlobal."Capacity Code" := 'PVSTEST';
        TempCapacityResourceGlobal.Insert();

        TempJobCostingJournalGlobal.Init();
        TempJobCostingJournalGlobal.Code := 'PVSTEST';
        TempJobCostingJournalGlobal.Name := 'PVSTEST';
        TempJobCostingJournalGlobal."User ID" := 'PVSTEST';
        TempJobCostingJournalGlobal.Insert();

        TempUserSetupGlobal.Init();
        TempUserSetupGlobal."User ID" := 'PVSTEST';
        TempUserSetupGlobal.Name := 'PrintVis Test';
        TempUserSetupGlobal.Coordinator := true;
        TempUserSetupGlobal."Production Employee" := true;
        TempUserSetupGlobal."Salesperson Code" := 'PVSTEST';
        TempUserSetupGlobal."Job Cost Journal" := 'PVSTEST';
        TempUserSetupGlobal."Responsible Comment" := true;
        TempUserSetupGlobal."Manual Responsible Allowed" := true;
        TempUserSetupGlobal."Allow Archiving" := true;
        TempUserSetupGlobal."Allow Credit Limit Override" := true;
        TempUserSetupGlobal."Status Code New Request" := 'REQUEST';
        TempUserSetupGlobal."Status Code New Quote" := 'QUOTE';
        TempUserSetupGlobal."Status Code New Order" := 'ORDER';
        TempUserSetupGlobal."Capacity Manning Code" := 'PVSTEST';
        TempUserSetupGlobal.Insert();
    end;

    procedure readPrintVisUser(var TempUserSetup: Record "PVS User Setup" temporary)
    begin
        if TempUserSetupGlobal.FindFirst() then begin
            TempUserSetup := TempUserSetupGlobal;
            TempUserSetup.Insert();
        end;
    end;

    procedure readCapacityResource(TempCapacityResource: Record "PVS Capacity Resource" temporary)
    begin
        if TempCapacityResourceGlobal.FindFirst() then begin
            TempCapacityResource := TempCapacityResourceGlobal;
            TempCapacityResource.Insert();
        end;
    end;

    procedure readJobCostingJournal(var TempJobCostingJournal: Record "PVS Job Costing Journal" temporary)
    begin
        if TempJobCostingJournalGlobal.FindFirst() then begin
            TempJobCostingJournal := TempJobCostingJournalGlobal;
            TempJobCostingJournal.Insert();
        end;
    end;

    procedure readSalespersonPurchase(var TempSalespersonPurchaser: Record "Salesperson/Purchaser" temporary)
    begin
        if TempSalespersonPurchaserGlobal.FindFirst() then begin
            TempSalespersonPurchaser := TempSalespersonPurchaserGlobal;
            TempSalespersonPurchaser.Insert();
        end;
    end;

    procedure writePrintVisUser()
    var
        UserSetup: Record "PVS User Setup";
        User: Record User;
    begin
        User.SetRange("User Name", UserId);
        user.FindFirst();

        if TempUserSetupGlobal.FindFirst() then begin
            UserSetup := TempUserSetupGlobal;
            UserSetup."User Security ID" := User."User Security ID";
            UserSetup.Insert();
        end;
    end;

    procedure writeCapacityResource()
    var
        CapacityResource: Record "PVS Capacity Resource";
    begin
        if TempCapacityResourceGlobal.FindFirst() then begin
            CapacityResource := TempCapacityResourceGlobal;
            CapacityResource.Insert();
        end;
    end;

    procedure writeJobCostingJournal()
    var
        JobCostingJournal: Record "PVS Job Costing Journal";
    begin
        if TempJobCostingJournalGlobal.FindFirst() then begin
            JobCostingJournal := TempJobCostingJournalGlobal;
            JobCostingJournal.Insert();
        end;
    end;

    procedure writeSalespersonPurchase()
    var
        SalespersonPurchaser: Record "Salesperson/Purchaser";
    begin
        if TempSalespersonPurchaserGlobal.FindFirst() then begin
            SalespersonPurchaser := TempSalespersonPurchaserGlobal;
            SalespersonPurchaser.Insert();
        end;
    end;

    procedure AllowUserToArchive()
    var
        UserSetup: Record "PVS User Setup";
    begin
        UserSetup.SetRange("BC User Name", UserId());
        if UserSetup.FindFirst() then begin
            UserSetup."Allow Archiving" := true;
            UserSetup.Modify();
        end;
    end;

    procedure AsignBcUserToPrintVisUser()
    var
        UserSetup: Record "PVS User Setup";
        User: Record User;
        SingleInstance: Codeunit "PVS SingleInstance";
    begin
        User.SetRange("User Name", UserId());
        if User.FindFirst() then
            if not UserSetup.Get(User."User Security ID") then
                if UserSetup.FindFirst() then begin
                    UserSetup."User Security ID" := User."User Security ID";
                    UserSetup.Modify();
                end;
    end;

    local procedure CreateUser()
    var
        UserSetup: Record "PVS User Setup";
    begin
        UserSetup.Init();
        UserSetup."User ID" := 'PVSTEST';
        UserSetup."BC User Name" := UserId();
        UserSetup.Name := 'PrintVis Test';
        UserSetup.Coordinator := true;
        UserSetup."Production Employee" := true;
        UserSetup."Salesperson Code" := 'PVSTEST';
        UserSetup."Job Cost Journal" := 'PVSTEST';
        UserSetup."Responsible Comment" := true;
        UserSetup."Manual Responsible Allowed" := true;
        UserSetup."Allow Archiving" := true;
        UserSetup."Allow Credit Limit Override" := true;
        UserSetup."Status Code New Request" := 'REQUEST';
        UserSetup."Status Code New Quote" := 'QUOTE';
        UserSetup."Status Code New Order" := 'ORDER';
        UserSetup."Capacity Manning Code" := 'PVSTEST';
        UserSetup.Insert(true);
    end;
}
