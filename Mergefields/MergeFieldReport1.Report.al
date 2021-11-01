Report 69007 "PTE Example MergeField 1"
{
    Caption = 'PrintVis Example MergeFields Report - Job (1)';
    ProcessingOnly = true;
    UseRequestPage = false;

    dataset
    {
        dataitem(DocRec; "PVS Document")
        {
            DataItemTableView = sorting("Entry No.");
            RequestFilterFields = "Entry No.";


            trigger OnAfterGetRecord()
            begin
                if not (DocRec."Table ID" in [6010312, 6010313]) then
                    Error(Text001);

                FileContents := '';
                CreateMergeContents();
                MergeRec.Merge_Custom_Report_WriteContents(FileContents);
            end;
        }
    }
    var
        MergeRec: Record "PVS Merge Fields";
        FileContents: Text;
        CaptionDescription: label 'Description';
        CaptionPages: label 'Pages';
        CaptionPrice: label 'Price';
        CaptionPriceAdditional: label 'Price additional';
        CaptionQuantity: label 'Quantity';
        Text001: label 'This report is only valid in connection with a Print-Order';

    local procedure CreateMergeContents()
    var
        OrderRec: Record "PVS Case";
        AlternativeJobRec: Record "PVS Job";
        JobRec: Record "PVS Job";
    begin
        // The design goes like this:
        // ------------------------------------------------------------------------------
        //
        // Quantity   Pages   Description     Price   Price additional
        //   99.999     999   xxxxxxxxxxx  9.999,99           9.999,99 // All Quotationlines
        //   99.999     999   xxxxxxxxxxx  9.999,99           9.999,99 // are printed
        //   99.999     999   xxxxxxxxxxx  9.999,99           9.999,99

        OrderRec.Get(DocRec.ID1);

        JobRec.SetRange(ID, OrderRec.ID);
        JobRec.SetRange(Status, JobRec.Status::Quote);
        JobRec.SetRange(Active, true);

        AddContent(
          CaptionQuantity + '[TAB]' +
          CaptionPages + '[TAB]' +
          CaptionDescription + '[TAB]' +
          CaptionPrice + '[TAB]' +
          CaptionPriceAdditional + '[CRLF]');

        if JobRec.FindSet(false, false) then
            repeat
                WriteJob(JobRec, JobRec);

                AlternativeJobRec.Reset();
                AlternativeJobRec.SetRange(ID, JobRec.ID);
                AlternativeJobRec.SetRange(Job, JobRec.Job);
                AlternativeJobRec.SetFilter(Version, '<>%1', JobRec.Version);
                AlternativeJobRec.SetRange(Alternative, 1, 2);
                if AlternativeJobRec.FindSet(false, false) then
                    repeat
                        WriteJob(AlternativeJobRec, JobRec);
                    until AlternativeJobRec.Next() = 0;
            until JobRec.Next() = 0;
    end;

    local procedure WriteJob(in_JobRec: Record "PVS Job"; PrimaryJobRec: Record "PVS Job")
    var
        JobItemRec: Record "PVS Job Item";
        GAF: Codeunit "PVS Table Filters";
        i: Integer;
    begin
        in_JobRec.CalcFields(Description);

        if (in_JobRec.Alternative = 2) and (in_JobRec.Version <> PrimaryJobRec.Version) then begin
            in_JobRec."Quoted Price" := in_JobRec."Quoted Price" - PrimaryJobRec."Quoted Price";
            in_JobRec."Add. Quoted Price" := in_JobRec."Add. Quoted Price" - PrimaryJobRec."Add. Quoted Price";
        end;

        i := 0;
        GAF.SELECT_JobItems2Job(JobItemRec, in_JobRec.ID, in_JobRec.Job, in_JobRec.Version, true);
        if JobItemRec.FindSet(false, false) then
            repeat
                i := i + JobItemRec."Pages With Print";
            until JobItemRec.Next() = 0;

        AddContent(
          Format(in_JobRec.Quantity) + '[TAB]' +
          Format(i) + '[TAB]' +
          Format(in_JobRec.Description) + '[TAB]' +
          MergeRec.FormatDecimal(in_JobRec."Quoted Price", 2) + '[TAB]' +
          MergeRec.FormatDecimal(in_JobRec."Add. Quoted Price", 2) + '[CRLF]'
          );
    end;

    local procedure AddContent(in_Txt: Text)
    begin
        FileContents += in_Txt;
    end;
}

