codeunit 88010 DOPDimensionGroups
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::DimensionManagement, 'OnAfterValidateShortcutDimValues', '', false, false)]
    local procedure DOPOnAfterValidateShortcutDimValues(FieldNumber: Integer; var ShortcutDimCode: Code[20]; var DimSetID: Integer);
    var
        DimGroupHdr: Record DOPDimensionGroupHeader;
        DimGroupLine: Record DOPDimensionGroupLine;

        DimMgt: Codeunit DimensionManagement;
        DimSetEntry: Record "Dimension Set Entry";
        DimSetEntryTemp: Record "Dimension Set Entry" temporary;
        ToInsert: Boolean;
    begin
        if FieldNumber = 1 then begin
            DimGroupHdr.Get();
            // When inserting ShortcutDim1
            if (ShortcutDimCode <> '') then begin
                DimGroupLine.Reset();
                DimGroupLine.SetRange("Shortcut Dimension 1 Code", ShortcutDimCode);
                // Insert existing Dims into DimSetEntryTemp
                if DimGroupLine.FindSet() then begin
                    DimSetEntry.Reset();
                    DimSetEntry.SetRange("Dimension Set ID", DimSetID);
                    if DimSetEntry.FindSet() then begin
                        repeat
                            DimSetEntryTemp.Init();
                            DimSetEntryTemp."Dimension Set ID" := -1;
                            DimSetEntryTemp."Dimension Code" := DimSetEntry."Dimension Code";
                            DimSetEntryTemp."Dimension Value Code" := DimSetEntry."Dimension Value Code";
                            DimSetEntryTemp."Dimension Value ID" := DimSetEntry."Dimension Value ID";
                            DimSetEntryTemp.INSERT(FALSE);
                        until DimSetEntry.Next() = 0;
                    end;

                    DimSetEntry.Reset();
                    DimSetEntry.SetRange("Dimension Set ID", DimGroupLine."Dimension Set ID");
                    // Insert DimGroupLine into DimSetEntryTemp
                    if DimSetEntry.FindSet() then begin
                        repeat
                            ToInsert := true;
                            DimSetEntryTemp.Reset();
                            DimSetEntryTemp.SetRange("Dimension Code", DimSetEntry."Dimension Code");
                            // Check if Dims exist in DimSetEntryTemp
                            if DimSetEntryTemp.FindSet() then begin
                                // If OverwriteExisting then delete and insert
                                if DimGroupHdr.OverwriteExisting then begin
                                    DimSetEntryTemp.Delete();
                                end else begin
                                    // Else do not insert
                                    ToInsert := false;
                                end;
                            end;

                            if ToInsert then begin
                                DimSetEntryTemp.Init();
                                DimSetEntryTemp."Dimension Set ID" := -1;
                                DimSetEntryTemp."Dimension Code" := DimSetEntry."Dimension Code";
                                DimSetEntryTemp."Dimension Value Code" := DimSetEntry."Dimension Value Code";
                                DimSetEntryTemp."Dimension Value ID" := DimSetEntry."Dimension Value ID";
                                DimSetEntryTemp.INSERT(FALSE);
                            end;
                        until DimSetEntry.Next() = 0;
                    end;

                    DimSetID := DimMgt.GetDimensionSetID(DimSetEntryTemp);
                end;
            end else
                // When deleting ShortcutDim1
                if (ShortcutDimCode = '') and (DimGroupHdr.OverwriteExisting) then begin
                end;
        end;
    end;
}