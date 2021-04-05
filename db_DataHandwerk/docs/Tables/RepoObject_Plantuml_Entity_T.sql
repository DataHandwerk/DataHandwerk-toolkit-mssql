CREATE TABLE [docs].[RepoObject_Plantuml_Entity_T] (
    [RepoObject_guid]     UNIQUEIDENTIFIER NOT NULL,
    [RepoObject_Plantuml] NVARCHAR (MAX)   NOT NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2de63abf-9395-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T', @level2type = N'COLUMN', @level2name = N'RepoObject_Plantuml';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2ce63abf-9395-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '29e63abf-9395-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_Entity_T';

