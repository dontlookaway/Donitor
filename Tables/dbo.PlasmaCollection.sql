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
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE Trigger [dbo].[PCDelete] On [dbo].[PlasmaCollection]
    After Delete
As
Insert [logs].[PlasmaCollectionLog]
        ( [DonorNumber]
        , [CollectionID]
        , [ChangeType]
        , [CollectionDate]
        , [DonorWeight]
        , [BodyTemp]
        , [SystolicBloodPressure]
        , [DiaSystolicBloodPressure]
        , [Pulse]
        , [Hematocrit]
        , [TotalProtein]
        , [BleedNumber]
        , [VolumePlasmaCollected]
        , [BloodLoss]
        , [EnteredBy]
        , [VerifiedBy]
        , [EnteredDate]
        , [VerifiedDate]
        )
SELECT [D].[DonorNumber]
     , [D].[CollectionID]
     , 'D'
	 , [D].[CollectionDate]
	 , [D].[DonorWeight]
     , [D].[BodyTemp]
     , [D].[SystolicBloodPressure]
     , [D].[DiaSystolicBloodPressure]
     , [D].[Pulse]
     , [D].[Hematocrit]
     , [D].[TotalProtein]
     , [D].[BleedNumber]
     , [D].[VolumePlasmaCollected]
     , [D].[BloodLoss]
     , [D].[EnteredBy]
     , [D].[VerifiedBy]
     , [D].[EnteredDate]
     , [D].[VerifiedDate] From [Deleted] As [D]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE Trigger [dbo].[PCInsert] On [dbo].[PlasmaCollection]
    After Insert
As
Insert [logs].[PlasmaCollectionLog]
        ( [DonorNumber]
        , [CollectionID]
        , [ChangeType]
        , [CollectionDate]
        , [DonorWeight]
        , [BodyTemp]
        , [SystolicBloodPressure]
        , [DiaSystolicBloodPressure]
        , [Pulse]
        , [Hematocrit]
        , [TotalProtein]
        , [BleedNumber]
        , [VolumePlasmaCollected]
        , [BloodLoss]
        , [EnteredBy]
        , [VerifiedBy]
        , [EnteredDate]
        , [VerifiedDate]
        )
SELECT [I].[DonorNumber]
     , [I].[CollectionID]
     , 'I'
	 , [I].[CollectionDate]
	 , [I].[DonorWeight]
     , [I].[BodyTemp]
     , [I].[SystolicBloodPressure]
     , [I].[DiaSystolicBloodPressure]
     , [I].[Pulse]
     , [I].[Hematocrit]
     , [I].[TotalProtein]
     , [I].[BleedNumber]
     , [I].[VolumePlasmaCollected]
     , [I].[BloodLoss]
     , [I].[EnteredBy]
     , [I].[VerifiedBy]
     , [I].[EnteredDate]
     , [I].[VerifiedDate] From [Inserted] As [I]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE Trigger [dbo].[PCUpdate] On [dbo].[PlasmaCollection]
    After Update
As
Insert [logs].[PlasmaCollectionLog]
        ( [DonorNumber]
        , [CollectionID]
        , [ChangeType]
        , [CollectionDate]
        , [DonorWeight]
        , [BodyTemp]
        , [SystolicBloodPressure]
        , [DiaSystolicBloodPressure]
        , [Pulse]
        , [Hematocrit]
        , [TotalProtein]
        , [BleedNumber]
        , [VolumePlasmaCollected]
        , [BloodLoss]
        , [EnteredBy]
        , [VerifiedBy]
        , [EnteredDate]
        , [VerifiedDate]
        )
SELECT [I].[DonorNumber]
     , [I].[CollectionID]
     , 'U'
	 , [I].[CollectionDate]
	 , [I].[DonorWeight]
     , [I].[BodyTemp]
     , [I].[SystolicBloodPressure]
     , [I].[DiaSystolicBloodPressure]
     , [I].[Pulse]
     , [I].[Hematocrit]
     , [I].[TotalProtein]
     , [I].[BleedNumber]
     , [I].[VolumePlasmaCollected]
     , [I].[BloodLoss]
     , [I].[EnteredBy]
     , [I].[VerifiedBy]
     , [I].[EnteredDate]
     , [I].[VerifiedDate] From [Inserted] As [I]
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
