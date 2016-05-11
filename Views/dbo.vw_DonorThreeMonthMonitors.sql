SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
Create View [dbo].[vw_DonorThreeMonthMonitors]
As
    Select  [D].[DonorNumber]
          , [D].[DateOfBirth]
          , [G].[GenderDesc]
          , [DonorEnteredBy] = [DonorEnter].[UserName]
          , [DonorEnteredDate] = [D].[EnteredDate]
          , [DonorVerifiedBy] = [DonorVerify].[UserName]
          , [DonorVerifiedDate] = [D].[VerifiedDate]
          , [TMM].[MonitorID]
          , [TMM].[MonitorDate]
          , [TMM].[TotalProtein]
          , [TMM].[RatioA]
          , [TMM].[Albumin]
          , [TMM].[AlphaOne]
          , [TMM].[AlphaTwo]
          , [TMM].[Beta]
          , [TMM].[Gamma]
          , [MonitorEnteredBy] = [MonitorEnter].[UserName]
          , [MonitorEnteredDate] = [TMM].[EnteredDate]
          , [MonitorVerifiedBy] = [MonitorVerify].[UserName]
          , [MonitorVerifiedDate] = [TMM].[VerifiedDate]
          , [MonitorRank] = Rank() Over ( Partition By [TMM].[DonorNumber] Order By [TMM].[MonitorDate] Desc )
    From    [dbo].[Donor] [D]
            Left Join [dbo].[ThreeMonthMonitor] [TMM]
                On [TMM].[DonorNumber] = [D].[DonorNumber]
            Left Join [lookups].[Gender] [G]
                On [G].[Gender] = [D].[Gender]
            Left Join [lookups].[Users] [DonorEnter]
                On [DonorEnter].[UserCode] = [D].[EnteredBy]
            Left Join [lookups].[Users] [DonorVerify]
                On [DonorVerify].[UserCode] = [D].[VerifiedBy]
            Left Join [lookups].[Users] [MonitorEnter]
                On [MonitorEnter].[UserCode] = [TMM].[EnteredBy]
            Left Join [lookups].[Users] [MonitorVerify]
                On [MonitorVerify].[UserCode] = [TMM].[VerifiedBy];
GO
