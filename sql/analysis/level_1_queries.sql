-- Question 1: 
-- 1. Lấy danh sách tất cả khách hàng và vùng miền của họ.
/*
SELECT  customer_name,
		region
FROM customers
*/

-- 2. Liệt kê tất cả các đơn hàng của khách hàng tên “Alice”.
/*
SELECT  c.customer_name,
		o.order_id,
		oi.quantity,
		p.product_name
		o.order_date
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE c.customer_name = 'Alice'
ORDER BY o.order_date;
*/

-- 3. Liệt kê sản phẩm và giá tiền, sắp xếp theo giá giảm dần.
SELECT  product_name as product,
		price
FROM products
ORDER BY price DESC;