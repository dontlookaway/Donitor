SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[vw_DonorAnnualPhysicals]
AS
Select  [D].[DonorNumber]
      , [D].[DateOfBirth]
      , [G].[GenderDesc]
      , [DonorEnteredBy] = [DonorEnter].[UserName]
      , [DonorEnteredDate] = [D].[EnteredDate]
      , [DonorVerifiedBy] = [DonorVerify].[UserName]
      , [DonorVerifiedDate] = [D].[VerifiedDate]
      , [AP].[PhysicalID]
      , [AP].[DateOfPhysical]
      , [Outcome] = PO.[OutcomeDesc]
      , [APEnteredBy] = [PhysicalEnter].[UserName]
      , [APEnteredDate] = [AP].[EnteredDate]
      , [APVerifiedBy] = [PhysicalVerify].[UserName]
	  , [APVerifiedDate] = [AP].[VerifiedDate]
	  , PhysicalRank = Rank()  Over (Partition By [AP].[DonorNumber] Order By [DateOfPhysical] Desc)
From    [dbo].[Donor] [D]
        Left Join [dbo].[AnnualPhysical] [AP]
            On [AP].[DonorNumber] = [D].[DonorNumber]
        Left Join [lookups].[Gender] [G]
            On [G].[Gender] = [D].[Gender]
        Left Join [lookups].[Users] [DonorEnter]
            On [DonorEnter].[UserCode] = [D].[EnteredBy]
        Left Join [lookups].[Users] [DonorVerify]
            On [DonorVerify].[UserCode] = [D].[VerifiedBy]
        Left Join [lookups].[Users] [PhysicalEnter]
            On [PhysicalEnter].[UserCode] = [AP].[EnteredBy]
		Left Join [lookups].[Users] [PhysicalVerify]
            On [PhysicalVerify].[UserCode] = [AP].[VerifiedBy]
		Left Join [lookups].[PhysicalOutcome] [PO] On [PO].[Outcome] = [AP].[Outcome];
-- WITH CHECK OPTION
GO
