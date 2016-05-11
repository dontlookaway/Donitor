CREATE TABLE [dbo].[PlasmaCollection]
(
[DonorNumber] [bigint] NOT NULL,
[CollectionID] [bigint] NOT NULL IDENTITY(1, 1),
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
[EnteredBy] [varchar] (50) COLLATE Latin1_General_BIN NOT NULL,
[VerifiedBy] [varchar] (50) COLLATE Latin1_General_BIN NULL,
[EnteredDate] [date] NOT NULL CONSTRAINT [DF__PlasmaCol__Enter__267ABA7A] DEFAULT (getdate()),
[VerifiedDate] [date] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PlasmaCollection] ADD CONSTRAINT [PKCollectionIdDate] PRIMARY KEY CLUSTERED  ([CollectionID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PlasmaCollection_Basic] ON [dbo].[PlasmaCollection] ([DonorNumber], [CollectionID], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PlasmaCollection] ADD CONSTRAINT [FK__PlasmaCol__Donor__239E4DCF] FOREIGN KEY ([DonorNumber]) REFERENCES [dbo].[Donor] ([DonorNumber])
GO
ALTER TABLE [dbo].[PlasmaCollection] ADD CONSTRAINT [FK__PlasmaCol__Verif__25869641] FOREIGN KEY ([VerifiedBy]) REFERENCES [lookups].[Users] ([UserCode])
GO
ALTER TABLE [dbo].[PlasmaCollection] ADD CONSTRAINT [FK__PlasmaCol__Enter__24927208] FOREIGN KEY ([EnteredBy]) REFERENCES [lookups].[Users] ([UserCode])
GO
