-------******************************************************************************************************  
/*************************************************************************

	Script Name  : DM_Table_Count_Script_Custid.sql
	Country		 : Dominica
	Created By   : Yash Sagar Mehta             
	Description  : This script take count of entries from tables           
	Date         : 15-03-2025           


**************************************************************************/
 
-------******************************************************************************************************  
-- Create a temp table with table names
CREATE TABLE #TableList (TableName NVARCHAR(256));
INSERT INTO #TableList VALUES 
('proposalflag'),
('CustAddressAudit'),
('custacct'),
('proposalaudit'),
('custtelAudit'),
('custtel'),
('proposal'),
('custaddress'),
('employment'),
('proposalflag_archive'),
('CustomerScoreHist'),
('ICAnalysisReport'),
('newcustaddress'),
('bankacct'),
('ScorexAppnumber'),
('referral'),
('newproposal'),
('Delinquency'),
('SR_ServiceRequest'),
('ReferralOverride'),
('SR_Customer'),
('CustomerAdditionalDetails'),
('summary3'),
('instantcreditflag'),
('summary14'),
('CashLoan'),
('CashLoanDisbursement'),
('prevname'),
('custcatcode'),
('scorexdata_temp'),
('DataCleanLog'),
('customerRFlimitoverride'),
('temp_custaddress2105'),
('ReferralRules'),
('LastFactExport'),
('temporary_LoanletterSC1'),
('CustomerLocking'),
('temporary_LoanletterSC2'),
('BailliffUnsuccessful'),
('ProposalDuplicates_68640'),
('ProposalDuplicates_NoFlags_68640'),
('custtelTable'),
('customer')


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
            AND LOWER(COLUMN_NAME) = 'Custid'
        )
        BEGIN
            SET @SQL += 
                'SELECT ''' + @SchemaName + '.' + @TableName + ''' AS TableName, COUNT(*) AS [Count] ' + 
                'FROM ' + QUOTENAME(@SchemaName) + '.' + QUOTENAME(@TableName) + ' WITH (NOLOCK) ' +
                ' WHERE custid in (select custid from customer WITH (NOLOCK))
					UNION ALL ';
        END
        ELSE
        BEGIN
            PRINT 'Skipping table: ' + @TableName + ' - Column ''Custid'' does not exist';
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
    PRINT 'No valid tables with column ''Custid'' found.';

DROP TABLE #TableList;