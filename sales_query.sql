create database sales_db;
use sales_db;
select * from sales_data;

##Data Cleaning
ALTER TABLE sales_data  
CHANGE COLUMN `Customer Age` Customer_age int;

ALTER TABLE sales_data  
CHANGE COLUMN `index` id int;

ALTER TABLE sales_data
CHANGE COLUMN `Customer Gender` Customer_gender text ;

ALTER TABLE sales_data
CHANGE COLUMN `Product Category` Product_Category varchar(20);

ALTER TABLE sales_data
CHANGE COLUMN `Sub Category` Sub_Category varchar(30) ;

ALTER TABLE sales_data
CHANGE COLUMN `Unit Cost` Unit_Cost float;

ALTER TABLE sales_data
CHANGE COLUMN `Unit Price` Unit_Price float;

select * from sales_data 
where 
Date is null
or
Year is null
or 
Month is null
or
Customer_age is null
or
Customer_gender is null
or
Country is null
or
State is null
or
Product_Category is null
or 
Sub_Category is null
or
Quantity is null
or
Unit_cost is null
or
Unit_price is null
or 
cost is null
or
Revenue is null;

##DATA EXPLORATION

##how many sales we have?
select count(*) as total_Sales from sales_data;

##how many distinct entries we have?
select count(distinct id) as total_sales from sales_data;

select * from sales_data;

##categories we have in our sales?
select distinct Product_Category from sales_data;
select distinct Sub_Category from sales_data;

##Data Analysis
##1 retrive total sales revenue
select sum(revenue) as total_revenue from sales_data;

##2 Get total sale per product
select Product_Category, sum(Revenue) as total_revenue_sold
from sales_data
group by Product_Category
order by total_revenue_sold;

select * from sales_data;

##3 find the top 5 customer who spent the most
select id, sum(Revenue) as total_spent from sales_data
group by id
order by total_spent desc
limit 5;

##4 Get Monthly sales trends
SELECT month, SUM(revenue) AS Monthly_sales
FROM (
    SELECT DATE_FORMAT(Date, '%Y-%m') AS month, revenue
    FROM sales_data
) AS subquery
GROUP BY month
ORDER BY month;

##5 Identify sales by State
select State, sum(Revenue) as total_revenue
from sales_data
group by State
order by total_revenue desc;

##6 identify most expensive product
select Sub_Category,Unit_Price
from sales_data
order by Unit_Price desc
limit 10;

select * from Sales_data;

##7 customers who bought high profit products
SELECT id, Product_Category, 
       (Unit_Price - Unit_Cost) * Quantity AS profit
FROM Sales_data
WHERE (Unit_Price - Unit_Cost) > 50
ORDER BY profit DESC
limit 10;

##End of Project 