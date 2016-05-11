CREATE TABLE [logs].[ThreeMonthMonitorLog]
(
[DonorNumber] [bigint] NOT NULL,
[MonitorID] [int] NULL,
[ChangeID] [bigint] NOT NULL IDENTITY(1, 1),
[ChangeType] [char] (1) COLLATE Latin1_General_BIN NOT NULL,
[MonitorDate] [date] NULL,
[TotalProtein] [numeric] (10, 5) NULL,
[RatioA] [numeric] (10, 5) NULL,
[Albumin] [numeric] (10, 5) NULL,
[AlphaOne] [numeric] (10, 5) NULL,
[AlphaTwo] [numeric] (10, 5) NULL,
[Beta] [numeric] (10, 5) NULL,
[Gamma] [numeric] (10, 5) NULL,
[EnteredBy] [varchar] (50) COLLATE Latin1_General_BIN NULL,
[VerifiedBy] [varchar] (50) COLLATE Latin1_General_BIN NULL,
[EnteredDate] [date] NOT NULL CONSTRAINT [DF__ThreeMont__Enter__3B40CD36] DEFAULT (getdate()),
[VerifiedDate] [date] NULL
) ON [PRIMARY]
GO
ALTER TABLE [logs].[ThreeMonthMonitorLog] ADD CONSTRAINT [FK__ThreeMont__Donor__367C1819] FOREIGN KEY ([DonorNumber]) REFERENCES [dbo].[Donor] ([DonorNumber])
GO
ALTER TABLE [logs].[ThreeMonthMonitorLog] ADD CONSTRAINT [FK__ThreeMont__Monit__37703C52] FOREIGN KEY ([MonitorID]) REFERENCES [dbo].[ThreeMonthMonitor] ([MonitorID])
GO
ALTER TABLE [logs].[ThreeMonthMonitorLog] ADD CONSTRAINT [FK__ThreeMont__Chang__3864608B] FOREIGN KEY ([ChangeType]) REFERENCES [lookups].[LogChangeType] ([ChangeType])
GO
ALTER TABLE [logs].[ThreeMonthMonitorLog] ADD CONSTRAINT [FK__ThreeMont__Verif__3A4CA8FD] FOREIGN KEY ([VerifiedBy]) REFERENCES [lookups].[Users] ([UserCode])
GO
ALTER TABLE [logs].[ThreeMonthMonitorLog] ADD CONSTRAINT [FK__ThreeMont__Enter__395884C4] FOREIGN KEY ([EnteredBy]) REFERENCES [lookups].[Users] ([UserCode])
GO
