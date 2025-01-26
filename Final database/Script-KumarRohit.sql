-- Database Creation
CREATE DATABASE db_restaurant_management;
USE db_restaurant_management;

-- Table Creation
-- Customers Table
CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    contact_info VARCHAR(100) NOT NULL,
    loyal_points DECIMAL DEFAULT 0,
    feedback VARCHAR(255)
);

-- Orders Table
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- Items Table
CREATE TABLE items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    menu_item_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (menu_item_id) REFERENCES menu(id)
);

-- Menu Table
CREATE TABLE menu (
    id INT AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(100) NOT NULL,
    ingredient_id INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    category VARCHAR(50)
);

-- Staff Table
CREATE TABLE staff (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    role VARCHAR(255) NOT NULL,
    contact_info VARCHAR(100) NOT NULL
);

-- Shifts Table
CREATE TABLE shifts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    staff_id INT NOT NULL,
    shift_date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    FOREIGN KEY (staff_id) REFERENCES staff(id)
);

-- Performance Table
CREATE TABLE performance (
    id INT AUTO_INCREMENT PRIMARY KEY,
    staff_id INT NOT NULL,
    rating DECIMAL(3, 2) NOT NULL,
    review_date DATE NOT NULL,
    review_description VARCHAR(255),
    FOREIGN KEY (staff_id) REFERENCES staff(id)
);

-- Sample Data Insertion
INSERT INTO customers (name, contact_info, loyal_points, feedback)
VALUES 
('Nitish sharma', 'nitishsharma@gmail.com', 10, 'Great service!'),
('Sumit singh', 'sumitsingh@gmail.com', 20, 'Love the food'),
('Abhiraj Abhiraj', 'abhiraj24@gmail.com', 25, 'Great service!'),
('Janine Intrakul', 'jajaint@gmail.com', 20, 'Not good');

INSERT INTO menu (item_name, ingredient_id, price, stock, category)
VALUES
('Burger', 101, 5.99, 50, 'Fast Food'),
('Pasta', 102, 8.99, 30, 'Italian');

INSERT INTO orders (customer_id, order_date)
VALUES
(1, '2024-11-30'),
(2, '2024-11-30');

INSERT INTO items (order_id, menu_item_id, quantity)
VALUES
(1, 1, 2),
(2, 2, 1);

INSERT INTO staff (name, role, contact_info)
VALUES
('Alice', 'Chef', 'alice@gmail.com'),
('Bob', 'Waiter', 'bob@gmail.com');

INSERT INTO shifts (staff_id, shift_date, start_time, end_time)
VALUES
(1, '2024-11-30', '09:00:00', '17:00:00'),
(2, '2024-11-30', '12:00:00', '20:00:00');

INSERT INTO performance (staff_id, rating, review_date, review_description)
VALUES
(1, 4.5, '2024-11-30', 'Efficient and skilled.'),
(2, 4.0, '2024-11-30', 'Friendly and professional.');

-- Trigger to Update Inventory
DELIMITER //
CREATE TRIGGER update_inventory_trigger
AFTER INSERT ON items
FOR EACH ROW
BEGIN
    UPDATE menu
    SET stock = stock - NEW.quantity
    WHERE id = NEW.menu_item_id;
END //
DELIMITER ;

-- Stored Procedure to Generate Staff Performance Report
DELIMITER //
CREATE PROCEDURE generate_staff_performance_report(IN start_date DATE, IN end_date DATE)
BEGIN
    SELECT s.name, p.rating, p.review_date, p.review_description
    FROM staff s
    JOIN performance p ON s.id = p.staff_id
    WHERE p.review_date BETWEEN start_date AND end_date;
END //
DELIMITER ;

-- View to Consolidate Customer Orders
CREATE VIEW customer_orders_view AS
SELECT 
    c.name AS customer_name, 
    c.contact_info, 
    o.id AS order_id, 
    o.order_date, 
    m.item_name, 
    i.quantity
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN items i ON o.id = i.order_id
JOIN menu m ON i.menu_item_id = m.id;

-- Example Queries to Demonstrate Features
-- View Customer Orders
SELECT * FROM customer_orders_view; 

-- Generate Staff Performance Report
CALL generate_staff_performance_report('2024-11-01', '2024-11-30');

INSERT INTO items (order_id, menu_item_id, quantity)
VALUES
(3,2, 2);