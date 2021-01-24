CREATE TABLE [repo].[Index_Settings] (
    [index_guid]                 UNIQUEIDENTIFIER NOT NULL,
    [IndexPatternColumnDatatype] NVARCHAR (4000)  NULL,
    [IndexPatternColumnName]     NVARCHAR (4000)  NULL,
    [IndexSemanticGroup]         NVARCHAR (512)   NULL,
    [is_create_constraint]       BIT              DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Index_Settings] PRIMARY KEY CLUSTERED ([index_guid] ASC)
);

