-- You would like to find out about stores that are offering discounts amid the pandemic. 
-- For each store that has offered discounts, print out the number of unique 
-- products that were sold at discount prices (i.e., at a price where the selling 
-- price was lower than the list price) along with their store IDs and store names. 
-- Rank the results going from the largest number of such products to the lowest. 
-- Print the first 10 rows.

SELECT s.store_id, s.name, COUNT (DISTINCT oi.product_id) AS num_product 
FROM orderitems oi, products p, orders o, stores s
WHERE oi.order_id = o.order_id AND oi.product_id = p.product_id AND s.store_id = o.store_id AND oi.selling_price < p.list_price
GROUP BY s.store_id 
ORDER BY num_product DESC
LIMIT 10