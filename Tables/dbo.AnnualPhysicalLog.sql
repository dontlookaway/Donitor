CREATE TABLE [dbo].[AnnualPhysicalLog]
(
[DonorNumber] [bigint] NULL,
[PhysicalID] [bigint] NULL,
[DateOfPhysical] [date] NULL,
[Outcome] [char] (1) COLLATE Latin1_General_BIN NULL,
[EnteredBy] [varchar] (50) COLLATE Latin1_General_BIN NULL,
[VerifiedBy] [varchar] (50) COLLATE Latin1_General_BIN NULL,
[EnteredDate] [date] NULL,
[VerifiedDate] [date] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AnnualPhysicalLog] ADD CONSTRAINT [FK__AnnualPhy__Physi__6B24EA82] FOREIGN KEY ([PhysicalID]) REFERENCES [dbo].[AnnualPhysical] ([PhysicalID])
GO
ALTER TABLE [dbo].[AnnualPhysicalLog] ADD CONSTRAINT [FK__AnnualPhy__Donor__6A30C649] FOREIGN KEY ([DonorNumber]) REFERENCES [dbo].[Donor] ([DonorNumber])
GO
ALTER TABLE [dbo].[AnnualPhysicalLog] ADD CONSTRAINT [FK__AnnualPhy__Outco__6C190EBB] FOREIGN KEY ([Outcome]) REFERENCES [lookups].[PhysicalOutcome] ([Outcome])
GO
ALTER TABLE [dbo].[AnnualPhysicalLog] ADD CONSTRAINT [FK__AnnualPhy__Verif__6E01572D] FOREIGN KEY ([VerifiedBy]) REFERENCES [lookups].[Users] ([UserCode])
GO
ALTER TABLE [dbo].[AnnualPhysicalLog] ADD CONSTRAINT [FK__AnnualPhy__Enter__6D0D32F4] FOREIGN KEY ([EnteredBy]) REFERENCES [lookups].[Users] ([UserCode])
GO
