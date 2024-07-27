select * from pizza_sales

/* Total Revenue from all pizza orders */
SELECT SUM(total_price) AS Total_Revenue from pizza_sales

/* Average order value of pizza orders */
SELECT SUM(total_price) / COUNT(DISTINCT order_id) as Avg_Order_Value from pizza_sales

/* Total pizza sold from all pizza orders */
SELECT SUM(quantity) AS Total_Pizza_Sold from pizza_sales

/* Total orders */
SELECT COUNT(DISTINCT order_id) AS Total_Orders from pizza_sales

/* Average pizza per order */
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10, 2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10, 2)) AS DECIMAL(10, 2)) AS Avg_Pizzas_Per_Order from pizza_sales


Select * from pizza_sales
ORDER BY pizza_id

/* Daily trend for total orders */
SELECT DATENAME(DW, order_date) as Order_Day, COUNT(DISTINCT order_id) AS Total_Orders
from pizza_sales
GROUP BY DATENAME(DW, order_date)
ORDER BY Total_Orders DESC


/* Hourly trend for total orders */
SELECT DATENAME(MONTH, order_date) as Order_Month, COUNT(DISTINCT order_id) AS Total_Orders
from pizza_sales
GROUP BY DATENAME(MONTH, order_date)
ORDER BY Total_Orders DESC

/* Percentage of sales by pizza category */
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10, 2)) AS Total_Price, CAST(Sum(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales WHERE MONTH(order_date) = 1) AS DECIMAL(10, 2)) AS Percentage_Sales
from pizza_sales
WHERE MONTH(order_date) = 1
GROUP BY pizza_category

/* Percentage of sales by pizza size */
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Price, CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales WHERE DATEPART(quarter, order_date) = 1) AS DECIMAL(10, 2)) AS Percentage_Sales
from pizza_sales
WHERE DATEPART(quarter, order_date) = 1
GROUP BY pizza_size
ORDER BY Percentage_Sales DESC

/* Total pizzas sold by pizza category */
SELECT pizza_category, SUM(quantity) AS Total_Pizza_Sold from pizza_sales
GROUP BY pizza_category
ORDER BY Total_Pizza_Sold DESC

/* Top 5 best sellers by total pizzas sold revenue*/
SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

/* Worst 5 best sellers by total pizzas sold revenue*/
SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC

/* Top 5 best sellers by total pizzas sold quantity*/
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quantity FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC

/* Worst 5 best sellers by total pizzas sold quantity*/
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quantity FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity ASC

/* Top 5 best sellers by total pizzas sold order*/
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC

/* Worst 5 best sellers by total pizzas sold order*/
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC
