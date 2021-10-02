CREATE TABLE [uspgenerator].[GeneratorUspStep] (
    [id]                          INT             IDENTITY (1, 1) NOT NULL,
    [usp_id]                      INT             NOT NULL,
    [Number]                      INT             NOT NULL,
    [Parent_Number]               INT             NULL,
    [Name]                        NVARCHAR (1000) NULL,
    [has_logging]                 TINYINT         CONSTRAINT [DF_GeneratorUspStep_has_logging] DEFAULT ((1)) NOT NULL,
    [is_condition]                TINYINT         CONSTRAINT [DF_GeneratorUspStep_is_condition] DEFAULT ((0)) NOT NULL,
    [is_inactive]                 TINYINT         CONSTRAINT [DF_GeneratorUspStep_is_inactive] DEFAULT ((0)) NOT NULL,
    [is_SubProcedure]             TINYINT         CONSTRAINT [DF_GeneratorUspStep_is_SubProcedure] DEFAULT ((0)) NOT NULL,
    [Statement]                   NVARCHAR (MAX)  NULL,
    [log_source_object]           NVARCHAR (261)  NULL,
    [log_target_object]           NVARCHAR (261)  NULL,
    [log_flag_InsertUpdateDelete] CHAR (1)        NULL,
    [Description]                 NVARCHAR (4000) NULL,
    [info_01]                     NVARCHAR (MAX)  NULL,
    [info_02]                     NVARCHAR (MAX)  NULL,
    [info_03]                     NVARCHAR (MAX)  NULL,
    [info_04]                     NVARCHAR (MAX)  NULL,
    [info_05]                     NVARCHAR (MAX)  NULL,
    [info_06]                     NVARCHAR (MAX)  NULL,
    [info_07]                     NVARCHAR (MAX)  NULL,
    [info_08]                     NVARCHAR (MAX)  NULL,
    [info_09]                     NVARCHAR (MAX)  NULL,
    CONSTRAINT [PK_GeneratorUspStep] PRIMARY KEY CLUSTERED ([id] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_GeneratorUspStep_GeneratorUsp] FOREIGN KEY ([usp_id]) REFERENCES [uspgenerator].[GeneratorUsp] ([id]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [UK_GeneratorUspStep_Number] UNIQUE NONCLUSTERED ([usp_id] ASC, [Number] ASC)
);




















GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '5a90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep', @level2type = N'CONSTRAINT', @level2name = N'UK_GeneratorUspStep_Number';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '5890291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep', @level2type = N'CONSTRAINT', @level2name = N'PK_GeneratorUspStep';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b690291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep', @level2type = N'CONSTRAINT', @level2name = N'FK_GeneratorUspStep_GeneratorUsp';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'ac90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep', @level2type = N'CONSTRAINT', @level2name = N'DF_GeneratorUspStep_is_SubProcedure';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'aa90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep', @level2type = N'CONSTRAINT', @level2name = N'DF_GeneratorUspStep_is_inactive';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'a890291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep', @level2type = N'CONSTRAINT', @level2name = N'DF_GeneratorUspStep_is_condition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'a690291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep', @level2type = N'CONSTRAINT', @level2name = N'DF_GeneratorUspStep_has_logging';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '5690291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '96f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep', @level2type = N'COLUMN', @level2name = N'usp_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9ef47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep', @level2type = N'COLUMN', @level2name = N'Statement';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '98f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep', @level2type = N'COLUMN', @level2name = N'Parent_Number';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '97f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep', @level2type = N'COLUMN', @level2name = N'Number';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '99f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a0f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep', @level2type = N'COLUMN', @level2name = N'log_target_object';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9ff47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep', @level2type = N'COLUMN', @level2name = N'log_source_object';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a1f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep', @level2type = N'COLUMN', @level2name = N'log_flag_InsertUpdateDelete';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9df47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep', @level2type = N'COLUMN', @level2name = N'is_SubProcedure';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9cf47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep', @level2type = N'COLUMN', @level2name = N'is_inactive';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9bf47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep', @level2type = N'COLUMN', @level2name = N'is_condition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aaf47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep', @level2type = N'COLUMN', @level2name = N'info_09';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a9f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep', @level2type = N'COLUMN', @level2name = N'info_08';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a8f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep', @level2type = N'COLUMN', @level2name = N'info_07';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a7f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep', @level2type = N'COLUMN', @level2name = N'info_06';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a6f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep', @level2type = N'COLUMN', @level2name = N'info_05';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a5f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep', @level2type = N'COLUMN', @level2name = N'info_04';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a4f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep', @level2type = N'COLUMN', @level2name = N'info_03';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a3f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep', @level2type = N'COLUMN', @level2name = N'info_02';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a2f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep', @level2type = N'COLUMN', @level2name = N'info_01';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '95f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep', @level2type = N'COLUMN', @level2name = N'id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9af47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep', @level2type = N'COLUMN', @level2name = N'has_logging';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'af7159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep', @level2type = N'COLUMN', @level2name = N'Description';


GO



GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'id', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'int', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'5890291C-9D61-EB11-84DC-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:uspgenerator.ftv_GeneratorUspStep_sql.adoc[]
* xref:uspgenerator.ftv_GeneratorUspStep_tree.adoc[]
* xref:uspgenerator.GeneratorUspStep_Sql.adoc[]
* xref:uspgenerator.usp_GeneratorUsp_insert_update_persistence.adoc[]', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep', @level2type = N'CONSTRAINT', @level2name = N'UK_GeneratorUspStep_Number';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep', @level2type = N'CONSTRAINT', @level2name = N'UK_GeneratorUspStep_Number';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep', @level2type = N'CONSTRAINT', @level2name = N'PK_GeneratorUspStep';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep', @level2type = N'CONSTRAINT', @level2name = N'PK_GeneratorUspStep';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep', @level2type = N'CONSTRAINT', @level2name = N'FK_GeneratorUspStep_GeneratorUsp';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep', @level2type = N'CONSTRAINT', @level2name = N'FK_GeneratorUspStep_GeneratorUsp';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep', @level2type = N'CONSTRAINT', @level2name = N'DF_GeneratorUspStep_is_SubProcedure';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep', @level2type = N'CONSTRAINT', @level2name = N'DF_GeneratorUspStep_is_SubProcedure';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep', @level2type = N'CONSTRAINT', @level2name = N'DF_GeneratorUspStep_is_inactive';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep', @level2type = N'CONSTRAINT', @level2name = N'DF_GeneratorUspStep_is_inactive';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep', @level2type = N'CONSTRAINT', @level2name = N'DF_GeneratorUspStep_is_condition';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep', @level2type = N'CONSTRAINT', @level2name = N'DF_GeneratorUspStep_is_condition';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep', @level2type = N'CONSTRAINT', @level2name = N'DF_GeneratorUspStep_has_logging';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep', @level2type = N'CONSTRAINT', @level2name = N'DF_GeneratorUspStep_has_logging';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspStep';

