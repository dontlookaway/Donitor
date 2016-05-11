CREATE TABLE [logs].[PlasmaCollectionLog]
(
[DonorNumber] [bigint] NULL,
[CollectionID] [bigint] NULL,
[ChangeID] [bigint] NOT NULL IDENTITY(1, 1),
[ChangeType] [char] (1) COLLATE Latin1_General_BIN NULL,
[CollectionDate] [datetime2] NULL,
[DonorWeight] [numeric] (10, 5) NULL,
[BodyTemp] [numeric] (10, 5) NULL,
[SystolicBloodPressure] [numeric] (10, 5) NULL,
[DiaSystolicBloodPressure] [numeric] (10, 5) NULL,
[Pulse] [numeric] (10, 5) NULL,
[Hematocrit] [numeric] (10, 5) NULL,
[TotalProtein] [numeric] (10, 5) NULL,
[BleedNumber] [numeric] (10, 5) NULL,
[VolumePlasmaCollected] [numeric] (10, 5) NULL,
[BloodLoss] [numeric] (10, 5) NULL,
[EnteredBy] [varchar] (50) COLLATE Latin1_General_BIN NULL,
[VerifiedBy] [varchar] (50) COLLATE Latin1_General_BIN NULL,
[EnteredDate] [date] NOT NULL CONSTRAINT [DF__PlasmaCol__Enter__18EBB532] DEFAULT (getdate()),
[VerifiedDate] [date] NULL
) ON [PRIMARY]
GO
ALTER TABLE [logs].[PlasmaCollectionLog] ADD CONSTRAINT [PK__PlasmaCo__0E05C5B7C49776B3] PRIMARY KEY CLUSTERED  ([ChangeID]) ON [PRIMARY]
GO
ALTER TABLE [logs].[PlasmaCollectionLog] ADD CONSTRAINT [FK__PlasmaCol__Donor__2180FB33] FOREIGN KEY ([DonorNumber]) REFERENCES [dbo].[Donor] ([DonorNumber])
GO
ALTER TABLE [logs].[PlasmaCollectionLog] ADD CONSTRAINT [FK__PlasmaCol__Donor__2B0A656D] FOREIGN KEY ([DonorNumber]) REFERENCES [dbo].[Donor] ([DonorNumber])
GO
ALTER TABLE [logs].[PlasmaCollectionLog] ADD CONSTRAINT [FK__PlasmaCol__Donor__2645B050] FOREIGN KEY ([DonorNumber]) REFERENCES [dbo].[Donor] ([DonorNumber])
GO
ALTER TABLE [logs].[PlasmaCollectionLog] ADD CONSTRAINT [FK__PlasmaCol__Colle__25518C17] FOREIGN KEY ([CollectionID]) REFERENCES [dbo].[PlasmaCollection] ([CollectionID])
GO
ALTER TABLE [logs].[PlasmaCollectionLog] ADD CONSTRAINT [FK__PlasmaCol__Colle__2A164134] FOREIGN KEY ([CollectionID]) REFERENCES [dbo].[PlasmaCollection] ([CollectionID])
GO
ALTER TABLE [logs].[PlasmaCollectionLog] ADD CONSTRAINT [FK__PlasmaCol__Colle__208CD6FA] FOREIGN KEY ([CollectionID]) REFERENCES [dbo].[PlasmaCollection] ([CollectionID])
GO
ALTER TABLE [logs].[PlasmaCollectionLog] ADD CONSTRAINT [FK__PlasmaCol__Chang__19DFD96B] FOREIGN KEY ([ChangeType]) REFERENCES [lookups].[LogChangeType] ([ChangeType])
GO
ALTER TABLE [logs].[PlasmaCollectionLog] ADD CONSTRAINT [FK__PlasmaCol__Chang__1F98B2C1] FOREIGN KEY ([ChangeType]) REFERENCES [lookups].[LogChangeType] ([ChangeType])
GO
ALTER TABLE [logs].[PlasmaCollectionLog] ADD CONSTRAINT [FK__PlasmaCol__Chang__245D67DE] FOREIGN KEY ([ChangeType]) REFERENCES [lookups].[LogChangeType] ([ChangeType])
GO
ALTER TABLE [logs].[PlasmaCollectionLog] ADD CONSTRAINT [FK__PlasmaCol__Chang__29221CFB] FOREIGN KEY ([ChangeType]) REFERENCES [lookups].[LogChangeType] ([ChangeType])
GO
ALTER TABLE [logs].[PlasmaCollectionLog] ADD CONSTRAINT [FK__PlasmaCol__Verif__236943A5] FOREIGN KEY ([VerifiedBy]) REFERENCES [lookups].[Users] ([UserCode])
GO
ALTER TABLE [logs].[PlasmaCollectionLog] ADD CONSTRAINT [FK__PlasmaCol__Verif__1DB06A4F] FOREIGN KEY ([VerifiedBy]) REFERENCES [lookups].[Users] ([UserCode])
GO
ALTER TABLE [logs].[PlasmaCollectionLog] ADD CONSTRAINT [FK__PlasmaCol__Verif__2CF2ADDF] FOREIGN KEY ([VerifiedBy]) REFERENCES [lookups].[Users] ([UserCode])
GO
ALTER TABLE [logs].[PlasmaCollectionLog] ADD CONSTRAINT [FK__PlasmaCol__Verif__282DF8C2] FOREIGN KEY ([VerifiedBy]) REFERENCES [lookups].[Users] ([UserCode])
GO
ALTER TABLE [logs].[PlasmaCollectionLog] ADD CONSTRAINT [FK__PlasmaCol__Enter__22751F6C] FOREIGN KEY ([EnteredBy]) REFERENCES [lookups].[Users] ([UserCode])
GO
ALTER TABLE [logs].[PlasmaCollectionLog] ADD CONSTRAINT [FK__PlasmaCol__Enter__1CBC4616] FOREIGN KEY ([EnteredBy]) REFERENCES [lookups].[Users] ([UserCode])
GO
ALTER TABLE [logs].[PlasmaCollectionLog] ADD CONSTRAINT [FK__PlasmaCol__Enter__2BFE89A6] FOREIGN KEY ([EnteredBy]) REFERENCES [lookups].[Users] ([UserCode])
GO
ALTER TABLE [logs].[PlasmaCollectionLog] ADD CONSTRAINT [FK__PlasmaCol__Enter__2739D489] FOREIGN KEY ([EnteredBy]) REFERENCES [lookups].[Users] ([UserCode])
GO
