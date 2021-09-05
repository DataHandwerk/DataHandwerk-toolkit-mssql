
/*
--hier stimmt irgendetwas nicht, es dauert sehr lange und es kommt ein Fehler mit einer Typ-Konvertierung

--based on [repo].[RepoObjectColumn_ReferenceTree]
--return referenced and referencing RepoObject
--Default:
--@Referenced_Depth = 1
--@Referencing_Depth

DECLARE @RepoObject_guid uniqueidentifier

SET @RepoObject_guid = (SELECT RepoObject_guid from [repo].[RepoObject] where RepoObject_fullname = '[repo].[RepoObject_gross]')

SELECT *
FROM [reference].[ftv_RepoObject_ColumReferenceRepoObject](@RepoObject_guid, DEFAULT, DEFAULT)

SELECT *
FROM [reference].[ftv_RepoObject_ColumReferenceRepoObject](@RepoObject_guid, 1, 1)

*/
CREATE Function reference.ftv_RepoObject_ColumReferenceRepoObject
(
    @RepoObject_guid   UniqueIdentifier
  , @Referenced_Depth  Int = 1
  , @Referencing_Depth Int = 1
)
Returns Table
As
Return
(
    With
    ro
    As
        (
        --all RepoObject which are [Referenced_RepoObject_guid] or [Referencing_RepoObject_guid]
        Select
            Distinct
            RepoObject_fullname       = Referenced_fullname
          , RepoObject_guid           = Referenced_RepoObject_guid
          , RepoObject_type           = Referenced_type
          , DbmlRelation              = Null
          , Parameter_RepoObject_guid = @RepoObject_guid
        From
            reference.RepoObjectColumn_ReferenceTree
        Where
            Referenced_RepoObject_guid = @RepoObject_guid
        Union
        Select
            Distinct
            Referencing_fullname
          , Referencing_RepoObject_guid
          , Referencing_type
          , DbmlRelation               = Null
          , @RepoObject_guid
        From
            reference.RepoObjectColumn_ReferenceTree
        Where
            Referencing_RepoObject_guid = @RepoObject_guid
        Union

        --add all referenced
        Select
            Distinct
            rt.Referenced_fullname
          , rt.Referenced_RepoObject_guid
          , rt.Referenced_type
          , rs.DbmlRelation
          , @RepoObject_guid
        From
            reference.RepoObjectColumn_ReferenceTree      As rt
            Left Join
                reference.RepoObjectColumn_RelationScript As rs
                    On
                    rs.referenced_RepoObject_guid      = rt.Referenced_RepoObject_guid
                    And rs.referencing_RepoObject_guid = @RepoObject_guid
        Where
            rt.Referencing_RepoObject_guid = @RepoObject_guid
            And rt.Referenced_Depth        <= @Referenced_Depth
            And rt.Referencing_Depth       = 0
        Union

        --add all referenced
        Select
            Distinct
            rt.Referencing_fullname
          , rt.Referencing_RepoObject_guid
          , rt.Referencing_type
          , rs.DbmlRelation
          , @RepoObject_guid
        From
            reference.RepoObjectColumn_ReferenceTree      As rt
            Left Join
                reference.RepoObjectColumn_RelationScript As rs
                    On
                    rs.referenced_RepoObject_guid      = @RepoObject_guid
                    And rs.referencing_RepoObject_guid = rt.Referencing_RepoObject_guid
        Where
            rt.Referenced_RepoObject_guid = @RepoObject_guid
            And rt.Referenced_Depth       = 0
            And rt.Referencing_Depth      <= @Referencing_Depth
        )
    --
    Select
        ro.RepoObject_fullname
      , ro.RepoObject_guid
      , ro.RepoObject_type
      , Dbml = dbml.DbmlTable
      , ro.Parameter_RepoObject_guid
    From
        ro
        Left Join
            repo.RepoObject_SqlCreateTable As dbml
                On
                dbml.RepoObject_guid = ro.RepoObject_guid
    Union
    Select
        Null
      , ro.Parameter_RepoObject_guid
      , Null
      , ro.DbmlRelation
      , ro.Parameter_RepoObject_guid
    From
        ro
    Where
        Not ro.DbmlRelation Is Null
--
);
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '9bbe898f-9381-eb11-84e9-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'FUNCTION'
  , @level1name = N'ftv_RepoObject_ColumReferenceRepoObject';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [reference].[RepoObjectColumn_ReferenceTree]
* [reference].[RepoObjectColumn_RelationScript]
* [repo].[RepoObject_SqlCreateTable]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'FUNCTION', @level1name = N'ftv_RepoObject_ColumReferenceRepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:reference.RepoObjectColumn_ReferenceTree.adoc[]
* xref:reference.RepoObjectColumn_RelationScript.adoc[]
* xref:repo.RepoObject_SqlCreateTable.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'FUNCTION', @level1name = N'ftv_RepoObject_ColumReferenceRepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'FUNCTION', @level1name = N'ftv_RepoObject_ColumReferenceRepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'FUNCTION', @level1name = N'ftv_RepoObject_ColumReferenceRepoObject';

