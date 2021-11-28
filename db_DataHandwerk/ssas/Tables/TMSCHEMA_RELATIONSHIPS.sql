CREATE TABLE [ssas].[TMSCHEMA_RELATIONSHIPS] (
    [databasename]               NVARCHAR (128) CONSTRAINT [DF_TMSCHEMA_RELATIONSHIPS_databasename] DEFAULT (N'mydatabase') NOT NULL,
    [ID]                         NUMERIC (20)   NOT NULL,
    [ModelID]                    NUMERIC (20)   NOT NULL,
    [Name]                       NVARCHAR (MAX) NOT NULL,
    [IsActive]                   BIT            NOT NULL,
    [Type]                       BIGINT         NOT NULL,
    [CrossFilteringBehavior]     BIGINT         NOT NULL,
    [JoinOnDateBehavior]         BIGINT         NOT NULL,
    [RelyOnReferentialIntegrity] BIT            NOT NULL,
    [FromTableID]                NUMERIC (20)   NOT NULL,
    [FromColumnID]               NUMERIC (20)   NOT NULL,
    [FromCardinality]            BIGINT         NOT NULL,
    [ToTableID]                  NUMERIC (20)   NOT NULL,
    [ToColumnID]                 NUMERIC (20)   NOT NULL,
    [ToCardinality]              BIGINT         NOT NULL,
    [State]                      BIGINT         NOT NULL,
    [RelationshipStorageID]      NUMERIC (20)   NULL,
    [RelationshipStorage2ID]     NUMERIC (20)   NULL,
    [ModifiedTime]               DATETIME       NOT NULL,
    [RefreshedTime]              DATETIME       NULL,
    [SecurityFilteringBehavior]  BIGINT         NOT NULL,
    CONSTRAINT [PK_TMSCHEMA_RELATIONSHIPS] PRIMARY KEY CLUSTERED ([databasename] ASC, [ID] ASC) WITH (DATA_COMPRESSION = PAGE)
);








GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'e5e6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS', @level2type = N'CONSTRAINT', @level2name = N'DF_TMSCHEMA_RELATIONSHIPS_databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'e6e6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS', @level2type = N'CONSTRAINT', @level2name = N'PK_TMSCHEMA_RELATIONSHIPS';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '66c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS', @level2type = N'COLUMN', @level2name = N'SecurityFilteringBehavior';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '65c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS', @level2type = N'COLUMN', @level2name = N'RefreshedTime';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '64c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS', @level2type = N'COLUMN', @level2name = N'ModifiedTime';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '63c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS', @level2type = N'COLUMN', @level2name = N'RelationshipStorage2ID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '62c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS', @level2type = N'COLUMN', @level2name = N'RelationshipStorageID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '61c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS', @level2type = N'COLUMN', @level2name = N'State';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '60c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS', @level2type = N'COLUMN', @level2name = N'ToCardinality';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5fc70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS', @level2type = N'COLUMN', @level2name = N'ToColumnID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5ec70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS', @level2type = N'COLUMN', @level2name = N'ToTableID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5dc70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS', @level2type = N'COLUMN', @level2name = N'FromCardinality';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5cc70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS', @level2type = N'COLUMN', @level2name = N'FromColumnID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5bc70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS', @level2type = N'COLUMN', @level2name = N'FromTableID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5ac70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS', @level2type = N'COLUMN', @level2name = N'RelyOnReferentialIntegrity';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '59c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS', @level2type = N'COLUMN', @level2name = N'JoinOnDateBehavior';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '58c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS', @level2type = N'COLUMN', @level2name = N'CrossFilteringBehavior';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '57c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS', @level2type = N'COLUMN', @level2name = N'Type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '56c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS', @level2type = N'COLUMN', @level2name = N'IsActive';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '55c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '54c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS', @level2type = N'COLUMN', @level2name = N'ModelID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '53c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '52c70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'e4e6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS', @level2type = N'CONSTRAINT', @level2name = N'PK_TMSCHEMA_RELATIONSHIPS';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS', @level2type = N'CONSTRAINT', @level2name = N'PK_TMSCHEMA_RELATIONSHIPS';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS', @level2type = N'CONSTRAINT', @level2name = N'DF_TMSCHEMA_RELATIONSHIPS_databasename';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS', @level2type = N'CONSTRAINT', @level2name = N'DF_TMSCHEMA_RELATIONSHIPS_databasename';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'databasename,ID', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'nvarchar(128),numeric(20, 0)', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'E6E6A70A-8A06-EC11-8515-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:ssas.TMSCHEMA_RELATIONSHIPS_T.adoc[]
* xref:ssas.usp_PERSIST_TMSCHEMA_RELATIONSHIPS_T.adoc[]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS';

