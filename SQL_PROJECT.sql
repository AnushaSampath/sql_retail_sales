--SQL RETAIL_SALES;
CREATE DATABASE SQL_PROJECT1;

CREATE TABLE retail_sales
(
   transactions_id INT PRIMARY KEY,	
   sale_date DATE,
   sale_time TIME,
   customer_id INT,
   gender VARCHAR(10),
   age INT,
   category VARCHAR(15),
   quantiy INT,
   price_per_unit FLOAT,
   cogs FLOAT,
   total_sale FLOAT
);

SELECT *FROM retail_sales LIMIT 10;

--Total number of records in the dataset.
SELECT COUNT(*) FROM retail_sales;

--Identify all unique product categories in the dataset.
SELECT DISTINCT category FROM retail_sales;

--Check for any null values in the dataset and delete records with missing data.
--ONE RECORD
SELECT *FROM retail_sales
WHERE
	quantiy IS NULL;
	
--MULTIPLE RECORD

SELECT *FROM retail_sales
WHERE
	transactions_id IS NULL
	OR
	sale_date IS NULL
	OR
	sale_time IS NULL
	OR
	quantiy IS NULL
	OR
	cogs IS NULL;


DELETE FROM retail_sales
WHERE
	transactions_id IS NULL
	OR
	sale_date IS NULL
	OR
	sale_time IS NULL
	OR
	quantiy IS NULL
	OR
	cogs IS NULL;

--1.Write a SQL query to retrieve all columns for sales made on '2022-11-05:

SELECT *FROM retail_sales
WHERE
sale_date = '2022-11-05';

--Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022:

SELECT *FROM retail_sales
WHERE
	category='Clothing'
	AND
	TO_CHAR(sale_date,'YYYY-MM')='2022-11'
	AND
	quantiy >=4;

--Write a SQL query to calculate the total sales (total_sale) for each category.:

SELECT 
	category,
	SUM(total_sale) AS net_sale
	From retail_sales
	GROUP BY category;

--Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:

SELECT
	ROUND(AVG(age),2) as avg_age
	FROM retail_sales
	WHERE category='Beauty';

--Write a SQL query to find all transactions where the total_sale is greater than 1000;

SELECT 
	*FROM retail_sales 
	WHERE total_sale > 1000;

--Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.:

SELECT
	category,
	gender,
	COUNT(*) as total_transactions
	FROM retail_sales
	GROUP BY 1,2
	ORDER BY 1;

--What is the average sale amount for each month and year:

SELECT 
	EXTRACT(year from sale_date) as year,
	EXTRACT(month from sale_date) as month,
	avg(total_sale) as avg_sale
	FROM retail_sales
	GROUP BY 1,2;

--Write a SQL query to find the top 5 customers based on the highest total sales:

SELECT 
	customer_id,
	sum(total_sale) as total_sale
	FROM retail_saleS
	GROUP BY 1
	ORDER BY 2 DESC
	LIMIT 5;

--Write a SQL query to find the number of unique customers who purchased items from each category:

SELECT
	category,
	COUNT(DISTINCT customer_id) AS unique_Id
	From retail_sales
	Group by category;


--Write a SQL query to categorize each sale as Morning, Afternoon, or Evening based on the sale time.

SELECT *,
    CASE
        WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END as shift
FROM retail_sales;

--End Project
	


	








	


	











