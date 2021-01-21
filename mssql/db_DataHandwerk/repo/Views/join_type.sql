CREATE   VIEW repo.join_type
AS
--
SELECT
       [join_type_variant] = 'INNER JOIN'
     , [join_type] = 'INNER JOIN'
UNION ALL
SELECT
       [join_type_variant] = 'LEFT OUTER JOIN'
     , [join_type] = 'LEFT OUTER JOIN'
UNION ALL
SELECT
       [join_type_variant] = 'LEFT JOIN'
     , [join_type] = 'LEFT OUTER JOIN'
UNION ALL
SELECT
       [join_type_variant] = 'RIGHT OUTER JOIN'
     , [join_type] = 'RIGHT OUTER JOIN'
UNION ALL
SELECT
       [join_type_variant] = 'RIGHT JOIN'
     , [join_type] = 'RIGHT OUTER JOIN'
UNION ALL
SELECT
       [join_type_variant] = 'FULL OUTER JOIN'
     , [join_type] = 'FULL OUTER JOIN'
UNION ALL
SELECT
       [join_type_variant] = 'CROSS JOIN'
     , [join_type] = 'CROSS JOIN'