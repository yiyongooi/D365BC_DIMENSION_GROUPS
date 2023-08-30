table 88011 DOPDimensionGroupLine
{
    Caption = 'Dimension Group Line';

    fields
    {
        field(10; "Shortcut Dimension 1 Code"; Code[20])
        {
            NotBlank = true;
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                          Blocked = CONST(false));
        }
        // field(20; "Shortcut Dimension 2 Code"; Code[20])
        // {
        //     CaptionClass = '1,2,2';
        //     Caption = 'Shortcut Dimension 2 Code';
        //     TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
        //                                                   Blocked = CONST(false));
        // }
        field(30; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3),
                                                          Blocked = CONST(false));
        }
        field(40; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4),
                                                          Blocked = CONST(false));
        }
        field(50; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5),
                                                          Blocked = CONST(false));
        }
        field(60; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 6 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6),
                                                          Blocked = CONST(false));
        }
        field(70; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 7 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7),
                                                          Blocked = CONST(false));
        }
        field(80; "Shortcut Dimension 8 Code"; Code[20])
        {
            CaptionClass = '1,2,8';
            Caption = 'Shortcut Dimension 8 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(8),
                                                          Blocked = CONST(false));
        }
        field(90; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Shortcut Dimension 1 Code")
        { Clustered = true; }
    }

    trigger OnInsert()
    begin
        UpdateDimSetID();
    end;

    trigger OnModify()
    begin
        UpdateDimSetID();
    end;

    trigger OnRename()
    begin
        UpdateDimSetID();
    end;

    trigger OnDelete()
    begin
        UpdateDimSetID();
    end;

    local procedure UpdateDimSetID()
    var
        DimMgt: Codeunit DimensionManagement;
        DimSetEntryTemp: Record "Dimension Set Entry" temporary;
        GLSetup: Record "General Ledger Setup";
        DimVal: Record "Dimension Value";
    begin
        GLSetup.Get();

        // Shortcut Dimension 1 - Start
        DimSetEntryTemp.Init();
        DimSetEntryTemp."Dimension Set ID" := -1;
        DimSetEntryTemp."Dimension Code" := GLSetup."Shortcut Dimension 1 Code";
        DimSetEntryTemp."Dimension Value Code" := Rec."Shortcut Dimension 1 Code";
        DimVal.Reset();
        DimVal.SetRange("Dimension Code", GLSetup."Shortcut Dimension 1 Code");
        DimVal.SetRange(Code, Rec."Shortcut Dimension 1 Code");
        DimVal.FindSet();
        DimSetEntryTemp."Dimension Value ID" := DimVal."Dimension Value ID";
        DimSetEntryTemp.INSERT(FALSE);
        // Shortcut Dimension 1 - End

        // Shortcut Dimension 2 - Start //! Not Recommended because field on page will be not updated
        // if Rec."Shortcut Dimension 2 Code" <> '' then begin
        //     DimSetEntry.Init();
        //     DimSetEntry."Dimension Set ID" := -1;
        //     DimSetEntry."Dimension Code" := GLSetup."Shortcut Dimension 2 Code";
        //     DimSetEntry."Dimension Value Code" := Rec."Shortcut Dimension 2 Code";
        //     DimVal.Reset();
        //     DimVal.SetRange("Dimension Code", GLSetup."Shortcut Dimension 2 Code");
        //     DimVal.SetRange(Code, Rec."Shortcut Dimension 2 Code");
        //     DimVal.FindSet();
        //     DimSetEntry."Dimension Value ID" := DimVal."Dimension Value ID";
        //     DimSetEntry.INSERT(FALSE);
        // end;
        // Shortcut Dimension 2 - End

        // Shortcut Dimension 3 - Start
        if Rec."Shortcut Dimension 3 Code" <> '' then begin
            DimSetEntryTemp.Init();
            DimSetEntryTemp."Dimension Set ID" := -1;
            DimSetEntryTemp."Dimension Code" := GLSetup."Shortcut Dimension 3 Code";
            DimSetEntryTemp."Dimension Value Code" := Rec."Shortcut Dimension 3 Code";
            DimVal.Reset();
            DimVal.SetRange("Dimension Code", GLSetup."Shortcut Dimension 3 Code");
            DimVal.SetRange(Code, Rec."Shortcut Dimension 3 Code");
            DimVal.FindSet();
            DimSetEntryTemp."Dimension Value ID" := DimVal."Dimension Value ID";
            DimSetEntryTemp.INSERT(FALSE);
        end;
        // Shortcut Dimension 3 - End

        // Shortcut Dimension 4 - Start
        if Rec."Shortcut Dimension 4 Code" <> '' then begin
            DimSetEntryTemp.Init();
            DimSetEntryTemp."Dimension Set ID" := -1;
            DimSetEntryTemp."Dimension Code" := GLSetup."Shortcut Dimension 4 Code";
            DimSetEntryTemp."Dimension Value Code" := Rec."Shortcut Dimension 4 Code";
            DimVal.Reset();
            DimVal.SetRange("Dimension Code", GLSetup."Shortcut Dimension 4 Code");
            DimVal.SetRange(Code, Rec."Shortcut Dimension 4 Code");
            DimVal.FindSet();
            DimSetEntryTemp."Dimension Value ID" := DimVal."Dimension Value ID";
            DimSetEntryTemp.INSERT(FALSE);
        end;
        // Shortcut Dimension 4 - End

        // Shortcut Dimension 5 - Start
        if Rec."Shortcut Dimension 5 Code" <> '' then begin
            DimSetEntryTemp.Init();
            DimSetEntryTemp."Dimension Set ID" := -1;
            DimSetEntryTemp."Dimension Code" := GLSetup."Shortcut Dimension 5 Code";
            DimSetEntryTemp."Dimension Value Code" := Rec."Shortcut Dimension 5 Code";
            DimVal.Reset();
            DimVal.SetRange("Dimension Code", GLSetup."Shortcut Dimension 5 Code");
            DimVal.SetRange(Code, Rec."Shortcut Dimension 5 Code");
            DimVal.FindSet();
            DimSetEntryTemp."Dimension Value ID" := DimVal."Dimension Value ID";
            DimSetEntryTemp.INSERT(FALSE);
        end;
        // Shortcut Dimension 5 - End

        // Shortcut Dimension 6 - Start
        if Rec."Shortcut Dimension 6 Code" <> '' then begin
            DimSetEntryTemp.Init();
            DimSetEntryTemp."Dimension Set ID" := -1;
            DimSetEntryTemp."Dimension Code" := GLSetup."Shortcut Dimension 6 Code";
            DimSetEntryTemp."Dimension Value Code" := Rec."Shortcut Dimension 6 Code";
            DimVal.Reset();
            DimVal.SetRange("Dimension Code", GLSetup."Shortcut Dimension 6 Code");
            DimVal.SetRange(Code, Rec."Shortcut Dimension 6 Code");
            DimVal.FindSet();
            DimSetEntryTemp."Dimension Value ID" := DimVal."Dimension Value ID";
            DimSetEntryTemp.INSERT(FALSE);
        end;
        // Shortcut Dimension 6 - End

        // Shortcut Dimension 7 - Start
        if Rec."Shortcut Dimension 7 Code" <> '' then begin
            DimSetEntryTemp.Init();
            DimSetEntryTemp."Dimension Set ID" := -1;
            DimSetEntryTemp."Dimension Code" := GLSetup."Shortcut Dimension 7 Code";
            DimSetEntryTemp."Dimension Value Code" := Rec."Shortcut Dimension 7 Code";
            DimVal.Reset();
            DimVal.SetRange("Dimension Code", GLSetup."Shortcut Dimension 7 Code");
            DimVal.SetRange(Code, Rec."Shortcut Dimension 7 Code");
            DimVal.FindSet();
            DimSetEntryTemp."Dimension Value ID" := DimVal."Dimension Value ID";
            DimSetEntryTemp.INSERT(FALSE);
        end;
        // Shortcut Dimension 7 - End

        // Shortcut Dimension 8 - Start
        if Rec."Shortcut Dimension 8 Code" <> '' then begin
            DimSetEntryTemp.Init();
            DimSetEntryTemp."Dimension Set ID" := -1;
            DimSetEntryTemp."Dimension Code" := GLSetup."Shortcut Dimension 8 Code";
            DimSetEntryTemp."Dimension Value Code" := Rec."Shortcut Dimension 8 Code";
            DimVal.Reset();
            DimVal.SetRange("Dimension Code", GLSetup."Shortcut Dimension 8 Code");
            DimVal.SetRange(Code, Rec."Shortcut Dimension 8 Code");
            DimVal.FindSet();
            DimSetEntryTemp."Dimension Value ID" := DimVal."Dimension Value ID";
            DimSetEntryTemp.INSERT(FALSE);
        end;
        // Shortcut Dimension 8 - End

        "Dimension Set ID" := DimMgt.GetDimensionSetID(DimSetEntryTemp);
    end;
}