codeunit 50100 "PTE Opening Hours SingleInstance"
{
    SingleInstance = true;

    //Used by the OpeningHours PageExtension

    //Add extra Calendar beyond PrintVis standard size to the Opening Hours Setup.
    //It should dynamically add Calendars after PrintVis.
    //So if PrintVis at some point extend their Calendar size from 32 to 64, the custom additions will be applied after
    //making sure it should not break any existing extension but just grow the number of Calenders shown 

    //*Adjust 8
    //Add below for each dimension field missing / needed
    //It should equal the GlobalDimensionSize set in this Codeunit
    //Example code

    /*                
                field(PTEField1; PTEMatrixData[1]) //<-- Adjust index
                {
                    ApplicationArea = All;
                    AutoFormatExpression = FormatStr("Analysis Rounding Factor"::"1000");
                    AutoFormatType = 10;
                    captionclass = '3,' + PTEMatrixColumnCaptions[1];//<-- Adjust index
                    StyleExpr = PTEField1Style;//<-- New variable is needed + Adjust Variable
                    TableRelation = "PVS Opening Hour Profile";
                    ToolTip = 'Use this action to set a day back to previously assigned Hour Profile.';
                    Visible = PTEField1Visible;//<-- New variable is needed + Adjust Variable
                    Width = 10;

                    trigger OnDrillDown()
                    begin
                        FieldDrillDown(PTEMatrixCalendarCodeColumnKey[1]);//<-- Adjust index
                        CurrPage.Update(true);
                    end;

                    trigger OnValidate()
                    begin
                        PageUpdate(Rec, PTEMatrixCalendarCodeColumnKey[1], PTEMatrixData[1]);//<-- Adjust both indexes
                        CurrPage.Update(true);
                    end;
                }
    */
    //Example code
    //*Adjust 8




    var
        //Dimension size 
        GlobalDimensionSize: Integer;
        //*Adjust 2
        //Array dimension should be requal to GlobalDimensionSize
        GlobalPTEMatrixColumnCaptions: array[32] of Text[1024];
        GlobalPTEMatrixData: array[32] of Text;
        GlobalPTEMatrixCalendarCodeColumnKey: array[32] of Code[20];
        GlobalPTEMatrixRounding: array[32] of Option;
        GlobalPTEMatrixStyle: array[32] of Text;
    //Array dimension should be requal to GlobalDimensionSize
    //*Adjust 2


    //*Adjust 3
    //Parameter should be requal to Out_CustomDimensionSize
    procedure CopyArrays(
           var PTEMatrixCalendarCodeColumnKey: array[32] of Code[20];
           var PTEMatrixColumnCaptions: array[32] of Text[1024];
           var PTEMatrixData: array[32] of Text;
           var PTEMatrixRounding: array[32] of Option;
           var PTEMatrixStyle: array[32] of Text)
    //Parameter should be requal to Out_CustomDimensionSize
    begin
        //Copy Parameter should be requal to Out_CustomDimensionSize
        CopyArray(PTEMatrixCalendarCodeColumnKey, GlobalPTEMatrixCalendarCodeColumnKey, 1, 32);
        CopyArray(PTEMatrixData, GlobalPTEMatrixData, 1, 32);
        CopyArray(PTEMatrixColumnCaptions, GlobalPTEMatrixColumnCaptions, 1, 32);
        CopyArray(PTEMatrixRounding, GlobalPTEMatrixRounding, 1, 32);
        CopyArray(PTEMatrixStyle, GlobalPTEMatrixStyle, 1, 32);
        //Copy Parameter should be requal to Out_CustomDimensionSize
    end;
    //*Adjust 3

    [EventSubscriber(ObjectType::Page, Page::"PVS Opening Hours Setup", 'LoadMatrixCustomDimensionsSetCustomSize', '', false, false)]
    local procedure LoadMatrixCustomDimensionsSetCustomSize(var Out_CustomDimensionSize: Integer)
    begin
        //*Adjust 1
        //Determines the size of the extra custom calendar size 
        GlobalDimensionSize := 32;
        //*Adjust 1

        Out_CustomDimensionSize := GlobalDimensionSize;
        Clear(GlobalPTEMatrixColumnCaptions);
        Clear(GlobalPTEMatrixData);
        Clear(GlobalPTEMatrixCalendarCodeColumnKey);
        Clear(GlobalPTEMatrixRounding);
    end;

    //Does not need to be modified
    [EventSubscriber(ObjectType::Page, Page::"PVS Opening Hours Setup", 'LoadDataCustomDimensionGetCalendarCode', '', false, false)]
    local procedure LoadDataCustomDimensionGetCalendarCode(CustomIndex: Integer; var Out_CalendarCode: Code[20])
    begin
        Out_CalendarCode := GlobalPTEMatrixCalendarCodeColumnKey[CustomIndex];
    end;
    //Does not need to be modified


    //Does not need to be modified
    [EventSubscriber(ObjectType::Page, Page::"PVS Opening Hours Setup", 'LoadMatrixCustomDimensionsSetDimensionsValues', '', false, false)]
    local procedure LoadMatrixCustomDimensionsSetDimensionsValues(CustomIndex: Integer; CalendarCode: Code[20]; Data: Code[20]; Rounding: Option)
    begin
        GlobalPTEMatrixCalendarCodeColumnKey[CustomIndex] := CalendarCode;
        GlobalPTEMatrixRounding[CustomIndex] := Rounding;
        GlobalPTEMatrixData[CustomIndex] := Data;
    end;
    //Does not need to be modified

    //Does not need to be modified
    [EventSubscriber(ObjectType::Page, Page::"PVS Opening Hours Setup", 'LoadMatrixSetCustomMaxtrixIndex', '', false, false)]
    local procedure LoadMatrixSetCustomMaxtrixIndex(CustomIndex: Integer; CalendarCode: Code[20]; ColumnCaption: Text[50])
    begin
        GlobalPTEMatrixCalendarCodeColumnKey[CustomIndex] := CalendarCode;
        GlobalPTEMatrixColumnCaptions[CustomIndex] := ColumnCaption;
        //Does not need to be modified
    end;

    //Does not need to be modified
    [EventSubscriber(ObjectType::Page, Page::"PVS Opening Hours Setup", 'SetStyleCustomDimensionsSetCustomStyle', '', false, false)]
    local procedure SetStyleCustomDimensionsSetCustomStyle(CustomIndex: Integer; Style: Text)
    begin
        GlobalPTEMatrixStyle[CustomIndex] := Style;
    end;
    //Does not need to be modified
}
