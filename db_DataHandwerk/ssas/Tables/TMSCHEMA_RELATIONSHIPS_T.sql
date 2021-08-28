CREATE TABLE [ssas].[TMSCHEMA_RELATIONSHIPS_T] (
    [databasename]               NVARCHAR (128)   NOT NULL,
    [ID]                         NUMERIC (20)     NOT NULL,
    [ModelID]                    NUMERIC (20)     NOT NULL,
    [Name]                       NVARCHAR (MAX)   NOT NULL,
    [IsActive]                   BIT              NOT NULL,
    [Type]                       BIGINT           NOT NULL,
    [CrossFilteringBehavior]     BIGINT           NOT NULL,
    [JoinOnDateBehavior]         BIGINT           NOT NULL,
    [RelyOnReferentialIntegrity] BIT              NOT NULL,
    [FromTableID]                NUMERIC (20)     NOT NULL,
    [FromColumnID]               NUMERIC (20)     NOT NULL,
    [FromCardinality]            BIGINT           NOT NULL,
    [ToTableID]                  NUMERIC (20)     NOT NULL,
    [ToColumnID]                 NUMERIC (20)     NOT NULL,
    [ToCardinality]              BIGINT           NOT NULL,
    [State]                      BIGINT           NOT NULL,
    [RelationshipStorageID]      NUMERIC (20)     NULL,
    [RelationshipStorage2ID]     NUMERIC (20)     NULL,
    [ModifiedTime]               DATETIME         NOT NULL,
    [RefreshedTime]              DATETIME         NULL,
    [SecurityFilteringBehavior]  BIGINT           NOT NULL,
    [ForeignKey_guid]            UNIQUEIDENTIFIER CONSTRAINT [DF_TMSCHEMA_RELATIONSHIPS_T_RepoObject_guid] DEFAULT (newsequentialid()) NOT NULL,
    CONSTRAINT [PK_TMSCHEMA_RELATIONSHIPS_T] PRIMARY KEY CLUSTERED ([databasename] ASC, [ID] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '853adabd-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'CONSTRAINT', @level2name = N'DF_TMSCHEMA_RELATIONSHIPS_T_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '863adabd-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'CONSTRAINT', @level2name = N'PK_TMSCHEMA_RELATIONSHIPS_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8d0962c8-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'ForeignKey_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8c0962c8-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'SecurityFilteringBehavior';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8b0962c8-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'RefreshedTime';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8a0962c8-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'ModifiedTime';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '890962c8-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'RelationshipStorage2ID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '880962c8-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'RelationshipStorageID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '870962c8-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'State';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '860962c8-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'ToCardinality';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '850962c8-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'ToColumnID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '840962c8-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'ToTableID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '830962c8-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'FromCardinality';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '820962c8-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'FromColumnID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '810962c8-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'FromTableID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '800962c8-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'RelyOnReferentialIntegrity';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7f0962c8-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'JoinOnDateBehavior';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7e0962c8-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'CrossFilteringBehavior';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7d0962c8-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'Type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7c0962c8-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'IsActive';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7b0962c8-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7a0962c8-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'ModelID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '790962c8-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '780962c8-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '843adabd-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T';

