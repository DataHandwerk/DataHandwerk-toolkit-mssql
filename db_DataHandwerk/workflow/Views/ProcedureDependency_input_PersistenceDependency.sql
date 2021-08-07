CREATE View [workflow].[ProcedureDependency_input_PersistenceDependency]
As
Select
    [referenced_Procedure_RepoObject_guid]
  , [referencing_Procedure_RepoObject_guid]
  , [is_PersistenceDependency]
--, [is_active]
--, [Description]
--, [id]
From
    [workflow].[ProcedureDependency]
Where
    [is_PersistenceDependency] = 1;