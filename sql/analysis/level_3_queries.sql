-- Question 3:
-- 1. Tìm sản phẩm bán chạy nhất mỗi tháng (theo quantity).
/*
WITH ranked_product AS (
SELECT  EXTRACT(MONTH FROM o.order_date) AS month,
		p.product_name,
		SUM(oi.quantity) AS total_quantity,
		RANK() OVER (PARTITION BY EXTRACT(MONTH FROM o.order_date) ORDER BY SUM(oi.quantity) DESC) AS rank
FROM orders o
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id
GROUP BY month,p.product_name
)
SELECT  month,
		product_name,
		total_quantity
FROM ranked_product
WHERE rank = 1
*/

-- 2. Tính tăng trưởng doanh thu từng tháng so với tháng trước (MoM Growth).
/*
WITH monthly_revenue as
(
SELECT  TO_CHAR(order_date, 'YYYY-MM') as month,
		SUM(p.price * oi.quantity) as revenue
FROM orders o
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id
GROUP BY month
ORDER BY month
),
monthly_sales as(
SELECT  month,
		revenue,
		LAG(revenue,1,0) OVER (ORDER BY month) as previous_month_revenue
from monthly_revenue
)
select  month,
		revenue,
		previous_month_revenue,
		ROUND(((revenue - previous_month_revenue) / NULLIF(previous_month_revenue,0)) * 100,2) as percentage_growth_rate
from monthly_sales
*/

-- 3. Xếp hạng các danh mục (category_name) theo tổng doanh thu.
/*
SELECT  c.category_name,
		SUM(p.price * oi.quantity) as revenue,
		RANK() OVER (ORDER BY SUM(p.price * oi.quantity) DESC) as rank
FROM categories c
INNER JOIN products p ON c.category_id = p.category_id
INNER JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY c.category_name
ORDER BY revenue DESC
*/

-- 4. Tìm khách hàng có đơn hàng gần đây nhất.
/*
SELECT  c.customer_name,
		o.order_date
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_date = (
	SELECT  MAX(order_date)
	FROM orders
)
*/

-- 5. Với mỗi khách hàng, tính tổng tiền họ đã trả và ngày mua gần nhất.
/*
with recent_orders as (
SELECT  c.customer_name,
		c.customer_id,
		MAX(o.order_date) as recent_order_date
FROM customers c 
INNER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name,c.customer_id
)
SELECT  ro.customer_name,
		ro.recent_order_date,
		SUM((p.price * oi.quantity)) as paid
FROM recent_orders ro
INNER JOIN orders o ON ro.customer_id = o.customer_id AND ro.recent_order_date = o.order_date
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id
GROUP BY ro.customer_name,ro.recent_order_date
ORDER BY ro.recent_order_date
*/