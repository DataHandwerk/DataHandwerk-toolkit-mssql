﻿/*
Mappping from repo_sys.type (used in [type] in system catalog views)
to level1type (used in sp_addextendedproperty, sp_updateextendedproperty) 
*/
Create View config.type_level1type_level2type
--WITH SCHEMABINDING
As
--
Select
    type
  , type_desc
  , level1type = Case
                     When type = 'AF'
                         Then
                         'AGGREGATE'
                     --When [type] = 'D '
                     --Then 'DEFAULT'
                     When type In
                     ( 'FN', 'FS', 'FT', 'IF', 'IS', 'TF' )
                         Then
                         'FUNCTION'
                     --WHEN [type] = 'V ' THEN 'LOGICAL FILE NAME'
                     When type In
                     ( 'P ', 'PC', 'RF', 'X ' )
                         Then
                         'PROCEDURE'
                     When type = 'SQ'
                         Then
                         'QUEUE'
                     When type = 'R '
                         Then
                         'RULE'
                     When type = 'SN'
                         Then
                         'SYNONYM'
                     When type = 'U '
                         Then
                         'TABLE'
                     --WHEN [type] = 'V ' THEN 'TABLE_TYPE'
                     --WHEN [type] = 'V ' THEN 'TYPE'
                     When type = 'V '
                         Then
                         'VIEW'
                     --WHEN [type] = 'V ' THEN 'XML SCHEMA COLLECTION'
                 End
  , level2type = Case type
                     When 'C'
                         Then
                         'CONSTRAINT' --CHECK_CONSTRAINT
                     When 'D'
                         Then
                         'CONSTRAINT' --DEFAULT_CONSTRAINT
                     When 'EC'
                         Then
                         'CONSTRAINT' --EDGE_CONSTRAINT
                     When 'F'
                         Then
                         'CONSTRAINT' --FOREIGN_KEY_CONSTRAINT
                     When 'PK'
                         Then
                         'CONSTRAINT' --PRIMARY_KEY_CONSTRAINT
                     When 'UQ'
                         Then
                         'CONSTRAINT' --UNIQUE_CONSTRAINT
                 End
From
    config.type;

Go
Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = 'db8f291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'config'
  , @level1type = N'VIEW'
  , @level1name = N'type_level1type_level2type';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '7ff17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'config'
  , @level1type = N'VIEW'
  , @level1name = N'type_level1type_level2type'
  , @level2type = N'COLUMN'
  , @level2name = N'type_desc';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '7ef17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'config'
  , @level1type = N'VIEW'
  , @level1name = N'type_level1type_level2type'
  , @level2type = N'COLUMN'
  , @level2name = N'type';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '81f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'config'
  , @level1type = N'VIEW'
  , @level1name = N'type_level1type_level2type'
  , @level2type = N'COLUMN'
  , @level2name = N'level2type';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '80f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'config'
  , @level1type = N'VIEW'
  , @level1name = N'type_level1type_level2type'
  , @level2type = N'COLUMN'
  , @level2name = N'level1type';


Go


