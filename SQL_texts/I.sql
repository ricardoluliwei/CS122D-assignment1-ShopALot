-- Suppose your boss wants to identify orders totalling more than $650 in an effort to identify high-value customers. 
-- How many orders have a total price greater than $650? While you are working on this query, 
-- use the EXPLAIN ANALYZE command to explore PostgreSQL’s view of the statistics for the query. 
-- How selective is this requirement? And how long does this query actually take to run?

DROP TABLE IF EXISTS Orders; 
CREATE TABLE Orders (
    order_id char(5) PRIMARY KEY, 
    total_price decimal(9,2), 
    time_placed timestamp, 
    pickup_time timestamp, 
    customer_id char(5), 
    shopper_id char(5), 
    state char(2), 
    license_plate varchar(15), 
    store_id char(5), 
    time_fulfilled timestamp
);

COPY Orders (order_id, total_price, time_placed, pickup_time, customer_id, shopper_id, state, license_plate, store_id, time_fulfilled)
FROM '/Users/ricardo/Desktop/UCI Course/2021 Spring/CS122D/assignments/assignments1/ShopALot.com Data/orders.csv'
DELIMITER ','
CSV HEADER;

SELECT COUNT(*)
FROM orders o 
WHERE o.total_price > 65
;

EXPLAIN (ANALYZE TRUE)
SELECT COUNT(*)
FROM orders o 
WHERE o.total_price > 650
;


-- Answers to Question
/*
It is selective because it selects 4 rows out of 20000. It take about 7.078ms to run
*/