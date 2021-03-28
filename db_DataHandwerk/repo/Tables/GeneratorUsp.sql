CREATE TABLE [repo].[GeneratorUsp] (
    [id]              INT             IDENTITY (1, 1) NOT NULL,
    [usp_schema]      NVARCHAR (128)  NOT NULL,
    [usp_name]        NVARCHAR (128)  NOT NULL,
    [has_logging]     TINYINT         CONSTRAINT [DF_GeneratorUsp_has_logging] DEFAULT ((1)) NOT NULL,
    [usp_Description] NVARCHAR (4000) NULL,
    [usp_Examples]    NVARCHAR (4000) NULL,
    [usp_fullname]    AS              (concat('[',[usp_schema],'].[',[usp_name],']')) PERSISTED NOT NULL,
    CONSTRAINT [PK_GeneratorUsp] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [UK_GeneratorUsp_Schema_Name] UNIQUE NONCLUSTERED ([usp_schema] ASC, [usp_name] ASC)
);






GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '3c90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'GeneratorUsp', @level2type = N'CONSTRAINT', @level2name = N'UK_GeneratorUsp_Schema_Name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '3a90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'GeneratorUsp', @level2type = N'CONSTRAINT', @level2name = N'PK_GeneratorUsp';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7e90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'GeneratorUsp', @level2type = N'CONSTRAINT', @level2name = N'DF_GeneratorUsp_has_logging';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '3890291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'GeneratorUsp';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b8f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'GeneratorUsp', @level2type = N'COLUMN', @level2name = N'usp_schema';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b9f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'GeneratorUsp', @level2type = N'COLUMN', @level2name = N'usp_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bbf37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'GeneratorUsp', @level2type = N'COLUMN', @level2name = N'usp_Description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b7f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'GeneratorUsp', @level2type = N'COLUMN', @level2name = N'id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'baf37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'GeneratorUsp', @level2type = N'COLUMN', @level2name = N'has_logging';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bcf37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'GeneratorUsp', @level2type = N'COLUMN', @level2name = N'usp_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[GeneratorUsp].[usp_name]
[repo].[GeneratorUsp].[usp_schema]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'GeneratorUsp', @level2type = N'COLUMN', @level2name = N'usp_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[usp_schema],''].['',[usp_name],'']''))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'GeneratorUsp', @level2type = N'COLUMN', @level2name = N'usp_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '261a8d58-e08f-eb11-84f1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'GeneratorUsp', @level2type = N'COLUMN', @level2name = N'usp_Examples';

