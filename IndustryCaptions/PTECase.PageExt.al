pageextension 50101 "PTE Case Card" extends "PVS Case Card"
{

    layout
    {
        addafter(SellToNo)
        {
            field(X; X)
            {
                CaptionClass = CFIMgt.GetCaption(Rec.ID, Enum::"PVS CFI"::"PTE Paper Color");
                ApplicationArea = all;
            }
        }
    }

    var
        x: text;
        CFIMgt: Codeunit "PVS CFI Mgt";

}
