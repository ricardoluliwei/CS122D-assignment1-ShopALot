-- We would like to do some clean-up in order to ensure the consistency of our data. 
-- In particular, we want to make sure that the total price on record for each order is accurate. 
-- (Your boss heard a rumor that one of the application’s web developers may have skipped CS122B.) 
-- Some orders have inconsistencies between the recorded total price and the sum of the items’ prices. 
-- Write a query to identify the offending orders and to report the number of such orders. 
-- Once you have done that, write and run an update query to fix the incorrect total prices.

/*
To restore the table Orders to the original version
*/
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


WITH 
order_price AS (
SELECT oi.order_id, SUM(oi.qty * oi.selling_price) AS total_price
FROM orderitems oi
GROUP BY oi.order_id
),

inconsistent_order_price AS (
SELECT o.order_id, op.total_price
FROM order_price op, orders o
WHERE op.order_id = o.order_id AND op.total_price != o.total_price
)
 
UPDATE orders
SET total_price = iop.total_price
FROM inconsistent_order_price iop
WHERE orders.order_id = iop.order_id
;

/*
The running time is 0.164 ms, it is much faster than without index.
The main reason is that after index, the total_price are sorted and stored in some kind of data structure(default is btree).
So it is much quicker to find the total_price that are > 650
*/