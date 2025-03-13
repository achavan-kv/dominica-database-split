-------******************************************************************************************************  
/*************************************************************************


	Modified By  : Yash Sagar Mehta             
	Description :  This script create stored procedures for cashloan instance            
	Date  : 12-03-2025           


**************************************************************************/
 
-------******************************************************************************************************  
GO
/****** Object:  StoredProcedure [dbo].[Step1_CreateTempNonClTables]    Script Date: 8/5/2020 5:37:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Step1_CreateTempNonClTables]
AS
BEGIN
	if exists(select * from sys.tables where name = 'TempNonClAcc')
		Drop Table TempNonClAcc

	SELECT acctno INTO TempNonClAcc FROM 
	(SELECT acctno FROM dbo.acct WHERE acctno NOT IN (SELECT acctno FROM dbo.cashloan WITH (NOLOCK))) t 


		if exists(select * from sys.tables where name = 'TempNonClCust')
		Drop Table TempNonClCust

	SELECT custid INTO TempNonClCust FROM 
	(SELECT custid FROM dbo.customer WHERE custid NOT IN (SELECT custid FROM dbo.cashloan WITH (NOLOCK))) t
	
END

GO
/****** Object:  StoredProcedure [dbo].[Step2_TruncateNonCLTable]    Script Date: 8/5/2020 5:37:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Step2_TruncateNonCLTable]
As

BEGIN
TRUNCATE TABLE [dbo].[delnotelock]
TRUNCATE TABLE [dbo].[addtoletter]
TRUNCATE TABLE [dbo].[dtproperties]
TRUNCATE TABLE [dbo].[spa]
TRUNCATE TABLE [dbo].[itemdetails]
TRUNCATE TABLE [dbo].[CMInsuranceDetail]
TRUNCATE TABLE [dbo].[DepositssrecentInterfaced]
TRUNCATE TABLE [dbo].[itemdetailstring]
TRUNCATE TABLE [dbo].[Dictionary]
TRUNCATE TABLE [dbo].[CL_PaymentDeductionSeq]
TRUNCATE TABLE [dbo].[RItemp_RawStkQtyload]
TRUNCATE TABLE [dbo].[WTRDates]
TRUNCATE TABLE [Warranty].[WarrantyPotentialSale]
TRUNCATE TABLE [dbo].[directdebit]
TRUNCATE TABLE [dbo].[SR_ServiceRequest]
TRUNCATE TABLE [dbo].[SR_ChargeTo]
TRUNCATE TABLE [Merchandising].[StockCountProduct]
TRUNCATE TABLE [dbo].[KitLineItem]
TRUNCATE TABLE [Sales].[OrderItem]
TRUNCATE TABLE [dbo].[DiscountsAuthorised]
TRUNCATE TABLE [dbo].[agreementsize]
TRUNCATE TABLE [dbo].[FasciaTemp]
TRUNCATE TABLE [dbo].[SR_ChargeToAuthorisation]
TRUNCATE TABLE [dbo].[KitCLineItem]
TRUNCATE TABLE [dbo].[CMLegalDetail]
TRUNCATE TABLE [dbo].[apperrorlog]
TRUNCATE TABLE [dbo].[Trigger_Data]
TRUNCATE TABLE [dbo].[downstatus]
TRUNCATE TABLE [dbo].[agreementbfcollection]
TRUNCATE TABLE [dbo].[traptimes]
TRUNCATE TABLE [dbo].[LastFactExport]
TRUNCATE TABLE [dbo].[allocctrl]
TRUNCATE TABLE [Communication].[SmsUnsubcription]
TRUNCATE TABLE [Merchandising].[StockAllocationProduct]
TRUNCATE TABLE [dbo].[SR_FoodLoss]
TRUNCATE TABLE [dbo].[dup_cheqbackup]
TRUNCATE TABLE [dbo].[SR_PartListResolved]
TRUNCATE TABLE [Credit].[StoreCardImport]
TRUNCATE TABLE [Service].[Comment]
TRUNCATE TABLE [dbo].[instalplanHistory]
TRUNCATE TABLE [dbo].[duplicate_warranties]
TRUNCATE TABLE [Merchandising].[RepossessedProduct]
TRUNCATE TABLE [dbo].[unposteddels]
TRUNCATE TABLE [dbo].[SR_PriceIndexMatrix]
TRUNCATE TABLE [dbo].[LetterControl]
TRUNCATE TABLE [dbo].[duplicatenotes]
TRUNCATE TABLE [dbo].[temp_rawpromoload]
TRUNCATE TABLE [dbo].[HubTestingPSN2]
TRUNCATE TABLE [dbo].[unposteddelsDaily]
TRUNCATE TABLE [dbo].[temp_rawnonstockpromoload]
TRUNCATE TABLE [dbo].[SR_Resolution]
TRUNCATE TABLE [dbo].[letterdate]
TRUNCATE TABLE [dbo].[userclass]
TRUNCATE TABLE [dbo].[line_back]
TRUNCATE TABLE [dbo].[warrantyband]
TRUNCATE TABLE [dbo].[SR_ServiceRequestHistory]
TRUNCATE TABLE [dbo].[emppass]
TRUNCATE TABLE [Merchandising].[CurrentStockPriceByLocationView1]
TRUNCATE TABLE [SalesManagement].[SummaryTable]
TRUNCATE TABLE [dbo].[SR_TechnicianDiary]
TRUNCATE TABLE [dbo].[lineitembfCollection]
TRUNCATE TABLE [dbo].[SingerBranch]
TRUNCATE TABLE [dbo].[RIDeliveriesReturnsRepo]
TRUNCATE TABLE [dbo].[badagr]
TRUNCATE TABLE [dbo].[WarrantyReturnCodes]
TRUNCATE TABLE [dbo].[SR_TechnicianPayment]
TRUNCATE TABLE [dbo].[StoreCardRateAudit]
TRUNCATE TABLE [Service].[Payment]
TRUNCATE TABLE [dbo].[Courtspersonaudit]
TRUNCATE TABLE [dbo].[eod]
TRUNCATE TABLE [Merchandising].[LocationStockLevelView1]
TRUNCATE TABLE [dbo].[Temp_11Apr2019_TTHub200_SameKeyItem]
TRUNCATE TABLE [dbo].[WarrantyReturnCode]
TRUNCATE TABLE [Merchandising].[GoodsOnLoanProduct]
TRUNCATE TABLE [dbo].[SR_TechnicianVacations]
TRUNCATE TABLE [NonStocks].[NonStockHierarchy]
TRUNCATE TABLE [dbo].[LineitemOracleExport]
TRUNCATE TABLE [Merchandising].[CurrentStockRetailPriceView1]
TRUNCATE TABLE [dbo].[SR_Zone]
TRUNCATE TABLE [dbo].[StoreCardStatement]
TRUNCATE TABLE [dbo].[lineitemosdelnotes]
TRUNCATE TABLE [dbo].[StoreCardRateDetails]
TRUNCATE TABLE [dbo].[Temp_11Apr2019_TTHub200_RepoSKUList]
TRUNCATE TABLE [dbo].[lineitemStockNotprintedDN]
TRUNCATE TABLE [dbo].[Delivery_Error_log]
TRUNCATE TABLE [dbo].[eposloyaltycard]
TRUNCATE TABLE [Warranty].[CurrentRetailPriceView1]
TRUNCATE TABLE [NonStocks].[NonStockPrice]
TRUNCATE TABLE [dbo].[lineitemwarrantieserased]
TRUNCATE TABLE [dbo].[HubFinal_POMissing]
TRUNCATE TABLE [dbo].[BusinessHours]
TRUNCATE TABLE [dbo].[Exchange]
TRUNCATE TABLE [dbo].[zz_SaveScorexdata]
TRUNCATE TABLE [dbo].[stat_temp01]
TRUNCATE TABLE [dbo].[liw_back]
TRUNCATE TABLE [dbo].[temp_smsduplicats]
TRUNCATE TABLE [Warranty].[PriceCalcView11]
TRUNCATE TABLE [dbo].[zz_SaveScorexdata1]
TRUNCATE TABLE [dbo].[ExtractedApps]
TRUNCATE TABLE [dbo].[PriceChangesAuditFix]
TRUNCATE TABLE [dbo].[zz_SaveScorexdata2]
TRUNCATE TABLE [dbo].[manualcdv]
TRUNCATE TABLE [dbo].[FactAuto]
TRUNCATE TABLE [Merchandising].[ProductHierarchyConcatTable]
TRUNCATE TABLE [dbo].[zz_SaveScorexdata3]
TRUNCATE TABLE [dbo].[CashierTotalWriteOff]
TRUNCATE TABLE [dbo].[STL_AddTo]
TRUNCATE TABLE [dbo].[STL_Status]
TRUNCATE TABLE [NonStocks].[LinkProduct]
TRUNCATE TABLE [Service].[TechnicianBookingDelete]
TRUNCATE TABLE [dbo].[feedererrorlog]
TRUNCATE TABLE [SalesManagement].[Call]
TRUNCATE TABLE [dbo].[stockitemassociated]
TRUNCATE TABLE [dbo].[MissingDels_67556_chk]
TRUNCATE TABLE [dbo].[ICAnalysisReport]
TRUNCATE TABLE [dbo].[BarCodeItem]
TRUNCATE TABLE [dbo].[TradingSummary]
TRUNCATE TABLE [Service].[TechnicianBookingReject]
TRUNCATE TABLE [dbo].[BDWAudit]
TRUNCATE TABLE [NonStocks].[LinkNonStock]
TRUNCATE TABLE [dbo].[mjkc_temp]
TRUNCATE TABLE [dbo].[CMActionRights]
TRUNCATE TABLE [dbo].[batch]
TRUNCATE TABLE [dbo].[tblFileData]
TRUNCATE TABLE [Service].[ServiceSupplier]
TRUNCATE TABLE [dbo].[tblAffectedProducts]
TRUNCATE TABLE [dbo].[newbranch]
TRUNCATE TABLE [dbo].[BDWRejection]
TRUNCATE TABLE [dbo].[StockQuantityAuditCosacs]
TRUNCATE TABLE [dbo].[TradingSummaryDatesHdr]
TRUNCATE TABLE [Service].[FaultTag]
TRUNCATE TABLE [dbo].[Storder]
TRUNCATE TABLE [dbo].[WTRReportDates]
TRUNCATE TABLE [Warehouse].[ZoneAssignment]
TRUNCATE TABLE [dbo].[BranchDeposit]
TRUNCATE TABLE [dbo].[temp_branch]
TRUNCATE TABLE [dbo].[stordercontrol]
TRUNCATE TABLE [dbo].[newproposal]
TRUNCATE TABLE [dbo].[temp_nonstockpromoload]
TRUNCATE TABLE [NonStocks].[NonStockPromotion]
TRUNCATE TABLE [dbo].[notesno]
TRUNCATE TABLE [dbo].[SOException]
TRUNCATE TABLE [dbo].[temp_stockload]
TRUNCATE TABLE [dbo].[storderprocess]
TRUNCATE TABLE [Merchandising].[ComboProductPrice]
TRUNCATE TABLE [Merchandising].[GoodsReceiptProductHistory]
TRUNCATE TABLE [dbo].[summary10]
TRUNCATE TABLE [dbo].[noninterface_financial]
TRUNCATE TABLE [dbo].[IgnoreCRECRF]
TRUNCATE TABLE [dbo].[StOrderTxn]
TRUNCATE TABLE [Merchandising].[GoodsReceiptHistory]
TRUNCATE TABLE [Warehouse].[DriverPayment]
TRUNCATE TABLE [dbo].[Summary12]
TRUNCATE TABLE [dbo].[notesstring]
TRUNCATE TABLE [dbo].[CmZoneAllocation]
TRUNCATE TABLE [dbo].[CashandGo_Archive]
TRUNCATE TABLE [dbo].[SOFilesProcessed]
TRUNCATE TABLE [Merchandising].[PurchaseOrderHistory]
TRUNCATE TABLE [dbo].[Summary12_Threshold]
TRUNCATE TABLE [dbo].[PrizeVoucherDetails]
TRUNCATE TABLE [Merchandising].[PurchaseOrderProductHistory]
TRUNCATE TABLE [dbo].[summary11]
TRUNCATE TABLE [Merchandising].[SetProduct]
TRUNCATE TABLE [dbo].[UnarchiveOrder]
TRUNCATE TABLE [dbo].[Summary12_QT]
TRUNCATE TABLE [dbo].[table_reindex]
TRUNCATE TABLE [dbo].[summary14]
TRUNCATE TABLE [dbo].[locklogfinal]
TRUNCATE TABLE [dbo].[OldPCMember]
TRUNCATE TABLE [dbo].[summary15]
TRUNCATE TABLE [dbo].[SR_TechnicianJobOverrideAudit]
TRUNCATE TABLE [dbo].[BrokerExtractHist]
TRUNCATE TABLE [dbo].[summary16]
TRUNCATE TABLE [Merchandising].[SetLocation]
TRUNCATE TABLE [Merchandising].[Set]
TRUNCATE TABLE [Merchandising].[Dates]
TRUNCATE TABLE [dbo].[BrokerOracleSetup]
TRUNCATE TABLE [dbo].[WTRReport]
TRUNCATE TABLE [dbo].[OracleOrderNo]
TRUNCATE TABLE [dbo].[sysdiagrams]
TRUNCATE TABLE [dbo].[summary2_non]
TRUNCATE TABLE [Merchandising].[VendorMapping]
TRUNCATE TABLE [dbo].[OracleReceipts]
TRUNCATE TABLE [dbo].[SPASummary]
TRUNCATE TABLE [dbo].[dbversion]
TRUNCATE TABLE [dbo].[temp_nonstockassociatedload]
TRUNCATE TABLE [dbo].[summary2_sec]
TRUNCATE TABLE [dbo].[TradingSummaryHdr]
TRUNCATE TABLE [dbo].[fisundry_temporary]
TRUNCATE TABLE [dbo].[TrigErrorLog]
TRUNCATE TABLE [dbo].[summary3]
TRUNCATE TABLE [dbo].[order_removed]
TRUNCATE TABLE [dbo].[SupplierItem]
TRUNCATE TABLE [dbo].[cashtillopen]
TRUNCATE TABLE [Merchandising].[DepartmentMapping]
TRUNCATE TABLE [dbo].[paydeduct]
TRUNCATE TABLE [dbo].[Supplier]
TRUNCATE TABLE [dbo].[RItemp_RawStkQtyloadRepo]
TRUNCATE TABLE [Merchandising].[GoodsReceiptResume]
TRUNCATE TABLE [dbo].[paymentholidayredeemed]
TRUNCATE TABLE [dbo].[StoreCardStatus]
TRUNCATE TABLE [dbo].[COVID_Instalplan_DataFix_Update_Backup]
TRUNCATE TABLE [dbo].[HierarchyExclusion]
TRUNCATE TABLE [Service].[RequestContact]
TRUNCATE TABLE [dbo].[PaymentHolidays]
TRUNCATE TABLE [dbo].[fr629_temp]
TRUNCATE TABLE [dbo].[PaymentHolidays67847_Bak]
TRUNCATE TABLE [dbo].[fr629_temp2]
TRUNCATE TABLE [dbo].[GiftVoucherCourts]
TRUNCATE TABLE [dbo].[classmenu]
TRUNCATE TABLE [dbo].[summary4b_non]
TRUNCATE TABLE [Service].[RequestPart]
TRUNCATE TABLE [dbo].[StoreCardCancellation_Lookup]
TRUNCATE TABLE [Warranty].[WarrantyTags]
TRUNCATE TABLE [dbo].[GiftVoucherOther]
TRUNCATE TABLE [dbo].[CMCondition]
TRUNCATE TABLE [dbo].[DDRejections]
TRUNCATE TABLE [dbo].[summary4b_sec]
TRUNCATE TABLE [dbo].[plettercontrolexclude]
TRUNCATE TABLE [dbo].[CMSMS]
TRUNCATE TABLE [dbo].[tallyweeklyexportlog]
TRUNCATE TABLE [dbo].[prevname]
TRUNCATE TABLE [dbo].[StockInfoAssociated]
TRUNCATE TABLE [dbo].[historical_data_rebate]
TRUNCATE TABLE [Merchandising].[ClassMapping]
TRUNCATE TABLE [Service].[RequestFoodLoss]
TRUNCATE TABLE [dbo].[printagr]
TRUNCATE TABLE [dbo].[ii_abfclasses]
TRUNCATE TABLE [dbo].[summary4c_non]
TRUNCATE TABLE [dbo].[ii_abfdependencies]
TRUNCATE TABLE [Merchandising].[AssociatedProduct]
TRUNCATE TABLE [dbo].[vintage2]
TRUNCATE TABLE [dbo].[summary4c_sec]
TRUNCATE TABLE [Merchandising].[ProductStaging]
TRUNCATE TABLE [Merchandising].[CintError]
TRUNCATE TABLE [dbo].[ii_abfobjects]
TRUNCATE TABLE [dbo].[summary5_non]
TRUNCATE TABLE [dbo].[ProductFaults]
TRUNCATE TABLE [SalesManagement].[CsrUnavailable]
TRUNCATE TABLE [dbo].[ii_app_cntns_comp]
TRUNCATE TABLE [dbo].[temporary_letter]
TRUNCATE TABLE [dbo].[summary5_sec]
TRUNCATE TABLE [dbo].[CollectionCommnMaxDays]
TRUNCATE TABLE [dbo].[ii_applications]
TRUNCATE TABLE [dbo].[Time]
TRUNCATE TABLE [dbo].[RItemp_RawProductload]
TRUNCATE TABLE [dbo].[warrantycodes]
TRUNCATE TABLE [dbo].[summary6_sec]
TRUNCATE TABLE [dbo].[ii_client_dep_mod]
TRUNCATE TABLE [dbo].[CMWorkListActions]
TRUNCATE TABLE [dbo].[summary8]
TRUNCATE TABLE [dbo].[ii_components]
TRUNCATE TABLE [Merchandising].[StockValuationSnapshot]
TRUNCATE TABLE [dbo].[summary6_non]
TRUNCATE TABLE [dbo].[ProposalDuplicates_NoFlags_68640]
TRUNCATE TABLE [dbo].[ProductHeirarchy]
TRUNCATE TABLE [dbo].[ii_dependencies]
TRUNCATE TABLE [dbo].[FinancialWeeks]
TRUNCATE TABLE [dbo].[coasterdata]
TRUNCATE TABLE [dbo].[summary7]
TRUNCATE TABLE [Service].[RequestScriptAnswer]
TRUNCATE TABLE [dbo].[ProposalDuplicates_68640]
TRUNCATE TABLE [dbo].[ii_dict_modules]
TRUNCATE TABLE [dbo].[temp_rawkitload]
TRUNCATE TABLE [dbo].[summary9_non]
TRUNCATE TABLE [dbo].[ii_encoded_forms]
TRUNCATE TABLE [dbo].[StorderDelimitedTemp]
TRUNCATE TABLE [dbo].[summary9_sec]
TRUNCATE TABLE [Merchandising].[ProductHierarchyStaging]
TRUNCATE TABLE [Warranty].[WarrantyPrice]
TRUNCATE TABLE [dbo].[ii_encodings]
TRUNCATE TABLE [dbo].[codreceipt]
TRUNCATE TABLE [dbo].[StorderDelimiters]
TRUNCATE TABLE [SalesManagement].[MailsToSend]
TRUNCATE TABLE [dbo].[summaryrun]
TRUNCATE TABLE [dbo].[CollectionCommnRuleActions]
TRUNCATE TABLE [Financial].[WarrantyReturnView_Temp]
TRUNCATE TABLE [dbo].[ii_entities]
TRUNCATE TABLE [dbo].[CollectionNoteChange]
TRUNCATE TABLE [dbo].[rpt1]
TRUNCATE TABLE [dbo].[sundagrmtchg]
TRUNCATE TABLE [Merchandising].[IncotermStaging]
TRUNCATE TABLE [dbo].[productclass]
TRUNCATE TABLE [dbo].[PropResult]
TRUNCATE TABLE [dbo].[ii_fields]
TRUNCATE TABLE [dbo].[columntext]
TRUNCATE TABLE [dbo].[temp_kitload]
TRUNCATE TABLE [Merchandising].[Incoterm]
TRUNCATE TABLE [dbo].[ii_forms]
TRUNCATE TABLE [dbo].[summary17]
TRUNCATE TABLE [Merchandising].[SucrBase]
TRUNCATE TABLE [Warranty].[WarrantyPromotion]
--TRUNCATE TABLE [dbo].[CollectionCommnRuleAudit]
TRUNCATE TABLE [dbo].[CashAndGoReceipt]
TRUNCATE TABLE [dbo].[ii_framevars]
TRUNCATE TABLE [dbo].[CommissionPaid]
TRUNCATE TABLE [dbo].[summary18]
TRUNCATE TABLE [dbo].[provisions]
TRUNCATE TABLE [dbo].[StoreCardBranchQualRules]
TRUNCATE TABLE [dbo].[ii_gropts]
TRUNCATE TABLE [dbo].[commnbasis]
TRUNCATE TABLE [dbo].[temporary_LoanletterSC1]
TRUNCATE TABLE [dbo].[Tallymanbdw]
TRUNCATE TABLE [dbo].[CollectionCommnRuleActionsAudit]
TRUNCATE TABLE [dbo].[ii_id]
TRUNCATE TABLE [dbo].[complaint]
TRUNCATE TABLE [dbo].[temporary_LoanletterSC2]
TRUNCATE TABLE [dbo].[ii_incl_apps]
TRUNCATE TABLE [dbo].[complno]
TRUNCATE TABLE [dbo].[temporary_LoanletterSC3]
TRUNCATE TABLE [dbo].[TallymanProducts]
TRUNCATE TABLE [dbo].[StoreCardBranchQualRulesAudit]
TRUNCATE TABLE [dbo].[LineOracleExHistory]
TRUNCATE TABLE [Warranty].[LinkProduct]
TRUNCATE TABLE [Merchandising].[WTRWarrantyReturnValuesView_Temp]
TRUNCATE TABLE [dbo].[ii_joindefs]
TRUNCATE TABLE [dbo].[complstring]
TRUNCATE TABLE [dbo].[DataCleanLog]
TRUNCATE TABLE [dbo].[temporary_LoanletterSCO]
TRUNCATE TABLE [Sales].[LinkedContracts]
TRUNCATE TABLE [dbo].[RebateForecast_errorlog]
TRUNCATE TABLE [dbo].[RItemp_RawProductHeirarchy]
TRUNCATE TABLE [Warranty].[LinkWarranty]
TRUNCATE TABLE [SalesManagement].[SalesPersonTargets]
TRUNCATE TABLE [dbo].[ii_locks]
TRUNCATE TABLE [Merchandising].[SkuMapping]
--TRUNCATE TABLE [dbo].[RebateForecast_PeriodEndDates]
TRUNCATE TABLE [dbo].[ii_menuargs]
TRUNCATE TABLE [dbo].[CorrectedPayments]
TRUNCATE TABLE [dbo].[StockInfoAudit]
TRUNCATE TABLE [dbo].[RebateforecastA]
TRUNCATE TABLE [Merchandising].[GoodsReceiptProduct]
TRUNCATE TABLE [dbo].[ii_longremarks]
TRUNCATE TABLE [dbo].[COVID_Instalplan_DataFix_Update]
TRUNCATE TABLE [dbo].[cos_error]
TRUNCATE TABLE [dbo].[DDRejectFile]
TRUNCATE TABLE [Merchandising].[NegativeStockSnapshot]
TRUNCATE TABLE [dbo].[RebateforecastB]
TRUNCATE TABLE [dbo].[ii_objects]
TRUNCATE TABLE [dbo].[StockPriceAudit]
TRUNCATE TABLE [dbo].[RebateforecastC]
TRUNCATE TABLE [dbo].[OracleExportHist]
TRUNCATE TABLE [dbo].[ii_qbfnames]
TRUNCATE TABLE [dbo].[temp_agreement]
TRUNCATE TABLE [Merchandising].[CintRun]
TRUNCATE TABLE [dbo].[RebateforecastD]
TRUNCATE TABLE [dbo].[ii_rcommands]
TRUNCATE TABLE [dbo].[DDPaymentFile]
TRUNCATE TABLE [dbo].[summary4_non]
TRUNCATE TABLE [dbo].[rebates]
TRUNCATE TABLE [dbo].[RICommittedStockRepo]
TRUNCATE TABLE [dbo].[ii_rep_bitmaps]
TRUNCATE TABLE [dbo].[ScheduleToBookings]
TRUNCATE TABLE [Sales].[DiscountLimit]
TRUNCATE TABLE [dbo].[Rebates_AsAt]
TRUNCATE TABLE [dbo].[StoreCardLastAppSuccess]
TRUNCATE TABLE [dbo].[ii_rep_documents]
TRUNCATE TABLE [dbo].[BehaveRescoreExclude]
TRUNCATE TABLE [dbo].[temp_calcpcent]
TRUNCATE TABLE [dbo].[ii_rep_idtbl]
TRUNCATE TABLE [Merchandising].[ProductStockLevel]
TRUNCATE TABLE [Communication].[SandBoxMails]
TRUNCATE TABLE [dbo].[WarrantyReturnCodesAudit]
--TRUNCATE TABLE [dbo].[Rebates_Total]
TRUNCATE TABLE [dbo].[ii_rep_images]
TRUNCATE TABLE [dbo].[RItemp_RawProductLoadRepo]
TRUNCATE TABLE [dbo].[Courtspersonauditlog]
TRUNCATE TABLE [dbo].[RICommittedStock]
TRUNCATE TABLE [dbo].[temp_cashint]
TRUNCATE TABLE [Merchandising].[CintsError]
TRUNCATE TABLE [dbo].[ii_rep_imgdoc]
TRUNCATE TABLE [dbo].[MissingDels_67556]
TRUNCATE TABLE [dbo].[ii_rep_include]
TRUNCATE TABLE [Service].[LabourCostMatrix]
TRUNCATE TABLE [dbo].[RIRepossessions]
TRUNCATE TABLE [dbo].[CashandGoTopSellStock]
TRUNCATE TABLE [dbo].[refversion]
TRUNCATE TABLE [dbo].[scheduledExport]
TRUNCATE TABLE [dbo].[ii_rep_locks]
TRUNCATE TABLE [dbo].[RIDeliveriesReturns]
TRUNCATE TABLE [Communication].[BlackEmailList]
TRUNCATE TABLE [dbo].[temp_delivery_war]
TRUNCATE TABLE [dbo].[temp_prodload]
TRUNCATE TABLE [dbo].[remexpress]
TRUNCATE TABLE [Merchandising].[GoodsReceiptDirectProduct]
TRUNCATE TABLE [dbo].[ii_rep_strings]
TRUNCATE TABLE [Service].[PartsCostMatrix]
TRUNCATE TABLE [dbo].[OracleExportHisttemp]
TRUNCATE TABLE [dbo].[summary4_sec]
TRUNCATE TABLE [dbo].[temp_dupinstalplan]
TRUNCATE TABLE [dbo].[RemoveOS_67556]
TRUNCATE TABLE [dbo].[ii_reports]
TRUNCATE TABLE [dbo].[RItemp_RawKitload]
TRUNCATE TABLE [dbo].[temp_dupinstalplan_bak]
TRUNCATE TABLE [dbo].[RemoveOS_67748]
TRUNCATE TABLE [dbo].[LoyaltyCancellation]
TRUNCATE TABLE [dbo].[ii_sequence_values]
TRUNCATE TABLE [Sales].[OrderReturnItem]
TRUNCATE TABLE [dbo].[TermsTypeBandAuditPrevious]
TRUNCATE TABLE [dbo].[temp_f653_proposal]
TRUNCATE TABLE [dbo].[loyaltyrejections]
TRUNCATE TABLE [dbo].[ii_srcobj_encoded]
TRUNCATE TABLE [dbo].[RItemp_RawProductImport]
TRUNCATE TABLE [dbo].[temp_f653_proposal2]
TRUNCATE TABLE [dbo].[SR_AllocationAudit]
TRUNCATE TABLE [dbo].[Report_Dates]
TRUNCATE TABLE [dbo].[StoreCardAudit]
TRUNCATE TABLE [Warranty].[WarrantyReturnFilter]
TRUNCATE TABLE [dbo].[loyaltyaudit]
TRUNCATE TABLE [dbo].[ii_stored_bitmaps]
TRUNCATE TABLE [dbo].[RItemp_RawProductImportRepo]
TRUNCATE TABLE [dbo].[temp_promoload]
TRUNCATE TABLE [Financial].[CintOrderReceiptMessage]
TRUNCATE TABLE [dbo].[loyaltyvoucher]
TRUNCATE TABLE [dbo].[ii_stored_strings]
TRUNCATE TABLE [dbo].[RItemp_RawProductImportError]
TRUNCATE TABLE [dbo].[temp_hldjnt_1]
TRUNCATE TABLE [dbo].[ii_trim]
TRUNCATE TABLE [dbo].[temp_hldjnt_2]
--TRUNCATE TABLE [dbo].[ReportParameters]
TRUNCATE TABLE [dbo].[ii_vqjoins]
TRUNCATE TABLE [dbo].[RItemp_Kitload]
TRUNCATE TABLE [dbo].[COVID_chargesdata_DataFix_Update]
TRUNCATE TABLE [dbo].[rescorenumber]
TRUNCATE TABLE [dbo].[ii_vqtabcols]
TRUNCATE TABLE [SalesManagement].[FollowUpCall]
TRUNCATE TABLE [dbo].[temp_hldjnt_3]
TRUNCATE TABLE [Financial].[GoodsReceiptProductMessage]
TRUNCATE TABLE [dbo].[temp_cmload]
TRUNCATE TABLE [dbo].[ii_vqtables]
TRUNCATE TABLE [dbo].[RItemp_RawPOload]
TRUNCATE TABLE [dbo].[temp_interest]
TRUNCATE TABLE [dbo].[temp_CMCondition_bak]
TRUNCATE TABLE [dbo].[iialt_columns]
TRUNCATE TABLE [dbo].[summary4_New_non]
TRUNCATE TABLE [dbo].[temp_instalplanbak63980]
TRUNCATE TABLE [dbo].[Installation]
TRUNCATE TABLE [dbo].[temp_CMSMS_bak]
TRUNCATE TABLE [dbo].[RFCardPrint]
TRUNCATE TABLE [Warranty].[WarrantyContact]
TRUNCATE TABLE [dbo].[iidatabase]
TRUNCATE TABLE [dbo].[temp_interfacevaluebak363]
TRUNCATE TABLE [SalesManagement].[IconTypes]
TRUNCATE TABLE [dbo].[iidb_comments]
TRUNCATE TABLE [Service].[Resolution]
TRUNCATE TABLE [dbo].[temp_ipcnt]
TRUNCATE TABLE [dbo].[rowlevellocked]
TRUNCATE TABLE [dbo].[iidb_subcomments]
TRUNCATE TABLE [Merchandising].[HierarchyTagCondition]
TRUNCATE TABLE [dbo].[temp_iplatest]
TRUNCATE TABLE [Financial].[StockAdjustmentProductMessage]
TRUNCATE TABLE [dbo].[iidbcapabilities]
TRUNCATE TABLE [Merchandising].[RetailPrice]
TRUNCATE TABLE [dbo].[iigw_datatype_map]
TRUNCATE TABLE [dbo].[Mergedtechnician]
TRUNCATE TABLE [dbo].[temp_ipdups]
TRUNCATE TABLE [dbo].[SalesCommission]
TRUNCATE TABLE [dbo].[autoupdatelog]
TRUNCATE TABLE [dbo].[iigwdba]
TRUNCATE TABLE [dbo].[Migtechnician]
TRUNCATE TABLE [dbo].[temp_ipmaxtid]
TRUNCATE TABLE [dbo].[csk_get_audit]
TRUNCATE TABLE [dbo].[temp_CMActionRights_bak]
TRUNCATE TABLE [dbo].[iigwprocdefaults]
TRUNCATE TABLE [dbo].[temp_associatedload]
TRUNCATE TABLE [dbo].[Temp_Matrix]
TRUNCATE TABLE [dbo].[temp_CMZone_bak]
TRUNCATE TABLE [dbo].[SalesCommissionMultiSPIFFRates]
TRUNCATE TABLE [dbo].[iigwprocedures]
TRUNCATE TABLE [Merchandising].[CostPrice]
TRUNCATE TABLE [dbo].[summary4_New_sec]
TRUNCATE TABLE [dbo].[temp_menuoption]
TRUNCATE TABLE [Financial].[VendorReturnProductMessage]
TRUNCATE TABLE [dbo].[temp_CmZoneAllocation_bak]
TRUNCATE TABLE [dbo].[SalesCommissionRates]
TRUNCATE TABLE [Merchandising].[VendorReturnProduct]
TRUNCATE TABLE [dbo].[iigwprocparams]
TRUNCATE TABLE [Service].[SupplierCost]
TRUNCATE TABLE [dbo].[SalesCommissionRatesAudit]
TRUNCATE TABLE [dbo].[iigwuser]
TRUNCATE TABLE [dbo].[Equifax_ScoringOperand]
TRUNCATE TABLE [dbo].[InstallationResolution]
TRUNCATE TABLE [dbo].[salesnotrap]
TRUNCATE TABLE [dbo].[iihistograms]
TRUNCATE TABLE [dbo].[temp_summary4export]
TRUNCATE TABLE [dbo].[iiindex_columns]
TRUNCATE TABLE [dbo].[iiindexes]
TRUNCATE TABLE [Service].[ZoneUser]
TRUNCATE TABLE [dbo].[iiprocedures]
TRUNCATE TABLE [dbo].[DataCleanSummary]
TRUNCATE TABLE [dbo].[iistats]
TRUNCATE TABLE [dbo].[DataFix]
TRUNCATE TABLE [dbo].[temp_countrymaintenance]
TRUNCATE TABLE [dbo].[temp_result]
TRUNCATE TABLE [dbo].[iisynonyms]
TRUNCATE TABLE [dbo].[dataline]
TRUNCATE TABLE [dbo].[Equifax_Variable]
TRUNCATE TABLE [dbo].[temp_statchge]
TRUNCATE TABLE [Merchandising].[ProductHierarchy]
TRUNCATE TABLE [dbo].[summary4b_New_sec]
TRUNCATE TABLE [dbo].[InstallationSparePart]
TRUNCATE TABLE [dbo].[temp_nonstockprodload]
TRUNCATE TABLE [Service].[Holiday]
TRUNCATE TABLE [SalesManagement].[SmsToSend]
TRUNCATE TABLE [dbo].[scorexdata_temp]
TRUNCATE TABLE [dbo].[NonStockDeletionDates]
TRUNCATE TABLE [dbo].[LicenseAudit]
TRUNCATE TABLE [Service].[TechnicianBooking]
TRUNCATE TABLE [dbo].[summary4b_New_non]
TRUNCATE TABLE [dbo].[tempreceipt]
TRUNCATE TABLE [dbo].[tempTT]
TRUNCATE TABLE [dbo].[TempServiceRequestImport]
TRUNCATE TABLE [dbo].[InstallationChargeAnalysis]
TRUNCATE TABLE [Financial].[WarrantyMessage]
TRUNCATE TABLE [dbo].[ScriptRunTime]
TRUNCATE TABLE [Warranty].[Renewal]
TRUNCATE TABLE [Merchandising].[StockAdjustmentProduct]
TRUNCATE TABLE [dbo].[TermsTypeBak]
TRUNCATE TABLE [Sales].[OrderPayment]
TRUNCATE TABLE [Merchandising].[ProductSupplier]
TRUNCATE TABLE [dbo].[summary4c_New_non]
TRUNCATE TABLE [dbo].[InstallationBooking]
TRUNCATE TABLE [dbo].[securitised_report]
TRUNCATE TABLE [Merchandising].[PromotionHierarchy]
TRUNCATE TABLE [dbo].[del_thres_reached]
TRUNCATE TABLE [dbo].[SecuritisedSummaryInterface]
TRUNCATE TABLE [dbo].[interface_financial]
TRUNCATE TABLE [dbo].[CMReminder]
TRUNCATE TABLE [dbo].[del_thres_reached_before]
TRUNCATE TABLE [dbo].[termstypehistory]
TRUNCATE TABLE [dbo].[server]
TRUNCATE TABLE [Communication].[SmsToSend]
TRUNCATE TABLE [Merchandising].[StockRequisitionProduct]
TRUNCATE TABLE [dbo].[Delinquency]
TRUNCATE TABLE [dbo].[tempstatustype]
TRUNCATE TABLE [dbo].[interfaceerror]
TRUNCATE TABLE [Merchandising].[StockCountHierarchy]
--TRUNCATE TABLE [dbo].[interfacevalue]
TRUNCATE TABLE [dbo].[deliveryletter]
TRUNCATE TABLE [dbo].[intratehistory_pre_dataclean]
TRUNCATE TABLE [dbo].[CMFraudDetail]
TRUNCATE TABLE [dbo].[deliveryload]
TRUNCATE TABLE [dbo].[itemdetailno]
TRUNCATE TABLE [dbo].[summary4c_New_sec]
TRUNCATE TABLE [dbo].[initload]
TRUNCATE TABLE [Payments].[CurrencyCodes]
TRUNCATE TABLE [dbo].[TM_Header]
TRUNCATE TABLE [Merchandising].[CintOrderStats]
TRUNCATE TABLE [dbo].[sms]
TRUNCATE TABLE [dbo].[DeliveryReprint]
TRUNCATE TABLE [dbo].[temp_AddtoReceivable]
TRUNCATE TABLE [dbo].[TM_Product]
TRUNCATE TABLE [dbo].[source]
TRUNCATE TABLE [dbo].[intratehistorydeletedtemp]
TRUNCATE TABLE [Sales].[OrderReturnPayment]

END

GO
/****** Object:  StoredProcedure [dbo].[Step3_StopSaleProcess]    Script Date: 8/5/2020 5:37:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Step3_StopSaleProcess]
As
BEGIN

	Delete from StockQuantity where itemno not in ('DT','Loan','AD','RB','STAX','ADDCR')

END

GO
/****** Object:  StoredProcedure [dbo].[Step4_DeleteNonClAccount]    Script Date: 8/5/2020 5:37:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Step4_DeleteNonClAccount] 
(
	@ChunkLength int = 25000
)
AS
BEGIN
	DECLARE @from INT, @to int, @loop int;
	 
	SET @from = 1;
	SET @to = @ChunkLength;
	SELECT @loop = COUNT(1) FROM [TempNonClAcc];
  
	IF OBJECT_ID('tempdb..#temprn') IS NOT NULL
	    Drop TABLE #temprn
	ELSE
	
		SELECT ROW_NUMBER() OVER (ORDER BY acctno) rn, acctno INTO #tmprn FROM [TempNonClAcc] with (NOLOCK)-- 267953
	
	
	WHILE @loop > 0
	BEGIN

	 
		IF OBJECT_ID('tempdb..#tmp') IS NOT NULL
		begin
		    Drop TABLE #tmp;
		end
		
		SELECT acctno INTO #tmp FROM #tmprn WITH (NOLOCK) WHERE rn BETWEEN @from AND @to				
		
		delete from dbo.termstypeaudit where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.as400fin where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.bailaction where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.accountmonths2 where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.status where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.lineitem where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.letter where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.delivery where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.CMStrategyAcct where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.LineitemAudit where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.cheqfintranslnk where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.as400trans where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.proposalflag where  Acctno in (select Acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.CMWorklistsAcct where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.sms where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.DocumentReprint where  AcctNo in (select AcctNo from #tmp WITH (NOLOCK)) 
		delete from dbo.agreement where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.custacct where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.proposalaudit where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.Summary1_MR where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.CMStrategyVariablesEntry where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.CMStrategyVariablesExit where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.CMStrategyVariablesSteps where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.bailactionPTP where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.follupalloc where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.agreementAudit where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.addtoletter where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from Warranty.WarrantyPotentialSale where  CustomerAccount in (select CustomerAccount from #tmp WITH (NOLOCK)) 
		delete from dbo.setlstatus where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.DelAuthoriseAudit where  Acctno in (select Acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.ProposalRef where  AcctNo in (select AcctNo from #tmp WITH (NOLOCK)) 
		delete from dbo.lineitemosdelnotes where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.chargesdata where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.instalplan where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.proposal where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.settled_before_thres where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.instalplanAudit where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.bailactionMaxAction where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.acctcode where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.DiscountsAuthorised where  AcctNo in (select AcctNo from #tmp WITH (NOLOCK)) 
		delete from dbo.ScheduleAudit where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.newlineitem where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.zz_SaveScorexdata3 where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.zz_SaveApplication where  Acctno in (select Acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.summary2_non where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.finxfr where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.cashiertotalsincome where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.bailiffcommn where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.unposteddels where  acctno in (select acctno from #tmp WITH (NOLOCK))  
		delete from dbo.invoiceDetails where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.ArrearsDaily where  Acctno in (select Acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.bailiffCommnPaid where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.mjkc_temp where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.CustomerScoreHist where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.Summary1AcctStatus where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.ICAnalysisReport where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.SalesCommission where  AcctNo in (select AcctNo from #tmp WITH (NOLOCK)) 
		delete from dbo.CMStrategySOD where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.stat_temp01 where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.ScorexAppnumber where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.bailiffcommn_pre2005 where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.summary16 where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.transactionaudit where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.temp_Summary1_MR where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.CashAndGoReceipt where  AcctNo in (select AcctNo from #tmp WITH (NOLOCK)) 
		delete from dbo.cancellation where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.itemdetails where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.temp_calcpcent where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.temp_hldjnt_1 where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.SR_Summary where  Acctno in (select Acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.newproposal where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.BailiffCommnDeleted where  AcctNo in (select AcctNo from #tmp WITH (NOLOCK)) 
		delete from dbo.DeliveryReprint where  AcctNo in (select AcctNo from #tmp WITH (NOLOCK)) 
		delete from dbo.spa where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.AutoSettled_Account_Backup where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.Delinquency where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.SR_ServiceRequest where  AcctNo in (select AcctNo from #tmp WITH (NOLOCK)) 
		delete from dbo.ReferralOverride where  AcctNo in (select AcctNo from #tmp WITH (NOLOCK)) 
		delete from dbo.downstatus where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.ExtractedApps where  Acctno in (select Acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.fintransAddtos where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.SR_ChargeAcct where  AcctNo in (select AcctNo from #tmp WITH (NOLOCK)) 
		delete from dbo.salesnotrap where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.revisedhist where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.lineitem_amend where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.tempreceipt where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.CollectionReason where  AcctNo in (select AcctNo from #tmp WITH (NOLOCK)) 
		delete from dbo.instantcreditflag where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.order_removed where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.delauthorise where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.del_thres_reached where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.temp_AddtoReceivable where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.fintrans_backup where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.FACTTRANS_V10Upg where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.line_back where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.ScheduleRemoval where  AcctNo in (select AcctNo from #tmp WITH (NOLOCK)) 
		delete from dbo.RebateForecast_byaccount_previous_previous where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.RebateForecast_byaccount_yearend where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.RebateForecast_byaccount_previous where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.lineitembfCollection where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.KitCLineItem where  AcctNo in (select AcctNo from #tmp WITH (NOLOCK)) 
		delete from dbo.zz_SaveScorexdata where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.SR_CustomerInteraction where  AcctNo in (select AcctNo from #tmp WITH (NOLOCK)) 
		delete from dbo.CMWorklistSOD where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.RebateForecast_byaccount_current where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.summary14 where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.rebates where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.CorrectedPayments where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.temp_interest where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.liw_back where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.zz_SaveScorexdata1 where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.CLANewPaymentDetails where  AcctNo in (select AcctNo from #tmp WITH (NOLOCK)) 
		delete from dbo.baldue12_full where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.CashLoan where  AcctNo in (select AcctNo from #tmp WITH (NOLOCK)) 
		delete from dbo.Exchange where  AcctNo in (select AcctNo from #tmp WITH (NOLOCK)) 
		delete from dbo.CashLoanDisbursement where  AcctNo in (select AcctNo from #tmp WITH (NOLOCK)) 
		delete from dbo.Delivery_Error_log where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.baldue12_less where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.scorexdata_temp where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.Application where  Acctno in (select Acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.DataCleanLog where  Acctno in (select Acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.FinTransAccount where  AcctNo in (select AcctNo from #tmp WITH (NOLOCK)) 
		delete from dbo.temp_AccountstoBeDeallocated where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.setldates where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.agreementbfcollection where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.zz_SaveScorexdata2 where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.KitLineItem where  AcctNo in (select AcctNo from #tmp WITH (NOLOCK)) 
		delete from dbo.fintrans_new_income where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.fintransnote where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.unposteddelsDaily where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.ServiceChargeAcct where  AcctNo in (select AcctNo from #tmp WITH (NOLOCK)) 
		delete from dbo.CollectionNoteChange where  AcctNo in (select AcctNo from #tmp WITH (NOLOCK)) 
		delete from dbo.fintransLastSummary where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.lineitemwarrantieserased where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.IgnoreCRECRF where  AcctNo in (select AcctNo from #tmp WITH (NOLOCK)) 
		delete from dbo.LastFactExport where  AcctNo in (select AcctNo from #tmp WITH (NOLOCK)) 
		delete from dbo.manualcdv where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.duplicatenotes where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.summary15 where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.summary7 where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.scorexdata where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.BDWAudit where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.schedule where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.STL_Status where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.BDWPending where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.FinTransExchange where  AcctNo in (select AcctNo from #tmp WITH (NOLOCK)) 
		delete from dbo.BailliffUnsuccessful where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.SPASummary where  Acctno in (select Acctno from #tmp WITH (NOLOCK)) -- remove
		delete from dbo.badagr where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.temp_cashint where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.ProposalDuplicates_68640 where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.temp_acct where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.temp_agreement where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.STL_AddTo where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.AccountLocking where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.facttrans where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.ProposalDuplicates_NoFlags_68640 where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.STL_SpecialAccts where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.fintrans where  acctno in (select acctno from #tmp WITH (NOLOCK)) 
		delete from dbo.acct where  acctno in (select acctno from #tmp WITH (NOLOCK)) 

		SET @loop = @loop - @ChunkLength;
		SET @from = @from + @ChunkLength;
		SET @to = @to + @ChunkLength
	 print '------------------------'

 
	END
END


GO
/****** Object:  StoredProcedure [dbo].[Step5_DeleteNonClCustomer]    Script Date: 8/5/2020 5:37:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Step5_DeleteNonClCustomer] 
(
	@ChunkLength int = 25000
)
AS
BEGIN
	DECLARE @from INT, @to int, @loop int;
	 
	SET @from = 1;
	SET @to = @ChunkLength;
	SELECT @loop = COUNT(1) FROM [TempNonClCust];
  
	IF OBJECT_ID('tempdb..#temprn') IS NOT NULL
	    Drop TABLE #temprn
		
	SELECT ROW_NUMBER() OVER (ORDER BY custid) rn, custid INTO #tmprn  FROM [TempNonClCust] WITH (NOLOCK) -- 267953
		
	WHILE @loop > 0
	BEGIN
	 
  print convert(varchar(20), @from) + ' : ' +convert(varchar(20), @to) + ' : ' + convert(varchar(20),@loop)
	 
		IF OBJECT_ID('tempdb..#tmp') IS NOT NULL
		    Drop TABLE #tmp
		
		SELECT custid INTO #tmp FROM #tmprn WITH (NOLOCK) WHERE rn BETWEEN @from AND @to
		
		delete from dbo.proposalflag where custid in (select custid from #tmp WITH (NOLOCK))
		delete from dbo.CustAddressAudit where custid in (select custid from #tmp WITH (NOLOCK))
		delete from dbo.custacct where custid in (select custid from #tmp WITH (NOLOCK))
		delete from dbo.proposalaudit where custid in (select custid from #tmp WITH (NOLOCK))
		delete from dbo.custtelAudit where custid in (select custid from #tmp WITH (NOLOCK))
		
		delete from Warranty.WarrantyPotentialSale where CustomerId in (select custid from #tmp WITH (NOLOCK))
		delete from dbo.custtel where custid in (select custid from #tmp WITH (NOLOCK))
		delete from dbo.proposal where custid in (select custid from #tmp WITH (NOLOCK))
		delete from dbo.custaddress where custid in (select custid from #tmp WITH (NOLOCK))
		delete from dbo.employment where custid in (select custid from #tmp WITH (NOLOCK))
		delete from dbo.proposalflag_archive where custid in (select custid from #tmp WITH (NOLOCK))
		delete from dbo.zz_SaveApplication where CustomerId in (select custid from #tmp WITH (NOLOCK))
		
		delete from dbo.CustomerScoreHist where Custid in (select Custid from #tmp WITH (NOLOCK))
		delete from dbo.ICAnalysisReport where custid in (select custid from #tmp WITH (NOLOCK))
		delete from dbo.newcustaddress where custid in (select custid from #tmp WITH (NOLOCK))
		delete from dbo.bankacct where custid in (select custid from #tmp WITH (NOLOCK))
		delete from dbo.ScorexAppnumber where custid in (select custid from #tmp WITH (NOLOCK))
		delete from dbo.referral where custid in (select custid from #tmp WITH (NOLOCK))
		
		
		delete from SalesManagement.Call where CustomerId in (select custid from #tmp WITH (NOLOCK))
		delete from dbo.newproposal where custid in (select custid from #tmp WITH (NOLOCK))
		delete from dbo.Delinquency where CustId in (select CustId from #tmp WITH (NOLOCK))
		delete from dbo.SR_ServiceRequest where CustId in (select CustId from #tmp WITH (NOLOCK))
		delete from dbo.ReferralOverride where CustId in (select CustId from #tmp WITH (NOLOCK))
		delete from dbo.SR_Customer where CustId in (select CustId from #tmp WITH (NOLOCK))
		delete from dbo.CustomerAdditionalDetails where Custid in (select Custid from #tmp WITH (NOLOCK))
		delete from Communication.SmsUnsubcription where CustomerId in (select custid from #tmp WITH (NOLOCK))
		delete from dbo.summary3 where custid in (select custid from #tmp WITH (NOLOCK))
		delete from Sales.OrderCustomer where CustomerId in (select custid from #tmp WITH (NOLOCK))
		delete from dbo.instantcreditflag where custid in (select custid from #tmp WITH (NOLOCK))
		delete from dbo.SR_CustomerInteraction where CustomerId in (select custid from #tmp WITH (NOLOCK))
		delete from dbo.summary14 where custid in (select custid from #tmp WITH (NOLOCK))
		delete from dbo.CashLoan where Custid in (select Custid from #tmp WITH (NOLOCK))
		delete from dbo.CashLoanDisbursement where CustId in (select CustId from #tmp WITH (NOLOCK))
		delete from dbo.prevname where custid in (select custid from #tmp WITH (NOLOCK))
		delete from dbo.custcatcode where custid in (select custid from #tmp WITH (NOLOCK))
		delete from dbo.scorexdata_temp where custid in (select custid from #tmp WITH (NOLOCK))
		delete from dbo.Application where CustomerId in (select custid from #tmp WITH (NOLOCK))
		delete from dbo.DataCleanLog where Custid in (select Custid from #tmp WITH (NOLOCK))
		delete from Service.Payment where CustomerId in (select custid from #tmp WITH (NOLOCK))
		delete from dbo.customerRFlimitoverride where custid in (select custid from #tmp WITH (NOLOCK))
		delete from dbo.temp_custaddress2105 where custid in (select custid from #tmp WITH (NOLOCK))
		delete from dbo.ReferralRules where custid in (select custid from #tmp WITH (NOLOCK))
		delete from dbo.LastFactExport where custid in (select custid from #tmp WITH (NOLOCK))
		delete from dbo.temporary_LoanletterSC1 where CustId in (select CustId from #tmp WITH (NOLOCK))
		delete from dbo.CustomerLocking where CustID in (select CustID from #tmp WITH (NOLOCK))
		delete from dbo.temporary_LoanletterSC2 where CustId in (select CustId from #tmp WITH (NOLOCK))
		delete from dbo.BailliffUnsuccessful where custid in (select custid from #tmp WITH (NOLOCK))
		delete from dbo.ProposalDuplicates_68640 where custid in (select custid from #tmp WITH (NOLOCK))
		delete from dbo.ProposalDuplicates_NoFlags_68640 where custid in (select custid from #tmp WITH (NOLOCK))
		
		
		
		
		delete from SalesManagement.CustomerSalesPerson where CustomerId in (select custid from #tmp WITH (NOLOCK))
		delete from dbo.custtelTable where custid in (select custid from #tmp WITH (NOLOCK))
		
		delete from dbo.customer where custid in (select custid from #tmp WITH (NOLOCK))

		SET @loop = @loop - @ChunkLength;
		SET @from = @from + @ChunkLength;
		SET @to = @to + @ChunkLength
	 print '------------------------'
	
 
	END
END

GO
/****** Object:  StoredProcedure [dbo].[Step6_DenyNonCLPermission]    Script Date: 8/5/2020 5:37:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Step6_DenyNonCLPermission]
As
BEGIN

update rp
	set rp.[deny] = 1
	from
		[admin].[Role] r
		inner join [Admin].[RolePermission] rp on r.Id = rp.RoleId
		inner join [Admin].[Permission] p on rp.PermissionId= p.Id
	where p.Name not in ('Account Details - Create Bailif Action'
					,'Account Details - Show Agreement Changes'
					,'Add Customer/Account Codes'
					,'Allow Access for Collectors'
					,'Allow Access for Telephone Callers'
					,'Authorise Delivery'
					,'Authorise Delivery - Clear Proposal'
					,'Authorise Delivery - Credit accounts'
					,'Authorise Delivery - View Underwriter Information'
					,'Bad Debt Write Off Review'
					,'Bad Debt Write Off Review - Accept For Write Off'
					,'Bad Debt Write Off Review - Reject For Write Off'
					,'Bailiff Commission Maintenance'
					,'Bailiff Review'
					,'Bailiff Review - Allocate Single Account'
					,'Bailiff Review - Override Maximum Allocation'
					,'Bailiff Review - Search By Account Number'
					,'Bailiff Review - View References'
					,'Behavioural Scoring Results'
					,'Branch - Bank Deposits'
					,'Branch - Details'
					,'Branch - Edit'
					,'Branch - Store Card Qualification Rule'
					,'Branch - Storecard Interest Rates'
					,'Branch - View'
					,'Calculate Bailiff Commission'
					,'Cancel Account'
					,'Cash Loan Application'
					,'Cash Loan Disbursement'
					,'Cashier Deposits'
					,'Cashier Disbursements - Cashier Functions'
					,'Cashier Disbursements - Full Control'
					,'Cashier Totals - Print Cashier Totals By Branch'
					,'Cashier Totals - Print Cashier Totals By Employee'
					,'Cashier Totals - Save Unreconciled Cashier Totals'
					,'Cashier Totals - Summary Tab'
					,'Change Customer ID'
					,'Change Terms Type Band'
					,'Check Customer Reference'
					,'Cheque Return'
					,'Collection Account Analysis - Allocation'
					,'Copy Staff Allocations to Excel'
					,'Create RF Accounts'
					,'Credit Staff Allocation'
					,'Credit Staff Allocation - Load Other Branches'
					,'Customer - Generate SPECIAL Account'
					,'Customer Details - Add To'
					,'Customer Details - Add To Reversal'
					,'Customer Details - Bank'
					,'Customer Details - Employment'
					,'Customer Details - Financial'
					,'Customer Details - Previous'
					,'Customer Details - Refer Rejected Account'
					,'Customer Details - Residential'
					,'Customer Details - Sanction Accounts'
					,'Customer Details - Unblock Credit'
					,'Customer Pickup - Failed'
					,'Customer Search'
					,'Delete Reference Data'
					,'Document Confirmation'
					,'Document Confirmation - View Previous Details'
					,'Employee Appears in Cashier Deposits'
					,'Enable Customer'
					,'Enable Product'
					,'End Of Day - Configuration'
					,'End of Day - Tasks EOD Delete'
					,'Factoring Reports'
					,'Financial Interface Report'
					,'Financial Transactions Query'
					,'Flag Customer As Bankrupt'
					,'General Financial Transactions'
					,'Incomplete Credit Applications'
					,'Incomplete Credit Applications - View Referral Details'
					,'Letter Merge'
					,'Location View'
					,'Location Edit'
					,'Monitor Bookings'
					,'Monitor Bookings - Allow Live Database'
					,'Monitor Outstanding Deliveries'
					,'New Customer'
					,'Number Generation'
					,'Open Cash Till'
					,'Open Cash Till on Log in'
					,'Payments'
					,'Payments - Cheque Authorisation'
					,'Payments - Credit Fee Waiver'
					,'Payments - Credit Fee Waiver(Combined RF)'
					,'Payments - View Customer details'
					,'Print Invoice'
					,'Print Load'
					,'Print Service Request'
					,'Referral - Override Credit Limit'
					,'Refunds and Corrections'
					,'Refunds and Corrections - Enter Corrections'
					,'Refunds and Corrections - Enter Refunds'
					,'Remove Customer-Account link'
					,'Reopen Document Confirmation'
					,'Reopen Stage 1'
					,'Reopen Stage 2'
					,'Report - Delivery Performance Summary'
					,'Report - Products Without Warranties'
					,'Report - Sales Comparison'
					,'Report - Summary Update Control Report'
					,'Re-Print Action Sheet'
					,'Reprint Bailiff Commission'
					,'Reverse Cancellation'
					,'Revise Account'
					,'Revise Account - Change Terms Type'
					,'Revise Account - Revise Cash Accounts'
					,'Revise Account - Revise Settled Accounts'
					,'Sanction Stage 1'
					,'Sanction Stage 1 - Manual Refer'
					,'Sanction Stage 2'
					,'Save Service Requests'
					,'Scoring - Edit scoreband Matrix'
					,'Scoring - Import scoring Matrix'
					,'Scoring - Import Scoring Rules'
					,'Service Request - Customer Interaction'
					,'Service Request - Deposit Update Allowed'
					,'Service Request - Enable Deposit Update'
					,'Service Request - Make Payments'
					,'Sessions - Kill User Session '
					,'Sessions - User Sessions'
					,'SMS Setup'
					,'Staff Maintainance - Change password'
					,'Staff Maintainance - Create User'
					,'Staff Maintainance - Edit'
					,'Staff Maintainance - Lock User'
					,'Staff Maintainance - Password Reset For other users'
					,'Status Code Maintenance'
					,'Status Code Maintenance - Manual Write Off'
					,'Strategy Configuration'
					,'Summary Update Control Report'
					,'Sys Config - Account Number Control'
					,'Sys Config - Code Maintenance'
					,'Sys Config - Country Maintainance'
					,'Sys Config - Customise Mandatory Fields'
					,'Sys Config - Delivery Area Maintenance'
					,'Sys Config - Payment File Definition'
					,'Sys Config - Pick Lists'
					,'Sys Config - Screen Translation'
					,'Sys Config - Stock Item Translation'
					,'Sys Config - Store Card Batch Print'
					,'Sys Config - View Roles'
					,'Sys Config - Edit Roles'
					,'SysConfig - Audit'
					,'SysConfig - Bank Maintainance'
					,'SysConfig - Config File Maintenance'
					,'SysConfig - Sales Commission Maintenance'
					,'SysConfig - Sales Commission -Spiffs'
					,'Telephone Action'
					,'Telephone Action - Apply to all accounts'
					,'Telephone Action - View Multiple Accounts'
					,'Telephone Action - View References'
					,'Temporary Receipt Allocation'
					,'Temporary Receipt Investigation'
					,'Temporary Receipts'
					,'Transaction Journal Enquiry'
					,'Transactions - Activate Terms type'
					,'Transactions - Edit Terms type'
					,'Transactions - Edit Transaction codes'
					,'Transactions - Exchange Rates'
					,'Transactions - Overages and Shortages'
					,'Transactions - Transaction Type Maintenance'
					,'Transactions - View Terms type'
					,'Transfer Transactions'
					,'Underwriter Referral'
					,'Unpaid Accounts - Current Branch'
					,'Unpaid Accounts - Current User'
					,'Update Date Due'
					,'Update Date Due - Date First > 2 Months After Del Date'
					,'Users - Search'
					,'View Account Details'
					,'View Credit Score Result'
					,'View Customer Details'
					,'View Proposal From DA'
					,'View Proposal from IC'
					,'View Service Request'
					,'View user security Audit'
					,'Work List Setup'
					,'Zone Allocation Automation'
					,'Edit DecisionTables'
					,'Provisions Screen'
					,'Location View delegate'
					,'End of Day'
					,'Payment - Manual Store Card Entry'
					,'Cashier Totals - View Branch Tab'
					,'Re-index customer'
					,'Re-index customer delegate'
					,'Non Stocks - View Items')
END

GO