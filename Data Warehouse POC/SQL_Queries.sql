-- 1.	How many orders are placed at each state level

SELECT c.customer_state, count(*) as 'count'
FROM orders o join customers c 
WHERE o.order_customer_id = c.customer_id
GROUP BY c.customer_state;

-- 2.	orders placed in each city

SELECT c.customer_city, c.customer_state, count(*) as 'count'
FROM orders o join customers c 
WHERE o.order_customer_id = c.customer_id
GROUP BY c.customer_state, c.customer_city ;

-- 3.	creating table order_count_by_city

create table order_count_by_city 
AS
SELECT c.customer_city, c.customer_state, count(*) as 'count'
FROM orders o join customers c 
WHERE o.order_customer_id = c.customer_id
GROUP BY c.customer_state, c.customer_city ;

-- 4.	revenue generated by each department. 


SELECT department_name, round(sum(order_item_subtotal),2)
FROM (
	departments d RIGHT OUTER JOIN categories c ON d.department_id = c.category_department_id 
	JOIN 
    products p on c.category_id = p.product_category_id
    JOIN 
    order_items o ON p.product_id = o.order_item_product_id
	)
GROUP BY d.department_name;


