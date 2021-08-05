/*
<<property_start>>MS_Description
* merges default values for parameters from xref:sqldb:config.Parameter_default.adoc[] into xref:sqldb:config.Parameter.adoc[]
<<property_end>>
*/
CREATE Procedure [config].[usp_init_parameter]
As
--
Insert Into [config].Parameter
(
    Parameter_name
  , sub_Parameter
  , Parameter_desciption
  , Parameter_default_value
)
Select
    Parameter_name
  , sub_Parameter
  , Parameter_desciption
  , Parameter_default_value
From
    [configT].Parameter_default As T1
Where
    Not Exists
(
    Select
        1
    From
        [config].Parameter As target
    Where
        target.Parameter_name    = T1.Parameter_name
        And target.sub_Parameter = T1.sub_Parameter
);

Update
    T2
Set
    T2.Parameter_desciption = source.Parameter_desciption
  , T2.Parameter_default_value = source.Parameter_default_value
From
    [config].Parameter               As T2
    Inner Join
        [configT].Parameter_default As source
            On
            source.Parameter_name    = T2.Parameter_name
            And source.sub_Parameter = T2.sub_Parameter
Where
    T2.Parameter_desciption       <> source.Parameter_desciption
    Or
    (
        T2.Parameter_desciption Is Null
        And Not source.Parameter_desciption Is Null
    )
    Or
    (
        Not T2.Parameter_desciption Is Null
        And source.Parameter_desciption Is Null
    )
    Or T2.Parameter_default_value <> source.Parameter_default_value
    Or
    (
        T2.Parameter_default_value Is Null
        And Not source.Parameter_default_value Is Null
    )
    Or
    (
        Not T2.Parameter_default_value Is Null
        And source.Parameter_default_value Is Null
    );

Go
Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '8d90291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'config'
  , @level1type = N'PROCEDURE'
  , @level1name = N'usp_init_parameter';


Go
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [config].[Parameter]
* [config].[Parameter_default]', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'PROCEDURE', @level1name = N'usp_init_parameter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'
* merges default values for parameters from xref:sqldb:config.Parameter_default.adoc[] into xref:sqldb:config.Parameter.adoc[]', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'PROCEDURE', @level1name = N'usp_init_parameter';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:config.usp_connect_database.adoc[]', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'PROCEDURE', @level1name = N'usp_init_parameter';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:config.Parameter.adoc[]
* xref:configT.Parameter_default.adoc[]', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'PROCEDURE', @level1name = N'usp_init_parameter';

