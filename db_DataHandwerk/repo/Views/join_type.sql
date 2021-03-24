CREATE VIEW repo.join_type
AS
--
SELECT [join_type_variant] = 'INNER JOIN'
 , [join_type] = 'INNER JOIN'

UNION ALL

SELECT [join_type_variant] = 'LEFT OUTER JOIN'
 , [join_type] = 'LEFT OUTER JOIN'

UNION ALL

SELECT [join_type_variant] = 'LEFT JOIN'
 , [join_type] = 'LEFT OUTER JOIN'

UNION ALL

SELECT [join_type_variant] = 'RIGHT OUTER JOIN'
 , [join_type] = 'RIGHT OUTER JOIN'

UNION ALL

SELECT [join_type_variant] = 'RIGHT JOIN'
 , [join_type] = 'RIGHT OUTER JOIN'

UNION ALL

SELECT [join_type_variant] = 'FULL OUTER JOIN'
 , [join_type] = 'FULL OUTER JOIN'

UNION ALL

SELECT [join_type_variant] = 'CROSS JOIN'
 , [join_type] = 'CROSS JOIN'

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'c190291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'join_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b4f77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'join_type', @level2type = N'COLUMN', @level2name = N'join_type_variant';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b5f77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'join_type', @level2type = N'COLUMN', @level2name = N'join_type';

