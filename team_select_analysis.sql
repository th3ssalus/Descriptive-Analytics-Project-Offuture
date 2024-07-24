------------------------------------
--Checking for correlation between discount and if the customer orders more than usual.
	
WITH my_stats AS (
	SELECT
		customer_id ,
		avg(quantity) AS my_avg
	FROM 
		student.team_select
	GROUP BY
		customer_id
)
SELECT 
	s.discount,
	count(s.customer_id)
FROM student.team_select s
LEFT JOIN my_stats m
	ON s.customer_id = m.customer_id
WHERE
	s.quantity > m.my_avg 
GROUP BY s.discount;

------------------------------------
--Comparing the top 10 countries for sales
-- total sales, total profit, average profit, average quantity, count of orders in each category

WITH my_cat1 AS (
	SELECT
		country ,
		count(order_id) furniture_count
	FROM student.team_select
	WHERE category = 'Furniture'
	GROUP BY country
),
my_cat2 AS (
	SELECT
		country ,
		count(order_id) supplies_count
	FROM student.team_select
	WHERE category = 'Office Supplies'
	GROUP BY country
),
my_cat3 AS (
	SELECT
		country ,
		count(order_id) tech_count
	FROM student.team_select
	WHERE category = 'Technology'
	GROUP BY country
)
SELECT 
 	ts.country ,
 	sum(profit) total_profit,
 	sum(sales) total_sales ,
 	avg(quantity) avg_quantity ,
 	count(order_id) no_of_orders ,
 	avg(discount) avg_discount ,
 	avg(profit) avg_profit ,
 	avg(tech_count) tech_count ,
 	avg(supplies_count) supplies_count ,
 	avg(furniture_count) furniture_count
FROM 
	student.team_select ts
LEFT JOIN my_cat1 m1
	ON ts.country = m1.country
LEFT JOIN my_cat2 m2
	ON ts.country = m2.country
LEFT JOIN my_cat3 m3
	ON ts.country = m3.country
GROUP BY ts.country
ORDER BY total_sales DESC -- can be changed to total_profit to see top 10 countries by profit
LIMIT 10;

------------------------------------
-- Information on top profitting products

SELECT
	product_id ,
	product_name ,
	category ,
	sub_category ,
	sum(profit) total_profit
FROM
	student.team_select
GROUP BY
	product_id ,
	product_name,
	category ,
	sub_category 
ORDER BY
	total_profit DESC;

--Worst profitting products
SELECT
	product_id ,
	product_name ,
	category ,
	sub_category ,
	sum(profit) total_profit
FROM
	student.team_select
GROUP BY
	product_id ,
	product_name,
	category ,
	sub_category 
ORDER BY
	total_profit ASC;

------------------------------------
-- Comparing all of the sub categories in terms of total profit
-- Led to our discovery of tables underperforming

SELECT 
	sub_category ,
	sum(profit) total_profit,
	count(order_id) orders,
	avg(quantity) avg_quantity
FROM
	student.team_select
GROUP BY 
	sub_category 
ORDER BY 
	total_profit desc;

------------------------------------
-- Understanding the loss of profit in tables by comparing how the discount and shipping correlates

SELECT 
	sub_category ,
	sum(profit) total_profit,
	count(order_id) orders,
	avg(quantity) avg_quantity ,
	avg(discount) avg_discount ,
	stddev(discount) std_discount ,
	variance(discount) var_discount ,
	avg(shipping_cost) avg_shipping ,
	stddev(shipping_cost) std_shipping ,
	variance(shipping_cost) var_shipping 
FROM
	student.team_select
GROUP BY 
	sub_category 
ORDER BY 
	total_profit asc;

------------------------------------
--Seeing if tables had high shipping costs to test a theory due to their size

SELECT
	shipping_cost 
FROM
	student.team_select
WHERE sub_category = 'Tables'
ORDER BY
	shipping_cost DESC;

------------------------------------
-- Top 10 countries by sales in 2014

SELECT
	country ,
	sum(sales) AS sales ,
	min(order_date) ,
	max(order_date)
FROM
	student.team_select
WHERE 
	order_date::varchar LIKE '%2014%'
GROUP BY 
	country 
ORDER BY
	sales DESC
LIMIT 10;

------------------------------------
-- Comparing top performing countries in terms of profit to sales ratio and assessing correlation with discount

SELECT
	country ,
	(sum(profit)/sum(sales)) ps,
	avg(discount)
FROM student.team_select
GROUP BY country
ORDER BY ps desc;