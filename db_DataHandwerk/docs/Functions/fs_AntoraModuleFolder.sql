
/*
<<property_start>>MS_Description
generate AntoraModuleFolder for Antora export based on cofiguration

use @cultures_name as suffix if @cultures_name <> ''
<<property_end>>
<<property_start>>exampleUsage
Select
    a = docs.fs_AntoraModuleFolder ( Default )
  , b = docs.fs_AntoraModuleFolder ( 'en-US' )
<<property_end>>
*/
CREATE Function docs.fs_AntoraModuleFolder
(
    @cultures_name NVarchar(10) = ''
)
Returns NVarchar(1024)
As
Begin
    Return ( config.fs_get_parameter_value ( 'AntoraComponentFolder', '' ) + '\modules\'
             + config.fs_get_parameter_value ( 'AntoraModule', '' ) + Iif(@cultures_name <> '', '-', '')
             + @cultures_name
           )
End
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '39415ec3-7a22-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'FUNCTION', @level1name = N'fs_AntoraModuleFolder';

