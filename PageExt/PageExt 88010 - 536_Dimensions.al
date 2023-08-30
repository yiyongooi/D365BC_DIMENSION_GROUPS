pageextension 88010 _Dimensions extends Dimensions
{
    actions
    {
        addlast("F&unctions")
        {
            action("DOP Dimension Group")
            {
                ApplicationArea = All;
                Caption = 'Dimension Groups';
                Image = Group;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page DOPDimensionGroups;
            }
        }
    }
}

