

/*
<<property_start>>MS_Description
* based on master.dbo.spt_values, which  is an undocumemted hidden view or table, containing useful entries 
* master.dbo.spt_values content is available as copy in xref:sqldb:config.spt_values.adoc[]
<<property_end>>
*/
Create View config.type
As
--
Select
    type          = Trim ( type )
  , type_desc     = Trim ( type_desc )
  , is_DocsOutput = Case
                        When type In
                        ( 'U', 'V', 'FN', 'FS', 'FT', 'IF', 'IS', 'P', 'PC', 'SN', 'SO', 'TF', 'TR', 'X' )
                            Then
                            1
                        Else
                            0
                    End
From
(
    Select
        ParseName ( Replace ( name, ':', '.' ), 2 )         As type
      , Trim ( ParseName ( Replace ( name, ':', '.' ), 1 )) As type_desc
    From
        config.spt_values
    Where
        type       = 'O9T'
        And number = -1
) T1;

Go
Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = 'd98f291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'config'
  , @level1type = N'VIEW'
  , @level1name = N'type';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '7df17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'config'
  , @level1type = N'VIEW'
  , @level1name = N'type'
  , @level2type = N'COLUMN'
  , @level2name = N'type_desc';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '7cf17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'config'
  , @level1type = N'VIEW'
  , @level1name = N'type'
  , @level2type = N'COLUMN'
  , @level2name = N'type';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '2ae90a1e-7495-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'config'
  , @level1type = N'VIEW'
  , @level1name = N'type'
  , @level2type = N'COLUMN'
  , @level2name = N'is_DocsOutput';

