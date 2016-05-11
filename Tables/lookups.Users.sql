CREATE TABLE [lookups].[Users]
(
[UserCode] [varchar] (50) COLLATE Latin1_General_BIN NOT NULL,
[UserName] [varchar] (150) COLLATE Latin1_General_BIN NULL
) ON [PRIMARY]
GO
ALTER TABLE [lookups].[Users] ADD CONSTRAINT [PKUserCode] PRIMARY KEY CLUSTERED  ([UserCode]) ON [PRIMARY]
GO
