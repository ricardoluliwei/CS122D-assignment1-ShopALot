-- Your boss is developing a shopper hiring plan and would like you to provide a thorough aggregation of store locations. 
-- Use the ROLLUP operator of PostgreSQL to show the total number of stores for each (state, city, zip code) combination. 
-- Read the “Advanced Aggregation in SQL” handout on the course wiki for more information about how to formulate this kind of query. 
-- Sort the results in descending order of (state, city, zip code) and print the first 20 rows.

SELECT state, city, zip_code, COUNT(store_id) AS num_store
FROM stores
GROUP BY ROLLUP(state, city, zip_code)
ORDER BY (state, city, zip_code) DESC
LIMIT 20
;