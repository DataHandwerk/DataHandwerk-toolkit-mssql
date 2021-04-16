CREATE TABLE [property].[RepoObjectColumn_Inheritance_temp] (
    [RepoObjectColumn_guid]             UNIQUEIDENTIFIER NOT NULL,
    [property_name]                     NVARCHAR (128)   NOT NULL,
    [property_value]                    SQL_VARIANT      NULL,
    [property_value_new]                SQL_VARIANT      NULL,
    [InheritanceType]                   INT              NULL,
    [Inheritance_StringAggSeparatorSql] NVARCHAR (4000)  NULL,
    [is_force_inherit_empty_source]     INT              NOT NULL,
    [is_StringAggAllSources]            INT              NOT NULL,
    [resulting_InheritanceDefinition]   NVARCHAR (4000)  NULL,
    [RowNumberSource]                   BIGINT           NULL,
    [referenced_RepoObjectColumn_guid]  UNIQUEIDENTIFIER NULL,
    [referenced_RepoObject_fullname]    NVARCHAR (261)   NOT NULL,
    [referenced_RepoObjectColumn_name]  NVARCHAR (128)   NOT NULL,
    [referencing_RepoObject_fullname]   NVARCHAR (261)   NOT NULL,
    [referencing_RepoObjectColumn_name] NVARCHAR (128)   NOT NULL
);




GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '5fb33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_Inheritance_temp';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b0b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_Inheritance_temp', @level2type = N'COLUMN', @level2name = N'RowNumberSource';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'afb33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_Inheritance_temp', @level2type = N'COLUMN', @level2name = N'resulting_InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a7b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_Inheritance_temp', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b5b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_Inheritance_temp', @level2type = N'COLUMN', @level2name = N'referencing_RepoObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b4b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_Inheritance_temp', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b3b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_Inheritance_temp', @level2type = N'COLUMN', @level2name = N'referenced_RepoObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b1b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_Inheritance_temp', @level2type = N'COLUMN', @level2name = N'referenced_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b2b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_Inheritance_temp', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aab33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_Inheritance_temp', @level2type = N'COLUMN', @level2name = N'property_value_new';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a9b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_Inheritance_temp', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a8b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_Inheritance_temp', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aeb33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_Inheritance_temp', @level2type = N'COLUMN', @level2name = N'is_StringAggAllSources';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'adb33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_Inheritance_temp', @level2type = N'COLUMN', @level2name = N'is_force_inherit_empty_source';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'abb33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_Inheritance_temp', @level2type = N'COLUMN', @level2name = N'InheritanceType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'acb33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectColumn_Inheritance_temp', @level2type = N'COLUMN', @level2name = N'Inheritance_StringAggSeparatorSql';

