CREATE TABLE [property].[PropertyName_Measure_T] (
    [property_name]               NVARCHAR (128) NOT NULL,
    [OrderInAntoraMeasureDetails] INT            CONSTRAINT [DF_PropertyName_Measure_T_is_in_AntoraMeasureDetails] DEFAULT ((0)) NOT NULL,
    [NoOfCollapsibleChars]        TINYINT        CONSTRAINT [DF_PropertyName_Measure_T_NoOfListingChars1] DEFAULT ((0)) NOT NULL,
    [NoOfExampleChars]            TINYINT        CONSTRAINT [DF_PropertyName_Measure_T_NoOfListingChars1_1] DEFAULT ((0)) NOT NULL,
    [NoOfListingChars]            TINYINT        CONSTRAINT [DF_PropertyName_Measure_T_is_listing] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_PropertyName_Measure_T] PRIMARY KEY CLUSTERED ([property_name] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '2d8d889d-3250-ec11-8532-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'PropertyName_Measure_T', @level2type = N'CONSTRAINT', @level2name = N'DF_PropertyName_Measure_T_NoOfListingChars1';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '2f8d889d-3250-ec11-8532-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'PropertyName_Measure_T', @level2type = N'CONSTRAINT', @level2name = N'DF_PropertyName_Measure_T_is_listing';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '2e8d889d-3250-ec11-8532-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'PropertyName_Measure_T', @level2type = N'CONSTRAINT', @level2name = N'DF_PropertyName_Measure_T_NoOfListingChars1_1';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '2b8d889d-3250-ec11-8532-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'PropertyName_Measure_T', @level2type = N'CONSTRAINT', @level2name = N'DF_PropertyName_Measure_T_is_in_AntoraMeasureDetails';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'a3471cf0-464d-ec11-8531-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'PropertyName_Measure_T', @level2type = N'CONSTRAINT', @level2name = N'PK_PropertyName_Measure_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '32535aab-3250-ec11-8532-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'PropertyName_Measure_T', @level2type = N'COLUMN', @level2name = N'NoOfListingChars';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NoOfListingChars > 0

* create a listing block, use count of ''-''
* a normal value would be 4
', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'PropertyName_Measure_T', @level2type = N'COLUMN', @level2name = N'NoOfListingChars';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '31535aab-3250-ec11-8532-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'PropertyName_Measure_T', @level2type = N'COLUMN', @level2name = N'NoOfExampleChars';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NoOfExampleChars > 0

* create a listing block, use count of ''=''
* a normal value would be 4
', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'PropertyName_Measure_T', @level2type = N'COLUMN', @level2name = N'NoOfExampleChars';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '30535aab-3250-ec11-8532-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'PropertyName_Measure_T', @level2type = N'COLUMN', @level2name = N'NoOfCollapsibleChars';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NoOfCollapsibleChars > 0

* create a [%collapsible] block, use count of ''=''
* a normal value would be 5 or 6
', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'PropertyName_Measure_T', @level2type = N'COLUMN', @level2name = N'NoOfCollapsibleChars';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2f535aab-3250-ec11-8532-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'PropertyName_Measure_T', @level2type = N'COLUMN', @level2name = N'OrderInAntoraMeasureDetails';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'* order number <= 0 - don''t use in AntoraMeasureDetails
* order number > 0 - use in AntoraMeasureDetails, order by order number', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'PropertyName_Measure_T', @level2type = N'COLUMN', @level2name = N'OrderInAntoraMeasureDetails';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '857f7d5a-464d-ec11-8531-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'PropertyName_Measure_T', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'f91ea651-464d-ec11-8531-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'PropertyName_Measure_T';

