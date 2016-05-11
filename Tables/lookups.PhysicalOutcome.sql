CREATE TABLE [lookups].[PhysicalOutcome]
(
[Outcome] [char] (1) COLLATE Latin1_General_BIN NOT NULL,
[OutcomeDesc] [varchar] (150) COLLATE Latin1_General_BIN NULL
) ON [PRIMARY]
GO
ALTER TABLE [lookups].[PhysicalOutcome] ADD CONSTRAINT [PKOutcome] PRIMARY KEY CLUSTERED  ([Outcome]) ON [PRIMARY]
GO
