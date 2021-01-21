
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
CREATE VIEW [repo].[visjs_EdgeList_object_test01]
as
SELECT
       [referencing_node_id]
     , [referenced_node_id]
     , EdgeListElement = concat('{ from: ' , [referenced_node_id] , ', to:' , [referencing_node_id] , ' },')
FROM
     repo.RepoObject_reference__sql_expression_dependencies
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'fd888a3c-034e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'visjs_EdgeList_object_test01', @level2type = N'COLUMN', @level2name = N'EdgeListElement';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'fe888a3c-034e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'visjs_EdgeList_object_test01', @level2type = N'COLUMN', @level2name = N'referenced_node_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'ff888a3c-034e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'visjs_EdgeList_object_test01', @level2type = N'COLUMN', @level2name = N'referencing_node_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = N'9a888a3c-034e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'visjs_EdgeList_object_test01';

