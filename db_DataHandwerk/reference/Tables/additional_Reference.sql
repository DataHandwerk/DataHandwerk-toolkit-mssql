CREATE TABLE [reference].[additional_Reference] (
    [referenced_AntoraComponent]  NVARCHAR (128) CONSTRAINT [DF_additional_Reference_referenced_AntoraComponent] DEFAULT (N'mycomponent') NOT NULL,
    [referenced_AntoraModule]      NVARCHAR (128) CONSTRAINT [DF_additional_Reference_referenced_AntoraModule] DEFAULT (N'sqldb') NOT NULL,
    [referenced_Schema]           NVARCHAR (128) NOT NULL,
    [referenced_Object]           NVARCHAR (128) NOT NULL,
    [referenced_Column]           NVARCHAR (128) NULL,
    [referencing_AntoraComponent] NVARCHAR (128) CONSTRAINT [DF_additional_Reference_referencing_AntoraComponent] DEFAULT (N'mycomponent') NOT NULL,
    [referencing_AntoraModule]     NVARCHAR (128) CONSTRAINT [DF_additional_Reference_referencing_AntoraModule] DEFAULT (N'sqldb') NOT NULL,
    [referencing_Schema]          NVARCHAR (128) NOT NULL,
    [referencing_Object]          NVARCHAR (128) NOT NULL,
    [referencing_Column]          NVARCHAR (128) NULL,
    [Id]                          INT            IDENTITY (1, 1) NOT NULL,
    [tik]                         AS             (concat(N'',[referenced_AntoraComponent],'|~|',[referenced_AntoraModule],'|~|',[referenced_Schema],'|~|',[referenced_Object],'|~|',[referenced_Column],'|~|',[referencing_AntoraComponent],'|~|',[referencing_AntoraModule],'|~|',[referencing_Schema],'|~|',[referencing_Object],'|~|',[referencing_Column],'|~|')) PERSISTED NOT NULL,
    [tik_hash]                    AS             (CONVERT([binary](16),hashbytes('MD5',lower(concat(N'',[referenced_AntoraComponent],'|~|',[referenced_AntoraModule],'|~|',[referenced_Schema],'|~|',[referenced_Object],'|~|',[referenced_Column],'|~|',[referencing_AntoraComponent],'|~|',[referencing_AntoraModule],'|~|',[referencing_Schema],'|~|',[referencing_Object],'|~|',[referencing_Column],'|~|'))))) PERSISTED,
    CONSTRAINT [PK_additional_Reference] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [uq_additional_Reference] UNIQUE NONCLUSTERED ([tik_hash] ASC)
);






GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '9cb0b5f7-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference', @level2type = N'CONSTRAINT', @level2name = N'uq_additional_Reference';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '9bb0b5f7-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference', @level2type = N'CONSTRAINT', @level2name = N'PK_additional_Reference';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4208fcfd-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference', @level2type = N'COLUMN', @level2name = N'tik_hash';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4108fcfd-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference', @level2type = N'COLUMN', @level2name = N'tik';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4008fcfd-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference', @level2type = N'COLUMN', @level2name = N'Id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3f08fcfd-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference', @level2type = N'COLUMN', @level2name = N'referencing_Column';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3e08fcfd-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference', @level2type = N'COLUMN', @level2name = N'referencing_Object';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3d08fcfd-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference', @level2type = N'COLUMN', @level2name = N'referencing_Schema';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3c08fcfd-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference', @level2type = N'COLUMN', @level2name = N'referencing_AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3b08fcfd-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference', @level2type = N'COLUMN', @level2name = N'referenced_Column';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3a08fcfd-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference', @level2type = N'COLUMN', @level2name = N'referenced_Object';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3908fcfd-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference', @level2type = N'COLUMN', @level2name = N'referenced_Schema';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3808fcfd-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference', @level2type = N'COLUMN', @level2name = N'referenced_AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '9ab0b5f7-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '104559f6-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference', @level2type = N'CONSTRAINT', @level2name = N'DF_additional_Reference_referencing_AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '0f4559f6-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference', @level2type = N'CONSTRAINT', @level2name = N'DF_additional_Reference_referencing_AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '0e4559f6-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference', @level2type = N'CONSTRAINT', @level2name = N'DF_additional_Reference_referenced_AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '0d4559f6-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference', @level2type = N'CONSTRAINT', @level2name = N'DF_additional_Reference_referenced_AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a7f5bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference', @level2type = N'COLUMN', @level2name = N'referencing_AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a6f5bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference', @level2type = N'COLUMN', @level2name = N'referenced_AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference', @level2type = N'CONSTRAINT', @level2name = N'uq_additional_Reference';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference', @level2type = N'CONSTRAINT', @level2name = N'uq_additional_Reference';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference', @level2type = N'CONSTRAINT', @level2name = N'PK_additional_Reference';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference', @level2type = N'CONSTRAINT', @level2name = N'PK_additional_Reference';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference', @level2type = N'CONSTRAINT', @level2name = N'DF_additional_Reference_referencing_AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference', @level2type = N'CONSTRAINT', @level2name = N'DF_additional_Reference_referencing_AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference', @level2type = N'CONSTRAINT', @level2name = N'DF_additional_Reference_referencing_AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference', @level2type = N'CONSTRAINT', @level2name = N'DF_additional_Reference_referencing_AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference', @level2type = N'CONSTRAINT', @level2name = N'DF_additional_Reference_referenced_AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference', @level2type = N'CONSTRAINT', @level2name = N'DF_additional_Reference_referenced_AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference', @level2type = N'CONSTRAINT', @level2name = N'DF_additional_Reference_referenced_AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference', @level2type = N'CONSTRAINT', @level2name = N'DF_additional_Reference_referenced_AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'Id', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'int', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'9BB0B5F7-B004-EC11-8514-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:reference.additional_Reference_guid.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[additional_Reference].[referenced_AntoraComponent]
* [reference].[additional_Reference].[referenced_AntoraModule]
* [reference].[additional_Reference].[referenced_Column]
* [reference].[additional_Reference].[referenced_Object]
* [reference].[additional_Reference].[referenced_Schema]
* [reference].[additional_Reference].[referencing_AntoraComponent]
* [reference].[additional_Reference].[referencing_AntoraModule]
* [reference].[additional_Reference].[referencing_Column]
* [reference].[additional_Reference].[referencing_Object]
* [reference].[additional_Reference].[referencing_Schema]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference', @level2type = N'COLUMN', @level2name = N'tik_hash';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(CONVERT([binary](16),hashbytes(''MD5'',lower(concat(N'''',[referenced_AntoraModule],''|~|'',[referenced_Schema],''|~|'',[referenced_Object],''|~|'',[referenced_Column],''|~|'',[referencing_AntoraModule],''|~|'',[referencing_Schema],''|~|'',[referencing_Object],''|~|'',[referencing_Column],''|~|'')))))', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference', @level2type = N'COLUMN', @level2name = N'tik_hash';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[additional_Reference].[referenced_AntoraComponent]
* [reference].[additional_Reference].[referenced_AntoraModule]
* [reference].[additional_Reference].[referenced_Column]
* [reference].[additional_Reference].[referenced_Object]
* [reference].[additional_Reference].[referenced_Schema]
* [reference].[additional_Reference].[referencing_AntoraComponent]
* [reference].[additional_Reference].[referencing_AntoraModule]
* [reference].[additional_Reference].[referencing_Column]
* [reference].[additional_Reference].[referencing_Object]
* [reference].[additional_Reference].[referencing_Schema]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference', @level2type = N'COLUMN', @level2name = N'tik';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(N'''',[referenced_AntoraModule],''|~|'',[referenced_Schema],''|~|'',[referenced_Object],''|~|'',[referenced_Column],''|~|'',[referencing_AntoraModule],''|~|'',[referencing_Schema],''|~|'',[referencing_Object],''|~|'',[referencing_Column],''|~|''))', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference', @level2type = N'COLUMN', @level2name = N'tik';

