CREATE TABLE [lookups].[LogChangeType]
(
[ChangeType] [char] (1) COLLATE Latin1_General_BIN NOT NULL,
[ChangeDesc] [varchar] (150) COLLATE Latin1_General_BIN NULL
) ON [PRIMARY]
GO
ALTER TABLE [lookups].[LogChangeType] ADD CONSTRAINT [PK__LogChang__98147D1ED8131F59] PRIMARY KEY CLUSTERED  ([ChangeType]) ON [PRIMARY]
GO
