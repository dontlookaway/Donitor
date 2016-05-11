CREATE TABLE [dbo].[Donor]
(
[DonorNumber] [bigint] NOT NULL IDENTITY(1, 1),
[DateOfBirth] [date] NOT NULL,
[Gender] [char] (1) COLLATE Latin1_General_BIN NOT NULL,
[EnteredBy] [varchar] (50) COLLATE Latin1_General_BIN NOT NULL,
[VerifiedBy] [varchar] (50) COLLATE Latin1_General_BIN NULL,
[EnteredDate] [date] NOT NULL CONSTRAINT [DF__Donor__EnteredDa__1B0907CE] DEFAULT (getdate()),
[VerifiedDate] [date] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Donor] ADD CONSTRAINT [PKDonorNo] PRIMARY KEY CLUSTERED  ([DonorNumber]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Donor] ADD CONSTRAINT [FK__Donor__Gender__182C9B23] FOREIGN KEY ([Gender]) REFERENCES [lookups].[Gender] ([Gender])
GO
ALTER TABLE [dbo].[Donor] ADD CONSTRAINT [FK__Donor__VerifiedB__1A14E395] FOREIGN KEY ([VerifiedBy]) REFERENCES [lookups].[Users] ([UserCode])
GO
ALTER TABLE [dbo].[Donor] ADD CONSTRAINT [FK__Donor__EnteredBy__1920BF5C] FOREIGN KEY ([EnteredBy]) REFERENCES [lookups].[Users] ([UserCode])
GO
