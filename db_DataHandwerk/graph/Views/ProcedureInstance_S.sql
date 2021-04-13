CREATE View graph.ProcedureInstance_S
As
Select
    -- 
    T1.Procedure_RepoObject_guid
  , T1.Instance
  , Procedure_fullname = ro.RepoObject_fullname
From
    workflow.ProcedureInstance As T1
    Inner Join
        repo.RepoObject    As ro
            On
            ro.RepoObject_guid = T1.Procedure_RepoObject_guid;
Go
Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '32c1e60f-ed66-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'graph'
  , @level1type = N'VIEW'
  , @level1name = N'ProcedureInstance_S';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '48c1e60f-ed66-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'graph'
  , @level1type = N'VIEW'
  , @level1name = N'ProcedureInstance_S'
  , @level2type = N'COLUMN'
  , @level2name = N'Procedure_RepoObject_guid';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4ac1e60f-ed66-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'graph'
  , @level1type = N'VIEW'
  , @level1name = N'ProcedureInstance_S'
  , @level2type = N'COLUMN'
  , @level2name = N'Procedure_fullname';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '49c1e60f-ed66-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'graph'
  , @level1type = N'VIEW'
  , @level1name = N'ProcedureInstance_S'
  , @level2type = N'COLUMN'
  , @level2name = N'Instance';


Go



Go
Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[ProcedureInstance].[Procedure_RepoObject_guid]'
  , @level0type = N'SCHEMA'
  , @level0name = N'graph'
  , @level1type = N'VIEW'
  , @level1name = N'ProcedureInstance_S'
  , @level2type = N'COLUMN'
  , @level2name = N'Procedure_RepoObject_guid';


Go
Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[RepoObject_fullname]'
  , @level0type = N'SCHEMA'
  , @level0name = N'graph'
  , @level1type = N'VIEW'
  , @level1name = N'ProcedureInstance_S'
  , @level2type = N'COLUMN'
  , @level2name = N'Procedure_fullname';


Go
Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'(concat(''['',[RepoObject_schema_name],''].['',[RepoObject_name],'']''))'
  , @level0type = N'SCHEMA'
  , @level0name = N'graph'
  , @level1type = N'VIEW'
  , @level1name = N'ProcedureInstance_S'
  , @level2type = N'COLUMN'
  , @level2name = N'Procedure_fullname';


Go
Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[ProcedureInstance].[Instance]'
  , @level0type = N'SCHEMA'
  , @level0name = N'graph'
  , @level1type = N'VIEW'
  , @level1name = N'ProcedureInstance_S'
  , @level2type = N'COLUMN'
  , @level2name = N'Instance';

