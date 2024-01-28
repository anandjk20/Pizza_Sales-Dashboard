use Pizza_DB;
select * from pizza_sales;
select sum(total_price) as Total_Revenue from pizza_sales;
select sum(total_price)/count(distinct order_id) as Avg_Order_Value from pizza_sales;
select sum(quantity) as Total_pizza_Sold from pizza_sales;
select count(distinct order_id) as Total_orders from pizza_sales;
select sum(quantity)/count(distinct order_id) from pizza sales;
#The abouve query will give result without decimals to get decimal  we can use cast () function
select cast(sum(quantity) as decimal(10,2))/
cast(count(distinct order_id) as decimal(10,2)) as Average_Pizza_per_order from pizza_sales;
#The DECIMAL(10,2) means we will get 10 decimal places among them up to 2 will be printed and in the result of this query the entire answer is not in casted
# To get this for entire result we can use/updtae query like
select cast(cast(sum(quantity) as decimal(10,2))/
cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) as Average_Pizza_per_order from pizza_sales;

select DATENAME(DW,order_date) as order_day, count(distinct order_id) as Total_orders 
from pizza_sales
group by DATENAME(DW,order_date);

select DATENAME(MONTH,order_date) as Month_Name, count(distinct order_id) as Total_orders 
from pizza_sales
group by DATENAME(MONTH,order_date)
order by Total_orders desc;



SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category;


SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PC
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;

SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;

select Top 5 pizza_name, sum(total_price) as TOTAL_REVENUE from pizza_sales
group by pizza_name
order by Total_Revenue desc;

select Top 5 pizza_name, sum(total_price) as TOTAL_REVENUE from pizza_sales
group by pizza_name
order by Total_Revenue asc;

SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC;

SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC;


