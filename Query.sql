-- top selling products
SELECT product_id, SUM(quantity) AS total_sold
FROM order_items
GROUP BY product_id
ORDER BY total_sold DESC
LIMIT 10;

-- orders per user
SELECT user_id, COUNT(*) AS orders
FROM orders
GROUP BY user_id
ORDER BY orders DESC;

-- monthly sales
SELECT 
MONTH(order_date) AS month,
SUM(total_amount) AS revenue
FROM orders
GROUP BY MONTH(order_date)
ORDER BY month;

-- total revenue
SELECT SUM(total_amount) AS revenue
FROM orders;

-- customer by city
SELECT 
city,
COUNT(*) AS total_customers
FROM users
GROUP BY city
ORDER BY total_customers DESC;

-- top customer
SELECT 
u.user_id,
u.name,
SUM(o.total_amount) AS money_spent
FROM users u
JOIN orders o 
ON u.user_id = o.user_id
GROUP BY u.user_id, u.name
ORDER BY money_spent DESC
LIMIT 10;

-- revenue by category
SELECT 
p.category,
SUM(oi.quantity * oi.price) AS revenue
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;

-- average order values
SELECT 
AVG(total_amount) AS average_order_value
FROM orders;

-- top 3 customers in city
SELECT *
FROM (
    SELECT 
        u.city,
        u.name,
        SUM(o.total_amount) AS total_spent,
        RANK() OVER (PARTITION BY u.city ORDER BY SUM(o.total_amount) DESC) AS rnk
    FROM users u
    JOIN orders o ON u.user_id = o.user_id
    GROUP BY u.city, u.name
) ranked
WHERE rnk <= 3;

-- popular categoary
SELECT 
p.category,
COUNT(*) AS total_orders
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY total_orders DESC
LIMIT 1;

-- sale trend analysis
SELECT 
order_date,
SUM(total_amount) AS daily_sales,
SUM(SUM(total_amount)) OVER (ORDER BY order_date) AS running_total
FROM orders
GROUP BY order_date;