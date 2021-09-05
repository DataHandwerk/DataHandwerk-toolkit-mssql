
/*
--usage:

SELECT *
FROM [repo].[GeneratorUspStep_Sql]
ORDER BY [id]
 , [RowNumber_PerUsp]


*/
CREATE View uspgenerator.GeneratorUspStep_Sql
As
Select
    usp_id   = u.id
  , t.Number
  , u.has_logging
  , BeginEnd.required_Begin_count
  , BeginEnd.required_End_count
  , BeginEnd.is_required_ELSE
  --only information
  , u.usp_fullname
  , t.RowNumber_PerUsp
  --, [t].[Depth]
  --, [t].[is_condition]
  --, [t].[Root_Sort]
  --, [t].[Parent_Number]
  --, [t].[Parent_Sort]
  --, [t].[Sort]
  --, [t].[child_PerParent]
  --, [t].[Asc_PerParentChild]
  --, [t].[Desc_PerParentChild]
  , sql.SqlStep
  ----this list is  too wide, we need a smaller list
  --, AdocStep = CONCAT (
  -- '|'
  -- , step.Number
  -- , CHAR(13)
  -- , CHAR(10)
  -- , '|'
  -- , step.[Name]
  -- , CHAR(13)
  -- , CHAR(10)
  -- , '|'
  -- , step.[is_condition]
  -- , CHAR(13)
  -- , CHAR(10)
  -- , '|'
  -- , step.[log_source_object]
  -- , CHAR(13)
  -- , CHAR(10)
  -- , '|'
  -- , step.[log_target_object]
  -- , CHAR(13)
  -- , CHAR(10)
  -- , '|'
  -- , step.[log_flag_InsertUpdateDelete]
  -- , CHAR(13)
  -- , CHAR(10)
  -- )
  , AdocStep = Concat (
                          '|'
                        , step.Number
                        , Char ( 13 ) + Char ( 10 )
                        , '|'
                        , Char ( 13 ) + Char ( 10 )
                        , '*'
                        , step.Name
                        , '*'
                        , Char ( 13 ) + Char ( 10 )
                        , Char ( 13 ) + Char ( 10 )
                        , Iif(step.is_SubProcedure = 1
                              , '* ' + '`EXEC ' + step.Statement + '`' + Char ( 13 ) + Char ( 10 )
                              , Null)
                        , Iif(step.is_condition = 1
                              , '* ' + '`IF ' + step.Statement + '`' + Char ( 13 ) + Char ( 10 )
                              , Null)
                        , Iif(step.log_flag_InsertUpdateDelete <> ''
                              , '* ' + step.log_flag_InsertUpdateDelete + Char ( 13 ) + Char ( 10 )
                              , Null)
                        , Iif(step.log_source_object <> ''
                              , '* ' + step.log_source_object + Char ( 13 ) + Char ( 10 )
                              , Null)
                        , Iif(step.log_target_object <> ''
                              , '* ' + step.log_target_object + Char ( 13 ) + Char ( 10 )
                              , Null)
                        , Char ( 13 ) + Char ( 10 )
                        , Char ( 13 ) + Char ( 10 ) + step.Description + Char ( 13 ) + Char ( 10 )
                        , Char ( 13 ) + Char ( 10 )
                        , '.Statement' + Char ( 13 ) + Char ( 10 )
                        , '[%collapsible]' + Char ( 13 ) + Char ( 10 )
                        , '=====' + Char ( 13 ) + Char ( 10 )
                        , '[source,sql]' + Char ( 13 ) + Char ( 10 )
                        , '----' + Char ( 13 ) + Char ( 10 )
                        , step.Statement + Char ( 13 ) + Char ( 10 )
                        , '----' + Char ( 13 ) + Char ( 10 )
                        , '=====' + Char ( 13 ) + Char ( 10 )
                        , Char ( 13 ) + Char ( 10 )
                        , '|'
                        , step.Parent_Number
                        , Char ( 13 ) + Char ( 10 )
                        , Char ( 13 ) + Char ( 10 )
                      )
From
    uspgenerator.GeneratorUsp                                       As u
    Cross Apply uspgenerator.ftv_GeneratorUspStep_tree ( id, Null ) As t
    Left Join
    (
        Select
            s.usp_id
          , t.Number
          , required_Begin_count = Sum ( Iif(t.Asc_PerParentChild = 1, 1, 0))
          , required_End_count   = Sum ( Iif(t.Desc_PerParentChild = 1, 1, 0))
          , is_required_ELSE     = Max ( t.is_required_ELSE )
        From
            uspgenerator.GeneratorUspStep                                         As s
            Cross Apply uspgenerator.ftv_GeneratorUspStep_tree ( usp_id, Number ) As t
        Where
            s.is_condition = 1
        Group By
            s.usp_id
          , t.Number
    )                                                   As BeginEnd
        On
        BeginEnd.usp_id = u.id
        And BeginEnd.Number = t.Number

    Left Join
        uspgenerator.GeneratorUspStep                   As step
            On
            step.usp_id = u.id
            And step.Number = t.Number
    Cross Apply uspgenerator.ftv_GeneratorUspStep_sql (
                                                          u.id
                                                        , t.Number
                                                        , u.has_logging
                                                        , BeginEnd.required_Begin_count
                                                        , BeginEnd.required_End_count
                                                        , BeginEnd.is_required_ELSE
                                                      ) As sql
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '4590291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUspStep_Sql';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1af47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUspStep_Sql'
  , @level2type = N'COLUMN'
  , @level2name = N'usp_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '20f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUspStep_Sql'
  , @level2type = N'COLUMN'
  , @level2name = N'usp_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '22f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUspStep_Sql'
  , @level2type = N'COLUMN'
  , @level2name = N'SqlStep';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '21f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUspStep_Sql'
  , @level2type = N'COLUMN'
  , @level2name = N'RowNumber_PerUsp';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1ef47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUspStep_Sql'
  , @level2type = N'COLUMN'
  , @level2name = N'required_End_count';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1df47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUspStep_Sql'
  , @level2type = N'COLUMN'
  , @level2name = N'required_Begin_count';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1bf47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUspStep_Sql'
  , @level2type = N'COLUMN'
  , @level2name = N'Number';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1ff47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUspStep_Sql'
  , @level2type = N'COLUMN'
  , @level2name = N'is_required_ELSE';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1cf47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUspStep_Sql'
  , @level2type = N'COLUMN'
  , @level2name = N'has_logging';
Go

Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [uspgenerator].[GeneratorUsp].[usp_fullname]', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Sql', @level2type = N'COLUMN', @level2name = N'usp_fullname';


Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'(concat(''['',[usp_schema],''].['',[usp_name],'']''))'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUspStep_Sql'
  , @level2type = N'COLUMN'
  , @level2name = N'usp_fullname';
Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [uspgenerator].[GeneratorUsp].[has_logging]', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Sql', @level2type = N'COLUMN', @level2name = N'has_logging';


Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '271a8d58-e08f-eb11-84f1-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUspStep_Sql'
  , @level2type = N'COLUMN'
  , @level2name = N'AdocStep';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [uspgenerator].[ftv_GeneratorUspStep_sql]
* [uspgenerator].[ftv_GeneratorUspStep_tree]
* [uspgenerator].[GeneratorUsp]
* [uspgenerator].[GeneratorUspStep]', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Sql';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'usp_id,Number', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Sql';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'usp_id,Number', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Sql';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'int,int', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Sql';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'053E549A-0796-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Sql';


GO
EXECUTE sp_addextendedproperty @name = N'has_execution_plan_issue', @value = N'1', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Sql';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:uspgenerator.GeneratorUsp_StepList.adoc[]', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Sql';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:uspgenerator.ftv_GeneratorUspStep_sql.adoc[]
* xref:uspgenerator.ftv_GeneratorUspStep_tree.adoc[]
* xref:uspgenerator.GeneratorUsp.adoc[]
* xref:uspgenerator.GeneratorUspStep.adoc[]', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Sql';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Sql';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Sql';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [uspgenerator].[GeneratorUsp].[id]', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Sql', @level2type = N'COLUMN', @level2name = N'usp_id';

