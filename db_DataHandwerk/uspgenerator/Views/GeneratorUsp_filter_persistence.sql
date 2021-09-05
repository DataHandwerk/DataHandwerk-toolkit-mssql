
CREATE View uspgenerator.GeneratorUsp_filter_persistence
As
Select
    u.id
  , u.usp_schema
  , u.usp_name
  , u.has_logging
  , u.usp_Description
  , u.usp_fullname
From
    uspgenerator.GeneratorUsp As u
Where
    Left(u.usp_name, 12) = 'usp_PERSIST_'
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = 'df8f291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUsp_filter_persistence';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '87f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUsp_filter_persistence'
  , @level2type = N'COLUMN'
  , @level2name = N'usp_schema';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '88f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUsp_filter_persistence'
  , @level2type = N'COLUMN'
  , @level2name = N'usp_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '8bf17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUsp_filter_persistence'
  , @level2type = N'COLUMN'
  , @level2name = N'usp_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '8af17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUsp_filter_persistence'
  , @level2type = N'COLUMN'
  , @level2name = N'usp_Description';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '86f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUsp_filter_persistence'
  , @level2type = N'COLUMN'
  , @level2name = N'id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '89f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUsp_filter_persistence'
  , @level2type = N'COLUMN'
  , @level2name = N'has_logging';
Go

Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [uspgenerator].[GeneratorUsp].[usp_schema]', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_filter_persistence', @level2type = N'COLUMN', @level2name = N'usp_schema';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [uspgenerator].[GeneratorUsp].[usp_name]', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_filter_persistence', @level2type = N'COLUMN', @level2name = N'usp_name';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [uspgenerator].[GeneratorUsp].[usp_fullname]', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_filter_persistence', @level2type = N'COLUMN', @level2name = N'usp_fullname';


Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'(concat(''['',[usp_schema],''].['',[usp_name],'']''))'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUsp_filter_persistence'
  , @level2type = N'COLUMN'
  , @level2name = N'usp_fullname';
Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [uspgenerator].[GeneratorUsp].[usp_Description]', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_filter_persistence', @level2type = N'COLUMN', @level2name = N'usp_Description';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [uspgenerator].[GeneratorUsp].[id]', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_filter_persistence', @level2type = N'COLUMN', @level2name = N'id';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [uspgenerator].[GeneratorUsp].[has_logging]', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_filter_persistence', @level2type = N'COLUMN', @level2name = N'has_logging';



GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [uspgenerator].[GeneratorUsp]', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_filter_persistence';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:uspgenerator.GeneratorUsp.adoc[]', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_filter_persistence';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_filter_persistence';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_filter_persistence';

