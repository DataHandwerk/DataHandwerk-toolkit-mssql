﻿CREATE TABLE [reference].[RepoObjectColumnSource_virtual] (
    [RepoObjectColumn_guid]        UNIQUEIDENTIFIER CONSTRAINT [DF_RepoObjectColumnSource_virtual_RepoObjectColumn_guid] DEFAULT (newsequentialid()) NOT NULL,
    [Source_RepoObjectColumn_guid] UNIQUEIDENTIFIER CONSTRAINT [DF_RepoObjectColumnSource_virtual_RepoObjectColumn_guid1] DEFAULT (newsequentialid()) NOT NULL,
    CONSTRAINT [PK_RepoObjectColumnSource_virtual] PRIMARY KEY CLUSTERED ([RepoObjectColumn_guid] ASC, [Source_RepoObjectColumn_guid] ASC),
    CONSTRAINT [FK_RepoObjectColumnSource_virtual_RepoObjectColumn] FOREIGN KEY ([RepoObjectColumn_guid]) REFERENCES [repo].[RepoObjectColumn] ([RepoObjectColumn_guid]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_RepoObjectColumnSource_virtual_RepoObjectColumn_source] FOREIGN KEY ([Source_RepoObjectColumn_guid]) REFERENCES [repo].[RepoObjectColumn] ([RepoObjectColumn_guid])
);


GO
ALTER TABLE [reference].[RepoObjectColumnSource_virtual] NOCHECK CONSTRAINT [FK_RepoObjectColumnSource_virtual_RepoObjectColumn_source];


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '4377342a-21a5-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumnSource_virtual', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObjectColumnSource_virtual_RepoObjectColumn_guid1';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '4277342a-21a5-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumnSource_virtual', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObjectColumnSource_virtual_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '4577342a-21a5-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumnSource_virtual', @level2type = N'CONSTRAINT', @level2name = N'FK_RepoObjectColumnSource_virtual_RepoObjectColumn_source';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '4477342a-21a5-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumnSource_virtual', @level2type = N'CONSTRAINT', @level2name = N'FK_RepoObjectColumnSource_virtual_RepoObjectColumn';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '4177342a-21a5-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumnSource_virtual', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObjectColumnSource_virtual';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4b77342a-21a5-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumnSource_virtual', @level2type = N'COLUMN', @level2name = N'Source_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4a77342a-21a5-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumnSource_virtual', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '4077342a-21a5-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectColumnSource_virtual';

