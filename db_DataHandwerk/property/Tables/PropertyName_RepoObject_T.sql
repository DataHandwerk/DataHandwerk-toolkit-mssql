CREATE TABLE [property].[PropertyName_RepoObject_T] (
    [property_name]   NVARCHAR (128) NOT NULL,
    [has_inheritance] BIT            CONSTRAINT [DF_PropertyName_RepoObject_T_has_inheritance] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_PropertyName_RepoObject_T] PRIMARY KEY CLUSTERED ([property_name] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '65bb6129-4a12-ec11-851a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'PropertyName_RepoObject_T', @level2type = N'CONSTRAINT', @level2name = N'DF_PropertyName_RepoObject_T_has_inheritance';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '67bb6129-4a12-ec11-851a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'PropertyName_RepoObject_T', @level2type = N'CONSTRAINT', @level2name = N'PK_PropertyName_RepoObject_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '53b47830-4a12-ec11-851a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'PropertyName_RepoObject_T', @level2type = N'COLUMN', @level2name = N'has_inheritance';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b9952df6-4712-ec11-851a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'PropertyName_RepoObject_T', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'c9ea41eb-4712-ec11-851a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'PropertyName_RepoObject_T';

