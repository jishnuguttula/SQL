# 🛒 E-Commerce SQL Database Project

## 📌 Project Overview

This project demonstrates the design and analysis of an **E-Commerce database** using **MySQL**.
It simulates how an online store manages customers, products, and orders.

The project focuses on:

* Database design
* SQL queries
* Business insights from data


# 🗂 Database Schema

The database contains four main tables:

1. **users** – customer information
2. **products** – product catalog
3. **orders** – purchase records
4. **order_items** – items inside each order

Relationship structure:

users → orders → order_items ← products

---

# 📊 Dataset

| Table       | Records |
| ----------- | ------- |
| Users       | 100     |
| Products    | 50      |
| Orders      | 200+    |
| Order Items | 500     |

---

# 🔎 Example Analysis Queries

### Top Selling Products

```sql
SELECT p.product_name, SUM(oi.quantity) total_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;
```

### Top Customers

```sql
SELECT u.name, SUM(o.total_amount) money_spent
FROM users u
JOIN orders o ON u.user_id = o.user_id
GROUP BY u.name
ORDER BY money_spent DESC;
```

### Revenue by Category

```sql
SELECT p.category,
SUM(oi.quantity * oi.price) revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category;
```

---

# 🧰 Technologies Used

* MySQL
* SQL
* GitHub

# 🚀 Future Improvements

* Add payment system
* Add product reviews
* Create dashboards
* Optimize queries
