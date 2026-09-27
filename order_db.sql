SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
-- Name: Sanika Kangane
-- Roll No: 150096725211
SELECT customer_name, city, country
FROM customers
WHERE country = 'India'
ORDER BY customer_name ASC;
-- Name: Sanika Kangane
-- Roll No: 150096725211
SELECT *
FROM products
WHERE category = 'Electronics'
  AND price > 10000
ORDER BY price DESC;
-- Name: Sanika Kangane
-- Roll No: 150096725211
SELECT order_id, customer_id, product_id, order_date
FROM orders
WHERE order_date BETWEEN '2024-01-01' AND '2024-01-31';
-- Name: Sanika Kangane
-- Roll No: 150096725211
SELECT customer_name, country
FROM customers
WHERE country <> 'India';
-- Name: Sanika Kangane
-- Roll No: 150096725211
SELECT *
FROM products
WHERE product_name LIKE 'L%'
   OR category = 'Stationery';
-- Name: Sanika Kangane
-- Roll No: 150096725211
SELECT *
FROM orders
WHERE quantity > 1
ORDER BY order_date ASC;
-- Name: Sanika Kangane
-- Roll No: 150096725211
SELECT product_id, SUM(quantity) AS total_quantity
FROM orders
GROUP BY product_id;
-- Name: Sanika Kangane
-- Roll No: 150096725211
SELECT customer_id, COUNT(*) AS order_count
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 1;
-- Name: Sanika Kangane
-- Roll No: 150096725211
SELECT p.category,
       SUM(p.price * o.quantity) AS total_revenue
FROM products p
INNER JOIN orders o
    ON p.product_id = o.product_id
GROUP BY p.category;
-- Name: Sanika Kangane
-- Roll No: 150096725211
SELECT category,
       AVG(price) AS average_price
FROM products
GROUP BY category
ORDER BY average_price DESC;
-- Name: Sanika Kangane
-- Roll No: 150096725211
SELECT customer_id
FROM orders
GROUP BY customer_id
HAVING COUNT(*) = (
    SELECT MAX(order_count)
    FROM (
        SELECT COUNT(*) AS order_count
        FROM orders
        GROUP BY customer_id
    ) AS customer_orders
);
-- Name: Sanika Kangane
-- Roll No: 150096725211
SELECT EXTRACT(MONTH FROM order_date) AS month,
       SUM(quantity) AS total_quantity
FROM orders
GROUP BY EXTRACT(MONTH FROM order_date)
ORDER BY month;
-- Name: Sanika Kangane
-- Roll No: 150096725211
SELECT c.customer_name,
       p.product_name,
       o.quantity,
       o.order_date
FROM orders o
INNER JOIN customers c
    ON o.customer_id = c.customer_id
INNER JOIN products p
    ON o.product_id = p.product_id;
-- Name: Sanika Kangane
-- Roll No: 150096725211
SELECT c.customer_id,
       c.customer_name,
       c.city,
       c.country,
       o.order_id,
       o.product_id,
       o.order_date,
       o.quantity
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id;
-- Name: Sanika Kangane
-- Roll No: 150096725211
SELECT p.product_id,
       p.product_name,
       p.category,
       p.price,
       o.order_id,
       o.customer_id,
       o.order_date,
       o.quantity
FROM products p
LEFT JOIN orders o
    ON p.product_id = o.product_id;
-- Name: Sanika Kangane
-- Roll No: 150096725211
SELECT c.customer_id,
       c.customer_name,
       p.product_id,
       p.product_name
FROM customers c
CROSS JOIN products p;
-- Name: Sanika Kangane
-- Roll No: 150096725211
SELECT c.customer_id,
       c.customer_name,
       SUM(p.price * o.quantity) AS total_revenue
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
INNER JOIN products p
    ON o.product_id = p.product_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_revenue DESC;
-- Name: Sanika Kangane
-- Roll No: 150096725211
SELECT c.customer_id,
       c.customer_name,
       c.city,
       c.country
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
\s order_db;
