-- With the correct total prices in place, create an index on the total price column 
-- and run query I and use the EXPLAIN ANALYZE command once again. 
-- Compare the query’s running time with and without the index and briefly 
-- state what you think the main reason(s) for any running time difference is.

CREATE INDEX idx_total_price ON orders(total_price);

EXPLAIN (ANALYZE TRUE)
SELECT COUNT(*)
FROM orders o 
WHERE o.total_price > 650
;