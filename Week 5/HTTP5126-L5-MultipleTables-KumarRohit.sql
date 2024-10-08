--  LAB 5 MULTIPLE TABLES
--  Put your answers on the lines after each letter. E.g. your query for question 1A should go on line 5; your query for question 1B should go on line 7...
--  1 
-- A 
SELECT * FROM sales WHERE item = 1014;
-- B 
SELECT sales.`date`,stock_items.item FROM sales INNER JOIN stock_items ON sales.item=stock_items.id WHERE stock_items.id=1014;

--  2
-- A 
SELECT * FROM sales WHERE employee = 111;
-- B
SELECT sales.`date`,employees.first_name,employees.last_name,sales.item FROM sales INNER JOIN employees ON sales.employee=employees.id WHERE sales.employee=111;  

--  3
-- A
SELECT sales.`date`,sales.item,employees.first_name FROM sales INNER JOIN employees ON sales.employee=employees.id WHERE sales.`date` BETWEEN '2024-09-12' AND '2024-09-18'; 
-- B
SELECT employees.first_name, employees.last_name, COUNT(sales.id) AS sales_count FROM sales  JOIN employees  ON sales.employee = employees.id GROUP BY employees.first_name, employees.last_name ORDER BY sales_count DESC;

--  4
-- A
SELECT s.`date`, si.item, si.price, si.category, e.first_name FROM sales s JOIN stock_items si ON s.item = si.id JOIN employees e ON s.employee = e.id WHERE s.employee = (SELECT e.id FROM sales s JOIN employees e ON s.employee = e.id GROUP BY e.id ORDER BY COUNT(s.id) DESC LIMIT 1);

-- B
SELECT si.id, si.item, si.price, si.category, COUNT(s.id) AS times_sold FROM stock_items si LEFT JOIN sales s ON si.id = s.item GROUP BY si.id ORDER BY si.id;

--  5
-- A <What is the total revenue generated by each employee for each item sold? Display the employee's first and last name along with the item sold, and order the results by total revenue in descending order.>
-- B
SELECT e.first_name, e.last_name, si.item, SUM(si.price) AS total_revenue FROM sales s JOIN employees e ON s.employee = e.id JOIN stock_items si ON s.item = si.id GROUP BY e.first_name, e.last_name, si.item ORDER BY total_revenue DESC;