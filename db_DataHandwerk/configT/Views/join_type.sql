
/*
<<property_start>>Description
<<property_end>>
*/
CREATE View [configT].[join_type]
As
--
Select
    join_type_variant = 'INNER JOIN'
  , join_type         = 'INNER JOIN'
Union All
Select
    join_type_variant = 'LEFT OUTER JOIN'
  , join_type         = 'LEFT OUTER JOIN'
Union All
Select
    join_type_variant = 'LEFT JOIN'
  , join_type         = 'LEFT OUTER JOIN'
Union All
Select
    join_type_variant = 'RIGHT OUTER JOIN'
  , join_type         = 'RIGHT OUTER JOIN'
Union All
Select
    join_type_variant = 'RIGHT JOIN'
  , join_type         = 'RIGHT OUTER JOIN'
Union All
Select
    join_type_variant = 'FULL OUTER JOIN'
  , join_type         = 'FULL OUTER JOIN'
Union All
Select
    join_type_variant = 'CROSS JOIN'
  , join_type         = 'CROSS JOIN'

Go
Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = 'c190291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'configT'
  , @level1type = N'VIEW'
  , @level1name = N'join_type';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'b4f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'configT'
  , @level1type = N'VIEW'
  , @level1name = N'join_type'
  , @level2type = N'COLUMN'
  , @level2name = N'join_type_variant';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'b5f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'configT'
  , @level1type = N'VIEW'
  , @level1name = N'join_type'
  , @level2type = N'COLUMN'
  , @level2name = N'join_type';


GO



GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'join_type', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'join_type';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'varchar(16)', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'join_type';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'0AA50ECF-FB95-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'join_type';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:sqlparse.RepoObject_SqlModules_41_from.adoc[]', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'join_type';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'join_type';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'join_type';

