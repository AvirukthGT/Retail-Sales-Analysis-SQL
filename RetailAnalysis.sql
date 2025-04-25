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


-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05'
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)


-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05'

select * from retail where sale_date='2022-11-05'


-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 2 in the month of Nov-2022

select * from retail where category = 'Clothing' and quantiy>2 and to_char(sale_date,'YYYY-MM')='2022-11'

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.

select category,sum(total_sale) as total_sale from retail
group by category
order by 2 desc

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

select round(avg(age),2) as average_age from retail
where category='Beauty'

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
select * from retail where total_sale>1000

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

select gender,category,count(*) as total_transactions
from retail
group by 1,2
order by 1

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year

select year,month,max from (
select to_char(sale_date,'YYYY') as year,to_char(sale_date,'MM') as month,avg(total_sale) from retail
group by 1,2
order by 1,2
) 

