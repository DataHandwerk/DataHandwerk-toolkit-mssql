
CREATE View docs.RepoObject_AntoraXrefCulturesList
As
Select
    rof.RepoObject_guid
  , AntoraXrefCulturesList = String_Agg (   Cast('* ' As NVarchar(Max)) + ax.AntoraXrefComponentModule
                                            --
                                            + ' - ' + rof.cultures_name
                                          , Char ( 13 ) + Char ( 10 )
                                        ) Within Group(Order By
                                                           rof.cultures_name)
  , cultures_count         = Count ( 1 )
From
    docs.RepoObject_OutputFilter_T                                                        As rof
    Cross Apply docs.ftv_RepoObject_AntoraXref ( rof.RepoObject_guid, rof.cultures_name ) As ax
Group By
    rof.RepoObject_guid
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3ae0bca9-ae26-ec11-8529-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_AntoraXrefCulturesList', @level2type = N'COLUMN', @level2name = N'cultures_count';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '39e0bca9-ae26-ec11-8529-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_AntoraXrefCulturesList', @level2type = N'COLUMN', @level2name = N'AntoraXrefCulturesList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '38e0bca9-ae26-ec11-8529-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_AntoraXrefCulturesList', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7cb0089f-ae26-ec11-8529-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_AntoraXrefCulturesList';

