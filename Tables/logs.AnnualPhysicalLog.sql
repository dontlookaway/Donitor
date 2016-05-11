CREATE TABLE [logs].[AnnualPhysicalLog]
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
ALTER TABLE [logs].[AnnualPhysicalLog] ADD CONSTRAINT [FK__AnnualPhy__Physi__0F624AF8] FOREIGN KEY ([PhysicalID]) REFERENCES [dbo].[AnnualPhysical] ([PhysicalID])
GO
ALTER TABLE [logs].[AnnualPhysicalLog] ADD CONSTRAINT [FK__AnnualPhy__Physi__151B244E] FOREIGN KEY ([PhysicalID]) REFERENCES [dbo].[AnnualPhysical] ([PhysicalID])
GO
ALTER TABLE [logs].[AnnualPhysicalLog] ADD CONSTRAINT [FK__AnnualPhy__Donor__123EB7A3] FOREIGN KEY ([DonorNumber]) REFERENCES [dbo].[Donor] ([DonorNumber])
GO
ALTER TABLE [logs].[AnnualPhysicalLog] ADD CONSTRAINT [FK__AnnualPhy__Donor__0C85DE4D] FOREIGN KEY ([DonorNumber]) REFERENCES [dbo].[Donor] ([DonorNumber])
GO
ALTER TABLE [logs].[AnnualPhysicalLog] ADD CONSTRAINT [FK__AnnualPhy__Chang__0B91BA14] FOREIGN KEY ([ChangeType]) REFERENCES [lookups].[LogChangeType] ([ChangeType])
GO
ALTER TABLE [logs].[AnnualPhysicalLog] ADD CONSTRAINT [FK__AnnualPhy__Chang__114A936A] FOREIGN KEY ([ChangeType]) REFERENCES [lookups].[LogChangeType] ([ChangeType])
GO
ALTER TABLE [logs].[AnnualPhysicalLog] ADD CONSTRAINT [FK__AnnualPhy__Outco__14270015] FOREIGN KEY ([Outcome]) REFERENCES [lookups].[PhysicalOutcome] ([Outcome])
GO
ALTER TABLE [logs].[AnnualPhysicalLog] ADD CONSTRAINT [FK__AnnualPhy__Outco__0E6E26BF] FOREIGN KEY ([Outcome]) REFERENCES [lookups].[PhysicalOutcome] ([Outcome])
GO
ALTER TABLE [logs].[AnnualPhysicalLog] ADD CONSTRAINT [FK__AnnualPhy__Verif__160F4887] FOREIGN KEY ([VerifiedBy]) REFERENCES [lookups].[Users] ([UserCode])
GO
ALTER TABLE [logs].[AnnualPhysicalLog] ADD CONSTRAINT [FK__AnnualPhy__Verif__10566F31] FOREIGN KEY ([VerifiedBy]) REFERENCES [lookups].[Users] ([UserCode])
GO
ALTER TABLE [logs].[AnnualPhysicalLog] ADD CONSTRAINT [FK__AnnualPhy__Enter__0D7A0286] FOREIGN KEY ([EnteredBy]) REFERENCES [lookups].[Users] ([UserCode])
GO
ALTER TABLE [logs].[AnnualPhysicalLog] ADD CONSTRAINT [FK__AnnualPhy__Enter__1332DBDC] FOREIGN KEY ([EnteredBy]) REFERENCES [lookups].[Users] ([UserCode])
GO
