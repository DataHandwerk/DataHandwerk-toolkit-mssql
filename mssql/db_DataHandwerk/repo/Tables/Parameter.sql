CREATE TABLE [repo].[Parameter] (
    [Parameter_name]                   VARCHAR (100)   NOT NULL,
    [sub_Parameter]                    NVARCHAR (128)  CONSTRAINT [DF__Parameter__sub_P__18B6AB08] DEFAULT ('') NOT NULL,
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
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '2690291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Parameter', @level2type = N'CONSTRAINT', @level2name = N'PK_Parameter';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '2490291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Parameter';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '69cbc49c-3862-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Parameter', @level2type = N'CONSTRAINT', @level2name = N'DF__Parameter__sub_P__18B6AB08';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '12f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Parameter', @level2type = N'COLUMN', @level2name = N'sub_Parameter';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '15f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Parameter', @level2type = N'COLUMN', @level2name = N'Parameter_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '11f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Parameter', @level2type = N'COLUMN', @level2name = N'Parameter_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '13f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Parameter', @level2type = N'COLUMN', @level2name = N'Parameter_desciption';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '14f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Parameter', @level2type = N'COLUMN', @level2name = N'Parameter_default_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '16f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Parameter', @level2type = N'COLUMN', @level2name = N'Parameter_value__result_nvarchar';

