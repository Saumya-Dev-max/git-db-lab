-- Section A – Basic Queries
-- starts with letter "A".

-- SELECTING CUSTOMERS NAME STARTING WITH 'A':
SELECT * FROM customer
WHERE name LIKE 'A%';
-- COUNTING NO. OF CUTOMERS WHOSE NAME IS STARTING FROM 'A':
SELECT COUNT(*) FROM customer
WHERE name LIKE 'A%';        --output:17681


-- Section B – Sorting & Filtering
-- Q6.
-- Display the top 10 highest priced products.

-- SELECTING TOP 10 HIGHEST PRICED PRODUCTS NAME,PRICE,DESCRIPTION
SELECT name,price,description 
FROM customer
ORDER BY price DESC
LIMIT 10;

-- Q7.
-- Find all orders having payment amount between 1000 and 5000.
SELECT * FROM ORDERS
WHERE total_amount BETWEEN 1000 AND 5000;

-- Q8.
-- Show products belonging to category ID 5.
SELECT * FROM product
WHERE c_id=5;


-- Q9.
-- Find all customers from a particular city.
SELECT * FROM customer
WHERE city='Bhubaneswar';

-- Q10.
-- Display latest 20 orders.
SELECT *
FROM orders
ORDER BY order_date DESC
LIMIT 20;




-- Section C – Aggregate Functions

-- Q11.
-- Find total number of customers.
SELECT COUNT(*) FROM customer;



-- Q12.
-- Find:
-- minimum product price
-- maximum product price
-- average product price

-- SELECTING MAXIMUM PRICED PRODUCT ID,NAME,PRICE
SELECT p_id, name, price
FROM product
WHERE price = (
    SELECT MAX(price)
    FROM product
);
-- SELECTING MINIMUM PRICED PRODUCT ID,NAME,PRICE
SELECT p_id, name, price
FROM product
WHERE price = (
    SELECT MIN(price)
    FROM product
);
-- SELECTING AVERAGE PRODUCT PRICE
SELECT AVG(price) AS average_price
FROM product;


-- Q13.
-- Find total payment collected from all orders.
SELECT SUM(total_amount) AS total_payment_collected
FROM orders;



-- Q14.
-- Count total number of orders for each customer.
SELECT user_id, COUNT(*) AS total_orders
FROM orders
GROUP BY user_id;


-- Q15.
-- Find total products available in each category.
SELECT c_id, COUNT(*) AS total_products
FROM product
GROUP BY c_id;



-- Section D – JOIN Queries
-- Q16.
-- Display:
-- customer name
-- order ID
-- order date
-- using JOIN between "customer" and "orders".
SELECT customer.name,
       orders.order_id,
       orders.order_date
FROM customer
JOIN orders
ON customer.user_id = orders.user_id;

-- Q17.
-- Display:
-- product name
-- category name
-- using JOIN.
SELECT p.name AS product_name,
       c.name AS category_name
FROM product p
JOIN category c
ON p.c_id = c.c_id;


-- Q18.
-- Display:
-- order ID
-- payment status
-- payment amount
-- using JOIN between "orders" and "payment".
SELECT o.order_id,
       p.payment_type AS payment_type,
       p.amount
FROM orders o
JOIN payment p
ON o.order_id = p.order_id;


-- Q19.
-- Display all products added in cart by customers.
SELECT c.name AS customer_name,
       p.name AS product_name,
       ci.quantity
FROM customer c
JOIN cart ct
ON c.user_id = ct.user_id
JOIN cart_items ci
ON ct.cart_id = ci.cart_id
JOIN product p
ON ci.product_id = p.p_id;

-- Q20.
-- Display all ordered products with quantity.
SELECT o.order_id,
       p.name AS product_name,
       oi.quantity
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
JOIN product p
ON oi.product_id = p.p_id;


-- Q21.
-- Find top 5 customers who placed maximum orders
SELECT c.name AS customer_name,
       COUNT(o.order_id) AS total_orders
FROM customer c
JOIN orders o
ON c.user_id = o.user_id
GROUP BY c.name
ORDER BY total_orders DESC
LIMIT 5;


-- Q22.
-- Find products never ordered.
SELECT p.p_id,
       p.name
FROM product p
LEFT JOIN order_items oi
ON p.p_id = oi.product_id
WHERE oi.product_id IS NULL;


-- Q23.
-- Find customers who placed more than 5 orders.
SELECT c.name AS customer_name,
       COUNT(o.order_id) AS total_orders
FROM customer c
JOIN orders o
ON c.user_id = o.user_id
GROUP BY c.name
HAVING COUNT(o.order_id) > 5;



-- Q24.
-- Find top selling products based on quantity sold.
SELECT p.name AS product_name,
       SUM(oi.quantity) AS total_quantity_sold
FROM product p
JOIN order_items oi
ON p.p_id = oi.product_id
GROUP BY p.name
ORDER BY total_quantity_sold DESC;


-- Q25.
-- Create a query to generate daily sales report.
SELECT order_date,
       SUM(total_amount) AS daily_sales
FROM orders
GROUP BY order_date
ORDER BY order_date;
