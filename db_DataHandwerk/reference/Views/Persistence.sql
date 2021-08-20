


/*
<<property_start>>MS_Description
* references between persistence tables and therefore between persistence procedures to call them in the right order
* to get only relations between persistence tables (or views) the result set is limited:
+
[source,sql]
------
Where
    ro1.[is_persistence]     = 1
    And ro2.[is_persistence] = 1;
------
<<property_end>>

*/
CREATE View reference.Persistence
As
Select
    Distinct
    referenced_RepoObject_guid                  = ro1.RepoObject_guid
  , referenced_fullname                         = ro1.RepoObject_fullname
  , referenced_schema_name                      = ro1.RepoObject_schema_name
  , referenced_usp_persistence_name             = ro1.usp_persistence_name
  , referenced_usp_persistence_RepoObject_guid  = ro1.usp_persistence_RepoObject_guid
  , referencing_RepoObject_guid                 = ro2.RepoObject_guid
  , referencing_fullname                        = ro2.RepoObject_fullname
  , referencing_schema_name                     = ro2.RepoObject_schema_name
  , referencing_usp_persistence_name            = ro2.usp_persistence_name
  , referencing_usp_persistence_RepoObject_guid = ro2.usp_persistence_RepoObject_guid
From
    reference.RepoObject_ReferenceTree_30_0_T As Q
    Left Join
        repo.RepoObject_gross                 As ro1
            On
            ro1.RepoObject_guid = Q.Referenced_guid

    Left Join
        repo.RepoObject_gross                 As ro2
            On
            ro2.RepoObject_guid = Q.RepoObject_guid
Where
    --Q.[Referenced_type] = 'U'
    --and
    ro1.is_persistence     = 1
    And ro2.is_persistence = 1
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1db3a8a4-a0f6-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'Persistence', @level2type = N'COLUMN', @level2name = N'referencing_usp_persistence_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1cb3a8a4-a0f6-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'Persistence', @level2type = N'COLUMN', @level2name = N'referencing_usp_persistence_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(''usp_PERSIST_''+[RepoObject_name])', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'Persistence', @level2type = N'COLUMN', @level2name = N'referencing_usp_persistence_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1bb3a8a4-a0f6-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'Persistence', @level2type = N'COLUMN', @level2name = N'referencing_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1ab3a8a4-a0f6-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'Persistence', @level2type = N'COLUMN', @level2name = N'referencing_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[RepoObject_schema_name],''].['',[RepoObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'Persistence', @level2type = N'COLUMN', @level2name = N'referencing_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '19b3a8a4-a0f6-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'Persistence', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '18b3a8a4-a0f6-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'Persistence', @level2type = N'COLUMN', @level2name = N'referenced_usp_persistence_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '17b3a8a4-a0f6-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'Persistence', @level2type = N'COLUMN', @level2name = N'referenced_usp_persistence_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(''usp_PERSIST_''+[RepoObject_name])', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'Persistence', @level2type = N'COLUMN', @level2name = N'referenced_usp_persistence_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '16b3a8a4-a0f6-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'Persistence', @level2type = N'COLUMN', @level2name = N'referenced_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '15b3a8a4-a0f6-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'Persistence', @level2type = N'COLUMN', @level2name = N'referenced_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[RepoObject_schema_name],''].['',[RepoObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'Persistence', @level2type = N'COLUMN', @level2name = N'referenced_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '14b3a8a4-a0f6-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'Persistence', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'fea5bb9c-a0f6-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'Persistence';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'
* references between persistence tables and therefore between persistence procedures to call them in the right order
* to get only relations between persistence tables the result set is limited:
+
[source,sql]
------
Where
    ro1.[is_persistence]     = 1
    And ro2.[is_persistence] = 1;
------', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'Persistence';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:workflow.usp_workflow.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'Persistence';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:reference.RepoObject_ReferenceTree_30_0_T.adoc[]
* xref:repo.RepoObject_gross.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'Persistence';

