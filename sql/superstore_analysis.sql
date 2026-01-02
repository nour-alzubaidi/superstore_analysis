
--Basis KPI:

--1.total sales and profit
select
sum(sales) as total_sales,
sum(profit) as total_profit
from superstore_sales;

--insight: The Superstore generated total sales of 12.64M and a total profit of 1.47M, indicating overall positive business performance.


--2.total orders
select count(distinct order_id) as total_orders
from superstore_sales;

--insight: The store processed a total of 25035 orders during the analyzed period. 

--3.average order value
select
sum(sales)/count(distinct order_id) as avg_order_value
from superstore_sales;

--insight: The average order value is approximately 505, reflecting moderate transaction size per order.

--Category and Product analysis:

--1.sales and profit by category
select
category,
sum(sales) as total_sales,
sum(profit) as total_profit
from superstore_sales
group by category
order by total_sales desc;

--insight: The Technology category leads in both total sales and profit, indicating strong demand and higher pricing power compared to other categories

--2.sales and profit by sub category

select
sub_category,
sum(sales) as total_sales,
sum(profit) as total_profit
from superstore_sales
group by sub_category
order by total_sales desc;

--insight: Phones generate the highest total sales among sub-categories, highlighting strong customer demand for this product type.

--3. top 10 products by sales
select top 10
product_name,
sum(sales) as total_sales
from superstore_sales
group by product_name
order by total_sales desc

--insight: Apple Smart Phones (Full Size) generate the highest total sales among all products, making them a key revenue contributor.


--Regional performance analysis:

--1.sales and profit by region
select
region,
sum(sales) as total_sales,
sum(profit) as total_profit
from superstore_sales
group by region
order by total_profit desc;

--insight: The Central region generates the highest total profit, indicating strong regional performance and potential for further business expansion

--2. top states by sale

select top 10
state,
sum(sales) as total_sales,
sum(profit) as total_profit
from superstore_sales
group by state
order by total_profit desc;

--insight: The state of England has the highest total profit, that demonstrates strong market performance and represents a key area for continued investment.


--Time based analysis

--1.sales by year

select
year(order_date) as year,
sum(sales) as total_sales
from superstore_sales
group by year(order_date)
order by year;

--insight: Sales show a consistent upward trend over the years, with total sales approximately doubling between 2011 and 2014, indicating sustained business growth

--2. sales by month

select
format(order_date, 'yyyy-MM') as month,
sum(sales) as total_sales
from superstore_sales
group by format(order_date, 'yyyy-MM')
order by month;

--insight: Sales peak in the fourth quarter, indicating strong seasonal demand, likely driven by holiday sales and promotions


--Discount impact
--1. Does discount hurt profit?
select
discount,
sum(sales) as total_sales,
sum(profit) as total_profit
from superstore_sales
group by discount
order by discount

--insight: Results show that, products with higher discounts tend to generate lower or negative profit, suggesting excessive discounting negatively impacts overall profitability

--2. average discount by category

select
category,
avg(discount) as avg_discount,
sum(profit) as total_profit
from superstore_sales 
group by category
order by avg_discount desc

--insight: The Furniture category has the highest average discount and the lowest profitability, suggesting that current discount strategies may be negatively affecting margins

--Customer segment analysis

--1. sales by segment

select
segment,
sum(sales) as total_sales,
sum(profit) as total_profit
from superstore_sales
group by segment
order by total_sales desc;

--insight: The Consumer segment is the most profitable segment, contributing the highest share of total profit.

--Business level insight

--1. most profitable product

select top 10
product_name,
sum(profit) as total_profit
from superstore_sales
group by product_name
order by total_profit desc

--insight: Canon imageCLASS 2200 generates the highest total profit, indicating strong demand and healthy margins compared to other products.

--2. loss making products

select top 10
product_name,
sum(profit) as total_profit
from superstore_sales
group by product_name
order by total_profit asc;
-- insight: Several products consistently generate losses, highlighting the need to reassess pricing, discount strategies, or product discontinuation