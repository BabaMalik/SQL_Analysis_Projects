-- 🔹 Basic SQL Queries
-- Retrieve the total number of distinct orders. 

SELECT COUNT(DISTINCT order_id) FROM orders;

-- Find the number of orders placed on each date. 

SELECT date, COUNT(order_id) FROM orders GROUP BY date;

-- Get the total revenue from all pizza sales. 

SELECT ROUND(SUM(order_details.quantity * pizzas.price),2) AS total_sales
FROM order_details
JOIN pizzas ON pizzas.pizza_id = order_details.pizza_id;

-- Identify the highest-priced pizza. 

SELECT pt.name, MAX(p.price)
FROM pizza_types pt
JOIN pizzas p ON pt.pizza_type_id = p.pizza_type_id
GROUP BY pt.name
ORDER BY MAX(p.price) DESC LIMIT 1;

-- Find the most common pizza size ordered. 

SELECT pizzas.size, COUNT(order_details.order_details_id) AS order_count
FROM pizzas
JOIN order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.size
ORDER BY order_count DESC;

-- Retrieve the names of all unique pizza types available. 

-- Count the number of orders placed per year. 
-- Identify the top 5 most ordered pizza types by quantity. 
-- List all pizzas along with their sizes and prices. 
-- Find the pizza with the lowest price. 
-- Retrieve the names of pizzas containing "Cheese" in their ingredients. 
-- Count the total number of pizza orders for each day of the week.
-- List all unique pizza categories available. 
-- Find the maximum quantity ordered for a single order.
-- Count how many pizzas were ordered in the last 7 days.
