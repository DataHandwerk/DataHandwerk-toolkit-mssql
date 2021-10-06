
/*
<<property_start>>Description
generate Antora `xref:`

@cultures_name is only used for ssas tabular models, for example 'de-DE', 'en-US'
<<property_end>>

<<property_start>>exampleUsage
Select
    ro.RepoObject_guid
  , ax.cultures_name
  , ax.AntoraXrefComponentModule
  , ax.AntoraXrefModule
From
    repo.RepoObject                                                            As ro
    Cross Apply docs.ftv_RepoObject_AntoraXref ( ro.RepoObject_guid, 'de-DE' ) As ax
Order By
    ax.AntoraXrefComponentModule

Select
    rof.RepoObject_guid
  , AntoraXrefCulturesList = String_Agg (
                                            Cast('* ' As NVarchar(Max)) + ax.AntoraXrefComponentModule
                                          , Char ( 13 ) + Char ( 10 )
                                        ) Within Group(Order By
                                                           rof.cultures_name)
  , cultures_count         = Count ( 1 )
From
    docs.RepoObject_OutputFilter_T                                                        As rof
    Cross Apply docs.ftv_RepoObject_AntoraXref ( rof.RepoObject_guid, rof.cultures_name ) As ax
Group By
    rof.RepoObject_guid
<<property_end>>

check:

SELECT * from [docs].[ftv_RepoObject_AntoraXref]('69CE8EB8-5F62-EB11-84DC-A81E8446D5B0', '')

SELECT * from [docs].[ftv_RepoObject_AntoraXref]('636A4E8B-B80B-EC11-8516-A81E8446D5B0', 'de-DE')

*/
Create   Function docs.ftv_RepoObject_AntoraXref
(
    @RepoObject_guid UniqueIdentifier
  , @cultures_name   NVarchar(10) = ''
)
Returns Table
As
Return
(
    Select
        RepoObject_guid           = @RepoObject_guid
      , cultures_name             = @cultures_name
      , AntoraXrefComponentModule = 'xref:'
                                    --
                                    + config.fs_get_parameter_value ( 'AntoraComponent', '' ) + ':'
                                    --
                                    + config.fs_get_parameter_value ( 'AntoraModule', '' )
                                    + Iif(@cultures_name <> '', '-', '') + @cultures_name + ':'
                                    + docs.fs_cleanStringForFilename ( ro.RepoObject_fullname2 ) + '.adoc[]'
      , AntoraXrefModule          = 'xref:'
                                    --
                                    + config.fs_get_parameter_value ( 'AntoraModule', '' ) + Iif(@cultures_name <> '', '-', '')
                                    + @cultures_name + ':' + docs.fs_cleanStringForFilename ( ro.RepoObject_fullname2 )
                                    + '.adoc[]'
    From
        repo.RepoObject As ro
    Where
        ro.RepoObject_guid = @RepoObject_guid
)
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7bb0089f-ae26-ec11-8529-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'FUNCTION', @level1name = N'ftv_RepoObject_AntoraXref';

