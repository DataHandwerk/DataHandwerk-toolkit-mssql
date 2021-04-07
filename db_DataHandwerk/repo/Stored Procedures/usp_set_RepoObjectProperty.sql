/*
--example
[repo].[usp_set_RepoObjectProperty]
@RepoObject_fullname2 = 'repo.usp_connect_database'
, @property_name = 'MS_Description'
, @property_value =
'connect repo datatabase to dwh database using synonyms executing

see details in xref:manual:repo.xref:sqldb:repo.usp_connect_database.adoc[]
'

*/
CREATE PROCEDURE [repo].[usp_set_RepoObjectProperty]
 --
 @RepoObject_guid UNIQUEIDENTIFIER = NULL --if @RepoObject_guid is NULL, then @RepoObject_fullname or @RepoObject_fullname2 is used
 , @RepoObject_fullname NVARCHAR(261) = NULL --will be used to find matching @RepoObject_guid, if @RepoObject_guid is NULL; use [schema].[TableOrView]
 , @RepoObject_fullname2 NVARCHAR(257) = NULL --will be used to find matching @RepoObject_guid, if @RepoObject_guid is NULL; use schema.TableOrView
 , @property_name NVARCHAR(128)
 , @property_value SQL_VARIANT
AS
BEGIN
 DECLARE @step_name NVARCHAR(1000) = NULL

 IF @RepoObject_guid IS NULL
  SET @RepoObject_guid = (
    SELECT [RepoObject_guid]
    FROM [repo].[RepoObject]
    WHERE [RepoObject_fullname] = @RepoObject_fullname
    )

 IF @RepoObject_guid IS NULL
  SET @RepoObject_guid = (
    SELECT [RepoObject_guid]
    FROM [repo].[RepoObject]
    WHERE [RepoObject_fullname2] = @RepoObject_fullname2
    )

 --check existence of @RepoObject_guid
 IF NOT EXISTS (
   SELECT 1
   FROM [repo].[RepoObject]
   WHERE [RepoObject_guid] = @RepoObject_guid
   )
 BEGIN
  SET @step_name = CONCAT (
    'RepoObject_guid does not exist;'
    , @RepoObject_guid
    , ';'
    , @RepoObject_fullname
    );

  THROW 51001
   , @step_name
   , 1;
 END

 MERGE [repo].[RepoObjectProperty] T
 USING (
  SELECT @RepoObject_guid
   , @property_name
   , @property_value
  ) AS S(RepoObject_guid, property_name, property_value)
  ON (
    T.RepoObject_guid = S.RepoObject_guid
    AND T.property_name = S.property_name
    )
 WHEN MATCHED
  THEN
   UPDATE
   SET property_value = S.property_value
 WHEN NOT MATCHED
  THEN
   INSERT (
    RepoObject_guid
    , property_name
    , property_value
    )
   VALUES (
    S.RepoObject_guid
    , S.property_name
    , S.property_value
    )
 OUTPUT deleted.*
  , $ACTION
  , inserted.*;
END
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '9edfbe88-ca97-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_set_RepoObjectProperty';

