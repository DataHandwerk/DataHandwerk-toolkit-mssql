

/*
<<property_start>>Description
This view generates tsql to drop all extended properties

based on https://stackoverflow.com/questions/12368448/drop-all-extended-properties-on-sql-server/17853448[]

orignal description of the script:

This script will generate calls to sp_dropextendedproperty for every extended property that exists in your database.

Actually, a caveat: I don't promise that it will catch each and every extended property that exists, but I'm confident it will catch most of them!

It is based on this: +
http://blog.hongens.nl/2010/02/25/drop-all-extended-properties-in-a-mssql-database/[] +
by Angelo Hongens.

Also had lots of help from this: +
http://www.sqlservercentral.com/articles/Metadata/72609/[] +
by Adam Aspin

Adam actually provides a script at that link to do something very similar +
but when I ran it I got an error:

....
Msg 468, Level 16, State 9, Line 78
Cannot resolve the collation conflict between "Latin1_General_100_CS_AS" and "Latin1_General_CI_AS" in the equal to operation.
....

So I put together this version instead. 

Use at your own risk.

Jamie Thomson
2012-03-25
<<property_end>>
<<property_start>>exampleUsage
--check existing ep
Select
    xp.class
  , xp.class_desc
  , xp.major_id
  , xp.minor_id
  , xp.name
  , xp.value
  , Object_Name ( xp.major_id )
From
    sys.extended_properties As xp

--create tsqp to drop them
Select
    Tsql
From
    repo_sys.drop_all_extendedproperty_sql<<property_end>>

*/
CREATE View [repo_sys].[drop_all_extendedproperty_sql]
As
Select
    Tsql = 'EXEC repo_sys.usp_DropExtendedProperty_in_self
@name = ''' + xp.name + '''
,@level0type = ''schema''
,@level0name = ''' + Object_Schema_Name ( xp.major_id ) + '''
,@level1type = ''table''
,@level1name = ''' + Object_Name ( xp.major_id ) + ''''
From
    sys.extended_properties As xp
    Join
        sys.tables          As t
            On
            xp.major_id = t.object_id
Where
    xp.class_desc   = 'OBJECT_OR_COLUMN'
    And xp.minor_id = 0
Union
--columns
Select
    'EXEC repo_sys.usp_DropExtendedProperty_in_self
@name = ''' + sys.extended_properties.name + '''
,@level0type = ''schema''
,@level0name = ''' + Object_Schema_Name ( extended_properties.major_id ) + '''
,@level1type = ''' + Case so.type
                         When 'u'
                             Then
                             'table'
                         When 'v'
                             Then
                             'view'
                     End + '''
,@level1name = ''' + Object_Name ( extended_properties.major_id ) + '''
,@level2type = ''column''
,@level2name = ''' + columns.name + ''''
From
    sys.extended_properties
    Join
        sys.columns
            On
            columns.object_id     = extended_properties.major_id
            And columns.column_id = extended_properties.minor_id

    Join
        sys.objects As so
            On
            columns.object_id     = so.object_id
Where
    extended_properties.class_desc   = 'OBJECT_OR_COLUMN'
    And extended_properties.minor_id > 0
    And so.type In
        ( 'u', 'v' )
Union
--check constraints
Select
    'EXEC repo_sys.usp_DropExtendedProperty_in_self
@name = ''' + xp.name + '''
,@level0type = ''schema''
,@level0name = ''' + Object_Schema_Name ( xp.major_id ) + '''
,@level1type = ''table''
,@level1name = ''' + Object_Name ( cc.parent_object_id ) + '''
,@level2type = ''constraint''
,@level2name = ''' + cc.name + ''''
From
    sys.extended_properties   As xp
    Join
        sys.check_constraints As cc
            On
            xp.major_id = cc.object_id
Union
--check constraints
Select
    'EXEC repo_sys.usp_DropExtendedProperty_in_self
@name = ''' + xp.name + '''
,@level0type = ''schema''
,@level0name = ''' + Object_Schema_Name ( xp.major_id ) + '''
,@level1type = ''table''
,@level1name = ''' + Object_Name ( cc.parent_object_id ) + '''
,@level2type = ''constraint''
,@level2name = ''' + cc.name + ''''
From
    sys.extended_properties     As xp
    Join
        sys.default_constraints As cc
            On
            xp.major_id = cc.object_id
Union
--views
Select
    'EXEC repo_sys.usp_DropExtendedProperty_in_self
@name = ''' + xp.name + '''
,@level0type = ''schema''
,@level0name = ''' + Object_Schema_Name ( xp.major_id ) + '''
,@level1type = ''view''
,@level1name = ''' + Object_Name ( xp.major_id ) + ''''
From
    sys.extended_properties As xp
    Join
        sys.views           As t
            On
            xp.major_id = t.object_id
Where
    xp.class_desc   = 'OBJECT_OR_COLUMN'
    And xp.minor_id = 0
Union
--sprocs
Select
    'EXEC repo_sys.usp_DropExtendedProperty_in_self
@name = ''' + xp.name + '''
,@level0type = ''schema''
,@level0name = ''' + Object_Schema_Name ( xp.major_id ) + '''
,@level1type = ''procedure''
,@level1name = ''' + Object_Name ( xp.major_id ) + ''''
From
    sys.extended_properties As xp
    Join
        sys.procedures      As t
            On
            xp.major_id = t.object_id
Where
    xp.class_desc   = 'OBJECT_OR_COLUMN'
    And xp.minor_id = 0
Union
--FKs
Select
    'EXEC repo_sys.usp_DropExtendedProperty_in_self
@name = ''' + xp.name + '''
,@level0type = ''schema''
,@level0name = ''' + Object_Schema_Name ( xp.major_id ) + '''
,@level1type = ''table''
,@level1name = ''' + Object_Name ( cc.parent_object_id ) + '''
,@level2type = ''constraint''
,@level2name = ''' + cc.name + ''''
From
    sys.extended_properties As xp
    Join
        sys.foreign_keys    As cc
            On
            xp.major_id = cc.object_id
Union
--PKs
Select
    'EXEC repo_sys.usp_DropExtendedProperty_in_self @level0type = N''SCHEMA'', @level0name = [' + SCH.name
    + '], @level1type = ''TABLE'', @level1name = [' + TBL.name + '] , @level2type = ''CONSTRAINT'', @level2name = ['
    + SKC.name + '] ,@name = ''' + Replace ( Cast(SEP.name As NVarchar(300)), '''', '''''' ) + ''''
From
    sys.tables      As TBL
    Inner Join
        sys.schemas As SCH
            On
            TBL.schema_id = SCH.schema_id

    Inner Join
        sys.extended_properties As SEP
        Inner Join
            sys.key_constraints As SKC
                On
                SEP.major_id = SKC.object_id
            On
            TBL.object_id = SKC.parent_object_id
Where
    SKC.type_desc = N'PRIMARY_KEY_CONSTRAINT'
Union
--Table triggers
Select
    'EXEC repo_sys.usp_DropExtendedProperty_in_self @level0type = N''SCHEMA'', @level0name = [' + SCH.name
    + '], @level1type = ''TABLE'', @level1name = [' + TBL.name + '] , @level2type = ''TRIGGER'', @level2name = ['
    + TRG.name + '] ,@name = ''' + Replace ( Cast(SEP.name As NVarchar(300)), '''', '''''' ) + ''''
From
    sys.tables                  As TBL
    Inner Join
        sys.triggers            As TRG
            On
            TBL.object_id = TRG.parent_id

    Inner Join
        sys.extended_properties As SEP
            On
            TRG.object_id = SEP.major_id

    Inner Join
        sys.schemas             As SCH
            On
            TBL.schema_id = SCH.schema_id
Union
--UDF params
Select
    'EXEC repo_sys.usp_DropExtendedProperty_in_self @level0type = N''SCHEMA'', @level0name = [' + SCH.name
    + '], @level1type = ''FUNCTION'', @level1name = [' + OBJ.name + '] , @level2type = ''PARAMETER'', @level2name = ['
    + PRM.name + '] ,@name = ''' + Replace ( Cast(SEP.name As NVarchar(300)), '''', '''''' ) + ''''
From
    sys.extended_properties As SEP
    Inner Join
        sys.objects         As OBJ
            On
            SEP.major_id     = OBJ.object_id

    Inner Join
        sys.schemas         As SCH
            On
            OBJ.schema_id    = SCH.schema_id

    Inner Join
        sys.parameters      As PRM
            On
            SEP.major_id     = PRM.object_id
            And SEP.minor_id = PRM.parameter_id
Where
    SEP.class_desc = N'PARAMETER'
    And OBJ.type In
        ( 'FN', 'IF', 'TF' )
Union
--sp params
Select
    'EXEC repo_sys.usp_DropExtendedProperty_in_self @level0type = N''SCHEMA'', @level0name = [' + SCH.name
    + '], @level1type = ''PROCEDURE'', @level1name = [' + SPR.name + '] , @level2type = ''PARAMETER'', @level2name = ['
    + PRM.name + '] ,@name = ''' + Replace ( Cast(SEP.name As NVarchar(300)), '''', '''''' ) + ''''
From
    sys.extended_properties As SEP
    Inner Join
        sys.procedures      As SPR
            On
            SEP.major_id     = SPR.object_id

    Inner Join
        sys.schemas         As SCH
            On
            SPR.schema_id    = SCH.schema_id

    Inner Join
        sys.parameters      As PRM
            On
            SEP.major_id     = PRM.object_id
            And SEP.minor_id = PRM.parameter_id
Where
    SEP.class_desc = N'PARAMETER'
Union
--DB
Select
    'EXEC repo_sys.usp_DropExtendedProperty_in_self @name = '''
    + Replace ( Cast(SEP.name As NVarchar(300)), '''', '''''' ) + ''''
From
    sys.extended_properties As SEP
Where
    SEP.class_desc = N'DATABASE'
Union
--schema
Select
    'EXEC repo_sys.usp_DropExtendedProperty_in_self @level0type = N''SCHEMA'', @level0name = [' + SCH.name
    + '] ,@name = ''' + Replace ( Cast(SEP.name As NVarchar(300)), '''', '''''' ) + ''''
From
    sys.extended_properties As SEP
    Inner Join
        sys.schemas         As SCH
            On
            SEP.major_id = SCH.schema_id
Where
    SEP.class_desc = N'SCHEMA'
Union
--DATABASE_FILE
Select
    'EXEC repo_sys.usp_DropExtendedProperty_in_self @level0type = N''FILEGROUP'', @level0name = [' + DSP.name
    + '], @level1type = ''LOGICAL FILE NAME'', @level1name = ' + DBF.name + ' ,@name = '''
    + Replace ( Cast(SEP.name As NVarchar(300)), '''', '''''' ) + ''''
From
    sys.extended_properties As SEP
    Inner Join
        sys.database_files  As DBF
            On
            SEP.major_id      = DBF.file_id

    Inner Join
        sys.data_spaces     As DSP
            On
            DBF.data_space_id = DSP.data_space_id
Where
    SEP.class_desc = N'DATABASE_FILE'
Union
--filegroup
Select
    'EXEC repo_sys.usp_DropExtendedProperty_in_self @level0type = N''FILEGROUP'', @level0name = [' + DSP.name
    + '] ,@name = ''' + Replace ( Cast(SEP.name As NVarchar(300)), '''', '''''' ) + ''''
From
    sys.extended_properties As SEP
    Inner Join
        sys.data_spaces     As DSP
            On
            SEP.major_id = DSP.data_space_id
Where
    DSP.type_desc = 'ROWS_FILEGROUP'
Union
-- INDEX
Select
    'EXEC repo_sys.usp_DropExtendedProperty_in_self
@name = ''' + sys.extended_properties.name + '''
,@level0type = ''schema''
,@level0name = ''' + Object_Schema_Name ( extended_properties.major_id )
    + '''
,@level1type = ''table''
,@level1name = ''' + Object_Name ( extended_properties.major_id ) + '''
,@level2type = ''index''
,@level2name = ''' + indexes.name + ''''
From
    sys.extended_properties
    Join
        sys.indexes
            On
            indexes.object_id    = extended_properties.major_id
            And indexes.index_id = extended_properties.minor_id
Where
    extended_properties.class_desc   = 'INDEX'
    And extended_properties.minor_id > 0
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '853efd10-0222-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'drop_all_extendedproperty_sql';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e1dcf21e-0222-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'drop_all_extendedproperty_sql', @level2type = N'COLUMN', @level2name = N'Tsql';

