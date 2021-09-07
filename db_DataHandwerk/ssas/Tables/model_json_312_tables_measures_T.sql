CREATE TABLE [ssas].[model_json_312_tables_measures_T] (
    [databasename]                   NVARCHAR (128)   NOT NULL,
    [tables_name]                    NVARCHAR (128)   NOT NULL,
    [tables_measures_name]           NVARCHAR (500)   NOT NULL,
    [RepoObject_guid]                UNIQUEIDENTIFIER NOT NULL,
    [tables_measures_description]    NVARCHAR (MAX)   NULL,
    [tables_measures_description_ja] NVARCHAR (MAX)   NULL,
    [tables_measures_displayFolder]  NVARCHAR (500)   NULL,
    [tables_measures_expression]     NVARCHAR (MAX)   NULL,
    [tables_measures_expression_ja]  NVARCHAR (MAX)   NULL,
    [tables_measures_formatString]   NVARCHAR (500)   NULL,
    [tables_measures_isHidden]       BIT              NULL,
    [Measure_guid]                   UNIQUEIDENTIFIER CONSTRAINT [DF_model_json_312_tables_measures_T_RepoObjectColumn_guid] DEFAULT (newsequentialid()) NOT NULL
);




GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '3b6d90f7-370f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_312_tables_measures_T', @level2type = N'CONSTRAINT', @level2name = N'DF_model_json_312_tables_measures_T_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b2051757-370f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_312_tables_measures_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '35208663-370f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_312_tables_measures_T', @level2type = N'COLUMN', @level2name = N'tables_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '36208663-370f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_312_tables_measures_T', @level2type = N'COLUMN', @level2name = N'tables_measures_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '37208663-370f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_312_tables_measures_T', @level2type = N'COLUMN', @level2name = N'tables_measures_isHidden';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '32208663-370f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_312_tables_measures_T', @level2type = N'COLUMN', @level2name = N'tables_measures_formatString';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2f208663-370f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_312_tables_measures_T', @level2type = N'COLUMN', @level2name = N'tables_measures_expression_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '34208663-370f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_312_tables_measures_T', @level2type = N'COLUMN', @level2name = N'tables_measures_expression';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '33208663-370f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_312_tables_measures_T', @level2type = N'COLUMN', @level2name = N'tables_measures_displayFolder';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '30208663-370f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_312_tables_measures_T', @level2type = N'COLUMN', @level2name = N'tables_measures_description_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '31208663-370f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_312_tables_measures_T', @level2type = N'COLUMN', @level2name = N'tables_measures_description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2e208663-370f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_312_tables_measures_T', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a833cd02-380f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_312_tables_measures_T', @level2type = N'COLUMN', @level2name = N'Measure_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '38208663-370f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'model_json_312_tables_measures_T', @level2type = N'COLUMN', @level2name = N'databasename';

