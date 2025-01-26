--  LAB 9 Views & Triggers
--  Put your answers on the lines after each letter. E.g. your query for question 1A should go on line 5; your query for question 1B should go on line 7...
--  1 
-- A 
CREATE VIEW stock_items_under_twenty AS SELECT category, item, inventory FROM stock_items WHERE inventory <= 20;
-- B 
SELECT * FROM stock_items_under_twenty;
-- C 
SELECT * FROM stock_items_under_twenty WHERE inventory = 0;

--  2 
-- A 
CREATE VIEW sales_total_by_employee AS SELECT employees.first_name, employees.last_name, SUM(stock_items.price) AS `Total Sales ($)` FROM sales JOIN employees ON sales.employee = employees.id JOIN stock_items ON sales.item = stock_items.id WHERE employees.role = 'Sales' GROUP BY employees.id ORDER BY `Total Sales ($)` DESC;
-- B 
SELECT * FROM sales_total_by_employee;
-- C 
SELECT * FROM sales_total_by_employee WHERE `Total Sales ($)` > 1000;

--  3 
-- A 
CREATE TRIGGER deduct_inventory_after_sale AFTER INSERT ON sales FOR EACH ROW UPDATE stock_items SET inventory = inventory - 1 WHERE id = NEW.item;
-- B 
INSERT INTO sales (date, item, employee) VALUES ('2021-06-21', 1003, 112);
-- C 


--  4 
-- A 

-- B 

-- C 


--  5
-- Run the queries in part A below before completing part 5B. 
-- Place your part 5 query below these queries where part B is indicated. 
-- Ensure these queries are included in your submission.
--
-- A
INSERT INTO stock_items (item, price, inventory, category) 
  VALUES ('Bad dog bed', '95', 2, 'Canine');
DELETE FROM stock_items 
  WHERE item = 'Bad dog bed';
INSERT INTO stock_items (item, price, inventory, category) 
  VALUES('Tiny size chew toy', 5, 5, 'Canine'),
  ('Huge water dish', 99, 18, 'Feline'),
  ('Fish bowl expert kit', 88, 11, 'Piscine'),
  ('Luxury cat collar', 150, 10, 'Feline');
UPDATE stock_items
  SET inventory = 0
  WHERE item = 'Luxury cat collar';
DELETE FROM stock_items
  WHERE inventory = 0;
UPDATE stock_items
  SET category = 'Cat'
  WHERE category = 'Feline';
INSERT INTO sales (`date`, item, employee)
  VALUES (NOW(), 1008, 114);
INSERT INTO sales (`date`, item, employee)
  VALUES (NOW(), 1005, 111);
-- B

