CREATE TABLE [repo].[GeneratorUsp] (
    [id]              INT             IDENTITY (1, 1) NOT NULL,
    [usp_schema]      NVARCHAR (128)  NOT NULL,
    [usp_name]        NVARCHAR (128)  NOT NULL,
    [has_logging]     TINYINT         CONSTRAINT [DF_GeneratorUsp_has_logging] DEFAULT ((0)) NOT NULL,
    [usp_Description] NVARCHAR (4000) NULL,
    [usp_fullname]    AS              (concat('[',[usp_schema],'].[',[usp_name],']')) PERSISTED NOT NULL,
    CONSTRAINT [PK_GeneratorUsp] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [UK_GeneratorUsp_Schema_Name] UNIQUE NONCLUSTERED ([usp_schema] ASC, [usp_name] ASC)
);

