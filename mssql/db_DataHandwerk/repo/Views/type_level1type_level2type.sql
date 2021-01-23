
-- Alter View type__level1type_level2type
-- Alter View type__level1type_level2type
-- Alter View type__level1type_level2type

/*
Mappping from repo_sys.type (used in [type] in system catalog views)
to level1type (used in sp_addextendedproperty, sp_updateextendedproperty) 
*/
CREATE VIEW [repo].[type_level1type_level2type]
--WITH SCHEMABINDING
AS
--
SELECT
       [type]
     , [type_desc]
     , [level1type] = CASE
                          WHEN [type] = 'AF'
                          THEN 'AGGREGATE'
                      --When [type] = 'D '
                      --Then 'DEFAULT'
                          WHEN [type] IN('FN' , 'FS' , 'FT' , 'IF' , 'IS' , 'TF')
                          THEN 'FUNCTION'
                      --WHEN [type] = 'V ' THEN 'LOGICAL FILE NAME'
                          WHEN [type] IN('P ' , 'PC' , 'RF' , 'X ')
                          THEN 'PROCEDURE'
                          WHEN [type] = 'SQ'
                          THEN 'QUEUE'
                          WHEN [type] = 'R '
                          THEN 'RULE'
                          WHEN [type] = 'SN'
                          THEN 'SYNONYM'
                          WHEN [type] = 'U '
                          THEN 'TABLE'
                      --WHEN [type] = 'V ' THEN 'TABLE_TYPE'
                      --WHEN [type] = 'V ' THEN 'TYPE'
                          WHEN [type] = 'V '
                          THEN 'VIEW'
                      --WHEN [type] = 'V ' THEN 'XML SCHEMA COLLECTION'
                      END
     , [level2type] = CASE [type]
                          WHEN 'C'
                          THEN 'CONSTRAINT' --CHECK_CONSTRAINT
                          WHEN 'D'
                          THEN 'CONSTRAINT' --DEFAULT_CONSTRAINT
                          WHEN 'EC'
                          THEN 'CONSTRAINT' --EDGE_CONSTRAINT
                          WHEN 'F'
                          THEN 'CONSTRAINT' --FOREIGN_KEY_CONSTRAINT
                          WHEN 'PK'
                          THEN 'CONSTRAINT' --PRIMARY_KEY_CONSTRAINT
                          WHEN 'UQ'
                          THEN 'CONSTRAINT' --UNIQUE_CONSTRAINT
                      END
FROM
     repo.type
GO