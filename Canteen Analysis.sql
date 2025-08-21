# 1. View all data
SELECT * FROM Students;
SELECT * FROM Orders;
SELECT * FROM Menu;

# 2. Filtering 
-- students from CSE department
SELECT * FROM Students 
WHERE department = 'CSE';

-- orders placed on a specific date
SELECT * FROM Orders 
WHERE Order_id = 28;

# 3. Sorting
-- List menu items in order of price (low to high)
SELECT * FROM Menu ORDER BY Price ASC;

-- List students by year (High to low)
SELECT * FROM Students ORDER BY year DESC;

# 4. Counting records
-- Count total students
SELECT COUNT(*) AS total_students FROM Students;

# 5. Aggregations (SUM, AVG)
-- Find total sales amount
SELECT SUM(Quantity * Price) AS total_sales FROM Orders
JOIN Menu ON Orders.Item_id = Menu.Item_id;

-- Find average price of menu items
SELECT AVG(Price) AS avg_price FROM Menu;

# 6. Simple JOIN 
-- Show order details with student name
SELECT o.Order_id, s.name, m.Item_name, o.Quantity
FROM Orders o
JOIN Students s ON o.Student_id = s.Student_id
JOIN Menu m ON o.Item_id = m.Item_id;

# Group By 
-- Find how many orders each student placed
SELECT s.name, COUNT(o.Order_id) AS total_orders
FROM Students s
JOIN Orders o ON s.Student_id = o.Student_id
GROUP BY s.name;

-- Find total quantity sold for each menu item
SELECT m.Item_name, SUM(o.Quantity) AS total_quantity
FROM Orders o
JOIN Menu m ON o.Item_id = m.Item_id
GROUP BY m.Item_name;




