-------******************************************************************************************************  
/*************************************************************************

	Script Name  : DM_RetailBuildTool_V2.sql
	Country		 : Dominica
	Modified By  : Yash Sagar Mehta             
	Description  : This script create stored procedures for Retails instance            
	Date         : 12-03-2025           


**************************************************************************/
 
-------******************************************************************************************************  
GO
/****** Object:  StoredProcedure [dbo].[Step1_CreateTempClTables]   ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Step1_CreateTempClTables]
AS
BEGIN
	if exists(select * from sys.tables where name = 'TempClAcc')
		Drop Table TempClAcc

	SELECT acctno INTO TempClAcc FROM 
	(SELECT acctno FROM dbo.acct WHERE acctno IN (SELECT acctno FROM dbo.cashloan)) t


END

GO
/****** Object:  StoredProcedure [dbo].[Step2_DeleteCLAccounts]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Step2_DeleteCLAccounts]
AS
BEGIN

	IF OBJECT_ID('tempdb..#tmp') IS NOT NULL
	    Drop TABLE #tmp
	ELSE

	select * into #tmp from TempClAcc

	delete from dbo.termstypeaudit where acctno in (select acctno from #tmp)
	delete from dbo.fintrans where acctno in (select acctno from #tmp)
	delete from dbo.as400fin where acctno in (select acctno from #tmp)
	delete from dbo.bailaction where acctno in (select acctno from #tmp)
	delete from dbo.accountmonths2 where acctno in (select acctno from #tmp)
	delete from dbo.status where acctno in (select acctno from #tmp)
	delete from dbo.lineitem where acctno in (select acctno from #tmp)
	delete from dbo.letter where acctno in (select acctno from #tmp)
	delete from dbo.delivery where acctno in (select acctno from #tmp)
	delete from dbo.CMStrategyAcct where acctno in (select acctno from #tmp)
	delete from dbo.LineitemAudit where acctno in (select acctno from #tmp)
	delete from dbo.cheqfintranslnk where acctno in (select acctno from #tmp)
	delete from dbo.as400trans where acctno in (select acctno from #tmp)
	delete from dbo.proposalflag where acctno in (select acctno from #tmp)
	delete from dbo.CMWorklistsAcct where acctno in (select acctno from #tmp)
	delete from dbo.sms where acctno in (select acctno from #tmp)
	delete from dbo.DocumentReprint where acctno in (select acctno from #tmp)
	delete from dbo.agreement where acctno in (select acctno from #tmp)
	delete from dbo.custacct where acctno in (select acctno from #tmp)
	delete from dbo.proposalaudit where acctno in (select acctno from #tmp)
	delete from dbo.Summary1_MR where acctno in (select acctno from #tmp)
	delete from dbo.CMStrategyVariablesEntry where acctno in (select acctno from #tmp)
	delete from dbo.CMStrategyVariablesExit where acctno in (select acctno from #tmp)
	delete from dbo.CMStrategyVariablesSteps where acctno in (select acctno from #tmp)
	delete from dbo.bailactionPTP where acctno in (select acctno from #tmp)
	delete from dbo.follupalloc where acctno in (select acctno from #tmp)
	delete from dbo.agreementAudit where acctno in (select acctno from #tmp)
	delete from dbo.addtoletter where acctno in (select acctno from #tmp)
	delete from dbo.setlstatus where acctno in (select acctno from #tmp)
	delete from Warehouse.Booking where acctno in (select acctno from #tmp)
	delete from dbo.DelAuthoriseAudit where acctno in (select acctno from #tmp)
	delete from dbo.ProposalRef where acctno in (select acctno from #tmp)
	delete from dbo.lineitemosdelnotes where acctno in (select acctno from #tmp)
	delete from dbo.chargesdata where acctno in (select acctno from #tmp)
	delete from dbo.proposal where acctno in (select acctno from #tmp)
	delete from dbo.settled_before_thres where acctno in (select acctno from #tmp)
	delete from dbo.instalplanAudit where acctno in (select acctno from #tmp)
	delete from dbo.bailactionMaxAction where acctno in (select acctno from #tmp)
	delete from dbo.acctcode where acctno in (select acctno from #tmp)
	delete from dbo.DiscountsAuthorised where acctno in (select acctno from #tmp)
	delete from dbo.ScheduleAudit where acctno in (select acctno from #tmp)
	delete from dbo.newlineitem where acctno in (select acctno from #tmp)
	delete from dbo.zz_SaveScorexdata3 where acctno in (select acctno from #tmp)
	delete from dbo.zz_SaveApplication where acctno in (select acctno from #tmp)
	delete from dbo.summary2_non where acctno in (select acctno from #tmp)
	delete from dbo.finxfr where acctno in (select acctno from #tmp)
	delete from dbo.cashiertotalsincome where acctno in (select acctno from #tmp)
	delete from dbo.bailiffcommn where acctno in (select acctno from #tmp)
	delete from dbo.unposteddels where acctno in (select acctno from #tmp)
	delete from dbo.invoiceDetails where acctno in (select acctno from #tmp)
	delete from dbo.ArrearsDaily where acctno in (select acctno from #tmp)
	delete from dbo.bailiffCommnPaid where acctno in (select acctno from #tmp)
	delete from dbo.mjkc_temp where acctno in (select acctno from #tmp)
	delete from dbo.CustomerScoreHist where acctno in (select acctno from #tmp)
	delete from dbo.Summary1AcctStatus where acctno in (select acctno from #tmp)
	delete from dbo.ICAnalysisReport where acctno in (select acctno from #tmp)
	delete from dbo.SalesCommission where acctno in (select acctno from #tmp)
	delete from dbo.CMStrategySOD where acctno in (select acctno from #tmp)
	delete from dbo.stat_temp01 where acctno in (select acctno from #tmp)
	delete from dbo.ScorexAppnumber where acctno in (select acctno from #tmp)
	delete from dbo.bailiffcommn_pre2005 where acctno in (select acctno from #tmp)
	delete from dbo.summary16 where acctno in (select acctno from #tmp)
	delete from dbo.transactionaudit where acctno in (select acctno from #tmp)
	delete from dbo.CashAndGoReceipt where acctno in (select acctno from #tmp)
	delete from dbo.cancellation where acctno in (select acctno from #tmp)
	delete from dbo.itemdetails where acctno in (select acctno from #tmp)
	delete from dbo.temp_calcpcent where acctno in (select acctno from #tmp)
	delete from dbo.temp_hldjnt_1 where acctno in (select acctno from #tmp)
	delete from dbo.SR_Summary where acctno in (select acctno from #tmp)
	delete from dbo.newproposal where acctno in (select acctno from #tmp)
	delete from dbo.BailiffCommnDeleted where acctno in (select acctno from #tmp)
	delete from dbo.DeliveryReprint where acctno in (select acctno from #tmp)
	delete from dbo.spa where acctno in (select acctno from #tmp)
	delete from dbo.AutoSettled_Account_Backup where acctno in (select acctno from #tmp)
	delete from dbo.Delinquency where acctno in (select acctno from #tmp)
	delete from dbo.SR_ServiceRequest where acctno in (select acctno from #tmp)
	delete from dbo.ReferralOverride where acctno in (select acctno from #tmp)
	delete from dbo.downstatus where acctno in (select acctno from #tmp)
	delete from dbo.ExtractedApps where acctno in (select acctno from #tmp)
	delete from dbo.fintransAddtos where acctno in (select acctno from #tmp)
	delete from dbo.SR_ChargeAcct where acctno in (select acctno from #tmp)
	delete from dbo.salesnotrap where acctno in (select acctno from #tmp)
	delete from dbo.revisedhist where acctno in (select acctno from #tmp)
	delete from dbo.lineitem_amend where acctno in (select acctno from #tmp)
	delete from dbo.tempreceipt where acctno in (select acctno from #tmp)
	delete from dbo.CollectionReason where acctno in (select acctno from #tmp)
	delete from dbo.instantcreditflag where acctno in (select acctno from #tmp)
	delete from dbo.order_removed where acctno in (select acctno from #tmp)
	delete from dbo.delauthorise where acctno in (select acctno from #tmp)
	delete from dbo.del_thres_reached where acctno in (select acctno from #tmp)
	delete from dbo.temp_AddtoReceivable where acctno in (select acctno from #tmp)
	delete from dbo.fintrans_backup where acctno in (select acctno from #tmp)
	delete from dbo.FACTTRANS_V10Upg where acctno in (select acctno from #tmp)
	delete from dbo.line_back where acctno in (select acctno from #tmp)
	delete from dbo.ScheduleRemoval where acctno in (select acctno from #tmp)
	delete from dbo.RebateForecast_byaccount_previous_previous where acctno in (select acctno from #tmp)
	delete from dbo.RebateForecast_byaccount_yearend where acctno in (select acctno from #tmp)
	delete from dbo.RebateForecast_byaccount_previous where acctno in (select acctno from #tmp)
	delete from dbo.lineitembfCollection where acctno in (select acctno from #tmp)
	delete from dbo.KitCLineItem where acctno in (select acctno from #tmp)
	delete from dbo.zz_SaveScorexdata where acctno in (select acctno from #tmp)
	delete from dbo.SR_CustomerInteraction where acctno in (select acctno from #tmp)
	delete from dbo.CMWorklistSOD where acctno in (select acctno from #tmp)
	delete from dbo.RebateForecast_byaccount_current where acctno in (select acctno from #tmp)
	delete from dbo.summary14 where acctno in (select acctno from #tmp)
	delete from dbo.rebates where acctno in (select acctno from #tmp)
	delete from dbo.CorrectedPayments where acctno in (select acctno from #tmp)
	delete from dbo.temp_interest where acctno in (select acctno from #tmp)
	delete from dbo.liw_back where acctno in (select acctno from #tmp)
	delete from dbo.zz_SaveScorexdata1 where acctno in (select acctno from #tmp)
	delete from dbo.CLANewPaymentDetails where acctno in (select acctno from #tmp)
	delete from dbo.baldue12_full where acctno in (select acctno from #tmp)
	delete from dbo.CashLoan where acctno in (select acctno from #tmp)
	delete from dbo.Exchange where acctno in (select acctno from #tmp)
	delete from dbo.CashLoanDisbursement where acctno in (select acctno from #tmp)
	delete from dbo.Delivery_Error_log where acctno in (select acctno from #tmp)
	delete from dbo.baldue12_less where acctno in (select acctno from #tmp)
	delete from dbo.scorexdata_temp where acctno in (select acctno from #tmp)
	delete from dbo.Application where acctno in (select acctno from #tmp)
	delete from dbo.DataCleanLog where acctno in (select acctno from #tmp)
	delete from dbo.FinTransAccount where acctno in (select acctno from #tmp)
	delete from dbo.temp_AccountstoBeDeallocated where acctno in (select acctno from #tmp)
	delete from dbo.setldates where acctno in (select acctno from #tmp)
	delete from dbo.agreementbfcollection where acctno in (select acctno from #tmp)
	delete from dbo.zz_SaveScorexdata2 where acctno in (select acctno from #tmp)
	delete from dbo.KitLineItem where acctno in (select acctno from #tmp)
	delete from dbo.fintrans_new_income where acctno in (select acctno from #tmp)
	delete from dbo.fintransnote where acctno in (select acctno from #tmp)
	delete from dbo.unposteddelsDaily where acctno in (select acctno from #tmp)
	delete from dbo.ServiceChargeAcct where acctno in (select acctno from #tmp)
	delete from dbo.CollectionNoteChange where acctno in (select acctno from #tmp)
	delete from dbo.fintransLastSummary where acctno in (select acctno from #tmp)
	delete from dbo.lineitemwarrantieserased where acctno in (select acctno from #tmp)
	delete from dbo.IgnoreCRECRF where acctno in (select acctno from #tmp)
	delete from dbo.LastFactExport where acctno in (select acctno from #tmp)
	delete from dbo.manualcdv where acctno in (select acctno from #tmp)
	delete from dbo.duplicatenotes where acctno in (select acctno from #tmp)
	delete from dbo.summary15 where acctno in (select acctno from #tmp)
	delete from dbo.summary7 where acctno in (select acctno from #tmp)
	delete from dbo.scorexdata where acctno in (select acctno from #tmp)
	delete from dbo.BDWAudit where acctno in (select acctno from #tmp)
	delete from dbo.schedule where acctno in (select acctno from #tmp)
	delete from dbo.STL_Status where acctno in (select acctno from #tmp)
	delete from dbo.BDWPending where acctno in (select acctno from #tmp)
	delete from dbo.FinTransExchange where acctno in (select acctno from #tmp)
	delete from dbo.BailliffUnsuccessful where acctno in (select acctno from #tmp)
	delete from dbo.SPASummary where acctno in (select acctno from #tmp)
	delete from dbo.badagr where acctno in (select acctno from #tmp)
	delete from dbo.temp_cashint where acctno in (select acctno from #tmp)
	delete from dbo.ProposalDuplicates_68640 where acctno in (select acctno from #tmp)
	delete from dbo.temp_agreement where acctno in (select acctno from #tmp)
	delete from dbo.temp_acct where acctno in (select acctno from #tmp)
	delete from dbo.STL_AddTo where acctno in (select acctno from #tmp)
	delete from dbo.AccountLocking where acctno in (select acctno from #tmp)
	delete from dbo.facttrans where acctno in (select acctno from #tmp)
	delete from dbo.ProposalDuplicates_NoFlags_68640 where acctno in (select acctno from #tmp)
	delete from dbo.instalplan where acctno in (select acctno from #tmp)
	delete from dbo.STL_SpecialAccts where acctno in (select acctno from #tmp)
	delete from dbo.acct where acctno in (select acctno from #tmp)END
GO
/****** Object:  StoredProcedure [dbo].[Step3_TruncateCLTable]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Step3_TruncateCLTable]
AS
BEGIN
	TRUNCATE TABLE [dbo].[CashLoanDisbursement]
END
GO
/****** Object:  StoredProcedure [dbo].[Step4_DenyCLPermission]   ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Step4_DenyCLPermission]
AS
BEGIN
	UPDATE rp
	SET rp.[Deny] = 1
	FROM [Admin].[Permission] p
		INNER JOIN [Admin].[RolePermission] rp ON  p.Id= rp.PermissionId
	WHERE 
		p.Name IN ('Cash Loan Application','Cash Loan Disbursement')
END
GO