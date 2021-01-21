
/*
<script type="text/javascript">
    // create an array with nodes
    var nodes = new vis.DataSet([
        {id: 1, label: 'Node 1'},
        {id: 2, label: 'Node 2'},
        {id: 3, label: 'Node 3'},
        {id: 4, label: 'Node 4'},
        {id: 5, label: 'Node 5'}
    ]);

    // create an array with edges
    var edges = new vis.DataSet([
        {from: 1, to: 3},
        {from: 1, to: 2},
        {from: 2, to: 4},
        {from: 2, to: 5}
    ]);

*/
CREATE VIEW [repo].[visjs_nodelist_object_test01]
as
SELECT
       [RepoObject_guid]
     , [SysObject_fullname]
     , [SysObject_type]
     , [node_id]
     , NodeListElement = CONCAT('{id: ' , [node_id] , ', label: ''' , [SysObject_fullname] , '''},')
FROM
     repo.RepoObject
WHERE  [SysObject_type] IN
                           (
                           'U' , 'V' , 'P'
                           )
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f9888a3c-034e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'visjs_nodelist_object_test01', @level2type = N'COLUMN', @level2name = N'NodeListElement';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f8888a3c-034e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'visjs_nodelist_object_test01', @level2type = N'COLUMN', @level2name = N'node_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fc888a3c-034e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'visjs_nodelist_object_test01', @level2type = N'COLUMN', @level2name = N'SysObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fb888a3c-034e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'visjs_nodelist_object_test01', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fa888a3c-034e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'visjs_nodelist_object_test01', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '9b888a3c-034e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'visjs_nodelist_object_test01';

