-- USE canteen;
-- #1 Most Popular Food Items
-- Shows which food items were ordered the most (by quantity)
SELECT 
    m.item_name AS food_item, 
    SUM(o.quantity) AS total_quantity_sold
FROM orders o
JOIN menu m ON o.item_id = m.item_id
GROUP BY m.item_name
ORDER BY total_quantity_sold DESC;

-- #2 Year-wise Order Frequency
-- Identifies which academic year students place the most orders
SELECT 
    s.year AS student_year, 
    COUNT(o.order_id) AS total_orders
FROM orders o
JOIN students s ON o.student_id = s.student_id
GROUP BY s.year
ORDER BY total_orders DESC;

-- #3 Most Active Students (Top 5)
-- Finds the 5 students who placed the most orders
SELECT 
    s.name AS student_name, 
    COUNT(o.order_id) AS orders_placed
FROM orders o
JOIN students s ON o.student_id = s.student_id
GROUP BY s.name
ORDER BY orders_placed DESC
LIMIT 5;

-- #4 Items Ordered More Than Once in a Single Order
-- Counts how many times items were ordered in quantity >1
SELECT 
    m.item_name AS food_item, 
    COUNT(*) AS times_ordered_more_than_once
FROM orders o
JOIN menu m ON o.item_id = m.item_id
WHERE o.quantity > 1
GROUP BY m.item_name
ORDER BY times_ordered_more_than_once DESC;

-- #5 Department-wise Average Spend
-- Calculates average spend per order by department
SELECT 
    s.department AS department, 
    ROUND(AVG(o.quantity * m.price), 2) AS avg_spend
FROM orders o
JOIN students s ON o.student_id = s.student_id
JOIN menu m ON o.item_id = m.item_id
GROUP BY s.department
ORDER BY avg_spend DESC;



