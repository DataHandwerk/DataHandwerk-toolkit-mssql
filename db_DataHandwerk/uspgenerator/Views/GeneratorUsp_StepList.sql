

/*
SQL for the list of all steps
*/
Create View [uspgenerator].GeneratorUsp_StepList
As
Select
    usp_id
  , StepList     = String_Agg ( Concat ( Cast('' As NVarchar(Max)), SqlStep ), Char ( 13 ) + Char ( 10 )) Within Group(Order By
                                                                                                                           RowNumber_PerUsp)
  ----Attention! issue, if the resulting string > 4000, because it is saved in Properties, which have a limit of sql_variant (nvarchar(4000))
  , AdocStepList = String_Agg ( Concat ( Cast('' As NVarchar(Max)), AdocStep ), Char ( 13 ) + Char ( 10 )) Within Group(Order By
                                                                                                                            RowNumber_PerUsp)
From
    [uspgenerator].GeneratorUspStep_Sql As us
Group By
    us.usp_id;
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '4790291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUsp_StepList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '32f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUsp_StepList'
  , @level2type = N'COLUMN'
  , @level2name = N'usp_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '33f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUsp_StepList'
  , @level2type = N'COLUMN'
  , @level2name = N'StepList';
Go

Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '281a8d58-e08f-eb11-84f1-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUsp_StepList'
  , @level2type = N'COLUMN'
  , @level2name = N'AdocStepList';
