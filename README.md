# Files from http-5126
## Database Design and Development
## Course Code: HTTP 5126

### Academic Year: 2025-2026

This course provides strategies and techniques for designing, creating and interacting with a database. SQL and MySQL languages are the primary focus, with an introduction to NoSQL options.

# Links
https://www.w3schools.com/sql/

# Images
![Database Design Overview](sql.png)

***Notice:*** This repository is dedicated to database design and development practices. It is highly recommended that you familiarize yourself with both SQL and NoSQL concepts to effectively utilize the resources provided.
# Examples of SQL Comands
-- Put your answers on the lines after each letter. E.g. your query for question 1A should go on line 5; your query for question 1B should go on line 7...
-- 1 
-- A
SELECT * FROM employees WHERE role= 'manager' OR role = 'Assistant';
-- B
SELECT * FROM stock_items WHERE category = 'Piscine' AND inventory < 24;

-- 2
-- A
SELECT * FROM stock_items WHERE item LIKE '%cage';
-- B
SELECT * FROM employees WHERE first_name LIKE 'F%';

-- 3
-- A
SELECT * FROM stock_items WHERE id BETWEEN 1010 and 1015;
-- B
SELECT item, price FROM stock_items WHERE category = 'Canine' AND price BETWEEN 10 AND 20;

-- 4
-- A
SELECT  CONCAT(first_name," ",last_name) AS "Names",phone FROM employees WHERE NOT (role='Manager' AND role='Assistant');
-- B
SELECT item, price, inventory FROM stock_items WHERE category NOT IN ('Feline', 'Canine') AND inventory <= 20;

-- 5
-- A
SELECT first_name,last_name,role AS 'Job Title',phone FROM employees ORDER BY last_name;
-- B
SELECT id, item, price, inventory FROM stock_items WHERE category= 'Murine' AND inventory >20
ORDER BY price DESC ;
