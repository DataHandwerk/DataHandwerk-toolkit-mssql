CREATE SYNONYM [sys_dwh].[dm_exec_describe_first_result_set] FOR [sys].[dm_exec_describe_first_result_set];






GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'sys_dwh', @level1type = N'SYNONYM', @level1name = N'dm_exec_describe_first_result_set';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'sys_dwh', @level1type = N'SYNONYM', @level1name = N'dm_exec_describe_first_result_set';

