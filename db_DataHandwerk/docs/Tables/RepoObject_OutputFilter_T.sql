CREATE TABLE [docs].[RepoObject_OutputFilter_T] (
    [RepoObject_guid]             UNIQUEIDENTIFIER NOT NULL,
    [cultures_name]               NVARCHAR (10)    NOT NULL,
    [SysObject_type]              CHAR (2)         NULL,
    [SysObject_type_name]         NVARCHAR (128)   NULL,
    [RepoObject_fullname]         NVARCHAR (261)   NOT NULL,
    [RepoObject_fullname2]        NVARCHAR (257)   NOT NULL,
    [RepoObject_FullDisplayName2] NVARCHAR (257)   NULL,
    [RepoObject_DisplayName]      NVARCHAR (128)   NULL,
    [RepoObject_translation]      NVARCHAR (128)   NULL,
    [RepoObject_schema_name]      NVARCHAR (128)   NOT NULL,
    [is_DocsOutput]               INT              NULL,
    [RepoObject_name]             NVARCHAR (128)   NOT NULL,
    [is_external]                 BIT              NOT NULL,
    [is_ssas]                     BIT              NOT NULL,
    [tables_isHidden]             BIT              NULL,
    [external_AntoraComponent]    NVARCHAR (128)   NULL,
    [external_AntoraModule]       NVARCHAR (128)   NULL,
    [external_DatabaseName]       NVARCHAR (128)   NULL,
    [AntoraComponent]             NVARCHAR (MAX)   NULL,
    [AntoraModule]                NVARCHAR (MAX)   NULL,
    [PumlEntityTopDefault]        NVARCHAR (MAX)   NOT NULL,
    [PumlEntityTopWorkaround]     NVARCHAR (MAX)   NOT NULL,
    CONSTRAINT [PK_RepoObject_OutputFilter_T] PRIMARY KEY CLUSTERED ([RepoObject_guid] ASC, [cultures_name] ASC) WITH (DATA_COMPRESSION = PAGE)
);










GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '6ad1ce74-7b24-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_OutputFilter_T', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObject_OutputFilter_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '631e7216-7824-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_OutputFilter_T', @level2type = N'COLUMN', @level2name = N'PumlEntityTopWorkaround';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '621e7216-7824-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_OutputFilter_T', @level2type = N'COLUMN', @level2name = N'PumlEntityTopDefault';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '611e7216-7824-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_OutputFilter_T', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '601e7216-7824-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_OutputFilter_T', @level2type = N'COLUMN', @level2name = N'AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5f1e7216-7824-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_OutputFilter_T', @level2type = N'COLUMN', @level2name = N'external_DatabaseName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5e1e7216-7824-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_OutputFilter_T', @level2type = N'COLUMN', @level2name = N'external_AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5d1e7216-7824-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_OutputFilter_T', @level2type = N'COLUMN', @level2name = N'external_AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5c1e7216-7824-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_OutputFilter_T', @level2type = N'COLUMN', @level2name = N'tables_isHidden';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5b1e7216-7824-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_OutputFilter_T', @level2type = N'COLUMN', @level2name = N'is_ssas';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5a1e7216-7824-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_OutputFilter_T', @level2type = N'COLUMN', @level2name = N'is_external';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '591e7216-7824-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_OutputFilter_T', @level2type = N'COLUMN', @level2name = N'RepoObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '581e7216-7824-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_OutputFilter_T', @level2type = N'COLUMN', @level2name = N'is_DocsOutput';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '571e7216-7824-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_OutputFilter_T', @level2type = N'COLUMN', @level2name = N'RepoObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '561e7216-7824-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_OutputFilter_T', @level2type = N'COLUMN', @level2name = N'RepoObject_translation';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '551e7216-7824-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_OutputFilter_T', @level2type = N'COLUMN', @level2name = N'RepoObject_DisplayName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '541e7216-7824-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_OutputFilter_T', @level2type = N'COLUMN', @level2name = N'RepoObject_FullDisplayName2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '531e7216-7824-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_OutputFilter_T', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '521e7216-7824-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_OutputFilter_T', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '511e7216-7824-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_OutputFilter_T', @level2type = N'COLUMN', @level2name = N'SysObject_type_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '501e7216-7824-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_OutputFilter_T', @level2type = N'COLUMN', @level2name = N'SysObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4f1e7216-7824-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_OutputFilter_T', @level2type = N'COLUMN', @level2name = N'cultures_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4e1e7216-7824-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_OutputFilter_T', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '16ebff08-7824-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_OutputFilter_T';


GO


