Report 69001 "PTE Example API/KPI Customers"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/APIKPICustomers.rdlc';
    Caption = 'PrintVis Example API/KPI Customers';

    dataset
    {
        dataitem(Customer; Customer)
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.", "Date Filter";

            column(FORMAT_TODAY_0_4_; Format(Today(), 0, 4)) { }
            column(COMPANYNAME; COMPANYNAME) { }
            column(UserId; UserId) { }
            column(GetFilters; GetFilters) { }
            column(Customer__No__; "No.") { }
            column(Customer_Name; Name) { }
            column(T_1_; T[1]) { }
            column(T_2_; T[2]) { }
            column(T_3_; T[3]) { }
            column(T_4_; T[4]) { }
            column(Text001; Text001) { }
            column(T_1__Control1160230020; T[1]) { }
            column(T_2__Control1160230021; T[2]) { }
            column(T_3__Control1160230022; T[3]) { }
            column(T_4__Control1160230023; T[4]) { }
            column(Customer_KPICaption; Customer_KPICaptionLbl) { }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl) { }
            column(Customer__No__Caption; FieldCaption("No.")) { }
            column(Customer_NameCaption; FieldCaption(Name)) { }
            column(T_1_Caption; T_1_CaptionLbl) { }
            column(Direct_CostCaption; Direct_CostCaptionLbl) { }
            column(Contribution_MarginCaption; Contribution_MarginCaptionLbl) { }
            column(Contribution_Margin_RatioCaption; Contribution_Margin_RatioCaptionLbl) { }

            trigger OnAfterGetRecord()
            begin
                Calculate();

                if (T[1] = 0) and (T[2] = 0) then // Don't print if zero
                    CurrReport.Skip();
            end;

        }
    }

    var
        T: array[10] of Decimal;
        KPI_Date_Principle: Option PostingDate,InvoiceDate,ShipmentDate,OrderDate,StatisticDate,ArchiveDate;
        Contribution_Margin_RatioCaptionLbl: label 'Contribution Margin Ratio';
        Contribution_MarginCaptionLbl: label 'Contribution Margin';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        Customer_KPICaptionLbl: label 'Customer KPI';
        Direct_CostCaptionLbl: label 'Direct Cost';
        T_1_CaptionLbl: label 'Invoiced Sale';
        Text001: label 'Total';

    procedure Calculate()
    var
        FilterRec: Record "PVS Job Costing Entry";
        API: Codeunit "PVS API";
    begin
        Clear(T);
        FilterRec.SetFilter("Posting Date", Customer.GetFilter("Date Filter"));

        API.KPI_Select_Date_Principle(KPI_Date_Principle);
        API.KPI_CALCULATE_Customer(Customer."No.", false, true, FilterRec);

        T[1] := API.GET_Invoiced_Amount();     // Invoiced Sale
        T[2] := API.GET_Direct_Cost(4);      // Direct Cost, Job Costing

        Calculate_Functions();
    end;

    procedure Calculate_Functions()
    begin
        T[3] := T[1] - T[2];                 // Contribution Margin
        if T[1] <> 0 then
            T[4] := 100 * T[3] / T[1]          // Contribution Margin Ratio
        else
            T[4] := 0;
    end;
}

