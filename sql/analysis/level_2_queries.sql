-- Question 2
-- 1. Tính tổng số tiền đã thanh toán của mỗi đơn hàng.
/*
SELECT  oi.order_id,
		SUM(oi.quantity * p.price) as total_paid
FROM order_items oi
INNER JOIN products p ON oi.product_id = p.product_id
GROUP BY oi.order_id
ORDER BY oi.order_id
*/

-- 2. Tính tổng số đơn hàng theo từng vùng (region) của khách hàng.
/*
SELECT  c.region,
		COUNT(o.order_id) AS total_orders
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.region
*/

-- 3. Liệt kê tên sản phẩm, số lượng bán được và tổng doanh thu của sản phẩm đó.
/*
SELECT  p.product_name,
		SUM(oi.quantity) as total_quantity,
		p.price,
		SUM(oi.quantity * p.price) as total_revenue
FROM products p
INNER JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name,p.price
ORDER BY total_revenue DESC
*/

-- 4. Tính tổng doanh thu mỗi tháng trong năm 2024.
/*
SELECT  EXTRACT(MONTH FROM o.order_date) as month,
		SUM(oi.quantity) as total_quantity,
		SUM(oi.quantity * p.price) as total_revenue
FROM orders o
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON p.product_id = oi.product_id
GROUP BY month
ORDER BY month
*/

-- 5.Liệt kê 3 khách hàng chi tiêu nhiều nhất.
/*
SELECT  c.customer_name,
		c.email,
		c.region,
		SUM(p.paid_amount) as total_paid
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN payments p ON o.order_id = p.order_id
GROUP BY c.customer_name,c.email,c.region
ORDER BY total_paid DESC
LIMIT 3
*/