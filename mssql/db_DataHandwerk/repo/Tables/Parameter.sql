CREATE TABLE [repo].[Parameter] (
    [Parameter_name]                   VARCHAR (100)   NOT NULL,
    [sub_Parameter]                    NVARCHAR (128)  CONSTRAINT [DF_Parameter_sub_Parameter] DEFAULT ('') NOT NULL,
    [Parameter_desciption]             NVARCHAR (1000) NULL,
    [Parameter_default_value]          SQL_VARIANT     NULL,
    [Parameter_value]                  SQL_VARIANT     NULL,
    [Parameter_value__result_nvarchar] AS              (TRY_CAST(coalesce([Parameter_value],[Parameter_default_value]) AS [nvarchar](4000))),
    CONSTRAINT [PK_Parameter] PRIMARY KEY CLUSTERED ([Parameter_name] ASC, [sub_Parameter] ASC)
);




GO



GO



GO



GO



GO



GO



GO


