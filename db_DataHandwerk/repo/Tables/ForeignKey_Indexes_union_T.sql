CREATE TABLE [repo].[ForeignKey_Indexes_union_T] (
    [ForeignKey_guid]                        UNIQUEIDENTIFIER NULL,
    [delete_referential_action]              TINYINT          NULL,
    [ForeignKey_fullname]                    NVARCHAR (517)   NULL,
    [ForeignKey_name]                        NVARCHAR (128)   NULL,
    [is_MatchingDatatypePattern]             INT              NOT NULL,
    [referenced_index_guid]                  UNIQUEIDENTIFIER NULL,
    [referenced_index_name]                  NVARCHAR (128)   NULL,
    [referenced_IndexPatternColumnDatatype]  NVARCHAR (4000)  NULL,
    [referenced_IndexPatternColumnName]      NVARCHAR (4000)  NULL,
    [referenced_RepoObject_fullname]         NVARCHAR (261)   NULL,
    [referenced_RepoObject_fullname2]        NVARCHAR (257)   NULL,
    [referenced_RepoObject_guid]             UNIQUEIDENTIFIER NULL,
    [referenced_SysObject_name]              NVARCHAR (128)   NULL,
    [referenced_SysObject_schema_name]       NVARCHAR (128)   NULL,
    [referencing_index_guid]                 UNIQUEIDENTIFIER NULL,
    [referencing_index_name]                 NVARCHAR (128)   NULL,
    [referencing_IndexPatternColumnDatatype] NVARCHAR (4000)  NULL,
    [referencing_IndexPatternColumnName]     NVARCHAR (4000)  NULL,
    [referencing_RepoObject_fullname]        NVARCHAR (261)   NULL,
    [referencing_RepoObject_fullname2]       NVARCHAR (257)   NULL,
    [referencing_RepoObject_guid]            UNIQUEIDENTIFIER NULL,
    [referencing_SysObject_name]             NVARCHAR (128)   NULL,
    [referencing_SysObject_schema_name]      NVARCHAR (128)   NULL,
    [update_referential_action]              TINYINT          NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1dc45691-a79a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ForeignKey_Indexes_union_T', @level2type = N'COLUMN', @level2name = N'update_referential_action';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1cc45691-a79a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ForeignKey_Indexes_union_T', @level2type = N'COLUMN', @level2name = N'referencing_SysObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1bc45691-a79a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ForeignKey_Indexes_union_T', @level2type = N'COLUMN', @level2name = N'referencing_SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1ac45691-a79a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ForeignKey_Indexes_union_T', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '19c45691-a79a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ForeignKey_Indexes_union_T', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '18c45691-a79a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ForeignKey_Indexes_union_T', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '17c45691-a79a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ForeignKey_Indexes_union_T', @level2type = N'COLUMN', @level2name = N'referencing_IndexPatternColumnName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '16c45691-a79a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ForeignKey_Indexes_union_T', @level2type = N'COLUMN', @level2name = N'referencing_IndexPatternColumnDatatype';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ee2aaf64-b89a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ForeignKey_Indexes_union_T', @level2type = N'COLUMN', @level2name = N'referencing_index_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '15c45691-a79a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ForeignKey_Indexes_union_T', @level2type = N'COLUMN', @level2name = N'referencing_index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '14c45691-a79a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ForeignKey_Indexes_union_T', @level2type = N'COLUMN', @level2name = N'referenced_SysObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '13c45691-a79a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ForeignKey_Indexes_union_T', @level2type = N'COLUMN', @level2name = N'referenced_SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '12c45691-a79a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ForeignKey_Indexes_union_T', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '11c45691-a79a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ForeignKey_Indexes_union_T', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '10c45691-a79a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ForeignKey_Indexes_union_T', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0fc45691-a79a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ForeignKey_Indexes_union_T', @level2type = N'COLUMN', @level2name = N'referenced_IndexPatternColumnName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0ec45691-a79a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ForeignKey_Indexes_union_T', @level2type = N'COLUMN', @level2name = N'referenced_IndexPatternColumnDatatype';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ed2aaf64-b89a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ForeignKey_Indexes_union_T', @level2type = N'COLUMN', @level2name = N'referenced_index_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0dc45691-a79a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ForeignKey_Indexes_union_T', @level2type = N'COLUMN', @level2name = N'referenced_index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0cc45691-a79a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ForeignKey_Indexes_union_T', @level2type = N'COLUMN', @level2name = N'is_MatchingDatatypePattern';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0bc45691-a79a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ForeignKey_Indexes_union_T', @level2type = N'COLUMN', @level2name = N'ForeignKey_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0ac45691-a79a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ForeignKey_Indexes_union_T', @level2type = N'COLUMN', @level2name = N'ForeignKey_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '09c45691-a79a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ForeignKey_Indexes_union_T', @level2type = N'COLUMN', @level2name = N'delete_referential_action';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '08c45691-a79a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ForeignKey_Indexes_union_T', @level2type = N'COLUMN', @level2name = N'ForeignKey_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '06c45691-a79a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ForeignKey_Indexes_union_T';

