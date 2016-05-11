CREATE TABLE [dbo].[DonorLog]
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
ALTER TABLE [dbo].[DonorLog] ADD CONSTRAINT [PK__DonorLog__0E05C5B782C62857] PRIMARY KEY CLUSTERED  ([ChangeID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DonorLog] ADD CONSTRAINT [FK__DonorLog__DonorN__628FA481] FOREIGN KEY ([DonorNumber]) REFERENCES [dbo].[Donor] ([DonorNumber])
GO
ALTER TABLE [dbo].[DonorLog] ADD CONSTRAINT [FK__DonorLog__Gender__6383C8BA] FOREIGN KEY ([Gender]) REFERENCES [lookups].[Gender] ([Gender])
GO
ALTER TABLE [dbo].[DonorLog] ADD CONSTRAINT [FK__DonorLog__Change__66603565] FOREIGN KEY ([ChangeType]) REFERENCES [lookups].[LogChangeType] ([ChangeType])
GO
ALTER TABLE [dbo].[DonorLog] ADD CONSTRAINT [FK__DonorLog__Verifi__656C112C] FOREIGN KEY ([VerifiedBy]) REFERENCES [lookups].[Users] ([UserCode])
GO
ALTER TABLE [dbo].[DonorLog] ADD CONSTRAINT [FK__DonorLog__Entere__6477ECF3] FOREIGN KEY ([EnteredBy]) REFERENCES [lookups].[Users] ([UserCode])
GO
