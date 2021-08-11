CREATE TABLE [workflow].[Connection] (
    [ConnectionName]   NVARCHAR (250)  NOT NULL,
    [ConnectionString] NVARCHAR (4000) NULL,
    [is_active]        BIT             CONSTRAINT [DF_Connection_is_active] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_Connection] PRIMARY KEY CLUSTERED ([ConnectionName] ASC)
);

