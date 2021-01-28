CREATE TABLE [repo].[GeneratorUspStep] (
    [id]                          INT            IDENTITY (1, 1) NOT NULL,
    [usp_id]                      INT            NOT NULL,
    [Number]                      INT            NOT NULL,
    [Parent_Number]               INT            NULL,
    [Name]                        NVARCHAR (128) NULL,
    [has_logging]                 TINYINT        CONSTRAINT [DF_GeneratorUspStep_has_logging] DEFAULT ((0)) NOT NULL,
    [is_condition]                TINYINT        CONSTRAINT [DF_GeneratorUspStep_is_condition] DEFAULT ((0)) NOT NULL,
    [is_inactive]                 TINYINT        CONSTRAINT [DF_GeneratorUspStep_is_inactive] DEFAULT ((0)) NOT NULL,
    [is_SubProcedure]             TINYINT        CONSTRAINT [DF_GeneratorUspStep_is_SubProcedure] DEFAULT ((0)) NOT NULL,
    [Statement]                   NVARCHAR (MAX) NULL,
    [log_source_object]           NVARCHAR (261) NULL,
    [log_target_object]           NVARCHAR (261) NULL,
    [log_flag_InsertUpdateDelete] CHAR (1)       NULL,
    [info_01]                     NVARCHAR (MAX) NULL,
    [info_02]                     NVARCHAR (MAX) NULL,
    [info_03]                     NVARCHAR (MAX) NULL,
    [info_04]                     NVARCHAR (MAX) NULL,
    [info_05]                     NVARCHAR (MAX) NULL,
    [info_06]                     NVARCHAR (MAX) NULL,
    [info_07]                     NVARCHAR (MAX) NULL,
    [info_08]                     NVARCHAR (MAX) NULL,
    [info_09]                     NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_GeneratorUspStep] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_GeneratorUspStep_GeneratorUsp] FOREIGN KEY ([usp_id]) REFERENCES [repo].[GeneratorUsp] ([id]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [UK_GeneratorUspStep_Number] UNIQUE NONCLUSTERED ([usp_id] ASC, [Number] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'use info_01, info_02, ... to define parameters for sub procedure call', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'GeneratorUspStep', @level2type = N'COLUMN', @level2name = N'is_SubProcedure';

