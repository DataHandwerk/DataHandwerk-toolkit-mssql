
/*
Because the target table structure was created from 
`Select * into Target from Soure`
we just scan the target table columns to get the column lists
*/
CREATE View configT.SsasDmvTableImport_DmvColumnList
As
Select
    T1.DmvTableName
  , DmvColumnList = String_Agg ( QuoteName ( sc.name ), Char ( 13 ) + Char ( 10 ) + ', ' ) Within Group(Order By
                                                                                                            sc.column_id)
From
    config.SsasDmvTableImport As T1
    Inner Join
        sys.objects           As so
            On
            so.name                          = T1.DmvTableName
            And Schema_Name ( so.schema_id ) = 'ssas'

    Inner Join
        sys.columns           As sc
            On
            sc.object_id                     = so.object_id
Where
    T1.isActive = 1
    --exclude the additional column, not existing in DMV view
    And sc.name <> 'databasename'
    --issues with [RefreshedTime] in $SYSTEM.[TMSCHEMA_COLUMNS]
    --we simply not import it
    --alternatively we should convert:
    --CStr([RefreshedTime]) as [RefreshedTime]
    --but then we need different column list for different usage
    And sc.name <> 'RefreshedTime'
Group By
    T1.DmvTableName
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f0c60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'SsasDmvTableImport_DmvColumnList', @level2type = N'COLUMN', @level2name = N'DmvColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'efc60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'SsasDmvTableImport_DmvColumnList', @level2type = N'COLUMN', @level2name = N'DmvTableName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'd0e6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'SsasDmvTableImport_DmvColumnList';

