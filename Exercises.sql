-- EXERCISES --

-- 1) Return all the products (name , unit price, new price(unit price * 1.1))
-- SELECT name, unit_price, (unit_price * 1.1) AS new_price FROM sql_store.products;

-- 2) Get the Orders placed this year (2019)
-- SELECT * FROM sql_store.orders WHERE order_date >= '2019-01-01';

-- 3) From the order_items table, get the items for order#6 where the total price is greater than 30
-- SELECT * FROM sql_store.order_items WHERE order_id = 6 AND (quantity * unit_price > 30);

-- 4) Return products with quatity in stock equal to 49, 38, 72
-- SELECT * FROM sql_store.products WHERE quantity_in_stock IN (49, 38, 72);

-- 5) Return customers born  between 1/1/1990 and 1/1/2000
-- SELECT * FROM sql_store.customers WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01';

-- 6) Get the customers whose address contain TRAIL or AVENUE
-- SELECT * FROM sql_store.customers WHERE (address LIKE '%trail%' or address LIKE '%avenue%');

-- 7) Get the customers whose phone numbers end with 9
-- SELECT * FROM sql_store.customers WHERE phone LIKE '%9';

-- 8) Get the customers whose first names are ELKA and AMBUR
-- SELECT * FROM sql_store.customers WHERE first_name REGEXP 'elka|ambur';

-- 9) Get the customers whose last names end with EY or ON
-- SELECT * FROM sql_store.customers WHERE last_name REGEXP 'ey$|on$';

-- 10) Get the customers whose last names start with MY or contains SE
-- SELECT * FROM sql_store.customers WHERE last_name REGEXP '^my|se';

-- 11) Get the customers whose last names contain B followed by R or U
-- SELECT * FROM sql_store.customers WHERE last_name REGEXP 'br|bu';
-- SELECT * FROM sql_store.customers WHERE last_name REGEXP 'b[ru]';

-- 12) Get the orders that are not shipped
-- SELECT * FROM sql_store.orders WHERE shipped_date IS NULL;

-- 13) Get the order items with order id #2 then arrange the order by the total price in descending order
-- SELECT *, (quantity * unit_price) AS total_price FROM sql_store.order_items WHERE order_id = 2 ORDER BY total_price DESC;

-- 14) Get the top 3 loyal customers
-- SELECT * FROM sql_store.customers ORDER BY points DESC LIMIT 3;

-- 15) Get the order_items with the product name from the products table using Inner Join
-- SELECT order_id, order_items.product_id, name, quantity, order_items.unit_price 
-- FROM sql_store.order_items 
-- JOIN sql_store.products 
-- 	ON sql_store.order_items.product_id = sql_store.products.product_id;

-- 16) Get the payments and join with the client name and payment method
-- SELECT p.date, p.invoice_id, p.amount, c.name AS client_name, pm.name AS payment_method 
-- FROM sql_invoicing.payments p 
-- JOIN sql_invoicing.clients c 
-- 	ON p.client_id = c.client_id 
-- JOIN sql_invoicing.payment_methods pm 
-- 	ON p.payment_method = pm.payment_method_id;

-- 17) Get the product and the order items using outer join
-- SELECT p.product_id, p.name, oi.quantity 
-- FROM sql_store.products p 
-- LEFT JOIN sql_store.order_items oi 
-- 	ON p.product_id = oi.product_id;

-- 18) Get the Orders with date, id, client name, shipper name and order status
-- SELECT o.order_date, o.order_id, c.first_name, s.name AS shipper, os.name AS status 
-- FROM sql_store.orders o 
-- JOIN sql_store.customers c 
-- 	ON o.customer_id = c.customer_id 
-- LEFT JOIN sql_store.shippers s 
-- 	ON o.shipper_id = s.shipper_id 
-- JOIN sql_store.order_statuses os 
-- 	ON o.status = os.order_status_id 
-- ORDER BY o.status;

-- 19) Get Payment with date, client name, amount and mode of payment
-- SELECT p.date, c.name AS client, p.amount, pm.name
-- FROM sql_invoicing.payments p
-- JOIN sql_invoicing.clients c
-- 	USING (client_id)
-- JOIN sql_invoicing.payment_methods pm
-- 	ON p.payment_method = pm.payment_method_id

-- 20) Do a CROSS JOIN between shippers and products
-- Implicit Syntax
-- SELECT p.name as products, s.name as shippers
-- FROM sql_store.products p, sql_store.shippers s;
-- Explicit Syntax
-- SELECT p.name as products, s.name as shippers
-- FROM sql_store.products p
-- CROSS JOIN sql_store.shippers s;

-- 21) Using UNION, Get the customer type according to their points, Bronze if < 2000, Silver if 2000-3000, Gold if > 3000
-- SELECT customer_id, first_name, points, 'Bronze' AS type
-- FROM sql_store.customers
-- WHERE points < 2000
-- UNION
-- SELECT customer_id, first_name, points, 'Silver'
-- FROM sql_store.customers
-- WHERE points BETWEEN 2000 AND 3000
-- UNION
-- SELECT customer_id, first_name, points, 'Gold' AS type
-- FROM sql_store.customers
-- WHERE points > 3000
-- ORDER BY first_name;

-- 22) Insert three rows in the products table
-- INSERT INTO sql_store.products (name, quantity_in_stock, unit_price)
-- VALUES ('Product1', 10, 2.50),
-- ('Product2', 20, 2.00),
-- ('Product3', 30, 3.75);

-- 23) Insert into multiple tables, Inserting Hierarchical Rows 
-- INSERT INTO sql_store.orders (customer_id, order_date, status)
-- VALUES (3, '2021-04-24', 1);
-- INSERT INTO sql_store.order_items (order_id, product_id, quantity, unit_price)
-- VALUES (LAST_INSERT_ID(), 2, 10, 2.75), (LAST_INSERT_ID(), 3, 2, 3.56);

-- 24) Create new table (invoice_archived) using client name , and insert rows that have payment_date
-- CREATE TABLE invoice_archived AS
-- SELECT invoice_id, number, name AS 'client_name', invoice_total, payment_total, invoice_date, due_date, payment_date 
-- FROM sql_invoicing.invoices i
-- JOIN sql_invoicing.clients c
-- USING (client_id)
-- WHERE payment_date IS NOT NULL;

-- 25) Write a SQL Statement to give any customers born before 1990, extra 50 points
-- UPDATE sql_store.customers
-- SET points = points + 50
-- WHERE birth_date < '1990-01-01;

-- 26) Update the comments of the customers who have more than 3000 points into 'Gold customer'
-- UPDATE sql_store.orders
-- SET comments = 'Gold customer'
-- WHERE customer_id IN 
-- (SELECT customer_id FROM sql_store.customers
-- WHERE points > 3000);



