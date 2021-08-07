CREATE TABLE [property].[RepoObject_Inheritance_temp] (
    [RepoObject_guid]                   UNIQUEIDENTIFIER NOT NULL,
    [property_name]                     NVARCHAR (128)   NOT NULL,
    [property_value]                    NVARCHAR (MAX)   NULL,
    [property_value_new]                NVARCHAR (MAX)   NULL,
    [InheritanceType]                   INT              NULL,
    [Inheritance_StringAggSeparatorSql] NVARCHAR (4000)  NULL,
    [is_force_inherit_empty_source]     INT              NOT NULL,
    [is_StringAggAllSources]            INT              NOT NULL,
    [resulting_InheritanceDefinition]   NVARCHAR (4000)  NULL,
    [RowNumberSource]                   BIGINT           NULL,
    [referenced_RepoObject_guid]        UNIQUEIDENTIFIER NULL,
    [referenced_RepoObject_fullname]    NVARCHAR (261)   NOT NULL,
    [referenced_RepoObject_name]        NVARCHAR (128)   NOT NULL,
    [referencing_RepoObject_fullname]   NVARCHAR (261)   NOT NULL,
    [referencing_RepoObject_name]       NVARCHAR (128)   NOT NULL
);










GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '62b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObject_Inheritance_temp';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cab33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObject_Inheritance_temp', @level2type = N'COLUMN', @level2name = N'RowNumberSource';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c9b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObject_Inheritance_temp', @level2type = N'COLUMN', @level2name = N'resulting_InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c1b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObject_Inheritance_temp', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cfb33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObject_Inheritance_temp', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ceb33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObject_Inheritance_temp', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cdb33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObject_Inheritance_temp', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cbb33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObject_Inheritance_temp', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ccb33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObject_Inheritance_temp', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c4b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObject_Inheritance_temp', @level2type = N'COLUMN', @level2name = N'property_value_new';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c3b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObject_Inheritance_temp', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c2b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObject_Inheritance_temp', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c8b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObject_Inheritance_temp', @level2type = N'COLUMN', @level2name = N'is_StringAggAllSources';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c7b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObject_Inheritance_temp', @level2type = N'COLUMN', @level2name = N'is_force_inherit_empty_source';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c5b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObject_Inheritance_temp', @level2type = N'COLUMN', @level2name = N'InheritanceType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c6b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObject_Inheritance_temp', @level2type = N'COLUMN', @level2name = N'Inheritance_StringAggSeparatorSql';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:property.usp_RepoObject_Inheritance.adoc[]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObject_Inheritance_temp';

