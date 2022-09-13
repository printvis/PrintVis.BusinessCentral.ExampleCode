// This report is not maintained
// Make sure all BC tables are cleared, more tables could be added for each release.
// remove the error codeline in the OnInit trigger Error('Remove this code line before using the report');

Report 74999 "PTE Clear Company"
{
    Caption = 'PrintVis Clear Company Pre Go-Live';
    ProcessingOnly = true;
    Permissions = Tabledata 17 = rmid,
Tabledata 18 = rmid,
Tabledata 21 = rmid,
Tabledata 23 = rmid,
Tabledata 25 = rmid,
Tabledata 27 = rmid,
Tabledata 32 = rmid,
Tabledata 36 = rmid,
Tabledata 37 = rmid,
Tabledata 38 = rmid,
Tabledata 39 = rmid,
Tabledata 43 = rmid,
Tabledata 44 = rmid,
Tabledata 45 = rmid,
Tabledata 46 = rmid,
Tabledata 51 = rmid,
Tabledata 81 = rmid,
Tabledata 83 = rmid,
Tabledata 86 = rmid,
Tabledata 87 = rmid,
Tabledata 97 = rmid,
Tabledata 110 = rmid,
Tabledata 111 = rmid,
Tabledata 112 = rmid,
Tabledata 113 = rmid,
Tabledata 114 = rmid,
Tabledata 115 = rmid,
Tabledata 120 = rmid,
Tabledata 121 = rmid,
Tabledata 122 = rmid,
Tabledata 123 = rmid,
Tabledata 124 = rmid,
Tabledata 125 = rmid,
Tabledata 169 = rmid,
Tabledata 203 = rmid,
Tabledata 222 = rmid,
Tabledata 240 = rmid,
Tabledata 241 = rmid,
Tabledata 246 = rmid,
Tabledata 253 = rmid,
Tabledata 254 = rmid,
Tabledata 271 = rmid,
Tabledata 272 = rmid,
Tabledata 275 = rmid,
Tabledata 276 = rmid,
Tabledata 281 = rmid,
Tabledata 287 = rmid,
Tabledata 288 = rmid,
Tabledata 297 = rmid,
Tabledata 298 = rmid,
Tabledata 300 = rmid,
Tabledata 304 = rmid,
Tabledata 305 = rmid,
Tabledata 308 = rmid,
Tabledata 309 = rmid,
Tabledata 336 = rmid,
Tabledata 337 = rmid,
Tabledata 339 = rmid,
Tabledata 355 = rmid,
Tabledata 357 = rmid,
Tabledata 365 = rmid,
Tabledata 366 = rmid,
Tabledata 379 = rmid,
Tabledata 380 = rmid,
Tabledata 405 = rmid,
Tabledata 480 = rmid,
Tabledata 481 = rmid,
Tabledata 5050 = rmid,
Tabledata 5051 = rmid,
Tabledata 5052 = rmid,
Tabledata 5054 = rmid,
Tabledata 5056 = rmid,
Tabledata 5058 = rmid,
Tabledata 5060 = rmid,
Tabledata 5061 = rmid,
Tabledata 5065 = rmid,
Tabledata 5067 = rmid,
Tabledata 5080 = rmid,
Tabledata 5085 = rmid,
Tabledata 5086 = rmid,
Tabledata 5089 = rmid,
Tabledata 5092 = rmid,
Tabledata 5093 = rmid,
Tabledata 5404 = rmid,
Tabledata 5601 = rmid,
Tabledata 5617 = rmid,
Tabledata 5625 = rmid,
Tabledata 5629 = rmid,
Tabledata 5740 = rmid,
Tabledata 5741 = rmid,
Tabledata 5744 = rmid,
Tabledata 5745 = rmid,
Tabledata 5746 = rmid,
Tabledata 5747 = rmid,
Tabledata 5748 = rmid,
Tabledata 5765 = rmid,
Tabledata 5766 = rmid,
Tabledata 5767 = rmid,
Tabledata 5768 = rmid,
Tabledata 5770 = rmid,
Tabledata 5772 = rmid,
Tabledata 5773 = rmid,
Tabledata 5802 = rmid,
Tabledata 5810 = rmid,
Tabledata 5823 = rmid,
Tabledata 5832 = rmid,
Tabledata 5900 = rmid,
Tabledata 5901 = rmid,
Tabledata 5902 = rmid,
Tabledata 5906 = rmid,
Tabledata 5907 = rmid,
Tabledata 5908 = rmid,
Tabledata 5910 = rmid,
Tabledata 5912 = rmid,
Tabledata 5934 = rmid,
Tabledata 5935 = rmid,
Tabledata 5936 = rmid,
Tabledata 5940 = rmid,
Tabledata 5941 = rmid,
Tabledata 5942 = rmid,
Tabledata 5943 = rmid,
Tabledata 5944 = rmid,
Tabledata 5950 = rmid,
Tabledata 5964 = rmid,
Tabledata 5965 = rmid,
Tabledata 5967 = rmid,
Tabledata 5969 = rmid,
Tabledata 5970 = rmid,
Tabledata 5971 = rmid,
Tabledata 5972 = rmid,
Tabledata 5989 = rmid,
Tabledata 5990 = rmid,
Tabledata 5991 = rmid,
Tabledata 5992 = rmid,
Tabledata 5993 = rmid,
Tabledata 5994 = rmid,
Tabledata 5995 = rmid,
Tabledata 6504 = rmid,
Tabledata 6505 = rmid,
Tabledata 6506 = rmid,
Tabledata 6507 = rmid,
Tabledata 6508 = rmid,
Tabledata 6509 = rmid,
Tabledata 6550 = rmid,
Tabledata 6650 = rmid,
Tabledata 6651 = rmid,
Tabledata 6660 = rmid,
Tabledata 6661 = rmid,
Tabledata 7002 = rmid,
Tabledata 7004 = rmid,
Tabledata 7012 = rmid,
Tabledata 7014 = rmid,
Tabledata 7302 = rmid,
Tabledata 7311 = rmid,
Tabledata 7312 = rmid,
Tabledata 7313 = rmid,
Tabledata 7316 = rmid,
Tabledata 7317 = rmid,
Tabledata 7318 = rmid,
Tabledata 7319 = rmid,
Tabledata 7320 = rmid,
Tabledata 7321 = rmid,
Tabledata 7322 = rmid,
Tabledata 7323 = rmid,
Tabledata 7324 = rmid,
Tabledata 7325 = rmid,
Tabledata 7326 = rmid,
Tabledata 7331 = rmid,
Tabledata 7332 = rmid,
Tabledata 7333 = rmid,
Tabledata 7334 = rmid,
Tabledata 7340 = rmid,
Tabledata 7341 = rmid,
Tabledata 7342 = rmid,
Tabledata 7343 = rmid;



    dataset
    {
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(CompanyText;
                COMPANYNAME)
                {
                    ApplicationArea = All;
                    Caption = 'Clear Company Tool for';
                    Editable = false;
                    Enabled = false;
                }
                group(Selection)
                {
                    Caption = 'Selection';
                    field(GbooT18; GbooT18)
                    {
                        ApplicationArea = All;
                        Caption = 'Clear Customers';
                        Enabled = not GbooAllNonPVS;
                    }
                    field(GbooT23; GbooT23)
                    {
                        ApplicationArea = All;
                        Caption = 'Clear Vendors';
                        Enabled = not GbooAllNonPVS;
                    }
                    field(GbooT27; GbooT27)
                    {
                        ApplicationArea = All;
                        Caption = 'Clear Items';
                        Enabled = not GbooAllNonPVS;
                    }
                    field(GbooT5050; GbooT5050)
                    {
                        ApplicationArea = All;
                        Caption = 'Clear Contacts';
                        Enabled = not GbooAllNonPVS;
                    }
                    field(GbooT6010312; GbooT6010312)
                    {
                        ApplicationArea = All;
                        Caption = 'Clear PV Cases';
                    }
                    group(Template)
                    {
                        Caption = 'Templates';
                        field(GbooT6010312Templates; GbooT6010312Templates)
                        {
                            ApplicationArea = All;
                            Caption = 'Include Template Jobs';
                        }
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport()
    var
        GLEntry: Record "G/L Entry";
        RetentionPolicies: Record "Retention Policy Setup";
    begin
        Error('Remove this code line before using the report');

        if not GLEntry.WritePermission() then
            Error(WrongLicense);

        if not RetentionPolicies.IsEmpty then
            Error(RetentionPoliciesErr);
    end;

    trigger OnPostReport()
    begin
        if GbooNoSeries then begin
            if GbooT18 or GbooT23 or GbooT27 or GbooT5050 or GbooT6010312 then begin
                Message(Gtxt003);
            end;
        end;
    end;

    trigger OnPreReport()
    var
        LbooContinue: Boolean;
    begin
        if not Confirm(Gtxt001, false) then
            exit;

        Window.Open(DialogText);
        Clear(StatusCounter);

        TotalRecNo := 149;

        if GbooAllNonPVS then begin
            TableMetadata.SetFilter(TableMetadata.ID, '..%1|%2..%3', 6010049, 6011049, 2000000000);
            TableMetadata.SetRange(TableMetadata.DataPerCompany, true);
            TableMetadata.SetRange(TableMetadata.DataIsExternal, false);
            TotalRecNo += TableMetadata.Count();
        end;
        if GbooNoSeries then
            TotalRecNo += 1;
        if GbooT18 then
            TotalRecNo += 5;
        if GbooT23 then
            TotalRecNo += 2;
        if GbooT5050 then
            TotalRecNo += 18;

        if GbooT6010312 then begin
            TotalRecNo += 1;
            if GbooT6010312Templates then
                TotalRecNo += 17;
        end;

        // NAV Tables
        if GbooAllNonPVS then begin
            TableMetadata.SetFilter(ObsoleteState, '<>%1', TableMetadata.ObsoleteState::Removed);
            if TableMetadata.FindSet(false, false) then begin
                repeat
                    StatusCounter := StatusCounter + 1;
                    Window.Update(1, ROUND(StatusCounter / TotalRecNo * 10000, 1));
                    if (StatusCounter MOD 10 = 0) then
                        Window.Update(2, StrSubstNo(Gtxt002, Format(TableMetadata.ID), TableMetadata.Name));
                    CleanTable(TableMetadata.ID);
                until TableMetadata.Next() = 0;
                SelectLatestVersion();

                Window.Close();
                Codeunit.Run(Codeunit::"Company-Initialize");

                Window.Open(DialogText);

            end;
        end else begin
            CleanTable(17);
            if GbooT18 then begin
                Delete_Customers();
                CleanTable(222);
                CleanTable(287);
            end;

            if GbooT23 then begin
                Delete_Vendors();
                CleanTable(288);
            end;

            CleanTable(21);
            CleanTable(25);
            CleanTable(32);
            CleanTable(36);
            CleanTable(37);
            CleanTable(38);
            CleanTable(39);
            CleanTable(43);
            CleanTable(44);
            CleanTable(45);
            CleanTable(46);
            CleanTable(81);
            CleanTable(83);
            CleanTable(86);
            CleanTable(87);
            CleanTable(110);
            CleanTable(111);
            CleanTable(112);
            CleanTable(113);
            CleanTable(114);
            CleanTable(115);
            CleanTable(120);
            CleanTable(121);
            CleanTable(122);
            CleanTable(123);
            CleanTable(124);
            CleanTable(125);
            CleanTable(169);
            CleanTable(203);
            CleanTable(240);
            CleanTable(241);
            CleanTable(246);
            CleanTable(253);
            CleanTable(254);
            CleanTable(271);
            CleanTable(272);
            CleanTable(275);
            CleanTable(276);
            CleanTable(281);
            CleanTable(297);
            CleanTable(298);
            CleanTable(300);
            CleanTable(304);
            CleanTable(305);
            CleanTable(336);
            CleanTable(337);
            CleanTable(339);
            CleanTable(355);
            CleanTable(357);
            CleanTable(359);
            CleanTable(365);
            CleanTable(366);
            CleanTable(379);
            CleanTable(380);
            CleanTable(405);
            CleanTable(480);
            CleanTable(481);

            if GbooT5050 then begin
                CleanTable(5050);
                CleanTable(5051);
                CleanTable(5052);
                CleanTable(5054);
                CleanTable(5056);
                CleanTable(5058);
                CleanTable(5060);
                CleanTable(5061);
                CleanTable(5065);
                CleanTable(5067);
                CleanTable(5080);
                CleanTable(5085);
                CleanTable(5086);
                CleanTable(5089);
                CleanTable(5092);
                CleanTable(5093);
                CleanTable(5119);
                CleanTable(5121);
            end;

            CleanTable(5601);
            CleanTable(5617);
            CleanTable(5625);
            CleanTable(5629);
            CleanTable(5740);
            CleanTable(5741);
            CleanTable(5744); // Transfer Shipment Header
            CleanTable(5745); // Transfer Shipment Line
            CleanTable(5746); // Transfer Receipt Header
            CleanTable(5747); // Transfer Receipt Line
            CleanTable(5748); // Inventory Comment Line
            CleanTable(5765); // Warehouse Request
            CleanTable(5766); // Warehouse Activity Header
            CleanTable(5767); // Warehouse Activity Line
            CleanTable(5768);
            CleanTable(5770); // Warehouse Comment Line
            CleanTable(5772);
            CleanTable(5773);
            CleanTable(5802);
            CleanTable(5810);
            // Check
            CleanTable(5823);
            // Check
            CleanTable(5832);
            CleanTable(6505);
            CleanTable(6506);
            CleanTable(6507);
            CleanTable(6508);
            CleanTable(6509);
            CleanTable(6550);
            CleanTable(6650);
            CleanTable(6651);
            CleanTable(6660);
            CleanTable(6661);
            CleanTable(7302);
            CleanTable(7311);
            CleanTable(7312);
            CleanTable(7313);
            CleanTable(7316);
            CleanTable(7317);
            CleanTable(7318);
            CleanTable(7319);
            CleanTable(7320);
            CleanTable(7321);
            CleanTable(7322);
            CleanTable(7323);
            CleanTable(7324);
            CleanTable(7325);
            CleanTable(7326);
            CleanTable(7331);
            CleanTable(7332);
            CleanTable(7333);
            CleanTable(7334);
            CleanTable(7340);
            CleanTable(7341);
            CleanTable(7342);
            CleanTable(7343);

            CleanTable(5900); // Service Header
            CleanTable(5901); // Service Item Line
            CleanTable(5902); // Service Line
            CleanTable(5906); // Service Comment Line
            CleanTable(5907); // Service Ledger Entry
            CleanTable(5908); // Warrenty Ledger Entry
            CleanTable(5910); // Service Hour
            CleanTable(5912); // Service Document Log
            CleanTable(5934); // Service Register
            CleanTable(5935); // Service E-mail Queue
            CleanTable(5936); // Service Document Register
            CleanTable(5940); // Service Item
            CleanTable(5941); // Service Item Component
            CleanTable(5942); // Service Item Log
            CleanTable(5943); // Troubleshooting Header
            CleanTable(5944); // Troubleshooting Line
            CleanTable(5950); // Service Order Allocation
            CleanTable(5964); // Service Contract Line
            CleanTable(5965); // Service Contract Header
            CleanTable(5967); // Contract Change Log
            CleanTable(5969); // Contract Gain/Loss Entry
            CleanTable(5970); // Filed Service Contract Header
            CleanTable(5971); // Filed Contract Line
            CleanTable(5972); // Contract/Service Discount
            CleanTable(5989); // Service Shipment Item Line
            CleanTable(5990); // Service Shipment Header
            CleanTable(5991); // Service Shipment Line
            CleanTable(5992); // Service Invoice Header
            CleanTable(5993); // Service Invoice Line
            CleanTable(5994); // Service Cr.Memo Header
            CleanTable(5995); // Service Cr.Memo Line
            CleanTable(6504); // Serial No. Information
        end;

        // PrintVis Tables
        CleanTable(6010070); // PVS Analysis Entry
        CleanTable(6010181); // Documents
        CleanTable(6010182); // Doc. Text
        CleanTable(6010880); // Folder
        CleanTable(6010325); // Job Costing Labor Entry
        CleanTable(6010327); // Sheet Bitmaps BLOBS, allways delete this
        CleanTable(6010314); // Job Shipment
        CleanTable(6010342); // Job Costing Entry
        CleanTable(6010343); // Job Material Requirement
        CleanTable(6010750); // Shop Floor Journal Entries not yet posted
        CleanTable(6010913); // CIM Outbound Entries
        CleanTable(6010917); // CIM Inbound Entries
        CleanTable(6010920); // Workflow Partner Cmd Buffer
        CleanTable(6010921); // Workflow Partner Resp. Att
        CleanTable(6010922); // Workflow Partner Queue Entr
        CleanTable(6010923); // Workflow Partner MIME Buff

        CleanTable(6010413); // Material Archive Entries
        CleanTable(6010056); // Change Log Entry

        Delete_Job_Costing_Journal_Lines();
        CleanTable(6010393); // Complaints

        SelectLatestVersion();

        if GbooT6010312 then begin
            if not GbooT6010312Templates then begin
                Delete_All_Cases_Not_Templates(); // Delete Cases but leave templates
            end else begin
                Delete_All_Cases_And_Templates(); // Delete Cases + Templates
                SelectLatestVersion();
            end;
        end;

        // Delete all items not used in calculations
        if not GbooAllNonPVS then begin
            if GbooT27 then
                Delete_Items();

            // *** Special Tables ***
            // Userfields

            GtxtUFTableFilter := '';
            if not GbooT18 then begin
                GtxtUFTableFilter := '<>18';
            end;
            if not GbooT23 then begin
                if GtxtUFTableFilter <> '' then
                    GtxtUFTableFilter := GtxtUFTableFilter + '&';
                GtxtUFTableFilter := GtxtUFTableFilter + '<>23';
            end;
            if not GbooT27 then begin
                if GtxtUFTableFilter <> '' then
                    GtxtUFTableFilter := GtxtUFTableFilter + '&';
                GtxtUFTableFilter := GtxtUFTableFilter + '<>27';
            end;
            if not GbooT5050 then begin
                if GtxtUFTableFilter <> '' then
                    GtxtUFTableFilter := GtxtUFTableFilter + '&';
                GtxtUFTableFilter := GtxtUFTableFilter + '<>5050';
            end;

            if GtxtUFTableFilter <> '' then
                GtxtUFTableFilter := GtxtUFTableFilter + '&';
        end;

        GtxtUFTableFilter := GtxtUFTableFilter + '<>6010300&<>6010301&<>6010336&<>6010370';

        StatusCounter := StatusCounter + 1;
        Window.Update(1, ROUND(StatusCounter / TotalRecNo * 10000, 1));
        Window.Update(2, StrSubstNo(Gtxt002, '6010084', r6010084.TableName()));

        if GtxtUFTableFilter <> '' then
            r6010084.SetFilter(r6010084."Table ID", GtxtUFTableFilter);

        if r6010084.FindSet() then begin
            GintTotalUF := r6010084.Count();
            GintUFCount := 0;
            repeat
                GintUFCount += 1;
                Window.Update(2, StrSubstNo(Gtxt002, '6010084', r6010084.TableName()) + ' (' + Format(GintUFCount) + '/' + Format(GintTotalUF) + ')');
                r6010084_D.Get(r6010084."Table ID", r6010084."Table Subtype", r6010084."Table Code", r6010084."Field No.", r6010084.ID1,
                  r6010084.ID2, r6010084.ID3, r6010084.ID4, r6010084.ID5, r6010084.Code1, r6010084."Entry No.");
                case r6010084_D."Table ID" of
                    18:
                        if GbooT18 or GbooAllNonPVS then
                            r6010084_D.Delete();
                    23:
                        if GbooT23 or GbooAllNonPVS then
                            r6010084_D.Delete();
                    27:
                        if GbooT27 or GbooAllNonPVS then
                            r6010084_D.Delete();
                    5050:
                        if GbooT5050 or GbooAllNonPVS then
                            r6010084_D.Delete();
                    6010312,
                    6010313,
                    6010314:
                        begin
                            if GbooT6010312 and (not GbooT6010312Templates) then begin
                                if not r6010312.Get(r6010084_D.ID1) then
                                    r6010084_D.Delete()
                                else
                                    if not r6010313.Get(r6010084_D.ID1, r6010084_D.ID2, r6010084_D.ID3) then
                                        r6010084_D.Delete();
                            end;
                        end;
                    else
                        r6010084_D.Delete();
                end;
            until r6010084.Next() = 0;
        end;

        // Comment Line
        StatusCounter := StatusCounter + 1;
        Window.Update(1, ROUND(StatusCounter / TotalRecNo * 10000, 1));
        Window.Update(2, StrSubstNo(Gtxt002, '97', r97.TableName()));

        if r97.FindSet() then begin
            GintTotalUF := r97.Count();
            GintUFCount := 0;
            repeat
                GintUFCount += 1;
                Window.Update(2, StrSubstNo(Gtxt002, '97', r97.TableName()) + ' (' + Format(GintUFCount) + '/' + Format(GintTotalUF) + ')');
                r97_D.Get(r97."Table Name", r97."No.", r97."Line No.");
                // 0:G/L Account, 1:Customer, 2:Vendor, 3:Item, 4:Resource, 5:Job,, 7:Resource Group, 8:Bank Account, 9:Campaign,
                // 10:Fixed Asset, 11:Insurance, 12:Nonstock Item, 13:IC Partner
                case r97_D."Table Name".AsInteger() of
                    1:
                        if GbooT18 then
                            r97_D.Delete();
                    2:
                        if GbooT23 then
                            r97_D.Delete();
                    3:
                        if GbooT27 then
                            r97_D.Delete();
                    else
                        r97_D.Delete();
                end;
            until r97.Next() = 0;
        end;

        // Reset User Setup
        StatusCounter := StatusCounter + 1;
        Window.Update(1, ROUND(StatusCounter / TotalRecNo * 10000, 1));
        Window.Update(2, StrSubstNo(Gtxt002, '51', r51.TableName()));

        r51.DeleteAll();

        // Reset No. Series
        if GbooNoSeries then begin
            StatusCounter := StatusCounter + 1;
            Window.Update(1, ROUND(StatusCounter / TotalRecNo * 10000, 1));
            Window.Update(2, StrSubstNo(Gtxt002, '308', GrecNrSeries.TableName()));
            if GrecNrSeries.FindSet(false, false) then begin
                GintTotal := GrecNrSeries.Count();
                GintCount := 0;
                repeat
                    GintCount += 1;
                    Window.Update(2, StrSubstNo(Gtxt002, '308', GrecNrSeries.TableName()) + ' (' + Format(GintCount) + '/' + Format(GintTotal) + ')');
                    GrecNrSeriesLine.SetRange(GrecNrSeriesLine."Series Code", GrecNrSeries.Code);
                    if GrecNrSeriesLine.FindLast() then begin
                        GrecNrSeriesLine."Last No. Used" := '';
                    end;
                until GrecNrSeries.Next() = 0;
            end;
            if not GbooT18 then begin
                // Find Last Customer Used
                Window.Update(2, StrSubstNo(Gtxt002, '308', GrecNrSeries.TableName()) + ' Reset ' + GrecT18.TableName());
                GrecBufferT.DeleteAll();
                GrecT18.Reset();
                if GrecT18.FindFirst() then begin
                    GrecBufferT.PK2_Code1 := GrecT18."No. Series";
                    GrecBufferT.PK2_Code2 := GrecT18."No.";
                    GrecBufferT.Insert();
                end;
                LbooContinue := true;
                while LbooContinue do begin
                    if GrecBufferT.FindLast() then begin
                        ResetNoSeries(GrecBufferT.PK2_Code1, GrecBufferT.PK2_Code2);
                    end else begin
                        LbooContinue := false;
                    end;
                end;
            end;
            if not GbooT23 then begin
                // Find Last Vendor Used
                Window.Update(2, StrSubstNo(Gtxt002, '308', GrecNrSeries.TableName()) + ' Reset ' + GrecT23.TableName());
                GrecBufferT.DeleteAll();
                GrecT23.Reset();
                if GrecT23.FindFirst() then begin
                    GrecBufferT.PK2_Code1 := GrecT23."No. Series";
                    GrecBufferT.PK2_Code2 := GrecT23."No.";
                    GrecBufferT.Insert();
                end;
                LbooContinue := true;
                while LbooContinue do begin
                    if GrecBufferT.FindLast() then begin
                        ResetNoSeries(GrecBufferT.PK2_Code1, GrecBufferT.PK2_Code2);
                    end else begin
                        LbooContinue := false;
                    end;
                end;
            end;
            if not GbooT27 then begin
                // Find Last Item Used
                Window.Update(2, StrSubstNo(Gtxt002, '308', GrecNrSeries.TableName()) + ' Reset ' + GrecT27.TableName());
                GrecBufferT.DeleteAll();
                GrecT27.Reset();
                if GrecT27.FindFirst() then begin
                    GrecBufferT.PK2_Code1 := GrecT27."No. Series";
                    GrecBufferT.PK2_Code2 := GrecT27."No.";
                    GrecBufferT.Insert();
                end;
                LbooContinue := true;
                while LbooContinue do begin
                    if GrecBufferT.FindLast() then begin
                        ResetNoSeries(GrecBufferT.PK2_Code1, GrecBufferT.PK2_Code2);
                    end else begin
                        LbooContinue := false;
                    end;
                end;
            end;
            if not GbooT5050 then begin
                // Find Last Contact Used
                Window.Update(2, StrSubstNo(Gtxt002, '308', GrecNrSeries.TableName()) + ' Reset ' + GrecT5050.TableName());
                GrecBufferT.DeleteAll();
                GrecT5050.Reset();
                if GrecT5050.FindFirst() then begin
                    GrecBufferT.PK2_Code1 := GrecT5050."No. Series";
                    GrecBufferT.PK2_Code2 := GrecT5050."No.";
                    GrecBufferT.Insert();
                end;
                LbooContinue := true;
                while LbooContinue do begin
                    if GrecBufferT.FindLast() then begin
                        ResetNoSeries(GrecBufferT.PK2_Code1, GrecBufferT.PK2_Code2);
                    end else begin
                        LbooContinue := false;
                    end;
                end;
            end;
            if not GbooT6010312 then begin
                // Find Last Case Used
                Window.Update(2, StrSubstNo(Gtxt002, '308', GrecNrSeries.TableName()) + ' Reset ' + r6010312.TableName());
                GrecBufferT.DeleteAll();
                GrecPVSetup.FindFirst();
                r6010312.Reset();
                if r6010312.FindSet(false, false) then begin
                    if r6010312."Quote No." <> '' then begin
                        GrecBufferT.PK2_Code1 := GrecPVSetup."Quote No. Series";
                        GrecBufferT.PK2_Code2 := r6010312."Quote No.";
                        GrecBufferT.Insert();
                    end;
                    if r6010312."Order No." <> '' then begin
                        GrecBufferT.PK2_Code1 := GrecPVSetup."Order No. Series";
                        GrecBufferT.PK2_Code2 := r6010312."Order No.";
                        GrecBufferT.Insert();
                    end;
                end;
                LbooContinue := true;
                while LbooContinue do begin
                    if GrecBufferT.FindLast() then begin
                        ResetNoSeries(GrecBufferT.PK2_Code1, GrecBufferT.PK2_Code2);
                    end else begin
                        LbooContinue := false;
                    end;
                end;
            end;
        end;

        Window.Close();
    end;

    var
        GrecT18: Record Customer;
        r18: Record Customer;
        GrecT23: Record Vendor;
        r23: Record Vendor;
        GrecT27: Record Item;
        r27: Record Item;
        r51: Record "User Time Register";
        r97: Record "Comment Line";
        r97_D: Record "Comment Line";
        GrecNrSeries: Record "No. Series";
        GrecNrSeriesLine: Record "No. Series Line";
        GrecT5050: Record Contact;
        r5404: Record "Item Unit of Measure";
        r7002: Record "Sales Price";
        r7004: Record "Sales Line Discount";
        r7012: Record "Purchase Price";
        r7014: Record "Purchase Line Discount";
        r6010084: Record "PVS Userfield Field Value";
        r6010084_D: Record "PVS Userfield Field Value";
        GrecBufferT: Record "PVS Sorting Buffer" temporary;
        GrecPVSetup: Record "PVS General Setup";
        r6010310: Record "PVS Job Item Variant";
        r6010311: Record "PVS Job Product / Variant Map.";
        r6010312: Record "PVS Case";
        r6010313: Record "PVS Job";
        r6010315: Record "PVS Job Text Description";
        r6010316: Record "PVS Job Item";
        r6010317: Record "PVS Job Item Color Entry";
        r6010318: Record "PVS Job Sheet";
        r6010319: Record "PVS Job Process";
        r6010320: Record "PVS Job Process Flow Pointer";
        r6010321: Record "PVS Job Calculation Unit";
        r6010322: Record "PVS Job Calculation Detail";
        r6010323: Record "PVS Job Planning Unit";
        r6010350: Record "PVS Job Item Plate Changes";
        r6010384: Record "PVS Job Costing Journal";
        r6010385: Record "PVS Job Costing Journal Line";
        TableMetadata: Record "Table Metadata";
        SingleInstance: Codeunit "PVS SingleInstance";
        Window: Dialog;
        GtxtUFTableFilter: Text[250];
        GintCount: Integer;
        GintTotal: Integer;
        GintTotalUF: Integer;
        GintUFCount: Integer;
        StatusCounter: Integer;
        TotalRecNo: Integer;
        [InDataSet]
        GbooAllNonPVS: Boolean;
        GbooNoSeries: Boolean;
        GbooT18: Boolean;
        GbooT23: Boolean;
        GbooT27: Boolean;
        GbooT5050: Boolean;
        GbooT6010312: Boolean;
        GbooT6010312Templates: Boolean;
        DialogText: label '@1@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\#2################################################', Locked = true;
        Gtxt001: label 'You''re about to delete data from the database.\\Are you sure you want to continue?';
        Gtxt002: label 'Table %1 %2';
        Gtxt003: label 'No. Series have been reset to inital values.\Please review Last No. Used for non-deleted records';
        WrongLicense: label 'You need to run this process using a Developer License.';
        RetentionPoliciesErr: Label 'You need to remove all Retention Policies before running a report.';

    procedure ResetNoSeries(PcodSeriesCode: Code[20]; PcodLastUsed: Code[20])
    begin
        GrecNrSeriesLine.SetRange(GrecNrSeriesLine."Series Code", PcodSeriesCode);
        if GrecNrSeriesLine.FindLast() then begin
            GrecNrSeriesLine."Last No. Used" := PcodLastUsed;
            GrecNrSeriesLine.Modify();
        end;
        GrecBufferT.SetRange(GrecBufferT.PK2_Code1, PcodSeriesCode);
        GrecBufferT.DeleteAll();
    end;

    procedure CleanTable(TableNo: Integer)
    var
        RecRef: RecordRef;
        LocalTableMetadata: Record "Table Metadata";
    begin
        if not LocalTableMetadata.Get(TableNo) then
            exit;

        RecRef.Open(TableNo);
        RecRef.DeleteAll(false);
    end;

    procedure Delete_Customers()
    begin
        if GbooAllNonPVS then
            exit;

        r7002.Reset();
        r7002.SetCurrentkey(r7002."Sales Type", r7002."Sales Code", r7002."Item No.", r7002."Starting Date", r7002."Currency Code", r7002."Variant Code",
          r7002."Unit of Measure Code", r7002."Minimum Quantity");
        r7004.Reset();
        r7004.SetCurrentkey(r7004."Sales Type", r7004."Sales Code", r7004.Type, r7004.Code, r7004."Starting Date", r7004."Currency Code", r7004."Variant Code",
          r7004."Unit of Measure Code", r7004."Minimum Quantity");
        if r18.FindSet() then
            repeat
                r7002.SetRange(r7002."Sales Type", r7002."sales type"::Customer);
                r7002.SetRange(r7002."Sales Code", r18."No.");
                r7002.DeleteAll();
                r7004.SetRange(r7004."Sales Type", r7004."sales type"::Customer);
                r7004.SetRange(r7004."Sales Code", r18."No.");
                r7004.DeleteAll();
                r18.DeleteAll();
            until r18.Next() = 0;
    end;

    procedure Delete_Vendors()
    begin
        if GbooAllNonPVS then
            exit;

        r7012.Reset();
        r7012.SetCurrentkey(r7012."Vendor No.", r7012."Item No.", r7012."Starting Date", r7012."Currency Code", r7012."Variant Code",
          r7012."Unit of Measure Code", r7012."Minimum Quantity");
        r7014.Reset();
        r7014.SetCurrentkey(r7014."Vendor No.", r7014."Item No.", r7014."Starting Date", r7014."Currency Code", r7014."Variant Code",
          r7014."Unit of Measure Code", r7014."Minimum Quantity");
        if r23.FindSet() then
            repeat
                r7012.SetRange(r7012."Vendor No.", r23."No.");
                r7012.DeleteAll();
                r7014.SetRange(r7014."Vendor No.", r23."No.");
                r7014.DeleteAll();
                r23.Delete();
            until r23.Next() = 0;
    end;

    procedure Delete_Items()
    begin
        if GbooAllNonPVS then
            exit;

        StatusCounter := StatusCounter + 1;
        Window.Update(1, ROUND(StatusCounter / TotalRecNo * 10000, 1));
        Window.Update(2, StrSubstNo(Gtxt002, '27', r27.TableName()));

        if not r27.FindSet() then
            exit;

        r7002.Reset();
        r7002.SetCurrentkey(r7002."Item No.", r7002."Sales Type", r7002."Sales Code", r7002."Starting Date", r7002."Currency Code", r7002."Variant Code",
          r7002."Unit of Measure Code", r7002."Minimum Quantity");
        r7004.Reset();
        r7004.SetCurrentkey(r7004.Type, r7004.Code, r7004."Sales Type", r7004."Sales Code", r7004."Starting Date", r7004."Currency Code", r7004."Variant Code",
          r7004."Unit of Measure Code", r7004."Minimum Quantity");
        r7012.Reset();
        r7012.SetCurrentkey(r7012."Item No.", r7012."Vendor No.", r7012."Starting Date", r7012."Currency Code", r7012."Variant Code",
          r7012."Unit of Measure Code", r7012."Minimum Quantity");
        r7014.Reset();
        r7014.SetCurrentkey(r7014."Item No.", r7014."Vendor No.", r7014."Starting Date", r7014."Currency Code", r7014."Variant Code",
          r7014."Unit of Measure Code", r7014."Minimum Quantity");
        repeat
            r6010322.Reset();
            r6010322.SetRange(r6010322."Item No.", r27."No.");
            r6010316.Reset();
            r6010316.SetRange(r6010316."Item No.", r27."No.");
            r6010313.Reset();
            r6010313.SetRange(r6010313."Item No.", r27."No.");

            if (r6010322.IsEmpty()) and (r6010316.IsEmpty()) and (r6010313.IsEmpty()) then begin
                r7002.SetRange(r7002."Item No.", r27."No.");
                r7002.DeleteAll();
                r7004.SetRange(r7004.Type, r7004.Type::Item);
                r7004.SetRange(r7004.Code, r27."No.");
                r7012.SetRange(r7012."Item No.", r27."No.");
                r7012.DeleteAll();
                r7014.SetRange(r7014."Item No.", r27."No.");
                r7014.DeleteAll();
                r5404.SetRange(r5404."Item No.", r27."No.");
                r5404.DeleteAll();
                r27.Delete(true);
            end;
        until r27.Next() = 0;
    end;

    procedure Delete_All_Cases_Not_Templates()
    begin
        // Delete Cases - but leave all Templates
        // Set filters if needed
        // i.e. r6010312.SETFILTER(ID,'XX..');

        StatusCounter := StatusCounter + 1;
        Window.Update(1, ROUND(StatusCounter / TotalRecNo * 10000, 1));
        Window.Update(2, StrSubstNo(Gtxt002, '6010312', r6010312.TableName()));

        if r6010312.FindSet() then begin
            GintTotal := r6010312.Count();
            GintCount := 0;
            repeat
                GintCount += 1;
                Window.Update(2, StrSubstNo(Gtxt002, '6010312', r6010312.TableName()) + ' (' + Format(GintCount) + '/' + Format(GintTotal) + ')');

                // 001
                if not isTemplateCase(r6010312.ID) then begin
                    // r6010313.SETRANGE(ID,r6010312.ID);
                    // r6010313.SETRANGE(Template,TRUE);
                    // IF NOT r6010313.FindSet() THEN BEGIN
                    // 001
                    SingleInstance.Set_Override_TableTrigger_Check(true);
                    r6010310.SetRange(r6010310.ID, r6010312.ID);
                    r6010310.DeleteAll();

                    SingleInstance.Set_Override_TableTrigger_Check(true);
                    r6010311.SetRange(r6010311.ID, r6010312.ID);
                    r6010311.DeleteAll();

                    SingleInstance.Set_Override_TableTrigger_Check(true);
                    r6010313.SetRange(r6010313.Template);
                    r6010313.DeleteAll();

                    SingleInstance.Set_Override_TableTrigger_Check(true);
                    r6010316.SetRange(r6010316.ID, r6010312.ID);
                    r6010316.DeleteAll();

                    SingleInstance.Set_Override_TableTrigger_Check(true);
                    r6010322.SetRange(r6010322.ID, r6010312.ID);
                    r6010322.DeleteAll();

                    SingleInstance.Set_Override_TableTrigger_Check(true);
                    r6010321.SetRange(r6010321.ID, r6010312.ID);
                    r6010321.DeleteAll();

                    SingleInstance.Set_Override_TableTrigger_Check(true);
                    r6010323.SetCurrentkey(r6010323.ID);
                    r6010323.SetRange(r6010323.ID, r6010312.ID);
                    r6010323.DeleteAll();

                    SingleInstance.Set_Override_TableTrigger_Check(true);
                    r6010318.SetCurrentkey(r6010318.ID);
                    r6010318.SetRange(r6010318.ID, r6010312.ID);
                    r6010318.DeleteAll();

                    SingleInstance.Set_Override_TableTrigger_Check(true);
                    r6010315.SetRange(r6010315.ID, r6010312.ID);
                    r6010315.DeleteAll();

                    SingleInstance.Set_Override_TableTrigger_Check(true);
                    r6010319.SetCurrentkey(r6010319.ID);
                    r6010319.SetRange(r6010319.ID, r6010312.ID);
                    r6010319.DeleteAll();

                    SingleInstance.Set_Override_TableTrigger_Check(true);
                    r6010320.SetCurrentkey(r6010320."Pointer Type", r6010320.ID);
                    r6010320.SetRange(r6010320.ID, r6010312.ID);
                    r6010320.DeleteAll();

                    SingleInstance.Set_Override_TableTrigger_Check(true);
                    r6010350.SetRange(r6010350.ID, r6010312.ID);
                    r6010350.DeleteAll();

                    SingleInstance.Set_Override_TableTrigger_Check(true);
                    r6010317.SetRange(r6010317.ID, r6010312.ID);
                    r6010317.DeleteAll();
                    r6010312.Delete();

                end;
            until r6010312.Next() = 0;
        end;

        SingleInstance.Set_Override_TableTrigger_Check(false);
    end;

    procedure Delete_All_Cases_And_Templates()
    begin
        CleanTable(6010310);
        CleanTable(6010311);
        CleanTable(6010312);
        CleanTable(6010313);
        CleanTable(6010314);
        CleanTable(6010315);
        CleanTable(6010316);
        CleanTable(6010317);
        CleanTable(6010318);
        CleanTable(6010319);
        CleanTable(6010320);
        CleanTable(6010321);
        CleanTable(6010322);
        CleanTable(6010323);
        CleanTable(6010324);
        CleanTable(6010325);
        CleanTable(6010326);
        CleanTable(6010327);
        CleanTable(6010328);
        CleanTable(6010350);
    end;

    procedure Delete_Job_Costing_Journal_Lines()
    begin
        r6010384.Reset();
        r6010384.SetRange(r6010384.Template, false);
        if r6010384.FindFirst() then begin
            repeat
                r6010385.Reset();
                r6010385.SetRange(r6010385.Journal, r6010384.Code);
                r6010385.DeleteAll();
            until r6010384.Next() = 0;
        end;
    end;

    local procedure isTemplateCase(in_ID: Integer): Boolean
    var
        PVSProductGroup: Record "PVS Product Group";
    begin
        // 001
        r6010313.SetRange(r6010313.ID, in_ID);
        r6010313.SetRange(r6010313.Template, true);
        if r6010313.FindFirst() then
            exit(true);

        // PVSProductGroup.Reset();
        PVSProductGroup.SetRange("Template ID", in_ID);
        if PVSProductGroup.FindFirst() then
            exit(true);

        r27.Reset();
        r27.SetRange(r27."PVS Template ID", in_ID);
        if r27.FindFirst() then
            exit(true);
    end;
}

