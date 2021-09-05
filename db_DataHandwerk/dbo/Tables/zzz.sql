CREATE TABLE [dbo].[zzz] (
    [aaa] INT NULL
);






GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8198f068-ca9d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'zzz', @level2type = N'COLUMN', @level2name = N'aaa';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '8098f068-ca9d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'zzz';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:dbo.581912AA-D2FB-4C62-B32F-60A5380164CE.adoc[]', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'zzz';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'zzz';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'zzz';

