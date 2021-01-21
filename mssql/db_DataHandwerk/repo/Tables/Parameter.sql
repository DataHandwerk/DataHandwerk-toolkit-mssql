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
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '01477f08-cb50-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Parameter', @level2type = N'CONSTRAINT', @level2name = N'PK_Parameter';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '09477f08-cb50-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Parameter', @level2type = N'COLUMN', @level2name = N'Parameter_value__result_nvarchar';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '08477f08-cb50-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Parameter', @level2type = N'COLUMN', @level2name = N'Parameter_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '05477f08-cb50-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Parameter', @level2type = N'COLUMN', @level2name = N'Parameter_default_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '06477f08-cb50-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Parameter', @level2type = N'COLUMN', @level2name = N'Parameter_desciption';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '07477f08-cb50-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Parameter', @level2type = N'COLUMN', @level2name = N'Parameter_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'ff467f08-cb50-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Parameter';

