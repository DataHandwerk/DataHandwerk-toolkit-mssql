CREATE TABLE [ssas].[TMSCHEMA_ROLE_MEMBERSHIPS] (
    [databasename]     NVARCHAR (128) CONSTRAINT [DF_TMSCHEMA_ROLE_MEMBERSHIPS_databasename] DEFAULT (N'mydatabase') NOT NULL,
    [ID]               NUMERIC (20)   NOT NULL,
    [RoleID]           NUMERIC (20)   NOT NULL,
    [MemberName]       NVARCHAR (MAX) NOT NULL,
    [MemberID]         NVARCHAR (MAX) NOT NULL,
    [IdentityProvider] NVARCHAR (MAX) NULL,
    [MemberType]       BIGINT         NOT NULL,
    [ModifiedTime]     DATETIME       NOT NULL,
    CONSTRAINT [PK_TMSCHEMA_ROLE_MEMBERSHIPS] PRIMARY KEY CLUSTERED ([databasename] ASC, [ID] ASC) WITH (DATA_COMPRESSION = PAGE)
);








GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'bee6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_ROLE_MEMBERSHIPS', @level2type = N'CONSTRAINT', @level2name = N'DF_TMSCHEMA_ROLE_MEMBERSHIPS_databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'bfe6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_ROLE_MEMBERSHIPS', @level2type = N'CONSTRAINT', @level2name = N'PK_TMSCHEMA_ROLE_MEMBERSHIPS';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c3c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_ROLE_MEMBERSHIPS', @level2type = N'COLUMN', @level2name = N'ModifiedTime';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c2c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_ROLE_MEMBERSHIPS', @level2type = N'COLUMN', @level2name = N'MemberType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c1c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_ROLE_MEMBERSHIPS', @level2type = N'COLUMN', @level2name = N'IdentityProvider';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c0c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_ROLE_MEMBERSHIPS', @level2type = N'COLUMN', @level2name = N'MemberID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bfc60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_ROLE_MEMBERSHIPS', @level2type = N'COLUMN', @level2name = N'MemberName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bec60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_ROLE_MEMBERSHIPS', @level2type = N'COLUMN', @level2name = N'RoleID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bdc60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_ROLE_MEMBERSHIPS', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bcc60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_ROLE_MEMBERSHIPS', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'bde6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_ROLE_MEMBERSHIPS';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_ROLE_MEMBERSHIPS', @level2type = N'CONSTRAINT', @level2name = N'PK_TMSCHEMA_ROLE_MEMBERSHIPS';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_ROLE_MEMBERSHIPS', @level2type = N'CONSTRAINT', @level2name = N'PK_TMSCHEMA_ROLE_MEMBERSHIPS';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_ROLE_MEMBERSHIPS', @level2type = N'CONSTRAINT', @level2name = N'DF_TMSCHEMA_ROLE_MEMBERSHIPS_databasename';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_ROLE_MEMBERSHIPS', @level2type = N'CONSTRAINT', @level2name = N'DF_TMSCHEMA_ROLE_MEMBERSHIPS_databasename';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'databasename,ID', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_ROLE_MEMBERSHIPS';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'nvarchar(128),numeric(20, 0)', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_ROLE_MEMBERSHIPS';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'BFE6A70A-8A06-EC11-8515-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_ROLE_MEMBERSHIPS';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_ROLE_MEMBERSHIPS';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_ROLE_MEMBERSHIPS';

