CREATE TABLE [repo].[spt_values] (
    [name]   NVARCHAR (35) NULL,
    [number] INT           NOT NULL,
    [type]   NCHAR (3)     NOT NULL,
    [low]    INT           NULL,
    [high]   INT           NULL,
    [status] INT           NULL
);

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

