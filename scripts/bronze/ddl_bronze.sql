/*
----------------------------------------------------------------------
DDL script : create bronze tables
----------------------------------------------------------------------

script purpose:
this script creates tables in the bronze schema, dropping exixting 
tables if they exists.
Run this script to redefine the the ddl structure of 'bronze' tables

----------------------------------------------------------------------
*/
create table bronze1.crm_cust_info(
	cst_id int,
	cst_key nvarchar(50),
	cst_firstname nvarchar(50),
	cst_lastname nvarchar(50),
	cst_material_status nvarchar(50),
	cst_gndr nvarchar(50),
	cst_create_date date
);

create table bronze1.crm_prd_info(
	prd_id int,
	prd_key nvarchar(50),
	prd_nm nvarchar(50),
	prd_cost int,
	prd_line nvarchar(50),
	prd_start_date datetime,
	prd_end_date datetime
);

create table bronze1.crm_sales_details(
sls_ord_num nvarchar(50),
sls_prd_key nvarchar(50),
sls_cust_id int,
sls_order_dt int,
sls_ship_dt int,
sls_due_dt int,
sls_sales int,
sls_quantity int,
sls_price int
);


create table bronze1.erp_cust_az12(
cid nvarchar(50),
bdate date,
gen varchar(50)
);

create table bronze1.erp_loc_a101(
cid nvarchar(50),
cntry varchar(50)
);

create  table bronze1.px_cat_g1v2(
id nvarchar(50),
cat varchar(50),
subcat varchar(50),
maintenance varchar(50)
);
