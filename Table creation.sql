
use onlineshoppingdatabase;

CREATE TABLE `onlineshoppingdatabase`.`customers` (
  `Customer_id` INT(10) NOT NULL AUTO_INCREMENT,
  `First_name` VARCHAR(60) NOT NULL,
  `Last_name` VARCHAR(60) NOT NULL,
  `DoB` DATE NULL,
  `Address` VARCHAR(60) NULL,
  `Phone` INT(10) NOT NULL,
  PRIMARY KEY (`Customer_id`));
  
  INSERT INTO customers values(1, 'John', 'Doe', '1990-05-15', '123 Main St', 5551234);
  INSERT INTO customers values(2, 'Jane', 'Smith', '1985-08-22', '456 Oak St', 5555678);
  INSERT INTO customers values(3, 'Bob', 'Johnson', '1992-02-10', '789 Pine St', 5559876);
  INSERT INTO customers values(4, 'Alice', 'Williams', '1988-11-30', '101 Elm St', 5554321);
  INSERT INTO customers values(5, 'Charlie', 'Brown', '1995-07-18', '202 Maple St', 5558765);
  INSERT INTO customers values(6, 'Emma', 'Davis', '1993-04-05', '303 Cedar St', 5552345);
  INSERT INTO customers values(7, 'Michael', 'Miller', '1987-09-25', '404 Birch St', 5557890);
  INSERT INTO customers values(8, 'Olivia', 'Wilson', '1994-12-12', '505 Walnut St', 5553456);
  INSERT INTO customers values(9, 'Ethan', 'Jones', '1991-06-08', '606 Spruce St', 5556543);
  INSERT INTO customers values(10, 'Sophia', 'Anderson', '1989-03-20', '707 Pine St', 5552109);
  INSERT INTO customers values(11, 'Liam', 'Taylor', '1996-01-17', '808 Oak St', 5558901);
  INSERT INTO customers values(12, 'Ava', 'Martin', '1997-08-03', '909 Maple St', 5551230);
  INSERT INTO customers values(13, 'Noah', 'Harris', '1998-04-29', '1010 Cedar St', 5554567);
  INSERT INTO customers values(14, 'Isabella', 'White', '1986-10-14', '1111 Elm St', 5557898);
  INSERT INTO customers values(15, 'Mia', 'Lee', '1999-07-07', '1212 Birch St', 5552340);
  
  CREATE TABLE `onlineshoppingdatabase`.`products` (
  `Product_id` INT(10) NOT NULL AUTO_INCREMENT,
  `Product_name` VARCHAR(60) NOT NULL,
  `Stock_quantity`VARCHAR(60) NULL,
  `Price` DECIMAL(10,2) NULL,
  `Category` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Product_id`));
  
INSERT INTO Products VALUES(1, 'Laptop', 50, 999.99, 'Electronics');
INSERT INTO Products VALUES(2, 'Smartphone', 100, 499.99, 'Electronics');
INSERT INTO Products VALUES(3, 'Coffee Maker', 30, 89.99, 'Appliances');
INSERT INTO Products VALUES(4, 'Running Shoes', 75, 59.99, 'Footwear');
INSERT INTO Products VALUES(5, 'Backpack', 40, 29.99, 'Fashion');
INSERT INTO Products VALUES(6, 'Desk Chair', 20, 149.99, 'Furniture');
INSERT INTO Products VALUES(7, 'Digital Camera', 25, 399.99, 'Electronics');
INSERT INTO Products VALUES(8, 'Microwave Oven', 15, 129.99, 'Appliances');
INSERT INTO Products VALUES(9, 'Sneakers', 60, 79.99, 'Footwear');
INSERT INTO Products VALUES(10, 'Sunglasses', 50, 19.99, 'Fashion');
INSERT INTO Products VALUES(11, 'Desk Lamp', 35, 39.99, 'Home Decor');
INSERT INTO Products VALUES(12, 'Fitness Tracker', 80, 69.99, 'Electronics');
INSERT INTO Products VALUES(13, 'Toaster', 25, 49.99, 'Appliances');
INSERT INTO Products VALUES(14, 'Running Shorts', 90, 24.99, 'Apparel');
INSERT INTO Products VALUES(15, 'Bluetooth Speaker', 40, 79.99, 'Electronics');
INSERT INTO Products VALUES(16, 'Coffee Table', 10, 199.99, 'Furniture');
INSERT INTO Products VALUES(17, 'Wristwatch', 70, 129.99, 'Fashion');
INSERT INTO Products VALUES(18, 'Blender', 20, 69.99, 'Appliances');
INSERT INTO Products VALUES(19, 'Hiking Boots', 55, 89.99, 'Footwear');
INSERT INTO Products VALUES(20, 'Wall Clock', 30, 29.99, 'Home Decor');

  CREATE TABLE `onlineshoppingdatabase`.`order_details` (
  `order_id` INT(10) NOT NULL AUTO_INCREMENT,
  `Product_id`  INT(10) NOT NULL,
  `Customer_id` INT(10) NULL,
  `Date` DATE NULL,
  `Quantity` INT(10) NULL,
  `Unit_price` DECIMAL(10,2) NULL,
  PRIMARY KEY (`order_id`),
  CONSTRAINT `fk_orders_customers` FOREIGN KEY (`customer_id`) 
  REFERENCES `customers` (`customer_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_orders_products` FOREIGN KEY (`Product_id`) 
  REFERENCES `products` (`Product_id`) ON UPDATE CASCADE);
    
INSERT INTO order_details values(1,2,1,'2023-07-01',2,499.99);
INSERT INTO order_details values(2,3,3,'2023-07-01',3,89.99);
INSERT INTO order_details values(3,10,14,'2023-07-01',10,19.99);
INSERT INTO order_details values(4,16,1,'2023-07-01',1,199.99);
INSERT INTO order_details values(5,2,1,'2023-07-01',2,499.99);
INSERT INTO order_details values(6,14,7,'2023-07-01',20,24.99);
INSERT INTO order_details values(7,9,14,'2023-07-01',1,79.99);
INSERT INTO order_details values(8,17,12,'2023-07-01',5,129.99);
INSERT INTO order_details values(9,20,8,'2023-07-01',2,29.99);
INSERT INTO order_details values(10,8,6,'2023-07-01',1,129.99);


  CREATE TABLE `onlineshoppingdatabase`.`Payment_method` (
  `Payment_method_id` INT(10) NOT NULL AUTO_INCREMENT,
  `Payment_method_name` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`Payment_method_id`));
  
INSERT INTO Payment_method VALUES(1,'Cash');
INSERT INTO Payment_method VALUES(2,'Credit');
INSERT INTO Payment_method VALUES(3,'Debit');
  
  CREATE TABLE `onlineshoppingdatabase`.`payment` (
  `Customer_id` INT(10) NULL,
  `Payment_id` INT(10) NOT NULL AUTO_INCREMENT,
  `order_id` INT(10) NOT NULL,
  `Payment_method` INT(10) NOT NULL,
  PRIMARY KEY (`Payment_id`),
  CONSTRAINT `fk_payment_customers` FOREIGN KEY (`order_id`)
  REFERENCES `order_details` (`order_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_payment_method_payment` FOREIGN KEY (`Payment_method`) 
  REFERENCES `Payment_method` (`Payment_method_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_customer_payment` FOREIGN KEY (`Payment_id`) 
  REFERENCES `Customers` (`Customer_id`) ON UPDATE CASCADE);
  
  INSERT INTO Payment VALUES(1,1,1,2);
  INSERT INTO Payment VALUES(1,2,4,1);
  INSERT INTO Payment VALUES(1,3,5,3);
  INSERT INTO Payment VALUES(14,4,3,3);
  INSERT INTO Payment VALUES(14,5,7,3);
  INSERT INTO Payment VALUES(6,6,10,2);
  INSERT INTO Payment VALUES(7,7,6,2);
  INSERT INTO Payment VALUES(3,8,2,1);
  INSERT INTO Payment VALUES(8,9,9,1);
  INSERT INTO Payment VALUES(12,10,8,2);
  