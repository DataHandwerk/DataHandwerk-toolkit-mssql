CREATE TABLE [repo].[GeneratorUspParameter] (
    [id]               INT            IDENTITY (1, 1) NOT NULL,
    [usp_id]           INT            NOT NULL,
    [Number]           INT            NOT NULL,
    [Name]             NVARCHAR (128) NOT NULL,
    [UserTypeFullname] NVARCHAR (128) NOT NULL,
    [is_inactive]      TINYINT        CONSTRAINT [DF_GeneratorUspParameter_is_inactive] DEFAULT ((0)) NOT NULL,
    [is_out]           TINYINT        CONSTRAINT [DF_GeneratorUspParameter_is_out] DEFAULT ((0)) NOT NULL,
    [has_DefaultValue] TINYINT        CONSTRAINT [DF_GeneratorUspParameter_has_DefaultValue] DEFAULT ((0)) NOT NULL,
    [DefaultValue]     NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_GeneratorUspParameter] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_GeneratorUspParameter_GeneratorUsp] FOREIGN KEY ([usp_id]) REFERENCES [repo].[GeneratorUsp] ([id]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [UK_GeneratorUspParameter_name] UNIQUE NONCLUSTERED ([usp_id] ASC, [Name] ASC),
    CONSTRAINT [UK_GeneratorUspParameter_Number] UNIQUE NONCLUSTERED ([usp_id] ASC, [Number] ASC)
);

