CREATE TABLE [dbo].[AnnualPhysical]
(
[DonorNumber] [bigint] NOT NULL,
[PhysicalID] [bigint] NOT NULL IDENTITY(1, 1),
[DateOfPhysical] [date] NULL,
[Outcome] [char] (1) COLLATE Latin1_General_BIN NOT NULL,
[EnteredBy] [varchar] (50) COLLATE Latin1_General_BIN NOT NULL,
[VerifiedBy] [varchar] (50) COLLATE Latin1_General_BIN NULL,
[EnteredDate] [date] NOT NULL CONSTRAINT [DF__AnnualPhy__Enter__20C1E124] DEFAULT (getdate()),
[VerifiedDate] [date] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AnnualPhysical] ADD CONSTRAINT [FK__AnnualPhy__Donor__1CF15040] FOREIGN KEY ([DonorNumber]) REFERENCES [dbo].[Donor] ([DonorNumber])
GO
ALTER TABLE [dbo].[AnnualPhysical] ADD CONSTRAINT [FK__AnnualPhy__Outco__1DE57479] FOREIGN KEY ([Outcome]) REFERENCES [lookups].[PhysicalOutcome] ([Outcome])
GO
ALTER TABLE [dbo].[AnnualPhysical] ADD CONSTRAINT [FK__AnnualPhy__Verif__1FCDBCEB] FOREIGN KEY ([VerifiedBy]) REFERENCES [lookups].[Users] ([UserCode])
GO
ALTER TABLE [dbo].[AnnualPhysical] ADD CONSTRAINT [FK__AnnualPhy__Enter__1ED998B2] FOREIGN KEY ([EnteredBy]) REFERENCES [lookups].[Users] ([UserCode])
GO
