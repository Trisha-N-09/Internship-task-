CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    customer_name TEXT NOT NULL,
    city TEXT,
    email TEXT
);

CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT NOT NULL,
    category TEXT,
    price REAL
);

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    order_date TEXT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers VALUES
(1, 'Rahul', 'Bangalore', 'rahul@gmail.com'),
(2, 'Ananya', 'Chennai', 'ananya@gmail.com'),
(3, 'Arjun', 'Mumbai', 'arjun@gmail.com'),
(4, 'Priya', 'Delhi', 'priya@gmail.com'),
(5, 'Sneha', 'Bangalore', 'sneha@gmail.com');

INSERT INTO products VALUES
(101, 'Laptop', 'Electronics', 55000),
(102, 'Smartphone', 'Electronics', 25000),
(103, 'Headphones', 'Electronics', 3000),
(104, 'Shoes', 'Fashion', 2000),
(105, 'Backpack', 'Fashion', 1500);

INSERT INTO orders VALUES
(1001, 1, 101, 1, '2026-08-01'),
(1002, 2, 102, 2, '2026-08-03'),
(1003, 3, 103, 3, '2026-08-05'),
(1004, 1, 104, 2, '2026-08-07'),
(1005, 4, 105, 1, '2026-08-10'),
(1006, 5, 102, 1, '2026-08-12'),
(1007, 2, 103, 2, '2026-08-15'),
(1008, 3, 101, 1, '2026-08-18');
SELECT * FROM customers;
SELECT product_name, category, price
FROM products
WHERE price > 3000
ORDER BY price DESC;
SELECT 
    p.product_name,
    SUM(o.quantity) AS total_quantity_sold,
    SUM(o.quantity * p.price) AS total_revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC;
SELECT product_name, price
FROM products
WHERE price > (
    SELECT AVG(price)
    FROM products
)
ORDER BY price DESC;
SELECT
    c.customer_name,
    c.city,
    o.order_id,
    o.quantity
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
ORDER BY c.customer_name;
SELECT
    c.customer_name,
    c.city,
    o.order_id,
    o.quantity
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
ORDER BY c.customer_name;SELECT
    c.customer_name,
    c.city,
    o.order_id,
    o.quantity
FROM orders o
RIGHT JOIN customers c
    ON o.customer_id = c.customer_id
ORDER BY c.customer_name;CREATE VIEW customer_orders AS
SELECT
    c.customer_name,
    c.city,
    p.product_name,
    o.quantity,
    p.price,
    (o.quantity * p.price) AS revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN products p
    ON o.product_id = p.product_id;
SELECT * FROM customer_orders;
CREATE INDEX idx_orders_customer
ON orders(customer_id);
EXPLAIN QUERY PLAN
SELECT *
FROM orders
WHERE customer_id = 2;
