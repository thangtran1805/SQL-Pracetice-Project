INSERT INTO categories (category_name) VALUES
('Electronics'),
('Clothing'),
('Books'),
('Home & Kitchen');

INSERT INTO products (product_name, category_id, price) VALUES
('Smartphone', 1, 699.99),
('T-shirt', 2, 19.99),
('Cookbook', 3, 24.99),
('Blender', 4, 49.99),
('Laptop', 1, 1299.00),
('Jeans', 2, 49.90);

INSERT INTO customers (customer_name, email, region) VALUES
('Alice', 'alice@gmail.com', 'North'),
('Bob', 'bob@gmail.com', 'South'),
('Charlie', 'charlie@gmail.com', 'East'),
('David', 'david@gmail.com', 'West'),
('Eva', 'eva@gmail.com', 'North');

INSERT INTO orders (customer_id, order_date) VALUES
(1, '2024-01-01'),
(2, '2024-01-03'),
(1, '2024-01-10'),
(3, '2024-02-01'),
(4, '2024-02-15'),
(5, '2024-03-01');

INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, 1),
(3, 1, 1),
(3, 5, 1),
(4, 4, 1),
(5, 2, 3),
(6, 6, 2);

INSERT INTO payments (order_id, payment_method, paid_amount, payment_date) VALUES
(1, 'Credit Card', 739.97, '2024-01-01'),
(2, 'PayPal', 24.99, '2024-01-03'),
(3, 'Credit Card', 1998.99, '2024-01-10'),
(4, 'Cash', 49.99, '2024-02-01'),
(5, 'PayPal', 59.97, '2024-02-15'),
(6, 'Credit Card', 99.80, '2024-03-01');