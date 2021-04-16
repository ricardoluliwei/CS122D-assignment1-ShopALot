-- [Extra Credit] A new analytical request has been given to you from your boss: For each category, 
-- rank the products in that category in descending order of their list prices. 
-- Use SQL’s window-based aggregation (i.e., the OVER clause) to find the ranks. 
-- Print out the product IDs, product names, categories, list prices, and ranks.
-- Read the “Advanced Aggregation in SQL” handout on the course wiki for more information about window queries in SQL. 
-- Print the first 10 rows.


SELECT p.product_id, p.name, p.category, p.list_price, RANK() OVER (ORDER BY (p.list_price) DESC)
FROM products p
LIMIT 10
;
