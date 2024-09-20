--  <Rohit Kumar>	ASSIGNMENT 2 ACCESSING DATA PART 1
--  Put your answers on the lines after each letter. E.g. your query for question 1A should go on line 5; your query for question 1B should go on line 7...
--  1 
-- A 
SELECT * from employees
-- B 
SELECT * from stock_item


--  2
-- A 
SELECT item,price from stock_items
-- B
SELECT first_name,last_name,role,phone from employees

--  3
-- A
SELECT item AS 'Product',category AS 'Animal' from stock_items
-- B
SELECT last_name AS 'Pet Store Staff',id AS 'Emp.ID',sin AS 'SIN' from employees

--  4
-- A
SELECT first_name,phone,role from employees WHERE role='Sales'
-- B
SELECT item,id,inventory from stock_items WHERE inventory<=12

--  5
-- A
SELECT item AS 'Kitty Cat',price from stock_items WHERE category='feline'
-- B
SELECT CONCAT(first_name,last_name) AS 'Staff Member' from employees WHERE id='115'