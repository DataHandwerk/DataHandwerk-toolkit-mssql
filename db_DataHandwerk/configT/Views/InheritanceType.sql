/*
<<property_start>>MS_Description
<<property_end>>
*/
CREATE View [configT].[InheritanceType]
As
--
Select
    InheritanceType            = 0
  , InheritanceTypeDescription = 'No inheritance from predecessor'
--
Union All
Select
    InheritanceType            = 11
  , InheritanceTypeDescription = 'Inheritance from first (or all) predecessor, if current value is NULL'
Union All
Select
    InheritanceType            = 12
  , InheritanceTypeDescription = 'Inheritance from first (or all) predecessor, if current value is NULL or empty ('''')'
Union All
Select
    InheritanceType            = 13
  , InheritanceTypeDescription = 'Inheritance from first (or all) predecessor, forced, only when source is not empty'
Union All
Select
    InheritanceType            = 14
  , InheritanceTypeDescription = 'Inheritance from first (or all) predecessor, forced without exception (dangerous!)';

--UNION ALL
--SELECT
--       [InheritanceType] = 21
--     , [InheritanceTypeDescription] = 'Inheritance from all predecessors - STRING_AGG(xyz, CHAR(13)+CHAR(10)), if current value is NULL'
--UNION ALL
--SELECT
--       [InheritanceType] = 22
--     , [InheritanceTypeDescription] = 'Inheritance from all predecessors - STRING_AGG(xyz, CHAR(13)+CHAR(10)), if current value is NULL or empty ('''')'
--UNION ALL
--SELECT
--       [InheritanceType] = 23
--     , [InheritanceTypeDescription] = 'Inheritance from all predecessors - STRING_AGG(xyz, CHAR(13)+CHAR(10)), forced, only when source is not empty'
--UNION ALL
--SELECT
--       [InheritanceType] = 24
--     , [InheritanceTypeDescription] = 'Inheritance from all predecessors - STRING_AGG(xyz, CHAR(13)+CHAR(10)), forced without exception (dangerous!)'

----still unclear if and how this could or should be implemented
----additional parameters for CONCAT String required
--UNION ALL
--SELECT
--       [InheritanceType] = 31
--     , [InheritanceTypeDescription] = 'use CONCAT (for example: ''[RepoObject_name],CHAR(13),CHAR(10),EineNochZuDefinierendeFunktion(''MS_Description'')''), Inheritance from first predecessor, if current value is NULL'
--UNION ALL
--SELECT
--       [InheritanceType] = 32
--     , [InheritanceTypeDescription] = 'use CONCAT (for example: ''[RepoObject_name],CHAR(13),CHAR(10),EineNochZuDefinierendeFunktion(''MS_Description'')''), Inheritance from first predecessor, if current value is NULL or empty ('''')'
--UNION ALL
--SELECT
--       [InheritanceType] = 33
--     , [InheritanceTypeDescription] = 'use CONCAT (for example: ''[RepoObject_name],CHAR(13),CHAR(10),EineNochZuDefinierendeFunktion(''MS_Description'')''), Inheritance from first predecessor, force'
Go
Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '5cb33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'configT'
  , @level1type = N'VIEW'
  , @level1name = N'InheritanceType';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a4b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'configT'
  , @level1type = N'VIEW'
  , @level1name = N'InheritanceType'
  , @level2type = N'COLUMN'
  , @level2name = N'InheritanceTypeDescription';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a3b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'configT'
  , @level1type = N'VIEW'
  , @level1name = N'InheritanceType'
  , @level2type = N'COLUMN'
  , @level2name = N'InheritanceType';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'InheritanceType', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'InheritanceType';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'InheritanceType', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'InheritanceType';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'int', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'InheritanceType';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'596C57BA-FB95-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'InheritanceType';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'InheritanceType';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'InheritanceType';

