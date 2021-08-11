

Create View [workflow].[Biml_Connection]
As
Select
    ConnectionName_Biml   = String_Agg (
                                           '<Connection ConnectionName="' + T1.[ConnectionName] + '" />'
                                         , Char ( 13 ) + Char ( 10 )
                                       ) Within Group(Order By
                                                          T1.[ConnectionName])
  , ConnectionString_Biml = String_Agg (
                                           Cast('<Connection Name="' As NVarchar(Max)) + T1.[ConnectionName]
                                           + '" ConnectionString="' + T1.ConnectionString + '" />'
                                         , Char ( 13 ) + Char ( 10 )
                                       ) Within Group(Order By
                                                          T1.[ConnectionName])
From
    [workflow].[Connection] T1
Where
    T1.[is_active] = 1;