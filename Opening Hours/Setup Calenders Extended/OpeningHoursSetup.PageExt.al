// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 "PTE Opening Hours Setup" extends "PVS Opening Hours Setup"
{
    layout
    {
        addlast(Control1)
        {
            field(PTEField1; PTEMatrixData[1])
            {
                ApplicationArea = All;
                AutoFormatExpression = FormatStr("Analysis Rounding Factor"::"1000");
                AutoFormatType = 10;
                captionclass = '3,' + PTEMatrixColumnCaptions[1];
                StyleExpr = PTEField1Style;
                TableRelation = "PVS Opening Hour Profile";
                ToolTip = 'Use this action to set a day back to previously assigned Hour Profile.';
                Visible = PTEField1Visible;
                Width = 10;

                trigger OnDrillDown()
                begin
                    FieldDrillDown(PTEMatrixCalendarCodeColumnKey[1]);
                    CurrPage.Update(true);
                end;

                trigger OnValidate()
                begin
                    PageUpdate(Rec, PTEMatrixCalendarCodeColumnKey[1], PTEMatrixData[1]);
                    CurrPage.Update(true);
                end;
            }
            field(PTEField2; PTEMatrixData[2])
            {
                ApplicationArea = All;
                AutoFormatExpression = FormatStr("Analysis Rounding Factor"::"1000");
                AutoFormatType = 10;
                captionclass = '3,' + PTEMatrixColumnCaptions[2];
                StyleExpr = PTEField2Style;
                TableRelation = "PVS Opening Hour Profile";
                ToolTip = 'Use this action to set a day back to previously assigned Hour Profile.';
                Visible = PTEField2Visible;
                Width = 10;

                trigger OnDrillDown()
                begin
                    FieldDrillDown(PTEMatrixCalendarCodeColumnKey[2]);
                    CurrPage.Update(true);
                end;

                trigger OnValidate()
                begin
                    PageUpdate(Rec, PTEMatrixCalendarCodeColumnKey[2], PTEMatrixData[2]);
                    CurrPage.Update(true);
                end;
            }
            field(PTEField3; PTEMatrixData[3])
            {
                ApplicationArea = All;
                AutoFormatExpression = FormatStr("Analysis Rounding Factor"::"1000");
                AutoFormatType = 10;
                captionclass = '3,' + PTEMatrixColumnCaptions[3];
                StyleExpr = PTEField3Style;
                TableRelation = "PVS Opening Hour Profile";
                ToolTip = 'Use this action to set a day back to previously assigned Hour Profile.';
                Visible = PTEField3Visible;
                Width = 10;

                trigger OnDrillDown()
                begin
                    FieldDrillDown(PTEMatrixCalendarCodeColumnKey[3]);
                    CurrPage.Update(true);
                end;

                trigger OnValidate()
                begin
                    PageUpdate(Rec, PTEMatrixCalendarCodeColumnKey[3], PTEMatrixData[3]);
                    CurrPage.Update(true);
                end;
            }
            field(PTEField4; PTEMatrixData[4])
            {
                ApplicationArea = All;
                AutoFormatExpression = FormatStr("Analysis Rounding Factor"::"1000");
                AutoFormatType = 10;
                captionclass = '3,' + PTEMatrixColumnCaptions[4];
                StyleExpr = PTEField4Style;
                TableRelation = "PVS Opening Hour Profile";
                ToolTip = 'Use this action to set a day back to previously assigned Hour Profile.';
                Visible = PTEField4Visible;
                Width = 10;

                trigger OnDrillDown()
                begin
                    FieldDrillDown(PTEMatrixCalendarCodeColumnKey[4]);
                    CurrPage.Update(true);
                end;

                trigger OnValidate()
                begin
                    PageUpdate(Rec, PTEMatrixCalendarCodeColumnKey[4], PTEMatrixData[4]);
                    CurrPage.Update(true);
                end;
            }
            field(PTEField5; PTEMatrixData[5])
            {
                ApplicationArea = All;
                AutoFormatExpression = FormatStr("Analysis Rounding Factor"::"1000");
                AutoFormatType = 10;
                captionclass = '3,' + PTEMatrixColumnCaptions[5];
                StyleExpr = PTEField5Style;
                TableRelation = "PVS Opening Hour Profile";
                ToolTip = 'Use this action to set a day back to previously assigned Hour Profile.';
                Visible = PTEField5Visible;
                Width = 10;

                trigger OnDrillDown()
                begin
                    FieldDrillDown(PTEMatrixCalendarCodeColumnKey[5]);
                    CurrPage.Update(true);
                end;

                trigger OnValidate()
                begin
                    PageUpdate(Rec, PTEMatrixCalendarCodeColumnKey[5], PTEMatrixData[5]);
                    CurrPage.Update(true);
                end;
            }
            field(PTEField6; PTEMatrixData[6])
            {
                ApplicationArea = All;
                AutoFormatExpression = FormatStr("Analysis Rounding Factor"::"1000");
                AutoFormatType = 10;
                captionclass = '3,' + PTEMatrixColumnCaptions[6];
                StyleExpr = PTEField6Style;
                TableRelation = "PVS Opening Hour Profile";
                ToolTip = 'Use this action to set a day back to previously assigned Hour Profile.';
                Visible = PTEField6Visible;
                Width = 10;

                trigger OnDrillDown()
                begin
                    FieldDrillDown(PTEMatrixCalendarCodeColumnKey[6]);
                    CurrPage.Update(true);
                end;

                trigger OnValidate()
                begin
                    PageUpdate(Rec, PTEMatrixCalendarCodeColumnKey[6], PTEMatrixData[6]);
                    CurrPage.Update(true);
                end;
            }
            field(PTEField7; PTEMatrixData[7])
            {
                ApplicationArea = All;
                AutoFormatExpression = FormatStr("Analysis Rounding Factor"::"1000");
                AutoFormatType = 10;
                captionclass = '3,' + PTEMatrixColumnCaptions[7];
                StyleExpr = PTEField7Style;
                TableRelation = "PVS Opening Hour Profile";
                ToolTip = 'Use this action to set a day back to previously assigned Hour Profile.';
                Visible = PTEField7Visible;
                Width = 10;

                trigger OnDrillDown()
                begin
                    FieldDrillDown(PTEMatrixCalendarCodeColumnKey[7]);
                    CurrPage.Update(true);
                end;

                trigger OnValidate()
                begin
                    PageUpdate(Rec, PTEMatrixCalendarCodeColumnKey[7], PTEMatrixData[7]);
                    CurrPage.Update(true);
                end;
            }
            field(PTEField8; PTEMatrixData[8])
            {
                ApplicationArea = All;
                AutoFormatExpression = FormatStr("Analysis Rounding Factor"::"1000");
                AutoFormatType = 10;
                captionclass = '3,' + PTEMatrixColumnCaptions[8];
                StyleExpr = PTEField8Style;
                TableRelation = "PVS Opening Hour Profile";
                ToolTip = 'Use this action to set a day back to previously assigned Hour Profile.';
                Visible = PTEField8Visible;
                Width = 10;

                trigger OnDrillDown()
                begin
                    FieldDrillDown(PTEMatrixCalendarCodeColumnKey[8]);
                    CurrPage.Update(true);
                end;

                trigger OnValidate()
                begin
                    PageUpdate(Rec, PTEMatrixCalendarCodeColumnKey[8], PTEMatrixData[8]);
                    CurrPage.Update(true);
                end;
            }
            field(PTEField9; PTEMatrixData[9])
            {
                ApplicationArea = All;
                AutoFormatExpression = FormatStr("Analysis Rounding Factor"::"1000");
                AutoFormatType = 10;
                captionclass = '3,' + PTEMatrixColumnCaptions[9];
                StyleExpr = PTEField9Style;
                TableRelation = "PVS Opening Hour Profile";
                ToolTip = 'Use this action to set a day back to previously assigned Hour Profile.';
                Visible = PTEField9Visible;
                Width = 10;

                trigger OnDrillDown()
                begin
                    FieldDrillDown(PTEMatrixCalendarCodeColumnKey[9]);
                    CurrPage.Update(true);
                end;

                trigger OnValidate()
                begin
                    PageUpdate(Rec, PTEMatrixCalendarCodeColumnKey[9], PTEMatrixData[9]);
                    CurrPage.Update(true);
                end;
            }
            field(PTEField10; PTEMatrixData[10])
            {
                ApplicationArea = All;
                AutoFormatExpression = FormatStr("Analysis Rounding Factor"::"1000");
                AutoFormatType = 10;
                captionclass = '3,' + PTEMatrixColumnCaptions[10];
                StyleExpr = PTEField10Style;
                TableRelation = "PVS Opening Hour Profile";
                ToolTip = 'Use this action to set a day back to previously assigned Hour Profile.';
                Visible = PTEField10Visible;
                Width = 10;

                trigger OnDrillDown()
                begin
                    FieldDrillDown(PTEMatrixCalendarCodeColumnKey[10]);
                    CurrPage.Update(true);
                end;

                trigger OnValidate()
                begin
                    PageUpdate(Rec, PTEMatrixCalendarCodeColumnKey[10], PTEMatrixData[10]);
                    CurrPage.Update(true);
                end;
            }
            field(PTEField11; PTEMatrixData[11])
            {
                ApplicationArea = All;
                AutoFormatExpression = FormatStr("Analysis Rounding Factor"::"1000");
                AutoFormatType = 10;
                captionclass = '3,' + PTEMatrixColumnCaptions[11];
                StyleExpr = PTEField11Style;
                TableRelation = "PVS Opening Hour Profile";
                ToolTip = 'Use this action to set a day back to previously assigned Hour Profile.';
                Visible = PTEField11Visible;
                Width = 10;

                trigger OnDrillDown()
                begin
                    FieldDrillDown(PTEMatrixCalendarCodeColumnKey[11]);
                    CurrPage.Update(true);
                end;

                trigger OnValidate()
                begin
                    PageUpdate(Rec, PTEMatrixCalendarCodeColumnKey[11], PTEMatrixData[11]);
                    CurrPage.Update(true);
                end;
            }
            field(PTEField12; PTEMatrixData[12])
            {
                ApplicationArea = All;
                AutoFormatExpression = FormatStr("Analysis Rounding Factor"::"1000");
                AutoFormatType = 10;
                captionclass = '3,' + PTEMatrixColumnCaptions[12];
                StyleExpr = PTEField12Style;
                TableRelation = "PVS Opening Hour Profile";
                ToolTip = 'Use this action to set a day back to previously assigned Hour Profile.';
                Visible = PTEField10Visible;
                Width = 10;

                trigger OnDrillDown()
                begin
                    FieldDrillDown(PTEMatrixCalendarCodeColumnKey[12]);
                    CurrPage.Update(true);
                end;

                trigger OnValidate()
                begin
                    PageUpdate(Rec, PTEMatrixCalendarCodeColumnKey[12], PTEMatrixData[12]);
                    CurrPage.Update(true);
                end;
            }
            field(PTEField13; PTEMatrixData[13])
            {
                ApplicationArea = All;
                AutoFormatExpression = FormatStr("Analysis Rounding Factor"::"1000");
                AutoFormatType = 10;
                captionclass = '3,' + PTEMatrixColumnCaptions[13];
                StyleExpr = PTEField13Style;
                TableRelation = "PVS Opening Hour Profile";
                ToolTip = 'Use this action to set a day back to previously assigned Hour Profile.';
                Visible = PTEField13Visible;
                Width = 10;

                trigger OnDrillDown()
                begin
                    FieldDrillDown(PTEMatrixCalendarCodeColumnKey[13]);
                    CurrPage.Update(true);
                end;

                trigger OnValidate()
                begin
                    PageUpdate(Rec, PTEMatrixCalendarCodeColumnKey[13], PTEMatrixData[13]);
                    CurrPage.Update(true);
                end;
            }
            field(PTEField14; PTEMatrixData[14])
            {
                ApplicationArea = All;
                AutoFormatExpression = FormatStr("Analysis Rounding Factor"::"1000");
                AutoFormatType = 10;
                captionclass = '3,' + PTEMatrixColumnCaptions[14];
                StyleExpr = PTEField14Style;
                TableRelation = "PVS Opening Hour Profile";
                ToolTip = 'Use this action to set a day back to previously assigned Hour Profile.';
                Visible = PTEField14Visible;
                Width = 10;

                trigger OnDrillDown()
                begin
                    FieldDrillDown(PTEMatrixCalendarCodeColumnKey[14]);
                    CurrPage.Update(true);
                end;

                trigger OnValidate()
                begin
                    PageUpdate(Rec, PTEMatrixCalendarCodeColumnKey[14], PTEMatrixData[14]);
                    CurrPage.Update(true);
                end;
            }
            field(PTEField15; PTEMatrixData[15])
            {
                ApplicationArea = All;
                AutoFormatExpression = FormatStr("Analysis Rounding Factor"::"1000");
                AutoFormatType = 10;
                captionclass = '3,' + PTEMatrixColumnCaptions[15];
                StyleExpr = PTEField15Style;
                TableRelation = "PVS Opening Hour Profile";
                ToolTip = 'Use this action to set a day back to previously assigned Hour Profile.';
                Visible = PTEField15Visible;
                Width = 10;

                trigger OnDrillDown()
                begin
                    FieldDrillDown(PTEMatrixCalendarCodeColumnKey[15]);
                    CurrPage.Update(true);
                end;

                trigger OnValidate()
                begin
                    PageUpdate(Rec, PTEMatrixCalendarCodeColumnKey[15], PTEMatrixData[15]);
                    CurrPage.Update(true);
                end;
            }
            field(PTEField16; PTEMatrixData[16])
            {
                ApplicationArea = All;
                AutoFormatExpression = FormatStr("Analysis Rounding Factor"::"1000");
                AutoFormatType = 10;
                captionclass = '3,' + PTEMatrixColumnCaptions[16];
                StyleExpr = PTEField16Style;
                TableRelation = "PVS Opening Hour Profile";
                ToolTip = 'Use this action to set a day back to previously assigned Hour Profile.';
                Visible = PTEField16Visible;
                Width = 10;

                trigger OnDrillDown()
                begin
                    FieldDrillDown(PTEMatrixCalendarCodeColumnKey[16]);
                    CurrPage.Update(true);
                end;

                trigger OnValidate()
                begin
                    PageUpdate(Rec, PTEMatrixCalendarCodeColumnKey[16], PTEMatrixData[16]);
                    CurrPage.Update(true);
                end;
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        PTEOpeningsHoursSetupSI.CopyArrays(PTEMatrixCalendarCodeColumnKey, PTEMatrixColumnCaptions, PTEMatrixData, PTEMatrixRounding, GlobalPTEMatrixStyle);
        PTESetStyles();
    end;

    trigger OnOpenPage()
    begin
        PTEOpeningsHoursSetupSI.CopyArrays(PTEMatrixCalendarCodeColumnKey, PTEMatrixColumnCaptions, PTEMatrixData, PTEMatrixRounding, GlobalPTEMatrixStyle);
        PTESetVisible();
    end;

    local procedure PTESetStyles()
    var
        Index: Integer;
    begin
        while (Index <= ArrayLen(GlobalPTEMatrixStyle)) do begin
            Index += 1;
            PTESetIndexStyle(index);
        end;
    end;

    procedure PTESetVisible()
    begin
        //*Adjust 7
        //Visible is set
        PTEField1Visible := PTEMatrixColumnCaptions[1] <> '';
        PTEField2Visible := PTEMatrixColumnCaptions[2] <> '';
        PTEField3Visible := PTEMatrixColumnCaptions[3] <> '';
        PTEField4Visible := PTEMatrixColumnCaptions[4] <> '';
        PTEField5Visible := PTEMatrixColumnCaptions[5] <> '';
        PTEField6Visible := PTEMatrixColumnCaptions[6] <> '';
        PTEField7Visible := PTEMatrixColumnCaptions[7] <> '';
        PTEField8Visible := PTEMatrixColumnCaptions[8] <> '';
        PTEField9Visible := PTEMatrixColumnCaptions[9] <> '';
        PTEField10Visible := PTEMatrixColumnCaptions[10] <> '';
        PTEField11Visible := PTEMatrixColumnCaptions[11] <> '';
        PTEField12Visible := PTEMatrixColumnCaptions[12] <> '';
        PTEField13Visible := PTEMatrixColumnCaptions[13] <> '';
        PTEField14Visible := PTEMatrixColumnCaptions[14] <> '';
        PTEField15Visible := PTEMatrixColumnCaptions[15] <> '';
        PTEField16Visible := PTEMatrixColumnCaptions[16] <> '';
        //Visible is set
        //*Adjust 7
    end;

    local procedure PTESetIndexStyle(Index: Integer)

    begin
        case Index of
            //*Adjust 6
            //Statements should be equal to diemsnion size
            1:
                PTEField1Style := GlobalPTEMatrixStyle[Index];
            2:
                PTEField2Style := GlobalPTEMatrixStyle[Index];
            3:
                PTEField3Style := GlobalPTEMatrixStyle[Index];
            4:
                PTEField4Style := GlobalPTEMatrixStyle[Index];
            5:
                PTEField5Style := GlobalPTEMatrixStyle[Index];
            6:
                PTEField6Style := GlobalPTEMatrixStyle[Index];
            7:
                PTEField7Style := GlobalPTEMatrixStyle[Index];
            8:
                PTEField8Style := GlobalPTEMatrixStyle[Index];
            9:
                PTEField9Style := GlobalPTEMatrixStyle[Index];
            10:
                PTEField10Style := GlobalPTEMatrixStyle[Index];
            11:
                PTEField11Style := GlobalPTEMatrixStyle[Index];
            12:
                PTEField12Style := GlobalPTEMatrixStyle[Index];
            13:
                PTEField13Style := GlobalPTEMatrixStyle[Index];
            14:
                PTEField14Style := GlobalPTEMatrixStyle[Index];
            15:
                PTEField15Style := GlobalPTEMatrixStyle[Index];
            16:
                PTEField16Style := GlobalPTEMatrixStyle[Index];
        //*Adjust 6
        end;
    end;

    var

        //*Adjust 4
        //Dimension Size should be equal to the GlobalDimensionSize in the SingleInstance Codeunit
        PTEMatrixColumnCaptions: array[32] of Text[1024];
        PTEMatrixData: array[32] of Text;
        PTEMatrixCalendarCodeColumnKey: array[32] of Code[20];
        PTEMatrixRounding: array[32] of Option;
        GlobalPTEMatrixStyle: array[32] of Text;
        //*Adjust 4
        PTEOpeningsHoursSetupSI: Codeunit "PTE Opening Hours SI";
        //*Adjust 5
        PTEField1Style: Text;
        PTEField1Visible: Boolean;
        PTEField2Style: Text;
        PTEField2Visible: Boolean;
        PTEField3Style: Text;
        PTEField3Visible: Boolean;
        PTEField4Style: Text;
        PTEField4Visible: Boolean;
        PTEField5Style: Text;
        PTEField5Visible: Boolean;
        PTEField6Style: Text;
        PTEField6Visible: Boolean;
        PTEField7Style: Text;
        PTEField7Visible: Boolean;
        PTEField8Style: Text;
        PTEField8Visible: Boolean;
        PTEField9Style: Text;
        PTEField9Visible: Boolean;
        PTEField10Style: Text;
        PTEField10Visible: Boolean;
        PTEField11Style: Text;
        PTEField11Visible: Boolean;
        PTEField12Style: Text;
        PTEField12Visible: Boolean;
        PTEField13Style: Text;
        PTEField13Visible: Boolean;
        PTEField14Style: Text;
        PTEField14Visible: Boolean;
        PTEField15Style: Text;
        PTEField15Visible: Boolean;
        PTEField16Style: Text;
        PTEField16Visible: Boolean;
    //PTEField16Style: Text; //<-- Add for each dimension
    //PTEField16Visible: Boolean; //<-- Add for each dimension
    //*Adjust 5

}