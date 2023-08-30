page 88010 DOPDimensionGroups
{
    Caption = 'Dimension Groups';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = DOPDimensionGroupHeader;
    DeleteAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field(OverwriteExisting; Rec.OverwriteExisting)
                {
                    ApplicationArea = All;
                    Editable = true;
                    ToolTip = 'Existing Shortcut Dimensions will be overwritten by the selected Dimension Group. Note: Blank Shortcut Dimension in Dimension Group will not be brought over';
                }
            }
            part(DOPDimensionGroupLine; DOPDimensionGroupsSubform)
            {
                ApplicationArea = All;
                UpdatePropagation = Both;
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}