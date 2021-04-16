CREATE TABLE [docs].[RepoObject_Plantuml_T] (
    [RepoObject_guid]               UNIQUEIDENTIFIER NOT NULL,
    [ColRefList]                    NVARCHAR (MAX)   NULL,
    [ObjectRefList]                 NVARCHAR (MAX)   NULL,
    [ObjectRefList_0_30]            NVARCHAR (MAX)   NULL,
    [ObjectRefList_30_0]            NVARCHAR (MAX)   NULL,
    [PlantumlEntity_0_30_ObjectRef] NVARCHAR (MAX)   NOT NULL,
    [PlantumlEntity_1_1_ColRef]     NVARCHAR (MAX)   NOT NULL,
    [PlantumlEntity_1_1_FkRef]      NVARCHAR (MAX)   NOT NULL,
    [PlantumlEntity_1_1_ObjectRef]  NVARCHAR (MAX)   NOT NULL,
    [PlantumlEntity_30_0_ObjectRef] NVARCHAR (MAX)   NOT NULL,
    [PumlEntityList]                NVARCHAR (MAX)   NULL,
    [PumlEntityList_0_30]           NVARCHAR (MAX)   NULL,
    [PumlEntityList_30_0]           NVARCHAR (MAX)   NULL,
    [RepoObject_fullname2]          NVARCHAR (257)   NOT NULL
);








GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a76b2118-b19a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a66b2118-b19a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'COLUMN', @level2name = N'PumlEntityList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a56b2118-b19a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'COLUMN', @level2name = N'PlantumlEntity_1_1_ObjectRef';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a46b2118-b19a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'COLUMN', @level2name = N'PlantumlEntity_1_1_FkRef';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a36b2118-b19a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'COLUMN', @level2name = N'PlantumlEntity_1_1_ColRef';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a26b2118-b19a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'COLUMN', @level2name = N'ObjectRefList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a16b2118-b19a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'COLUMN', @level2name = N'ColRefList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a06b2118-b19a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '9e6b2118-b19a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '148e62ad-4a9d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'COLUMN', @level2name = N'PumlEntityList_30_0';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '118e62ad-4a9d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'COLUMN', @level2name = N'PumlEntityList_0_30';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '168e62ad-4a9d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'COLUMN', @level2name = N'PlantumlEntity_30_0_ObjectRef';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '198e62ad-4a9d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'COLUMN', @level2name = N'PlantumlEntity_0_30_ObjectRef';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ee26ab1d-619d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'COLUMN', @level2name = N'ObjectRefList_30_0';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ec26ab1d-619d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_Plantuml_T', @level2type = N'COLUMN', @level2name = N'ObjectRefList_0_30';

