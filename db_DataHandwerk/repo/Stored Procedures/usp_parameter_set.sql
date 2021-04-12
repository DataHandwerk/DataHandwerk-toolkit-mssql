Create Procedure repo.usp_parameter_set
(
    @Parameter_name  Varchar(100)
  , @sub_Parameter   NVarchar(128) = ''
  , @Parameter_value Sql_Variant
)
As
--
Update
    p
Set
    Parameter_value = @Parameter_value
From
    repo.Parameter p
Where
    p.Parameter_name    = @Parameter_name
    And p.sub_Parameter = @sub_Parameter;

--IF NOT EXISTS
--(
--    SELECT
--           [col]
--    FROM
--         [repo].[Parameter] AS p
--    WHERE  [p].[Parameter_name] = @Parameter_name
--           AND [p].[sub_Parameter] = @sub_Parameter
--)
Insert Into repo.Parameter
(
    Parameter_name
  , sub_Parameter
  , Parameter_value
)
Select
    @Parameter_name
  , @sub_Parameter
  , @Parameter_value
Where
    Not Exists
(
    Select
        1
    From
        repo.Parameter As p
    Where
        p.Parameter_name    = @Parameter_name
        And p.sub_Parameter = @sub_Parameter
);

Go
Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '9990291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'PROCEDURE'
  , @level1name = N'usp_parameter_set';


Go


