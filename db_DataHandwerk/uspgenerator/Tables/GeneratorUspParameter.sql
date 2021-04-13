CREATE TABLE [uspgenerator].[GeneratorUspParameter] (
    [id]               INT             IDENTITY (1, 1) NOT NULL,
    [usp_id]           INT             NOT NULL,
    [Number]           INT             NOT NULL,
    [Name]             NVARCHAR (128)  NOT NULL,
    [UserTypeFullname] NVARCHAR (128)  NOT NULL,
    [is_inactive]      TINYINT         CONSTRAINT [DF_GeneratorUspParameter_is_inactive] DEFAULT ((0)) NOT NULL,
    [is_out]           TINYINT         CONSTRAINT [DF_GeneratorUspParameter_is_out] DEFAULT ((0)) NOT NULL,
    [has_DefaultValue] TINYINT         CONSTRAINT [DF_GeneratorUspParameter_has_DefaultValue] DEFAULT ((0)) NOT NULL,
    [DefaultValue]     NVARCHAR (MAX)  NULL,
    [Description]      NVARCHAR (4000) NULL,
    CONSTRAINT [PK_GeneratorUspParameter] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_GeneratorUspParameter_GeneratorUsp] FOREIGN KEY ([usp_id]) REFERENCES [uspgenerator].[GeneratorUsp] ([id]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [UK_GeneratorUspParameter_name] UNIQUE NONCLUSTERED ([usp_id] ASC, [Name] ASC),
    CONSTRAINT [UK_GeneratorUspParameter_Number] UNIQUE NONCLUSTERED ([usp_id] ASC, [Number] ASC)
);






GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '5290291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspParameter', @level2type = N'CONSTRAINT', @level2name = N'UK_GeneratorUspParameter_Number';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '5490291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspParameter', @level2type = N'CONSTRAINT', @level2name = N'UK_GeneratorUspParameter_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '5090291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspParameter', @level2type = N'CONSTRAINT', @level2name = N'PK_GeneratorUspParameter';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b490291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspParameter', @level2type = N'CONSTRAINT', @level2name = N'FK_GeneratorUspParameter_GeneratorUsp';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'a290291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspParameter', @level2type = N'CONSTRAINT', @level2name = N'DF_GeneratorUspParameter_is_out';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'a090291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspParameter', @level2type = N'CONSTRAINT', @level2name = N'DF_GeneratorUspParameter_is_inactive';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'a490291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspParameter', @level2type = N'CONSTRAINT', @level2name = N'DF_GeneratorUspParameter_has_DefaultValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '4e90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspParameter';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '62f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspParameter', @level2type = N'COLUMN', @level2name = N'usp_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '65f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspParameter', @level2type = N'COLUMN', @level2name = N'UserTypeFullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '63f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspParameter', @level2type = N'COLUMN', @level2name = N'Number';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '64f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspParameter', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '67f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspParameter', @level2type = N'COLUMN', @level2name = N'is_out';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '66f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspParameter', @level2type = N'COLUMN', @level2name = N'is_inactive';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '61f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspParameter', @level2type = N'COLUMN', @level2name = N'id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '68f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspParameter', @level2type = N'COLUMN', @level2name = N'has_DefaultValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '69f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspParameter', @level2type = N'COLUMN', @level2name = N'DefaultValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '72e2b548-5e96-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'TABLE', @level1name = N'GeneratorUspParameter', @level2type = N'COLUMN', @level2name = N'Description';

