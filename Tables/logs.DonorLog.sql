CREATE TABLE [logs].[DonorLog]
(
[DonorNumber] [bigint] NOT NULL,
[ChangeID] [bigint] NOT NULL IDENTITY(1, 1),
[DateOfBirth] [date] NOT NULL,
[Gender] [char] (1) COLLATE Latin1_General_BIN NULL,
[EnteredBy] [varchar] (50) COLLATE Latin1_General_BIN NULL,
[VerifiedBy] [varchar] (50) COLLATE Latin1_General_BIN NULL,
[EnteredDate] [date] NULL,
[VerifiedDate] [date] NULL,
[ChangeType] [char] (1) COLLATE Latin1_General_BIN NULL,
[IsDeleted] [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [logs].[DonorLog] ADD CONSTRAINT [PK__DonorLog__0E05C5B76C73115D] PRIMARY KEY CLUSTERED  ([ChangeID]) ON [PRIMARY]
GO
ALTER TABLE [logs].[DonorLog] ADD CONSTRAINT [FK__DonorLog__DonorN__30C33EC3] FOREIGN KEY ([DonorNumber]) REFERENCES [dbo].[Donor] ([DonorNumber])
GO
ALTER TABLE [logs].[DonorLog] ADD CONSTRAINT [FK__DonorLog__Gender__32AB8735] FOREIGN KEY ([Gender]) REFERENCES [lookups].[Gender] ([Gender])
GO
ALTER TABLE [logs].[DonorLog] ADD CONSTRAINT [FK__DonorLog__Change__2FCF1A8A] FOREIGN KEY ([ChangeType]) REFERENCES [lookups].[LogChangeType] ([ChangeType])
GO
ALTER TABLE [logs].[DonorLog] ADD CONSTRAINT [FK__DonorLog__Verifi__339FAB6E] FOREIGN KEY ([VerifiedBy]) REFERENCES [lookups].[Users] ([UserCode])
GO
ALTER TABLE [logs].[DonorLog] ADD CONSTRAINT [FK__DonorLog__Entere__31B762FC] FOREIGN KEY ([EnteredBy]) REFERENCES [lookups].[Users] ([UserCode])
GO
