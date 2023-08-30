table 88010 DOPDimensionGroupHeader
{
    Caption = 'Dimension Group Header';

    fields
    {
        field(10; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(20; OverwriteExisting; Boolean)
        {
            Caption = 'Overwrite Existing';
            InitValue = true;
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }
}