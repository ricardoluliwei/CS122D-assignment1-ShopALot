-- To study the users’ shopping habits, you want to explore trends in the average order’s total price during the peak of the pandemic. 
-- Suppose the peak date was 04/01/2020 (time placed). 
-- What was the average total price of all orders over the prior seven days? (Hint: Take advantage of the timestamp type.)

SELECT o.time_placed::date, AVG(o.total_price)
FROM orders o
WHERE o.time_placed::date <= date '2020-04-01' AND o.time_placed >= (date '2020-04-01' - 7)
GROUP BY o.time_placed::date
ORDER BY o.time_placed::date ASC