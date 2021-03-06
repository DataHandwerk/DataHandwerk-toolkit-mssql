﻿Create View docs.AntoraIndexSemanticgroup
As
Select
    IndexSemanticGroup
  , AntoraIndexSemanticgroup = Char ( 13 ) + Char ( 10 ) + '== ' + IsNull ( IndexSemanticGroup, '(no group)' )
                               + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                               --
                               + String_Agg ( AntoraIndexSemanticgroupPatterndatatype, Char ( 13 ) + Char ( 10 )) Within Group(Order By
                                                                                                                                   IndexPatternColumnDatatype)
  , fixvalue                 = 1
From
    docs.AntoraIndexSemanticgroupPatterndatatype
Group By
    IndexSemanticGroup;
Go
Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '891293b9-de96-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'AntoraIndexSemanticgroup';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '931293b9-de96-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'AntoraIndexSemanticgroup'
  , @level2type = N'COLUMN'
  , @level2name = N'IndexSemanticGroup';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '951293b9-de96-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'AntoraIndexSemanticgroup'
  , @level2type = N'COLUMN'
  , @level2name = N'fixvalue';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '941293b9-de96-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'AntoraIndexSemanticgroup'
  , @level2type = N'COLUMN'
  , @level2name = N'AntoraIndexSemanticgroup';

