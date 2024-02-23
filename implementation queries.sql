-- NOTE: DON'T EXECUTE ALL THE QUERIES AT ONCE

USE onlineshoppingdatabase;

-- 1) display all the tables
-- Queries:
SELECT * FROM customers;
SELECT * FROM order_details;
SELECT * FROM payment;
SELECT * FROM payment_method;
SELECT * FROM products;

-- 2)  create amount column in order_details table for each orders where amount= unit_price*quantity 
-- Query:
ALTER TABLE order_details 
	ADD COLUMN amount DECIMAL(10,2) 
	DEFAULT (Unit_price*quantity);

-- Note: just to check the above query, you can drop the column using query below and redo the above
ALTER TABLE order_details 
	DROP COLUMN amount;

-- 3) Retrieve the names and payment_method of customers who have made payment using the credit_card
-- Query:
SELECT 
	c.First_name,
    c.Last_name,
    pm.Payment_method_name
	FROM payment p
    JOIN payment_method pm
    ON p.payment_method=pm.payment_method_id
    JOIN customers c
    ON p.Customer_id=c.Customer_id;

-- 4)Find the total income generated
-- Query:
SELECT 
	sum(amount) 
	AS Total_Income
    FROM order_details;

-- 5)List the products that have not been ordered yet in ascending order
-- Query:
SELECT 
	p.product_name,
    'not_ordered' AS Status
    FROM products p
    LEFT JOIN order_details od
    ON p.Product_id=od.Product_id
    WHERE od.Product_id IS NULL
    ORDER BY p.Product_name;
    
-- 6) Retrieve top 3 customers with highest payment
-- Query:
SELECT c.First_name,sum(amount) as val
	FROM order_details od
    JOIN customers c
    USING(customer_id)
    GROUP BY Customer_id
    ORDER BY val DESC
    LIMIT 3;
    
-- 7) Find the most popular product(product bought in highest quantity).
-- Query:
SELECT Product_name,max(quantity) AS quantity
	FROM products p
    JOIN order_details od
    ON p.Product_id=od.Product_id
    GROUP BY p.product_id
    ORDER BY quantity DESC
    LIMIT 1;

-- 8) Calculate average payment amount for each payment method
-- Query:
SELECT 
	pm.Payment_method_name,
    AVG(amount) AS average_amount
	FROM order_details od
	JOIN payment p
    ON p.order_id=od.order_id
    JOIN payment_method pm
    ON p.Payment_method=pm.Payment_method_id
    GROUP BY p.Payment_method;
    
-- 9) retrieve the customers with their ordered products name along with the quantity and where to deliver the product
-- Query:
SELECT 
	c.First_name,
    c.Last_name,
    p.Product_name,
    od.Quantity,
    c.Address
	FROM customers c
    JOIN order_details od
    USING(customer_id)
    JOIN products p
    USING(product_id)
    ORDER BY c.First_name;

-- 10) Retrieve the  customer name and amount paid. Here, add a status
--      column that shows which customers buy or didnt by items.
-- Query:
SELECT 
	c.First_name,
    c.Last_name,
    'Bought' AS Status
	FROM customers c
	LEFT JOIN order_details od
	USING(customer_id)
	WHERE od.amount IS NOT NULL
UNION
SELECT 
	c.First_name,
    c.Last_name,
    'Not Bought' AS Status
	FROM customers c
	LEFT JOIN order_details od
	USING(customer_id)
	WHERE od.amount IS NULL;
    
-- other queries that can be applied:
-- a) delete(to remove record any not required record)
-- query:
DELETE 
	FROM customers
    WHERE Customer_id=4; -- its just one conditon out of many
    
-- b) ALTER(to manipulate the table)
-- queries:
ALTER 
	TABLE customers
    ADD COLUMN occupation INT(10);  -- adding new columns to the table
    
ALTER
	TABLE customers
    MODIFY COLUMN occupation VARCHAR(50);  -- modifying data type of the column. 
    
ALTER
	TABLE customers
    DROP COLUMN occupation;  -- deleting a column

ALTER
	TABLE customers
    CHANGE COLUMN occupation Designation VARCHAR(50);  -- changing any column name






