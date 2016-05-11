CREATE TABLE [lookups].[DAE]
(
[DAECode] [int] NOT NULL,
[DAEDescription] [varchar] (250) COLLATE Latin1_General_BIN NULL
) ON [PRIMARY]
GO
ALTER TABLE [lookups].[DAE] ADD CONSTRAINT [PkDAECode] PRIMARY KEY CLUSTERED  ([DAECode]) ON [PRIMARY]
GO
