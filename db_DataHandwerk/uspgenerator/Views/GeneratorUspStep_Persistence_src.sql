

/*
<<property_start>>Description
* xref:sqldb:uspgenerator.generatoruspstep_persistence_src.adoc[] creates all possible steps for GeneratorUspStep
* xref:sqldb:uspgenerator.generatoruspstep_persistence_isinactive_setpoint.adoc[] determines which steps should be activated based on settings in xref:sqldb:repo.repoobject_persistence.adoc[]
* xref:sqldb:uspgenerator.usp_generatorusp_insert_update_persistence.adoc[] uses these views
<<property_end>>
*/

CREATE View [uspgenerator].[GeneratorUspStep_Persistence_src]
As
--00:00:01
Select
    --
    usp_id                      = gu.id
  , Number                      = 100
  , Parent_Number               = Null
  , Name                        = 'check for empty source'
  , has_logging                 = 0
  , is_condition                = 1
  , is_inactive                 = 0
  , is_SubProcedure             = 0
  , Statement                   = '(SELECT count(*) FROM ' + ro.persistence_source_SysObject_fullname + ') = 0'
  , log_source_object           = ro.persistence_source_SysObject_fullname
  , log_target_object           = Cast(Null As NVarchar(261))
  , log_flag_InsertUpdateDelete = Cast(Null As Char(1))
  --
  , gu.usp_fullname
  , ro.RepoObject_guid
From
    repo.RepoObject_gross         As ro
    Inner Join
        uspgenerator.GeneratorUsp As gu
            On
            ro.RepoObject_schema_name   = gu.usp_schema
            And ro.usp_persistence_name = gu.usp_name
Union All
--00:00:01
Select
    --
    usp_id                      = gu.id
  , Number                      = 110
  , Parent_Number               = 100
  , Name                        = 'ERROR 50110: persistence source is empty'
  , has_logging                 = 0
  , is_condition                = 0
  , is_inactive                 = 0
  , is_SubProcedure             = 0
  , Statement                   = ' THROW 50110
  , ''persistence source is empty: ' + ro.persistence_source_SysObject_fullname + '''
  , 1;
'
  , log_source_object           = Cast(Null As NVarchar(261))
  , log_target_object           = Cast(Null As NVarchar(261))
  , log_flag_InsertUpdateDelete = Cast(Null As Char(1))
  --
  , gu.usp_fullname
  , ro.RepoObject_guid
From
    repo.RepoObject_gross         As ro
    Inner Join
        uspgenerator.GeneratorUsp As gu
            On
            ro.RepoObject_schema_name   = gu.usp_schema
            And ro.usp_persistence_name = gu.usp_name
Union All
--00:01:19
Select
    --will be empty if PK doesn't exist
    usp_id                      = gu.id
  , Number                      = 300
  , Parent_Number               = Null
  , Name                        = 'check duplicate per PK'
  , has_logging                 = 0
  , is_condition                = 1
  , is_inactive                 = 0
  , is_SubProcedure             = 0
  , Statement                   = 'EXISTS(SELECT TOP 1 1 FROM ' + ro.persistence_source_SysObject_fullname + ' GROUP BY ' + i.ColumnList
                                  + ' HAVING COUNT(*) > 1)'
  , log_source_object           = ro.persistence_source_SysObject_fullname
  , log_target_object           = Cast(Null As NVarchar(261))
  , log_flag_InsertUpdateDelete = Cast(Null As Char(1))
  --
  , gu.usp_fullname
  , ro.RepoObject_guid
From
    repo.RepoObject_gross         As ro
    Inner Join
        uspgenerator.GeneratorUsp As gu
            On
            ro.RepoObject_schema_name   = gu.usp_schema
            And ro.usp_persistence_name = gu.usp_name
    --INNER JOIN because step 300 should be created only when PK exists in persistence_source

    Inner Join
        repo.RepoObject_gross     As ro_s
            On
            ro_s.RepoObject_guid        = ro.persistence_source_RepoObject_guid

    Inner Join
        repo.Index_ColumList_T    As i
            On
            i.index_guid                = ro_s.pk_index_guid
Union All
--00:01:25
Select
    --will be empty if PK doesn't exist
    usp_id                      = gu.id
  , Number                      = 310
  , Parent_Number               = 300
  , Name                        = 'ERROR 50310: persistence source PK not unique'
  , has_logging                 = 0
  , is_condition                = 0
  , is_inactive                 = 0
  , is_SubProcedure             = 0
  , Statement                   = ' THROW 50310
  , ''persistence source PK not unique: ' + ro.persistence_source_SysObject_fullname + '; ' + i.ColumnList
                                  + '''
  , 1;
'
  , log_source_object           = Cast(Null As NVarchar(261))
  , log_target_object           = Cast(Null As NVarchar(261))
  , log_flag_InsertUpdateDelete = Cast(Null As Char(1))
  --
  , gu.usp_fullname
  , ro.RepoObject_guid
From
    repo.RepoObject_gross         As ro
    Inner Join
        uspgenerator.GeneratorUsp As gu
            On
            ro.RepoObject_schema_name   = gu.usp_schema
            And ro.usp_persistence_name = gu.usp_name
    --INNER JOIN because step 300 should be created only when PK exists in persistence_source

    Inner Join
        repo.RepoObject_gross     As ro_s
            On
            ro_s.RepoObject_guid        = ro.persistence_source_RepoObject_guid

    Inner Join
        repo.Index_ColumList_T    As i
            On
            i.index_guid                = ro_s.pk_index_guid
Union All
--00:00:00
Select
    --
    usp_id                      = gu.id
  , Number                      = 400
  , Parent_Number               = Null
  , Name                        = 'truncate persistence target'
  , has_logging                 = 1
  , is_condition                = 0
  , is_inactive                 = 0
  , is_SubProcedure             = 0
  , Statement                   = 'TRUNCATE TABLE ' + ro.RepoObject_fullname
  , log_source_object           = Cast(Null As NVarchar(261))
  , log_target_object           = ro.RepoObject_fullname
  , log_flag_InsertUpdateDelete = 'D'
  --
  , gu.usp_fullname
  , ro.RepoObject_guid
From
    repo.RepoObject_gross         As ro
    Inner Join
        uspgenerator.GeneratorUsp As gu
            On
            ro.RepoObject_schema_name   = gu.usp_schema
            And ro.usp_persistence_name = gu.usp_name
Union All
--00:01:19
Select
    --will be empty if PK doesn't exist
    usp_id                      = gu.id
  , Number                      = 500
  , Parent_Number               = Null
  , Name                        = 'delete persistence target missing in source'
  , has_logging                 = 1
  , is_condition                = 0
  , is_inactive                 = 0
  , is_SubProcedure             = 0
  , Statement                   = 'DELETE T
FROM ' + ro.RepoObject_fullname + ' AS T
WHERE
NOT EXISTS
(SELECT 1 FROM ' + ro.persistence_source_SysObject_fullname + ' AS S
WHERE
' + i.PersistenceWhereColumnList + ')
 '
  , log_source_object           = ro.persistence_source_SysObject_fullname
  , log_target_object           = ro.RepoObject_fullname
  , log_flag_InsertUpdateDelete = 'D'
  --
  , gu.usp_fullname
  , ro.RepoObject_guid
From
    repo.RepoObject_gross         As ro
    Inner Join
        uspgenerator.GeneratorUsp As gu
            On
            ro.RepoObject_schema_name   = gu.usp_schema
            And ro.usp_persistence_name = gu.usp_name
    --INNER JOIN because step 500 should be created only when PK exists in persistence_source

    Inner Join
        repo.RepoObject_gross     As ro_s
            On
            ro_s.RepoObject_guid        = ro.persistence_source_RepoObject_guid

    Inner Join
        repo.Index_ColumList_T    As i
            On
            i.index_guid                = ro_s.pk_index_guid
Union All
--00:01:53
Select
    --will be empty if PK doesn't exist
    usp_id                      = gu.id
  , Number                      = 550
  , Parent_Number               = Null
  , Name                        = 'delete persistence target changed'
  , has_logging                 = 1
  , is_condition                = 0
  , is_inactive                 = 0
  , is_SubProcedure             = 0
  , Statement                   = 'DELETE T
FROM ' + ro.RepoObject_fullname + ' AS T
INNER JOIN ' + ro.persistence_source_SysObject_fullname + ' AS S
ON
' + i.PersistenceWhereColumnList + '
WHERE
' + ro.PersistenceCompareColumnList
  , log_source_object           = ro.persistence_source_SysObject_fullname
  , log_target_object           = ro.RepoObject_fullname
  , log_flag_InsertUpdateDelete = 'D'
  --
  , gu.usp_fullname
  , ro.RepoObject_guid
From
    repo.RepoObject_gross2        As ro
    Inner Join
        uspgenerator.GeneratorUsp As gu
            On
            ro.RepoObject_schema_name   = gu.usp_schema
            And ro.usp_persistence_name = gu.usp_name
    --INNER JOIN because step 500 should be created only when PK exists in persistence_source

    Inner Join
        repo.RepoObject_gross     As ro_s
            On
            ro_s.RepoObject_guid        = ro.persistence_source_RepoObject_guid

    Inner Join
        repo.Index_ColumList_T    As i
            On
            i.index_guid                = ro_s.pk_index_guid
Union All
--00:01:41
Select
    --will be empty if PK doesn't exist
    usp_id                      = gu.id
  , Number                      = 600
  , Parent_Number               = Null
  , Name                        = 'update changed'
  , has_logging                 = 1
  , is_condition                = 0
  , is_inactive                 = 0
  , is_SubProcedure             = 0
  , Statement                   = 'UPDATE T
SET
' + ro.PersistenceUpdateColumnList + '
FROM ' + ro.RepoObject_fullname + ' AS T
INNER JOIN ' + ro.persistence_source_SysObject_fullname + ' AS S
ON
' + i.PersistenceWhereColumnList + '
WHERE
' + ro.PersistenceCompareColumnList
  , log_source_object           = ro.persistence_source_SysObject_fullname
  , log_target_object           = ro.RepoObject_fullname
  , log_flag_InsertUpdateDelete = 'U'
  --
  , gu.usp_fullname
  , ro.RepoObject_guid
From
    repo.RepoObject_gross2        As ro
    Inner Join
        uspgenerator.GeneratorUsp As gu
            On
            ro.RepoObject_schema_name   = gu.usp_schema
            And ro.usp_persistence_name = gu.usp_name
    --INNER JOIN because step 500 should be created only when PK exists in persistence_source

    Inner Join
        repo.RepoObject_gross     As ro_s
            On
            ro_s.RepoObject_guid        = ro.persistence_source_RepoObject_guid

    Inner Join
        repo.Index_ColumList_T    As i
            On
            i.index_guid                = ro_s.pk_index_guid
Union All
--00:02:06
Select
    --will be empty if PK doesn't exist
    usp_id                      = gu.id
  , Number                      = 700
  , Parent_Number               = Null
  , Name                        = 'insert missing'
  , has_logging                 = 1
  , is_condition                = 0
  , is_inactive                 = 0
  , is_SubProcedure             = 0
  , Statement                   = 'INSERT INTO 
 ' + ro.RepoObject_fullname + '
 (
' + ro.PersistenceInsertColumnList + ')
SELECT
' + ro.PersistenceInsertColumnList + '
FROM ' + ro.persistence_source_SysObject_fullname + ' AS S
WHERE
NOT EXISTS
(SELECT 1
FROM ' + ro.RepoObject_fullname + ' AS T
WHERE
' + i.PersistenceWhereColumnList + ')'
  , log_source_object           = ro.persistence_source_SysObject_fullname
  , log_target_object           = ro.RepoObject_fullname
  , log_flag_InsertUpdateDelete = 'I'
  --
  , gu.usp_fullname
  , ro.RepoObject_guid
From
    repo.RepoObject_gross2        As ro
    Inner Join
        uspgenerator.GeneratorUsp As gu
            On
            ro.RepoObject_schema_name   = gu.usp_schema
            And ro.usp_persistence_name = gu.usp_name
    --INNER JOIN because step 500 should be created only when PK exists in persistence_source

    Inner Join
        repo.RepoObject_gross     As ro_s
            On
            ro_s.RepoObject_guid        = ro.persistence_source_RepoObject_guid

    Inner Join
        repo.Index_ColumList_T    As i
            On
            i.index_guid                = ro_s.pk_index_guid
Union All
--00:00:04
Select
    --should be used in combination with truncate
    usp_id                      = gu.id
  , Number                      = 800
  , Parent_Number               = Null
  , Name                        = 'insert all'
  , has_logging                 = 1
  , is_condition                = 0
  , is_inactive                 = 0
  , is_SubProcedure             = 0
  , Statement                   = 'INSERT INTO 
 ' + ro.RepoObject_fullname + '
 (
' + ro.PersistenceInsertColumnList + ')
SELECT
' + ro.PersistenceInsertColumnList + '
FROM ' + ro.persistence_source_SysObject_fullname + ' AS S'
  , log_source_object           = ro.persistence_source_SysObject_fullname
  , log_target_object           = ro.RepoObject_fullname
  , log_flag_InsertUpdateDelete = 'I'
  --
  , gu.usp_fullname
  , ro.RepoObject_guid
From
    repo.RepoObject_gross2        As ro
    Inner Join
        uspgenerator.GeneratorUsp As gu
            On
            ro.RepoObject_schema_name   = gu.usp_schema
            And ro.usp_persistence_name = gu.usp_name
Union All
--00:00:09
Select
    usp_id                      = gu.id
  , Number                      = 900
  , Parent_Number               = Null
  , Name                        = 'merge'
  , has_logging                 = 1
  , is_condition                = 0
  , is_inactive                 = 0
  , is_SubProcedure             = 0
  , Statement                   = 'INSERT INTO 
 ' + ro.RepoObject_fullname + '
 (
' + ro.PersistenceInsertColumnList + ')
SELECT
' + ro.PersistenceInsertColumnList + '
FROM ' + ro.persistence_source_SysObject_fullname + ' AS S'
  , log_source_object           = ro.persistence_source_SysObject_fullname
  , log_target_object           = ro.RepoObject_fullname
  , log_flag_InsertUpdateDelete = 'I'
  --
  , gu.usp_fullname
  , ro.RepoObject_guid
From
    repo.RepoObject_gross2        As ro
    Inner Join
        uspgenerator.GeneratorUsp As gu
            On
            ro.RepoObject_schema_name   = gu.usp_schema
            And ro.usp_persistence_name = gu.usp_name
/*
MERGE [graph].[ReferencedObject] as T
USING
(
    SELECT
        [RepoObject_guid] AS [Procedure_RepoObject_guid]
      , ''                AS [Instance]
    FROM
        [repo].[RepoObject]
    WHERE
        [RepoObject_type] = 'P'
) AS S
ON T.[Procedure_RepoObject_guid] = S.[Procedure_RepoObject_guid]
   AND T.[Instance] = S.[Instance]
WHEN MATCHED AND (
                     t.property_nvarchar <> Cast(s.property_value As NVarchar(4000))
                     Or t.property_value Is Null
                        And Not s.property_value Is Null
                     Or s.property_value Is Null
                        And Not t.property_value Is Null
                 )
    Then Update Set
             property_value = s.property_value
WHEN NOT MATCHED BY TARGET
    THEN INSERT
         (
             $FROM_ID
           , $TO_ID
         )
         VALUES
             (
                 referencing.$NODE_ID
               , referenced.$NODE_ID
             )
WHEN NOT MATCHED BY SOURCE
    THEN DELETE
OUTPUT
    deleted.*
  , $ACTION
  , inserted.*;

*/
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '8190291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUspStep_Persistence_src';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '00f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUspStep_Persistence_src'
  , @level2type = N'COLUMN'
  , @level2name = N'usp_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '0cf77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUspStep_Persistence_src'
  , @level2type = N'COLUMN'
  , @level2name = N'usp_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '08f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUspStep_Persistence_src'
  , @level2type = N'COLUMN'
  , @level2name = N'Statement';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '0df77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUspStep_Persistence_src'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '02f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUspStep_Persistence_src'
  , @level2type = N'COLUMN'
  , @level2name = N'Parent_Number';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '01f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUspStep_Persistence_src'
  , @level2type = N'COLUMN'
  , @level2name = N'Number';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '03f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUspStep_Persistence_src'
  , @level2type = N'COLUMN'
  , @level2name = N'Name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '0af77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUspStep_Persistence_src'
  , @level2type = N'COLUMN'
  , @level2name = N'log_target_object';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '09f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUspStep_Persistence_src'
  , @level2type = N'COLUMN'
  , @level2name = N'log_source_object';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '0bf77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUspStep_Persistence_src'
  , @level2type = N'COLUMN'
  , @level2name = N'log_flag_InsertUpdateDelete';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '07f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUspStep_Persistence_src'
  , @level2type = N'COLUMN'
  , @level2name = N'is_SubProcedure';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '06f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUspStep_Persistence_src'
  , @level2type = N'COLUMN'
  , @level2name = N'is_inactive';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '05f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUspStep_Persistence_src'
  , @level2type = N'COLUMN'
  , @level2name = N'is_condition';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '04f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUspStep_Persistence_src'
  , @level2type = N'COLUMN'
  , @level2name = N'has_logging';
Go
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo].[Index_ColumList]
* [repo].[RepoObject_gross]
* [repo].[RepoObject_gross2]
* [uspgenerator].[GeneratorUsp]', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Persistence_src';




GO



GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'usp_id', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Persistence_src';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'int', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Persistence_src';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'319D0C2F-0796-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Persistence_src';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:uspgenerator.usp_GeneratorUsp_insert_update_persistence.adoc[]', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Persistence_src';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo.Index_ColumList.adoc[]
* xref:repo.RepoObject_gross.adoc[]
* xref:repo.RepoObject_gross2.adoc[]
* xref:uspgenerator.GeneratorUsp.adoc[]', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Persistence_src';




GO



GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Persistence_src';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Persistence_src';

