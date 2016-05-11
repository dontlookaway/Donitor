CREATE TABLE [dbo].[AnnualPhysicalLog]
(
[DonorNumber] [bigint] NULL,
[PhysicalID] [bigint] NULL,
[ChangeID] [bigint] NOT NULL IDENTITY(1, 1),
[ChangeType] [char] (1) COLLATE Latin1_General_BIN NULL,
[DateOfPhysical] [date] NULL,
[Outcome] [char] (1) COLLATE Latin1_General_BIN NULL,
[EnteredBy] [varchar] (50) COLLATE Latin1_General_BIN NULL,
[VerifiedBy] [varchar] (50) COLLATE Latin1_General_BIN NULL,
[EnteredDate] [date] NULL,
[VerifiedDate] [date] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AnnualPhysicalLog] ADD CONSTRAINT [FK__AnnualPhy__Physi__73BA3083] FOREIGN KEY ([PhysicalID]) REFERENCES [dbo].[AnnualPhysical] ([PhysicalID])
GO
ALTER TABLE [dbo].[AnnualPhysicalLog] ADD CONSTRAINT [FK__AnnualPhy__Donor__70DDC3D8] FOREIGN KEY ([DonorNumber]) REFERENCES [dbo].[Donor] ([DonorNumber])
GO
ALTER TABLE [dbo].[AnnualPhysicalLog] ADD CONSTRAINT [FK__AnnualPhy__Chang__6FE99F9F] FOREIGN KEY ([ChangeType]) REFERENCES [lookups].[LogChangeType] ([ChangeType])
GO
ALTER TABLE [dbo].[AnnualPhysicalLog] ADD CONSTRAINT [FK__AnnualPhy__Outco__72C60C4A] FOREIGN KEY ([Outcome]) REFERENCES [lookups].[PhysicalOutcome] ([Outcome])
GO
ALTER TABLE [dbo].[AnnualPhysicalLog] ADD CONSTRAINT [FK__AnnualPhy__Verif__74AE54BC] FOREIGN KEY ([VerifiedBy]) REFERENCES [lookups].[Users] ([UserCode])
GO
ALTER TABLE [dbo].[AnnualPhysicalLog] ADD CONSTRAINT [FK__AnnualPhy__Enter__71D1E811] FOREIGN KEY ([EnteredBy]) REFERENCES [lookups].[Users] ([UserCode])
GO
