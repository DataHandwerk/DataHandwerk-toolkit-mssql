﻿CREATE View [reference].Reference_UspPersistence
As
Select
    Last_usp_persistence_RepoObject_guid  As referenced_usp_RepoObject_guid
  , First_usp_persistence_RepoObject_guid As referencing_usp_RepoObject_guid
  , Last_usp_persistence_name             As referenced_usp_persistence_name
  , First_usp_persistence_name            As referencing_usp_persistence_name
From
    [reference].Match_RepoObject_referenced_UspPersistence;
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '00bf898f-9381-eb11-84e9-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'Reference_UspPersistence'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_usp_persistence_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'ffbe898f-9381-eb11-84e9-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'Reference_UspPersistence'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_usp_persistence_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'febe898f-9381-eb11-84e9-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'Reference_UspPersistence'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_usp_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'fdbe898f-9381-eb11-84e9-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'Reference_UspPersistence'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_usp_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '9cbe898f-9381-eb11-84e9-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'Reference_UspPersistence';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [reference].[Match_RepoObject_referenced_UspPersistence]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'Reference_UspPersistence';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'referenced_usp_RepoObject_guid,referencing_usp_RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'Reference_UspPersistence';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier,uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'Reference_UspPersistence';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = 'c216469c-119e-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'Reference_UspPersistence';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:reference.Match_RepoObject_referenced_UspPersistence.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'Reference_UspPersistence';

