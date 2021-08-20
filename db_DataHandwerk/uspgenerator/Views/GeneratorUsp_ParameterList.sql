


/*
List of parameters without trailing comma
*/
CREATE View uspgenerator.GeneratorUsp_ParameterList
As
Select
    up.usp_id
  , ParameterList        = String_Agg (
                                          Concat (
                                                     Cast('@' As NVarchar(Max))
                                                   , up.Name
                                                   , ' '
                                                   , up.UserTypeFullname
                                                   , Iif(up.has_DefaultValue = 1
                                                  , Concat ( ' = ', IsNull ( up.DefaultValue, 'NULL' ))
                                                  , Null)
                                                   , Iif(up.is_out = 1, ' OUTPUT', Null)
                                                   , Iif(Not up.Description Is Null, ' /* ' + up.Description + ' */', Null)
                                                 )
                                        , Char ( 13 ) + Char ( 10 ) + ','
                                      ) Within Group(Order By
                                                         up.Number)
  , ParameterListLogging = String_Agg (
                                          Concat (
                                                     Cast(' , @parameter_' As NVarchar(Max))
                                                   , Right(Concat ( '0', up.RowNumber_PerUsp ), 2)
                                                   , Cast(' = @' As NVarchar(Max))
                                                   , up.Name
                                                 )
                                        , Char ( 13 ) + Char ( 10 )
                                      ) Within Group(Order By
                                                         up.Number)
From
(
    Select
        par.usp_id
      , par.Number
      , par.Name
      , par.UserTypeFullname
      , par.is_inactive
      , par.is_out
      , par.has_DefaultValue
      , par.DefaultValue
      , par.Description
      , RowNumber_PerUsp = Row_Number () Over ( Partition By par.usp_id Order By par.Number )
    From
        uspgenerator.GeneratorUspParameter As par
) As up
Where
    up.is_inactive = 0
Group By
    up.usp_id
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = 'e18f291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUsp_ParameterList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '8cf17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUsp_ParameterList'
  , @level2type = N'COLUMN'
  , @level2name = N'usp_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '8ef17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUsp_ParameterList'
  , @level2type = N'COLUMN'
  , @level2name = N'ParameterListLogging';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '8df17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUsp_ParameterList'
  , @level2type = N'COLUMN'
  , @level2name = N'ParameterList';
Go
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [uspgenerator].[GeneratorUspParameter]', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_ParameterList';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'usp_id', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_ParameterList';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'usp_id', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_ParameterList';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'int', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_ParameterList';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'46CF54E5-0696-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_ParameterList';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:uspgenerator.GeneratorUsp_SqlUsp.adoc[]', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_ParameterList';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:uspgenerator.GeneratorUspParameter.adoc[]', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_ParameterList';

