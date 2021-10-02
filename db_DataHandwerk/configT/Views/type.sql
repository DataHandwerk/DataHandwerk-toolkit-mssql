


/*
<<property_start>>MS_Description
* based on master.dbo.spt_values, which  is an undocumemted hidden view or table, containing useful entries 
* master.dbo.spt_values content is available as copy in xref:sqldb:configt.spt_values.adoc[]
<<property_end>>
*/
CREATE View [configT].[type]
As
--
Select
    type          = Trim ( T1.type )
  , type_desc     = Trim ( T1.type_desc )
  , is_DocsOutput = Case
                        When T1.type In
                        ( 'U', 'V', 'FN', 'FS', 'FT', 'IF', 'IS', 'P', 'PC', 'SN', 'SO', 'TF', 'TR', 'X' )
                            Then
                            1
                        Else
                            0
                    End
From
(
    Select
        type      = ParseName ( Replace ( name, ':', '.' ), 2 )
      , type_desc = Trim ( ParseName ( Replace ( name, ':', '.' ), 1 ))
    From
        configT.spt_values
    Where
        type       = 'O9T'
        And number = -1
) As T1

Go
Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = 'd98f291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'configT'
  , @level1type = N'VIEW'
  , @level1name = N'type';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '7df17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'configT'
  , @level1type = N'VIEW'
  , @level1name = N'type'
  , @level2type = N'COLUMN'
  , @level2name = N'type_desc';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '7cf17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'configT'
  , @level1type = N'VIEW'
  , @level1name = N'type'
  , @level2type = N'COLUMN'
  , @level2name = N'type';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '2ae90a1e-7495-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'configT'
  , @level1type = N'VIEW'
  , @level1name = N'type'
  , @level2type = N'COLUMN'
  , @level2name = N'is_DocsOutput';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [configT].[spt_values]', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'type';




GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'object_type', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'type';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'type', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'type';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'nvarchar(128)', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'type';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'0E45DFF8-FB95-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'
* based on master.dbo.spt_values, which  is an undocumemted hidden view or table, containing useful entries 
* master.dbo.spt_values content is available as copy in xref:sqldb:configT.spt_values.adoc[]', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'type';




GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:configT.type_level1type_level2type.adoc[]
* xref:docs.AntoraNavListPage_by_type.adoc[]
* xref:docs.AntoraPage_ObjectByType.adoc[]
* xref:docs.usp_AntoraExport_navigation.adoc[]
* xref:repo.RepoObject_gross.adoc[]
* xref:repo.RepoObject_wo_referencing.adoc[]', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'type';




GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:configT.spt_values.adoc[]', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'type';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'type';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'type';

