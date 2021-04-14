-- Write a query to print out how many stores, customers, 
-- and products there are in the given datasets - i.e., the total numbers of each.

SELECT COUNT(*) as stores_count
FROM stores
;

SELECT COUNT(*) as customers_count
FROM customers
;

SELECT COUNT(*) as products_count
FROM products
;