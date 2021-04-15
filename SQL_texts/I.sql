-- Suppose your boss wants to identify orders totalling more than $650 in an effort to identify high-value customers. 
-- How many orders have a total price greater than $650? While you are working on this query, 
-- use the EXPLAIN ANALYZE command to explore PostgreSQL’s view of the statistics for the query. 
-- How selective is this requirement? And how long does this query actually take to run?

EXPLAIN (ANALYZE TRUE)
SELECT COUNT(*)
FROM orders o 
WHERE o.total_price > 650
;