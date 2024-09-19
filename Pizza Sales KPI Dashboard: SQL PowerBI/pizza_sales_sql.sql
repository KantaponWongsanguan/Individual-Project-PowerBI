SELECT * FROM pizza.pizza_sales;

-- Changing Column Type
-- Convert Date Format 
-- Convert order_date to the Correct Format:
ALTER TABLE `pizza`.`pizza_sales`
ADD COLUMN `order_date_temp` DATE;

UPDATE `pizza`.`pizza_sales`
SET `order_date_temp` = STR_TO_DATE(`order_date`, '%d-%m-%Y');

-- Check the Converted Data:
SELECT `order_date`, `order_date_temp` FROM `pizza`.`pizza_sales` LIMIT 10;

-- Drop the Original and rename temp
ALTER TABLE `pizza`.`pizza_sales`
DROP COLUMN `order_date`,
CHANGE COLUMN `order_date_temp` `order_date` DATE NULL DEFAULT NULL;

-- Conver order_time to Correct format
ALTER TABLE `pizza`.`pizza_sales` 
CHANGE COLUMN `order_time` `order_time` TIME NULL DEFAULT NULL ;

-- Organize column
ALTER TABLE `pizza`.`pizza_sales` 
CHANGE COLUMN `order_date` `order_date` DATE NULL DEFAULT NULL AFTER `quantity`;

SELECT * FROM pizza.pizza_sales;

-- KPI
-- Total Revenue
-- Average Order Value
-- Total Pizzas Sold
-- Total Orders
-- Average Pizzas Per Order

SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;

SELECT SUM(total_price)/ COUNT(DISTINCT order_id) AS AVG_Order_value FROM pizza_sales;

SELECT SUM(quantity) AS Total_Pizza_sold FROM pizza_sales;

SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales;

SELECT SUM(quantity) / COUNT(DISTINCT order_id) FROM pizza_sales;

-- Chart Requirement
-- Daily Trend for total orders
-- hourly trend for total orders
-- Percentage of sales by pizza category

SELECT DAYNAME(order_date) as order_day, COUNT(DISTINCT order_id) AS Total_orders FROM pizza_sales GROUP BY order_day;

SELECT MONTHNAME(order_date) as order_day, COUNT(DISTINCT order_id) AS Total_orders FROM pizza_sales GROUP BY order_day;

SELECT pizza_category, SUM(total_price) AS Total_sales, SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS PCT FROM pizza_sales GROUP BY pizza_category;

SELECT pizza_size, SUM(total_price) AS Total_sales, SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS PCT FROM pizza_sales GROUP BY pizza_size;

-- Total Pizzas Sold by Category
-- Top 5 by Revenue, Quantity, and Total Orders
-- Bottom 5 by Revenue, Quantity, and Total Orders

SELECT pizza_category, SUM(quantity) AS Total_Quantity_Sold FROM pizza_sales GROUP BY pizza_category;
-- Top 5
SELECT pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales GROUP BY pizza_name ORDER BY Total_Revenue DESC LIMIT 5;

SELECT pizza_name, SUM(quantity) AS Total_Quantity_Sold FROM pizza_sales GROUP BY pizza_name ORDER BY Total_Quantity_Sold DESC LIMIT 5;

SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales GROUP BY pizza_name ORDER BY Total_Orders DESC LIMIT 5;
-- Bottom 5
SELECT pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales GROUP BY pizza_name ORDER BY Total_Revenue ASC LIMIT 5;

SELECT pizza_name, SUM(quantity) AS Total_Quantity_Sold FROM pizza_sales GROUP BY pizza_name ORDER BY Total_Quantity_Sold ASC LIMIT 5;

SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales GROUP BY pizza_name ORDER BY Total_Orders ASC LIMIT 5;