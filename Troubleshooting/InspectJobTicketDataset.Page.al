page 69000 "PTE Example Inspect Buffer"
{

    Caption = 'PrintVis Example Inspect Job Ticket Dataset';
    PageType = List;
    SourceTable = "PVS Sorting Buffer";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(PK1_Integer1; Rec.PK1_Integer1)
                {
                    ApplicationArea = All;
                }
                field(PK1_Integer2; Rec.PK1_Integer2)
                {
                    ApplicationArea = All;
                }
                field("Report Section"; Rec."Report Section")
                {
                    ApplicationArea = All;
                }
                field("Report Department Code"; Rec."Report Department Code")
                {
                    ApplicationArea = All;
                }
                field("Report TableNo"; Rec."Report TableNo")
                {
                    ApplicationArea = All;
                }
                field("Report Cost Center Code"; Rec."Report Cost Center Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Report Unit of Measure Code"; Rec."Report Unit of Measure Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Report TableID1"; Rec."Report TableID1")
                {
                    ApplicationArea = All;
                }
                field("Report TableID2"; Rec."Report TableID2")
                {
                    ApplicationArea = All;
                }
                field("Report TableID3"; Rec."Report TableID3")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Report TableID4"; Rec."Report TableID4")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Report TableID5"; Rec."Report TableID5")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field(Text1; Rec.Text1)
                {
                    ApplicationArea = All;
                }
                field(Text2; Rec.Text2)
                {
                    ApplicationArea = All;
                }
                field(Text3; Rec.Text3)
                {
                    ApplicationArea = All;
                }
                field(Text4; Rec.Text4)
                {
                    ApplicationArea = All;
                }
                field(Text5; Rec.Text5)
                {
                    ApplicationArea = All;
                }
                field(Text6; Rec.Text6)
                {
                    ApplicationArea = All;
                }
                field(Text7; Rec.Text7)
                {
                    ApplicationArea = All;
                }
                field(Text8; Rec.Text8)
                {
                    ApplicationArea = All;
                }
                field(Text9; Rec.Text9)
                {
                    ApplicationArea = All;
                }
                field(Text10; Rec.Text10)
                {
                    ApplicationArea = All;
                }
                field(Text11; Rec.Text11)
                {
                    ApplicationArea = All;
                }
                field(Text12; Rec.Text12)
                {
                    ApplicationArea = All;
                }
                field(Text13; Rec.Text13)
                {
                    ApplicationArea = All;
                }
                field(Text14; Rec.Text14)
                {
                    ApplicationArea = All;
                }
                field(Text15; Rec.Text15)
                {
                    ApplicationArea = All;
                }
                field(Decimal1; Rec.Decimal1)
                {
                    ApplicationArea = All;
                }
                field(Decimal2; Rec.Decimal2)
                {
                    ApplicationArea = All;
                }
                field(Decimal3; Rec.Decimal3)
                {
                    ApplicationArea = All;
                }
                field(Decimal4; Rec.Decimal4)
                {
                    ApplicationArea = All;
                }
                field(Decimal5; Rec.Decimal5)
                {
                    ApplicationArea = All;
                }
                field(Decimal6; Rec.Decimal6)
                {
                    ApplicationArea = All;
                }
                field(Decimal7; Rec.Decimal7)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}
