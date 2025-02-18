# 🍕 PizzaHut SQL Analysis

## 📚 Project Overview
This project is focused on **SQL practice** using **PizzaHut sales data** in **MySQL Workbench**. It includes **schema modifications, indexing, and advanced analytics queries** to extract business insights.

The dataset consists of **orders, pizza details, pizza types, and sales transactions**. This analysis helps understand **ordering patterns, revenue trends, and pizza preferences**.

---

## 🏢 Database Schema

### **1️⃣ Orders Table**
| Field       | Type  | Description |
|-------------|------|-------------|
| order_id    | INT  | Unique order identifier |
| date        | DATE | Order date |
| time        | TIME | Order time |
| order_year  | INT  | Extracted year from `date` |
| order_month | INT  | Extracted month from `date` |
| order_day   | INT  | Extracted day from `date` |

### **2️⃣ Order Details Table**
| Field            | Type  | Description |
|------------------|------|-------------|
| order_details_id | INT  | Unique order detail ID |
| order_id         | INT  | Foreign key referencing `orders` |
| pizza_id        | TEXT  | Foreign key referencing `pizzas` |
| quantity        | INT  | Quantity of ordered pizzas |

### **3️⃣ Pizzas Table**
| Field        | Type  | Description |
|-------------|------|-------------|
| pizza_id     | TEXT | Unique pizza identifier |
| pizza_type_id | TEXT | Foreign key referencing `pizza_types` |
| size        | TEXT | Pizza size (Small, Medium, Large) |
| price       | DOUBLE | Pizza price |

### **4️⃣ Pizza Types Table**
| Field          | Type         | Description |
|---------------|-------------|-------------|
| pizza_type_id | VARCHAR(50) | Unique pizza type identifier |
| name         | VARCHAR(255) | Name of the pizza |
| category     | VARCHAR(50)  | Pizza category (Veg, Non-Veg, Special) |
| ingredients  | TEXT         | Ingredients used |


---



## ❓ SQL Questions & Challenges

### **🔹 Basic SQL Queries (Completed ✅ & Pending ⏳)**  
1. Retrieve the total number of distinct orders. ✅  
2. Find the number of orders placed on each date. ✅  
3. Get the total revenue from all pizza sales. ✅  
4. Identify the highest-priced pizza. ✅  
5. Find the most common pizza size ordered. ✅  
6. Retrieve the names of all unique pizza types available. ✅  
7. Count the number of orders placed per year. ✅  
8. Identify the top 5 most ordered pizza types by quantity. ✅  
9. List all pizzas along with their sizes and prices. ✅  
10. Find the pizza with the lowest price. ⏳ Pending  
11. Retrieve the names of pizzas containing "Cheese" in their ingredients. ⏳ Pending  
12. Count the total number of pizza orders for each day of the week. ⏳ Pending  
13. List all unique pizza categories available. ⏳ Pending  
14. Find the maximum quantity ordered for a single order. ⏳ Pending  
15. Count how many pizzas were ordered in the last 7 days. ⏳ Pending  

---

### **🔹 Intermediate SQL Queries (Completed ✅ & Pending ⏳)**  
1. Identify the top 3 most expensive pizzas. ✅  
2. Determine the number of orders placed during each hour of the day. ✅  
3. Calculate the average order quantity per order. ✅  
4. Find the distribution of pizza categories across all orders. ✅  
5. Get the total number of pizzas ordered for each day. ✅  
6. Find the top 3 most popular pizza types based on revenue. ✅  
7. Find the percentage contribution of each pizza category to total sales. ✅  
8. Identify which pizza category generated the highest revenue. ⏳ Pending  
9. Find the revenue trend for the last 6 months. ⏳ Pending  
10. Determine the customer’s favorite pizza size over time. ⏳ Pending  
11. Rank the pizzas based on sales quantity. ⏳ Pending  
12. Find the most common order time (morning, afternoon, evening, night). ⏳ Pending  
13. Identify the day of the week with the highest sales. ⏳ Pending  
14. Analyze revenue trends based on pizza size. ⏳ Pending  
15. Retrieve the name of the least ordered pizza type. ⏳ Pending  

---

### **🔹 Advanced SQL Queries (Completed ✅ & Pending ⏳)**  
1. Calculate the cumulative revenue over time. ✅  
2. Find the pizza type that contributes the most revenue. ✅  
3. Determine the revenue trend for different pizza sizes. ✅  
4. Rank pizza categories based on total revenue. ✅  
5. Find the percentage contribution of each pizza type to the total revenue. ✅  
6. Identify the top-selling pizza for each pizza category. ⏳ Pending  
7. Analyze order patterns based on time intervals (e.g., morning, afternoon, night). ⏳ Pending  
8. Determine the most profitable pizza category over the last year. ⏳ Pending  
9. Find the average revenue generated per order. ⏳ Pending  
10. Compare pizza sales between weekdays and weekends. ⏳ Pending  
11. Find the revenue distribution based on pizza ingredients. ⏳ Pending  
12. Analyze monthly trends in pizza sales. ⏳ Pending  
13. Determine the highest revenue-generating hour of the day. ⏳ Pending  
14. Identify patterns in order frequency for specific pizza categories. ⏳ Pending  
15. Analyze sales seasonality (trends over different months). ⏳ Pending  

---


## ❓ SQL Questions & Solutions

### **🔹 Basic SQL Queries**  
1. Retrieve the total number of distinct orders.  
   ```sql
   SELECT COUNT(DISTINCT order_id) FROM orders;
   ```  
2. Find the number of orders placed on each date.  
   ```sql
   SELECT date, COUNT(order_id) FROM orders GROUP BY date;
   ```  
3. Get the total revenue from all pizza sales.  
   ```sql
   SELECT ROUND(SUM(order_details.quantity * pizzas.price),2) AS total_sales
   FROM order_details
   JOIN pizzas ON pizzas.pizza_id = order_details.pizza_id;
   ```  
4. Identify the highest-priced pizza.  
   ```sql
   SELECT pt.name, MAX(p.price)
   FROM pizza_types pt
   JOIN pizzas p ON pt.pizza_type_id = p.pizza_type_id
   GROUP BY pt.name
   ORDER BY MAX(p.price) DESC LIMIT 1;
   ```  
5. Find the most common pizza size ordered.  
   ```sql
   SELECT pizzas.size, COUNT(order_details.order_details_id) AS order_count
   FROM pizzas
   JOIN order_details ON pizzas.pizza_id = order_details.pizza_id
   GROUP BY pizzas.size
   ORDER BY order_count DESC;
   ```  
6-15. **Pending Queries** ⏳  

---

### **🔹 Intermediate SQL Queries**  
1. Identify the top 5 most ordered pizza types by quantity.  
   ```sql
   SELECT pizza_types.name, SUM(order_details.quantity) AS quantity
   FROM pizza_types
   JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
   JOIN order_details ON order_details.pizza_id = pizzas.pizza_id
   GROUP BY pizza_types.name ORDER BY quantity DESC LIMIT 5;
   ```  
2. Determine the number of orders placed during each hour of the day.  
   ```sql
   SELECT HOUR(time) AS hour, COUNT(order_id) AS order_count
   FROM orders
   GROUP BY HOUR(time);
   ```  
3. Calculate the average order quantity per order.  
   ```sql
   SELECT ROUND(AVG(quantity),2) AS avg_order_quantity FROM order_details;
   ```  
4-15. **Pending Queries** ⏳  

---

### **🔹 Advanced SQL Queries**  
1. Calculate the cumulative revenue over time.  
   ```sql
   SELECT
       o.date,
       SUM(od.quantity * p.price) AS daily_revenue,
       SUM(SUM(od.quantity * p.price)) OVER (ORDER BY o.date) AS cumulative_revenue
   FROM orders o
   JOIN order_details od ON o.order_id = od.order_id
   JOIN pizzas p ON od.pizza_id = p.pizza_id
   GROUP BY o.date
   ORDER BY o.date;
   ```  
2. Find the pizza type that contributes the most revenue.  
   ```sql
   SELECT
       pt.name,
       ROUND(SUM(od.quantity * p.price),2) AS total_revenue
   FROM order_details od
   JOIN pizzas p ON od.pizza_id = p.pizza_id
   JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
   GROUP BY pt.name
   ORDER BY total_revenue DESC LIMIT 1;
   ```  
3-15. **Pending Queries** ⏳  

---

## 📂 Folder Structure
```
📁 pizzahut-sql-analysis
│-- 📝 README.md
│-- 📄 pizza_analysis.sql
│-- 📊 queries/
│   ├── basic_queries.sql
│   ├── intermediate_queries.sql
│   ├── advanced_queries.sql
│-- 💁️ screenshots/
│   ├── schema.png
│   ├── query_results.png
│   ├── insights.png
```

---

## 🛠️ Future Enhancements
- Implement **stored procedures** for automation.  
- Use **SQL views** for common queries.  
- **Integrate Power BI / Tableau** for better visualization.  
- Use **machine learning** to predict pizza sales trends.  

---

## 🌟 Support
If you find this project helpful, please ⭐ the repo and share it with others! 🚀

