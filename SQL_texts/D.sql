-- At the beginning of the pandemic, the number of hoarders hit an all-time high!
-- Find all hoarding orders between 05/01/2020 (time placed) and 07/01/2020 (time placed).
-- An order with more than 25 of any particular item (e.g. toilet paper, hand sanitizer, ...) 
-- can be considered a hoarding order. Print the order ID, total price, and time placed for these orders.

SELECT o.order_id, o.total_price, o.time_placed
FROM orders o, orderitems oi
WHERE o.order_id = oi.order_id AND date '2020-05-01' <= o.time_placed::date AND o.time_placed::date <= date '2020-07-01'
GROUP BY o.order_id
HAVING SUM (oi.qty) > 25;
