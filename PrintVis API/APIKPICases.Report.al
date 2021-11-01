Report 69000 "PTE Example API/KPI Cases"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/APIKPICases.rdlc';
    Caption = 'PrintVis Example API/KPI Cases';

    dataset
    {
        dataitem("PVS Case"; "PVS Case")
        {
            RequestFilterFields = Type, ID, Archived, "Status Code", "Date Filter";
            column(FORMAT_TODAY_0_4_; Format(Today(), 0, 4)) { }
            column(COMPANYNAME; COMPANYNAME) { }
            column(UserId; UserId) { }
            column(GetFilters; GetFilters) { }
            column(T_1_; T[1]) { }
            column(T_2_; T[2]) { }
            column(T_3_; T[3]) { }
            column(T_4_; T[4]) { }
            column(PVS_Case__Order_No__; "Order No.") { }
            column(PVS_Case__Job_Name_; "Job Name") { }
            column(Text001; Text001) { }
            column(T_1__Control1160230020; T[1]) { }
            column(T_2__Control1160230021; T[2]) { }
            column(T_3__Control1160230022; T[3]) { }
            column(T_4__Control1160230023; T[4]) { }
            column(Cases_KPICaption; Cases_KPICaptionLbl) { }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl) { }
            column(T_1_Caption; T_1_CaptionLbl) { }
            column(Direct_CostCaption; Direct_CostCaptionLbl) { }
            column(Contribution_MarginCaption; Contribution_MarginCaptionLbl) { }
            column(Contribution_Margin_RatioCaption; Contribution_Margin_RatioCaptionLbl) { }
            column(PVS_Case__Order_No__Caption; FieldCaption("Order No.")) { }
            column(PVS_Case__Job_Name_Caption; FieldCaption("Job Name")) { }
            column(PVS_Case_ID; ID) { }

            trigger OnAfterGetRecord()
            begin
                Calculate();

                if (T[1] = 0) and (T[2] = 0) then // Don't print if zero
                    CurrReport.Skip();
            end;

        }
    }

    local procedure Calculate()
    var
        FilterRec: Record "PVS Job Costing Entry";
        API: Codeunit "PVS API";
    begin
        Clear(T);
        FilterRec.SetFilter("Posting Date", "PVS Case".GetFilter("Date Filter"));

        API.KPI_Select_Date_Principle(KPI_Date_Principle);
        API.KPI_CALCULATE_Case("PVS Case".ID, FilterRec);

        T[1] := API.GET_Invoiced_Amount();     // Invoiced Sale
        T[2] := API.GET_Direct_Cost(4);      // Direct Cost, Job Costing

        Calculate_Functions();
    end;

    local procedure Calculate_Functions()
    begin
        T[3] := T[1] - T[2];                 // Contribution Margin
        if T[1] <> 0 then
            T[4] := 100 * T[3] / T[1]          // Contribution Margin Ratio
        else
            T[4] := 0;
    end;

    var
        T: array[10] of Decimal;
        KPI_Date_Principle: Option PostingDate,InvoiceDate,ShipmentDate,OrderDate,StatisticDate,ArchiveDate;
        Cases_KPICaptionLbl: label 'Cases KPI';
        Contribution_Margin_RatioCaptionLbl: label 'Contribution Margin Ratio';
        Contribution_MarginCaptionLbl: label 'Contribution Margin';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        Direct_CostCaptionLbl: label 'Direct Cost';
        T_1_CaptionLbl: label 'Invoiced Sale';
        Text001: label 'Total';
}

