# 🛒 Retail Sales Analysis

## 📊 Project Overview
This project focuses on analyzing retail transaction data using SQL to uncover key business insights. The analysis includes data cleaning, customer behavior analysis, sales performance evaluation, and time-based sales trends. The goal is to support data-driven decision-making for retail operations.





---

## 🗂️ Dataset Description
The dataset contains transactional-level data from a retail store with the following columns:

| Column Name     | Description                          |
|-----------------|--------------------------------------|
| transactions_id | Unique ID for each transaction       |
| sale_date       | Date of the sale                     |
| sale_time       | Time of the sale                     |
| customer_id     | Unique ID for each customer          |
| gender          | Gender of the customer               |
| age             | Age of the customer                  |
| category        | Product category                     |
| quantiy         | Quantity of items sold               |
| price_per_unit  | Price per unit of the item           |
| cogs            | Cost of goods sold                   |
| total_sale      | Total sale amount                    |


### 1. Database Setup

- **Database Creation**: The project starts by creating a database named `p1_retail_db`.
- **Table Creation**: A table named `retail_sales` is created to store the sales data. The table structure includes columns for transaction ID, sale date, sale time, customer ID, gender, age, product category, quantity sold, price per unit, cost of goods sold (COGS), and total sale amount.

```sql
CREATE DATABASE p1_retail_db;

CREATE TABLE retail_sales
(
    transactions_id INT PRIMARY KEY,
    sale_date DATE,	
    sale_time TIME,
    customer_id INT,	
    gender VARCHAR(10),
    age INT,
    category VARCHAR(35),
    quantity INT,
    price_per_unit FLOAT,	
    cogs FLOAT,
    total_sale FLOAT
);
```

---

## 🧹 Data Cleaning
- Identified and removed records containing `NULL` values in critical fields to ensure data integrity.
- Verified the dataset post-cleaning for accurate analysis.

**Steps:**

- **Record Count**: Determine the total number of records in the dataset.
- **Customer Count**: Find out how many unique customers are in the dataset.
- **Category Count**: Identify all unique product categories in the dataset.
- **Null Value Check**: Check for any null values in the dataset and delete records with missing data.

```sql
SELECT COUNT(*) FROM retail_sales;
SELECT COUNT(DISTINCT customer_id) FROM retail_sales;
SELECT DISTINCT category FROM retail_sales;

SELECT * FROM retail_sales
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;

DELETE FROM retail_sales
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;
```

---
### 3. Data Analysis & Findings

The following SQL queries were developed to answer specific business questions:

1. **Sales made on '2022-11-05**:
```sql
SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05';
```

2. ** All transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022**:
```sql
SELECT 
  *
FROM retail_sales
WHERE 
    category = 'Clothing'
    AND 
    TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
    AND
    quantity >= 4
```

3. **Total sales (total_sale) for each category.**:
```sql
SELECT 
    category,
    SUM(total_sale) as net_sale,
    COUNT(*) as total_orders
FROM retail_sales
GROUP BY 1
```

4. **Average age of customers who purchased items from the 'Beauty' category.**:
```sql
SELECT
    ROUND(AVG(age), 2) as avg_age
FROM retail_sales
WHERE category = 'Beauty'
```

5. **All transactions where the total_sale is greater than 1000.**:
```sql
SELECT * FROM retail_sales
WHERE total_sale > 1000
```

6. **Total number of transactions (transaction_id) made by each gender in each category.**:
```sql
SELECT 
    category,
    gender,
    COUNT(*) as total_trans
FROM retail_sales
GROUP 
    BY 
    category,
    gender
ORDER BY 1
```

7. **Average sale for each month. Find out best selling month in each year**:
```sql
SELECT 
       year,
       month,
    avg_sale
FROM 
(    
SELECT 
    EXTRACT(YEAR FROM sale_date) as year,
    EXTRACT(MONTH FROM sale_date) as month,
    AVG(total_sale) as avg_sale,
    RANK() OVER(PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC) as rank
FROM retail_sales
GROUP BY 1, 2
) as t1
WHERE rank = 1
```

8. ** Top 5 customers based on the highest total sales **:
```sql
SELECT 
    customer_id,
    SUM(total_sale) as total_sales
FROM retail_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5
```

9. **Number of unique customers who purchased items from each category.**:
```sql
SELECT 
    category,    
    COUNT(DISTINCT customer_id) as cnt_unique_cs
FROM retail_sales
GROUP BY category
```

## 📌 Key SQL Analyses Performed
1. **Sales Filtering:** Retrieved transactions for specific dates and categories.
2. **Category Insights:** Calculated total sales and unique customers by product category.
3. **Customer Analytics:** Identified top customers based on total spending.
4. **Demographic Analysis:** Computed average age of customers for targeted categories.
5. **Time-Based Analysis:**
   - Found best-selling months using window functions.
   - Classified transactions into shifts (Morning, Afternoon, Evening) based on sale time.
6. **High-Value Transactions:** Filtered transactions with significant sales amounts.
7. **Gender-Based Analysis:** Counted transactions by gender across categories.

---

## 🚀 Highlighted Queries
- **Top 5 Customers by Sales**
- **Best-Selling Month Per Year**
- **Shift-wise Order Distribution**
- **Unique Customer Count per Category**

---

## 📅 Tools & Technologies
- **SQL**: Core language for querying and analysis
- **PostgreSQL / MySQL** *(depending on your environment)*

---

## 📈 Sample Insights
- Identified that the **Afternoon shift** had the highest number of orders.
- The **Clothing category** generated the maximum total sales.
- Found that November was consistently a high-performing month in sales.

---

## 📂 How to Use
1. Clone this repository.
2. Run the SQL scripts in your preferred SQL environment.
3. Connect to your retail database and execute queries for insights.

---

## 🤝 Contributing
Feel free to fork this repository and submit pull requests for improvements or additional analyses!

---

## 📄 License
This project is licensed under the MIT License.

---

## ✨ Acknowledgements
Thanks to open-source SQL communities for best practices and optimization techniques.
