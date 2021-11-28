
CREATE Function repo.fs_Measure_fullname2
(
    @Measure_guid UniqueIdentifier
)
Returns NVarchar(257)
As
Begin
    Return
    (
        Select
            Measure_fullname2
        From
            ssas.model_json_312_tables_measures_T
        Where
            Measure_guid = @Measure_guid
    );
End;
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'f31ea651-464d-ec11-8531-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'FUNCTION', @level1name = N'fs_Measure_fullname2';

