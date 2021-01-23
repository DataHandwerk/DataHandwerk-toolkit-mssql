
CREATE VIEW [repo].[Index_IndexPattern]
AS
--
Select [index_guid]
     , IndexPatternColumnName     = String_Agg (SysObject_column_name, ';') WITHIN Group(Order By [index_column_id])
     , IndexPatternColumnDatatype = String_Agg ([SysObject_column_user_type_fullname], ';') WITHIN Group(Order By [index_column_id])
From [repo].[IndexColumn_union]
Where Not [index_guid] Is Null
Group By [index_guid]
GO



GO



GO



GO


