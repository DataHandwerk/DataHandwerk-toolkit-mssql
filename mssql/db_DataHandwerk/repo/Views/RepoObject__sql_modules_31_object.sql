﻿
CREATE VIEW [repo].[RepoObject__sql_modules_31_object]
AS
--
SELECT
       [RepoObject_guid]
     , MAX([SysObject_fullname]) AS  [SysObject_fullname]
     , MAX([is_1_create]) AS         [is_1_create]
     , MAX([is_2_view]) AS           [is_2_view]
     , MAX([is_3_Identifier]) AS     [is_3_Identifier]
     , MAX([is_4_as]) AS             [is_4_as]
     , MAX([is_5_select]) AS         [is_5_select]
     , MAX([is_6_IdentifierList]) AS [is_6_IdentifierList]
     , MAX([is_7_from]) AS           [is_7_from]
     , MAX([is_7_IdentifierList]) AS [is_7_IdentifierList]
     , MAX([is_8_IdentifierList]) AS [is_8_IdentifierList]
FROM
     repo.RepoObject__sql_modules_21_statement_children_helper
GROUP BY
         [RepoObject_guid]