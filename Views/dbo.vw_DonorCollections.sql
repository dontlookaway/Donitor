SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE View [dbo].[vw_DonorCollections]
AS
Select  [D].[DonorNumber]
      , [D].[DateOfBirth]
      , [Gender] = [G].[GenderDesc]
      , [DonorEnteredBy] = [DonorEnter].[UserName]
      , [DonorEnteredDate] = [D].[EnteredDate]
      , [DonorVerifiedBy] = [DonorVerify].[UserName]
      , [DonorVerifiedDate] = [D].[VerifiedDate]
      , [PC].[CollectionID]
      , [PC].[CollectionDate]
      , [PC].[DonorWeight]
      , [PC].[BodyTemp]
      , [PC].[SystolicBloodPressure]
      , [PC].[DiaSystolicBloodPressure]
      , [PC].[Pulse]
      , [PC].[Hematocrit]
      , [PC].[TotalProtein]
      , [PC].[BleedNumber]
      , [PC].[VolumePlasmaCollected]
      , [PC].[BloodLoss]
      , [CollectionEnteredBy] = [CollectionEnter].[UserName]
      , [CollectionEnteredDate] = [PC].[EnteredDate]
      , [CollectionVerifiedBy] = [CollectionVerify].[UserName]
      , [CollectionVerifiedDate] = [PC].[VerifiedDate]
      , [CollectionRank] = Rank() Over ( Partition By [PC].[DonorNumber] Order By [PC].[CollectionDate] Desc )
From    [dbo].[Donor] [D]
        Left Join [dbo].[PlasmaCollection] [PC]
            On [PC].[DonorNumber] = [D].[DonorNumber]
        Left Join [lookups].[Gender] [G]
            On [G].[Gender] = [D].[Gender]
        Left Join [lookups].[Users] [DonorEnter]
            On [DonorEnter].[UserCode] = [D].[EnteredBy]
        Left Join [lookups].[Users] [DonorVerify]
            On [DonorVerify].[UserCode] = [D].[VerifiedBy]
        Left Join [lookups].[Users] [CollectionEnter]
            On [CollectionEnter].[UserCode] = [PC].[EnteredBy]
        Left Join [lookups].[Users] [CollectionVerify]
            On [CollectionVerify].[UserCode] = [PC].[VerifiedBy];
-- WITH CHECK OPTION
GO
