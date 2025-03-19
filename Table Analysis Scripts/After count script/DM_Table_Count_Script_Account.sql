-------******************************************************************************************************  
/*************************************************************************

	Script Name  : DM_Table_Count_Script_Account.sql
	Country		 : Dominica
	Created By   : Yash Sagar Mehta             
	Description  : This script take count of entries from tables           
	Date         : 15-03-2025           


**************************************************************************/
 
-------******************************************************************************************************  
-- Create a temp table with table names
CREATE TABLE #TableList (TableName NVARCHAR(256));
INSERT INTO #TableList VALUES 
('termstypeaudit'),
('as400fin'),
('bailaction'),
('accountmonths2'),
('status'),
('lineitem'),
('letter'),
('delivery'),
('CMStrategyAcct'),
('LineitemAudit'),
('cheqfintranslnk'),
('as400trans'),
('proposalflag'),
('CMWorklistsAcct'),
('sms'),
('DocumentReprint'),
('agreement'),
('custacct'),
('proposalaudit'),
('Summary1_MR'),
('CMStrategyVariablesEntry'),
('CMStrategyVariablesExit'),
('CMStrategyVariablesSteps'),
('bailactionPTP'),
('follupalloc'),
('agreementAudit'),
('addtoletter'),
('Warranty.WarrantyPotentialSale'),
('setlstatus'),
('DelAuthoriseAudit'),
('ProposalRef'),
('lineitemosdelnotes'),
('chargesdata'),
('instalplan'),
('proposal'),
('settled_before_thres'),
('instalplanAudit'),
('bailactionMaxAction'),
('acctcode'),
('DiscountsAuthorised'),
('ScheduleAudit'),
('newlineitem'),
('zz_SaveScorexdata3'),
('zz_SaveApplication'),
('summary2_non'),
('finxfr'),
('cashiertotalsincome'),
('bailiffcommn'),
('unposteddels'),
('invoiceDetails'),
('ArrearsDaily'),
('bailiffCommnPaid'),
('mjkc_temp'),
('CustomerScoreHist'),
('Summary1AcctStatus'),
('ICAnalysisReport'),
('SalesCommission'),
('CMStrategySOD'),
('stat_temp01'),
('ScorexAppnumber'),
('bailiffcommn_pre2005'),
('summary16'),
('transactionaudit'),
('temp_Summary1_MR'),
('CashAndGoReceipt'),
('cancellation'),
('itemdetails'),
('temp_calcpcent'),
('temp_hldjnt_1'),
('SR_Summary'),
('newproposal'),
('BailiffCommnDeleted'),
('DeliveryReprint'),
('spa'),
('AutoSettled_Account_Backup'),
('Delinquency'),
('SR_ServiceRequest'),
('ReferralOverride'),
('downstatus'),
('ExtractedApps'),
('fintransAddtos'),
('SR_ChargeAcct'),
('salesnotrap'),
('revisedhist'),
('lineitem_amend'),
('tempreceipt'),
('CollectionReason'),
('instantcreditflag'),
('order_removed'),
('delauthorise'),
('del_thres_reached'),
('temp_AddtoReceivable'),
('fintrans_backup'),
('FACTTRANS_V10Upg'),
('line_back'),
('ScheduleRemoval'),
('RebateForecast_byaccount_previous_previous'),
('RebateForecast_byaccount_yearend'),
('RebateForecast_byaccount_previous'),
('lineitembfCollection'),
('KitCLineItem'),
('zz_SaveScorexdata'),
('SR_CustomerInteraction'),
('CMWorklistSOD'),
('RebateForecast_byaccount_current'),
('summary14'),
('rebates'),
('CorrectedPayments'),
('temp_interest'),
('liw_back'),
('zz_SaveScorexdata1'),
('CLANewPaymentDetails'),
('baldue12_full'),
('CashLoan'),
('Exchange'),
('CashLoanDisbursement'),
('Delivery_Error_log'),
('baldue12_less'),
('scorexdata_temp'),
('Application'),
('DataCleanLog'),
('FinTransAccount'),
('temp_AccountstoBeDeallocated'),
('setldates'),
('agreementbfcollection'),
('zz_SaveScorexdata2'),
('KitLineItem'),
('fintrans_new_income'),
('fintransnote'),
('unposteddelsDaily'),
('ServiceChargeAcct'),
('CollectionNoteChange'),
('fintransLastSummary'),
('lineitemwarrantieserased'),
('IgnoreCRECRF'),
('LastFactExport'),
('manualcdv'),
('duplicatenotes'),
('summary15'),
('summary7'),
('scorexdata'),
('BDWAudit'),
('schedule'),
('STL_Status'),
('BDWPending'),
('FinTransExchange'),
('BailliffUnsuccessful'),
('SPASummary'),
('badagr'),
('temp_cashint'),
('ProposalDuplicates_68640'),
('temp_acct'),
('temp_agreement'),
('STL_AddTo'),
('AccountLocking'),
('facttrans'),
('ProposalDuplicates_NoFlags_68640'),
('STL_SpecialAccts'),
('fintrans'),
('acct'),
('COVID_Instalplan_DataFix_Update_Backup'),
('COVID_Instalplan_DataFix_Update')

DECLARE @SQL NVARCHAR(MAX) = '';
DECLARE @TableName NVARCHAR(256);
DECLARE @SchemaName NVARCHAR(128);

DECLARE table_cursor CURSOR FOR 
SELECT TableName FROM #TableList;

OPEN table_cursor;

FETCH NEXT FROM table_cursor INTO @TableName;

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Get schema dynamically for each table
    SELECT @SchemaName = TABLE_SCHEMA
    FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_NAME = @TableName;

    IF @SchemaName IS NOT NULL
    BEGIN
        IF EXISTS (
            SELECT 1 
            FROM INFORMATION_SCHEMA.COLUMNS 
            WHERE TABLE_NAME = @TableName
            AND TABLE_SCHEMA = @SchemaName
            AND LOWER(COLUMN_NAME) = 'acctno'
        )
        BEGIN
            SET @SQL += 
                'SELECT ''' + @SchemaName + '.' + @TableName + ''' AS TableName, COUNT(*) AS [Count] ' + 
                'FROM ' + QUOTENAME(@SchemaName) + '.' + QUOTENAME(@TableName) + 
                ' WHERE acctno IS NOT NULL AND acctno NOT IN (' + CHAR(39) + CHAR(39) + ') AND LEN(acctno) > 11 
					AND acctno in (select acctno from acct)
					UNION ALL ';
        END
        ELSE
        BEGIN
            PRINT 'Skipping table: ' + @TableName + ' - Column ''acctno'' does not exist';
        END
    END
    ELSE
    BEGIN
        PRINT 'Skipping table: ' + @TableName + ' - Schema not found';
    END

    FETCH NEXT FROM table_cursor INTO @TableName;
END

CLOSE table_cursor;
DEALLOCATE table_cursor;

-- Remove the trailing "UNION ALL"
IF LEN(@SQL) > 0
    SET @SQL = LEFT(@SQL, LEN(@SQL) - 10);

-- Execute the dynamic query
IF LEN(@SQL) > 0
    EXEC sp_executesql @SQL;
ELSE
    PRINT 'No valid tables with column ''acctno'' found.';

DROP TABLE #TableList;