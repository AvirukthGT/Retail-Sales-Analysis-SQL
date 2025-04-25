--SQL RETAIL ANALYSIS

--Create Table
CREATE TABLE retail(
		transactions_id	INT PRIMARY KEY,
		sale_date	DATE,
		sale_time	TIME,
		customer_id	INT,
		gender 	VARCHAR(10),
		age INT,	
		category VARCHAR(15),	
		quantiy	INT,
		price_per_unit	FLOAT,
		cogs FLOAT,	
		total_sale FLOAT
	);

SELECT * FROM retail
LIMIT 10;

SELECT count(*) FROM retail;

--Dealing with null values

SELECT * FROM retail
where 
	customer_id is null
	or
	sale_date is null
	or
	transactions_id is null
	or
	sale_time is null
	or
	gender is null
	or
	quantiy is null
	or 
	category is null
	or
	cogs is null
	or
	total_sale is null

-- 
Delete from retail
where 
	customer_id is null
	or
	sale_date is null
	or
	transactions_id is null
	or
	sale_time is null
	or
	gender is null
	or
	quantiy is null
	or 
	category is null
	or
	cogs is null
	or
	total_sale is null

select count(*) from retail

--Distinct no of customers

select count(distinct customer_id) as total_sale from retail


select distinct category as total_sale from retail




