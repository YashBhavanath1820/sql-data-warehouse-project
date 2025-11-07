/*

----------------------------------------------------------------------------------
Stored procedure : Load bronze layer (source > bronze)
----------------------------------------------------------------------------------
script purpose:
	
	This stored procedure load  data into the 'bronze' schema from external csv 
	files.
	It performs the following actions:
	-Truncate the bronze tables before loading data
	-Uses 'bulk insert' command to load data from csv files to bronze tables.

Parameters:
	none.
	This stored procedure does not accept any parameters or return any values.

Usage examples:
	exec bronze.load_bronze;

-----------------------------------------------------------------------------------

*/



USE datawarehouse1;
GO

create or alter procedure bronze1.load_bronze as 

begin
	
	begin try

		print '---------------------------------';
		print 'loading bronze layer';
		print '---------------------------------';

		print '---------------------------------';
		print 'loading crm tables';
		print '---------------------------------';

		

		
		print '>>truncating table :  bronze1.crm_cust_info' ;

		TRUNCATE TABLE bronze1.crm_cust_info; -- it is used when we want to empty the table contents

		print '>> inserting data into table : bronze1.crm_cust_info';
		BULK INSERT  bronze1.crm_cust_info
		FROM 'C:\Users\yashb\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH (
		FIRSTROW = 2,  -- its used cuz the first row in csv file is headers and data starts from 2 row
		FIELDTERMINATOR = ',',    -- its used as a delimeter to separete the values in csv file 
		TABLOCK  --its used to lock the whole table 
		);


		print '>>truncating table : bronze1.crm_prd_info';

		TRUNCATE TABLE bronze1.crm_prd_info; -- it is used when we want to empty the table contents

		print '>> inserting data into table : bronze1.crm_prd_info';

		BULK INSERT  bronze1.crm_prd_info
		FROM 'C:\Users\yashb\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH (
		FIRSTROW = 2,  -- its used cuz the first row in csv file is headers and data starts from 2 row
		FIELDTERMINATOR = ',',    -- its used as a delimeter to separete the values in csv file 
		TABLOCK  --its used to lock the whole table 
		);

		select * from bronze1.crm_prd_info;

		print '>>truncating table :  bronze1.crm_sales_details';

		TRUNCATE TABLE bronze1.crm_sales_details; -- it is used when we want to empty the table contents

		print '>> inserting data into table : bronze1.crm_sales_details';

		BULK INSERT  bronze1.crm_sales_details
		FROM 'C:\Users\yashb\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH (
		FIRSTROW = 2,  -- its used cuz the first row in csv file is headers and data starts from 2 row
		FIELDTERMINATOR = ',',    -- its used as a delimeter to separete the values in csv file 
		TABLOCK  --its used to lock the whole table 
		);

		select * from bronze1.crm_sales_details;

		print '---------------------------------';
		print 'loading erp tables';
		print '---------------------------------';

		print '>>truncating table :  bronze1.erp_cust_az12';

		TRUNCATE TABLE bronze1.erp_cust_az12; -- it is used when we want to empty the table contents

		print '>> inserting data into table : bronze1.erp_cust_az12';

		BULK INSERT  bronze1.erp_cust_az12
		FROM 'C:\Users\yashb\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		WITH (
		FIRSTROW = 2,  -- its used cuz the first row in csv file is headers and data starts from 2 row
		FIELDTERMINATOR = ',',    -- its used as a delimeter to separete the values in csv file 
		TABLOCK  --its used to lock the whole table 
		);


		select * from  bronze1.erp_cust_az12;

		print '>>truncating table :   bronze1.erp_loc_a101';

		TRUNCATE TABLE bronze1.erp_loc_a101; -- it is used when we want to empty the table contents

		print '>> inserting data into table :  bronze1.erp_loc_a101';

		BULK INSERT  bronze1.erp_loc_a101
		FROM 'C:\Users\yashb\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
		WITH (
		FIRSTROW = 2,  -- its used cuz the first row in csv file is headers and data starts from 2 row
		FIELDTERMINATOR = ',',    -- its used as a delimeter to separete the values in csv file 
		TABLOCK  --its used to lock the whole table 
		);


		select * from bronze1.erp_loc_a101;

		print '>>truncating table : bronze1.px_cat_g1v2';

		TRUNCATE TABLE bronze1.px_cat_g1v2; -- it is used when we want to empty the table contents

		print '>> inserting data into table : bronze1.px_cat_g1v2';

		BULK INSERT  bronze1.px_cat_g1v2
		FROM 'C:\Users\yashb\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
		WITH (
		FIRSTROW = 2,  -- its used cuz the first row in csv file is headers and data starts from 2 row
		FIELDTERMINATOR = ',',    -- its used as a delimeter to separete the values in csv file 
		TABLOCK  --its used to lock the whole table 
		);

		select * from  bronze1.px_cat_g1v2;

	end try
	begin catch
		print '------------------------------------------------------'
		print 'error occured during loading bronze layer'
		print 'error message' + error_message();
		print 'error message' + cast (error_number() as nvarchar);
		print 'error message' + cast (error_state() as nvarchar);
		print '-------------------------------------------------------'
	end catch

end  
