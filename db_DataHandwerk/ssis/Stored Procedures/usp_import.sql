
CREATE Procedure ssis.usp_import
As
Exec ssis.usp_PERSIST_Package_tgt

Exec ssis.usp_PERSIST_PackageConnection_tgt

Exec ssis.usp_PERSIST_PackageFlow_tgt

Exec ssis.usp_PERSIST_PackageParameter_tgt

Exec ssis.usp_PERSIST_PackageTask_Dft_Component_tgt

--Exec ssis.usp_PERSIST_PackageTask_Dft_SrcDest_tgt
Exec ssis.usp_PERSIST_PackageTask_Dft_Component_input_tgt

Exec ssis.usp_PERSIST_PackageTask_Dft_Component_input_externalMetadataColumn_tgt

Exec ssis.usp_PERSIST_PackageTask_Dft_Component_input_inputColumn_tgt

Exec ssis.usp_PERSIST_PackageTask_Dft_Component_output_tgt

Exec ssis.usp_PERSIST_PackageTask_Dft_Component_output_externalMetadataColumn_tgt

Exec ssis.usp_PERSIST_PackageTask_Dft_Component_output_outputColumn_tgt

Exec ssis.usp_PERSIST_PackageTask_Sql_Parameter_tgt

Exec ssis.usp_PERSIST_PackageTask_tgt

Exec ssis.usp_PERSIST_PackageVariable_tgt

Exec ssis.usp_PERSIST_ProjectConnection_tgt
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '929a07f7-c23c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'PROCEDURE', @level1name = N'usp_import';

