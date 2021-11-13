CREATE View ssis_t.TblProjectConnection_src
As
With
CTE_ConLevel
As
    (
    Select
        con.RowID
      , con.ConnectionPath
      , ConnectionManagerName = cfnodes.x.value (
                                                    'declare namespace p1="www.microsoft.com/SqlServer/Dts";./@p1:ObjectName[1]'
                                                  , 'varchar(max)'
                                                )
      , ConnectionManagerType = cfnodes.x.value (
                                                    'declare namespace p1="www.microsoft.com/SqlServer/Dts";./@p1:CreationName[1]'
                                                  , 'varchar(max)'
                                                )
      --, cfnodes1.y.value('declare namespace p1="www.microsoft.com/SqlServer/Dts";./@p1:ConnectionString[1]', 'varchar(max)') 
      , ConnectionStringQry   = cfnodes.x.query ( '.' ).query ( 'declare namespace p1="www.microsoft.com/SqlServer/Dts";./p1:ConnectionManager/p1:ObjectData/p1:ConnectionManager' )
      , ExpressionQry         = cfnodes.x.query ( '.' ).query ( 'declare namespace p1="www.microsoft.com/SqlServer/Dts";./p1:ConnectionManager/p1:PropertyExpression' )
      , ConnectionManagerID   = cfnodes.x.value (
                                                    'declare namespace p1="www.microsoft.com/SqlServer/Dts";./@p1:DTSID[1]'
                                                  , 'uniqueidentifier'
                                                )
    From
        ssis_t.projectConnection                                                                              As con
        Cross Apply con.ConnectionXML.nodes ( 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";(*)' ) As cfnodes(x)
    )
,
CTE_ConLevelDetail
As
    (
    Select
        pkg.RowID
      , pkg.ConnectionPath
      , pkg.ConnectionManagerName
      , pkg.ConnectionManagerType
      , pkg.ConnectionManagerID
      --,pkg.ConnectionStringQry
      , ConnectionString             =
        (
            Select
                Top 1
                ConnectionString = cfnodes.x.value (
                                                       'declare namespace p1="www.microsoft.com/SqlServer/Dts";@p1:ConnectionString[1]'
                                                     , 'nvarchar(max)'
                                                   )
            From
                pkg.ConnectionStringQry.nodes ( './*' ) As cfnodes(x)
        )
      , ExpressionValue              =
        (
            Select
                Top 1
                ExpressionValue = cfnodes.x.value ( '.', 'nvarchar(max)' )
            From
                pkg.ExpressionQry.nodes ( './*' ) As cfnodes(x)
        )
      , RetainSameConnectionProperty =
        (
            Select
                Top 1
                RetainSameConnectionProperty = cfnodes.x.value (
                                                                   'declare namespace p1="www.microsoft.com/SqlServer/Dts";@p1:Retain[1]'
                                                                 , 'nvarchar(max)'
                                                               )
            From
                pkg.ConnectionStringQry.nodes ( './*' ) As cfnodes(x)
        )
    From
        CTE_ConLevel As pkg
    )
Select
    ConnectionManagerName = con.ConnectionManagerName
  , con.ConnectionManagerID
  , con.ConnectionPath
  , con.ConnectionManagerType
  , con.ConnectionString
  , con.ExpressionValue
  , con.RowID
From
    CTE_ConLevelDetail As con;
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5dddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblProjectConnection_src', @level2type = N'COLUMN', @level2name = N'RowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5cddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblProjectConnection_src', @level2type = N'COLUMN', @level2name = N'ExpressionValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5bddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblProjectConnection_src', @level2type = N'COLUMN', @level2name = N'ConnectionString';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5addc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblProjectConnection_src', @level2type = N'COLUMN', @level2name = N'ConnectionManagerType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '59ddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblProjectConnection_src', @level2type = N'COLUMN', @level2name = N'ConnectionPath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '58ddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblProjectConnection_src', @level2type = N'COLUMN', @level2name = N'ConnectionManagerID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '57ddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblProjectConnection_src', @level2type = N'COLUMN', @level2name = N'ConnectionManagerName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '8a9a07f7-c23c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblProjectConnection_src';

