﻿CREATE   VIEW [config].[InheritanceType]
AS
--
SELECT
       [InheritanceType] = 0
     , [InheritanceTypeDescription] = 'No inheritance from predecessor'
--
UNION ALL
SELECT
       [InheritanceType] = 11
     , [InheritanceTypeDescription] = 'Inheritance from first (or all) predecessor, if current value is NULL'
UNION ALL
SELECT
       [InheritanceType] = 12
     , [InheritanceTypeDescription] = 'Inheritance from first (or all) predecessor, if current value is NULL or empty ('''')'
UNION ALL
SELECT
       [InheritanceType] = 13
     , [InheritanceTypeDescription] = 'Inheritance from first (or all) predecessor, forced, only when source is not empty'
UNION ALL
SELECT
       [InheritanceType] = 14
     , [InheritanceTypeDescription] = 'Inheritance from first (or all) predecessor, forced without exception (dangerous!)'
----
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
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '5cb33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'VIEW', @level1name = N'InheritanceType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a4b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'VIEW', @level1name = N'InheritanceType', @level2type = N'COLUMN', @level2name = N'InheritanceTypeDescription';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a3b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'VIEW', @level1name = N'InheritanceType', @level2type = N'COLUMN', @level2name = N'InheritanceType';
