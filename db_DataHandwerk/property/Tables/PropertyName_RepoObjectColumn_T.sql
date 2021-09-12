CREATE TABLE [property].[PropertyName_RepoObjectColumn_T] (
    [property_name]   NVARCHAR (128) NOT NULL,
    [has_inheritance] BIT            CONSTRAINT [DF_PropertyName_RepoObjectColumn_T_has_inheritance] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_PropertyName_RepoObjectColumn_T] PRIMARY KEY CLUSTERED ([property_name] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '66bb6129-4a12-ec11-851a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'PropertyName_RepoObjectColumn_T', @level2type = N'CONSTRAINT', @level2name = N'DF_PropertyName_RepoObjectColumn_T_has_inheritance';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '68bb6129-4a12-ec11-851a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'PropertyName_RepoObjectColumn_T', @level2type = N'CONSTRAINT', @level2name = N'PK_PropertyName_RepoObjectColumn_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '54b47830-4a12-ec11-851a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'PropertyName_RepoObjectColumn_T', @level2type = N'COLUMN', @level2name = N'has_inheritance';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '90e02843-4812-ec11-851a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'PropertyName_RepoObjectColumn_T', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '8354c83c-4812-ec11-851a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'PropertyName_RepoObjectColumn_T';

