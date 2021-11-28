﻿
/*
<<property_start>>Description
<<property_end>>
*/

CREATE View docs.IndexSemanticgroup
As
Select
    IndexSemanticGroup
  , cultures_name
  , AntoraIndexSemanticgroup = Char ( 13 ) + Char ( 10 )
                               --
                               + '[#' + docs.fs_cleanStringForAnchorId ( IsNull ( IndexSemanticGroup, '(no group)' ))
                               + ']' + Char ( 13 ) + Char ( 10 )
                               --
                               + '== ' + IsNull ( IndexSemanticGroup, '(no group)' ) + Char ( 13 ) + Char ( 10 )
                               + Char ( 13 ) + Char ( 10 )
                               --
                               + String_Agg ( AntoraIndexSemanticgroupPatterndatatype, Char ( 13 ) + Char ( 10 )) Within Group(Order By
                                                                                                                                   IndexPatternColumnDatatype)
From
    docs.IndexSemanticgroupPatterndatatype
Group By
    IndexSemanticGroup
  , cultures_name
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '941293b9-de96-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'IndexSemanticgroup', @level2type = N'COLUMN', @level2name = N'AntoraIndexSemanticgroup';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '08d67baa-5925-ec11-8527-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'IndexSemanticgroup', @level2type = N'COLUMN', @level2name = N'cultures_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '931293b9-de96-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'IndexSemanticgroup', @level2type = N'COLUMN', @level2name = N'IndexSemanticGroup';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[AntoraIndexSemanticgroupPatterndatatype].[IndexSemanticGroup]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'IndexSemanticgroup', @level2type = N'COLUMN', @level2name = N'IndexSemanticGroup';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '891293b9-de96-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'IndexSemanticgroup';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [docs].[AntoraIndexSemanticgroupPatterndatatype]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'IndexSemanticgroup';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'IndexSemanticgroup';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'IndexSemanticgroup';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.AntoraPage_IndexSemanticGroup.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'IndexSemanticgroup';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:docs.AntoraIndexSemanticgroupPatterndatatype.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'IndexSemanticgroup';
