CREATE TABLE [lookups].[Gender]
(
[Gender] [char] (1) COLLATE Latin1_General_BIN NOT NULL,
[GenderDesc] [varchar] (50) COLLATE Latin1_General_BIN NULL
) ON [PRIMARY]
GO
ALTER TABLE [lookups].[Gender] ADD CONSTRAINT [PKGender] PRIMARY KEY CLUSTERED  ([Gender]) ON [PRIMARY]
GO
