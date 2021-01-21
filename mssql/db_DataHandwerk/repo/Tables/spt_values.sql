CREATE TABLE [repo].[spt_values] (
    [name]   NVARCHAR (35) NULL,
    [number] INT           NOT NULL,
    [type]   NCHAR (3)     NOT NULL,
    [low]    INT           NULL,
    [high]   INT           NULL,
    [status] INT           NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '19c30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'spt_values', @level2type = N'COLUMN', @level2name = N'status';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '15c30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'spt_values', @level2type = N'COLUMN', @level2name = N'high';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '16c30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'spt_values', @level2type = N'COLUMN', @level2name = N'low';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1ac30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'spt_values', @level2type = N'COLUMN', @level2name = N'type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '18c30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'spt_values', @level2type = N'COLUMN', @level2name = N'number';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '17c30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'spt_values', @level2type = N'COLUMN', @level2name = N'name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b73dfec8-3849-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'spt_values';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'How to fill from undocumented table in master:

```sql
Truncate Table repo_config.spt_values

Insert Into repo_config.spt_values
(
       [name]
     , [number]
     , [type]
     , [low]
     , [high]
     , Status
)
Select
       [name]
     , [number]
     , [type]
     , [low]
     , [high]
     , Status
From
     master.dbo.spt_values As spt_values_1
```', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'spt_values';

