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

---

## 🧹 Data Cleaning
- Identified and removed records containing `NULL` values in critical fields to ensure data integrity.
- Verified the dataset post-cleaning for accurate analysis.

---

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
