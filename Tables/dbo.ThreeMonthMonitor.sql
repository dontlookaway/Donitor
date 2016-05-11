CREATE TABLE [dbo].[ThreeMonthMonitor]
(
[DonorNumber] [bigint] NOT NULL,
[MonitorID] [int] NOT NULL IDENTITY(1, 1),
[MonitorDate] [date] NULL,
[TotalProtein] [numeric] (10, 5) NULL,
[RatioA] [numeric] (10, 5) NULL,
[Albumin] [numeric] (10, 5) NULL,
[AlphaOne] [numeric] (10, 5) NULL,
[AlphaTwo] [numeric] (10, 5) NULL,
[Beta] [numeric] (10, 5) NULL,
[Gamma] [numeric] (10, 5) NULL,
[EnteredBy] [varchar] (50) COLLATE Latin1_General_BIN NOT NULL,
[VerifiedBy] [varchar] (50) COLLATE Latin1_General_BIN NULL,
[EnteredDate] [date] NOT NULL CONSTRAINT [DF__ThreeMont__Enter__2F10007B] DEFAULT (getdate()),
[VerifiedDate] [date] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ThreeMonthMonitor] ADD CONSTRAINT [BlockFutureMonDate] CHECK (([MonitorDate]<=getdate()))
GO
ALTER TABLE [dbo].[ThreeMonthMonitor] ADD CONSTRAINT [PK_MonitorID] PRIMARY KEY CLUSTERED  ([MonitorID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ThreeMonthMonitor] ADD CONSTRAINT [FK__ThreeMont__Donor__2C3393D0] FOREIGN KEY ([DonorNumber]) REFERENCES [dbo].[Donor] ([DonorNumber])
GO
ALTER TABLE [dbo].[ThreeMonthMonitor] ADD CONSTRAINT [FK__ThreeMont__Verif__2E1BDC42] FOREIGN KEY ([VerifiedBy]) REFERENCES [lookups].[Users] ([UserCode])
GO
ALTER TABLE [dbo].[ThreeMonthMonitor] ADD CONSTRAINT [FK__ThreeMont__Enter__2D27B809] FOREIGN KEY ([EnteredBy]) REFERENCES [lookups].[Users] ([UserCode])
GO
