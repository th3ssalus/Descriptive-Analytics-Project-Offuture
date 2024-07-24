-- Table creation - SQL CODE 1 - 
CREATE TABLE student.team_select(  -- The name of the table that will hold the source file
	row_id integer ,               -- integer - This is an integer column
	order_id varchar(20),          -- varchar - This is a combunation of stings and number so varcahr is the most suitable
	order_date date,               -- date - This is a date column
	ship_date date,                -- date - This is a date column
	ship_mode varchar(20),         -- varchar - This is a character based column
	customer_id varchar(20),       -- varchar - This is a combunation of stings and number so varcahr is the most suitable
	customer_name varchar(30),     -- varchar - This is a character based column
	segment varchar(20),           -- varchar - This is a character based column
	city varchar(40),              -- varchar - This is a character based column
	state varchar(40),             -- varchar - This is a character based column
	country varchar(40),           -- varchar - This is a character based column
	postal_code varchar(20),       -- varchar - TO avoid clashes with different country's postol code format
	market varchar(20),            -- varchar - This is a character based column
	region varchar(20),            -- varchar - This is a character based column
	product_id varchar(20),        -- varchar - This is a combunation of stings and number so varcahr is the most suitable
	category varchar(20),          -- varchar - This is a character based column
	sub_category varchar(20),      -- varchar - This is a character based column
	product_name varchar(200),     -- varchar - This is a character based column
	sales NUMERIC ,                -- NUMERIC - This is a column with demial values so numeric is the most suitable
	quantity integer,              -- integer - This is an integer column
	discount NUMERIC ,             -- NUMERIC - This is a column with demial values so numeric is the most suitable
	profit NUMERIC ,               -- NUMERIC - This is a column with demial values so numeric is the most suitable
	shipping_cost NUMERIC ,        -- NUMERIC - This is a column with demial values so numeric is the most suitable
	order_priority varchar(10) -- HEADER names that ARE appropriate FOR SQL.
);

SELECT 
	*
FROM
	student.team_select ts ; -- This query is to see if the data has been uploaded into the table.
--------------------------------------------------------------------------------------------------------------------------------------------
-- Compulsory Checks --	

-- Number of Nulls - SQL CODE 2 - (41296)

SELECT 
	count(*) -- counting all the rows
FROM 
	student.team_select 
WHERE NOT 
	team_select IS NOT NULL ; -- where there are nulls in the table  

-- Column Count - SQL CODE 3 - (24)

SELECT 
	count(*) AS count_of_columns 
FROM 
	information_schema.COLUMNS -- using a system table to select the columns in our table
WHERE 
	table_name = 'team_select' ; 

-- Row Count - SQL CODE 4 - (51290)

SELECT 
	count(*) -- counting all the rows
FROM 
	student.team_select ts ; 

-- Sum of Column sums - SQL CODE 5 - (1331006116.61916)

SELECT 
	sum(row_id)+ -- adding all the values in column row_id
	sum(sales)+ -- adding all the values in column sales
	sum(quantity)+ -- adding all the values in column quantity
	sum(discount)+ -- adding all the values in column discount
	sum(profit)+ -- adding all the values in column profit
	sum(shipping_cost) -- adding all the values in column shipping_cost
	                   --Then adding all the sums togethere
FROM 
	student.team_select ts ;
	
-- Sum of Row sums - SQL CODE 6 -  (1331006116.61916)

SELECT 
	sum(
	row_id +
	sales +
	quantity +
	discount +
	profit +
	shipping_cost) -- adding all the values of the rows from each numeric column 
FROM
	student.team_select ts ;

-- String lengths - SQL CODE 7 -

SELECT 
min(length(row_id:: varchar(50))),        -- (SQL CODE 7.1) finding the minimum character length for row_id (1)
min(length(order_id)), 				      -- (SQL CODE 7.2) finding the minimum character length for order_id (9)
min(length(order_date:: varchar(50))),    -- (SQL CODE 7.3) finding the minimum character length for order_date (10)
min(length(ship_date:: varchar(50))),     -- (SQL CODE 7.4) finding the minimum character length for ship_date (10)
min(length(ship_mode)),                   -- (SQL CODE 7.5) finding the minimum character length for ship_mode (8)
min(length(customer_id)),                 -- (SQL CODE 7.6) finding the minimum character length for customer_id (5)
min(length(customer_name)),               -- (SQL CODE 7.7) finding the minimum character length for customer_name (7)
min(length(segment)),                     -- (SQL CODE 7.8) finding the minimum character length for segment (8)
min(length(city)),                        -- (SQL CODE 7.9) finding the minimum character length for city (2)
min(length(state)),                       -- (SQL CODE 7.10) finding the minimum character length for state (3)
min(length(country)),                     -- (SQL CODE 7.11) finding the minimum character length for country (4)
min(length(postal_code)),                 -- (SQL CODE 7.12) finding the minimum character length for postal_code (4)
min(length(market)),                      -- (SQL CODE 7.13) finding the minimum character length for market (2)
min(length(region)),                      -- (SQL CODE 7.14) finding the minimum character length for region (4)
min(length(product_id)),                  -- (SQL CODE 7.15) finding the minimum character length for product_id (15)
min(length(category)),                    -- (SQL CODE 7.16) finding the minimum character length for category (9)
min(length(sub_category)),                -- (SQL CODE 7.17) finding the minimum character length for sub_category (3)
min(length(product_name)),                -- (SQL CODE 7.18) finding the minimum character length for product_name (5)
min(length(sales:: varchar(50))),         -- (SQL CODE 7.19) finding the minimum character length for sales (1)
min(length(quantity:: varchar(50))),      -- (SQL CODE 7.20) finding the minimum character length for quantity (1)
min(length(discount:: varchar(50))),      -- (SQL CODE 7.21) finding the minimum character length for discount (1)
min(length(profit:: varchar(50))),        -- (SQL CODE 7.22) finding the minimum character length for profit (1)
min(length(shipping_cost:: varchar(50))), -- (SQL CODE 7.23) finding the minimum character length for shipping_cost (1)
min(length(order_priority))               -- (SQL CODE 7.24) finding the minimum character length for order_priority (3)
FROM 
	student.team_select ts ;

SELECT 
	max(length(row_id:: varchar(50))),        -- (SQL CODE 7.25) finding the maximum character length for row_id (5)    
	max(length(order_id)), 				      -- (SQL CODE 7.26) finding the maximum character length for order_id (15)
	max(length(order_date:: varchar(50))),    -- (SQL CODE 7.27) finding the maximum character length for order_date (10)
	max(length(ship_date:: varchar(50))),     -- (SQL CODE 7.28) finding the maximum character length for ship_date (10)
	max(length(ship_mode)),                   -- (SQL CODE 7.29) finding the maximum character length for ship_mode (14)
	max(length(customer_id)),                 -- (SQL CODE 7.30) finding the maximum character length for customer_id (8)
	max(length(customer_name)),               -- (SQL CODE 7.31) finding the maximum character length for customer_name (22)
	max(length(segment)),                     -- (SQL CODE 7.32) finding the maximum character length for segment (11)
	max(length(city)),                        -- (SQL CODE 7.33) finding the maximum character length for city (35)
	max(length(state)),                       -- (SQL CODE 7.34) finding the maximum character length for state (36)
	max(length(country)),                     -- (SQL CODE 7.35) finding the maximum character length for country (32)
	max(length(postal_code)),                 -- (SQL CODE 7.36) finding the maximum character length for postal_code (5)
	max(length(market)),                      -- (SQL CODE 7.37) finding the maximum character length for market (6)
	max(length(region)),                      -- (SQL CODE 7.38) finding the maximum character length for region (14)
	max(length(product_id)),                  -- (SQL CODE 7.39) finding the maximum character length for product_id (16)
	max(length(category)),                    -- (SQL CODE 7.40) finding the maximum character length for category (15)
	max(length(sub_category)),                -- (SQL CODE 7.41) finding the maximum character length for sub_category (11)
	max(length(product_name)),                -- (SQL CODE 7.42) finding the maximum character length for product_name (127)
	max(length(sales:: varchar(50))),         -- (SQL CODE 7.43) finding the maximum character length for sales (10)
	max(length(quantity:: varchar(50))),      -- (SQL CODE 7.44) finding the maximum character length for quantity (2)
	max(length(discount:: varchar(50))),      -- (SQL CODE 7.45) finding the maximum character length for discount (5)
	max(length(profit:: varchar(50))),        -- (SQL CODE 7.46) finding the maximum character length for profit (10)
	max(length(shipping_cost:: varchar(50))), -- (SQL CODE 7.47) finding the maximum character length for shipping_cost (6)
	max(length(order_priority))               -- (SQL CODE 7.48) finding the maximum character length for order_priority (8)
FROM 
	student.team_select ts ;

-- Min/Max Date - SQL CODE 8 -
--Oldest/most recent date --
SELECT 
	-- 8.1 --
	min(order_date) AS min_order_date, -- Finding the minimum order_date (2011-01-01)
	max(order_date) AS max_order_date, -- Finding the maximum order_date (2014-12-31)
	-- 8.2 --
	min(ship_date) AS min_ship_date, -- Finding the minimum ship_date (2011-01-03)
	max(ship_date) AS max_ship_date -- Finding the maximum ship_date (2015-01-07)
FROM 
	student.team_select ts ;

-- SUM/MIN/MAX of numeric tables - SQL CODE 9 -

SELECT
	-- 9.1 --
	sum(row_id) AS s_row_id, -- Finding the sum of row_id (1315357695)
	min(row_id) AS min_row_id, -- Finding the minimum of row_id (1)
	max(row_id) as max_row_id, -- Finding the maximum of row_id (51290)
	-- 9.2 --
	sum(sales) AS s_sales, -- Finding the sum of sales (12642501.90988)
	min(sales) AS min_sales, -- Finding the minimum of sales (0.444)
	max(sales) as max_sales, -- Finding the maximum of sales (22638.48)
	-- 9.3 --
	sum(quantity) AS s_quantity, -- Finding the sum of quantity (178312)
	min(quantity) AS min_quantity, -- Finding the minimum of quantity (1)
	max(quantity) as max_quantity, -- Finding the maximum of quantity (14)
	-- 9.4 --
	sum(discount) AS s_discount, -- Finding the sum of discount (7329.728)
	min(discount) AS min_discount, -- Finding the minimum of discount (0)
	max(discount) as max_discount, -- Finding the maximum of discount (0.85)
	-- 9.5 --
	sum(profit) AS s_profit, -- Finding the sum of profit (1467457.29128)
	min(profit) AS min_profit, -- Finding the minimum of profit (-6599.978)
	max(profit) as max_profit, -- Finding the maximum of profit (8399.976)
	-- 9.6 --
	sum(shipping_cost) AS sum_sc, -- Finding the sum of cost (1352820.69)
	min(shipping_cost) AS min_sc, -- Finding the minimum of shipping_cost (0)
	max(shipping_cost) AS max_sc -- Finding the maximum of shipping_cost (933.57)
FROM
	student.team_select ts ;

-- No of Unique row- SQL CODE 10 - (51290)
SELECT 
	count(DISTINCT row_id) -- Using primary key to count unique rows
FROM
	student.team_select ts ;


-- Column entry check - SQL CODE 11 -
-- 11.1 --
SELECT 
	DISTINCT(market) AS market_ -- DISTINCT allows us to see what the entries are for market
FROM
	student.team_select ts 
ORDER BY 
	market;

-- 11.2 --
SELECT 
	DISTINCT(region) AS region_ -- DISTINCT allows us to see what the entries are for region
FROM
	student.team_select ts 
ORDER BY 
	region ASC ;

-- 11.3 --
SELECT 
	DISTINCT(category) AS category_ -- DISTINCT allows us to see what the entries are for category
FROM
	student.team_select ts 
ORDER BY 
	category ASC ;


-- Eyeball entry check - SQL CODE 12 -
SELECT                  -- This is to give us a truly random set of 5 row_id's to check
 	row_id 
FROM 
 	student.team_select
ORDER BY
 	random()             -- Output will be different order each time
LIMIT 
	5; -- shows only first 5 random row_ids.

SELECT
 	*
FROM 
 	student.team_select
WHERE 
	row_id IN (23732, 7122, 11283, 1235, 50199); -- These row_id's were the ones generated for us
--------------------------------------------------------------------------------------------------------------------------------------------------
-- Additional Checks 
	
-- Check for inconsistency with 'Amman - SQL CODE 13 -
SELECT 
	*
FROM
	student.team_select ts 
WHERE 
	state ILIKE '%AMMAN%'; 
	--Finding all states where Amman appears
	--in the name to check that they are in the same format


-- Check duplicate row except row_id - SQL CODE 14 -	
SELECT                -- This is an additional check to make sure that no two observations are exactly the same except the row_id.
	order_date,       -- If that was the case, it would make the data qustionable.
	ship_date, 
	ship_mode, 
	customer_id, 
	customer_name, 
	segment, 
	city, 
	state, 
	country, 
	postal_code, 
	market, 
	region, 
	product_id, 
	category, 
	sub_category, 
	product_name, 
	sales, 
	quantity, 
	discount, 
	profit, 
	shipping_cost, 
	order_priority, 
	count(*)
FROM student.team_select
GROUP BY 
	order_date, 
	ship_date, 
	ship_mode, 
	customer_id, 
	customer_name, 
	segment, 
	city, 
	state, 
	country, 
	postal_code, 
	market, 
	region, 
	product_id, 
	category, 
	sub_category, 
	product_name, 
	sales, 
	quantity, 
	discount, 
	profit, 
	shipping_cost, 
	order_priority
HAVING 
	count(*) > 1 ;