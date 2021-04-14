-- The stores in Seattle,WA recently received a big flurry of orders and they need shoppers 
-- who are able to handle at least 5 orders at a time. List all the shoppers
-- with a capacity of at least 5 who work for one or more of the stores
-- located in Seattle, WA.

SELECT u.first_name, u.last_name 
FROM users u, shoppers s
WHERE 
    u.user_id = s.user_id 
    AND s.capacity >= 5 
    AND u.user_id in
    (
        SELECT DISTINCT w1.shopper_id
        FROM workfor w1 NATURAL JOIN stores s1
        WHERE s1.city = 'Seattle' AND s1.state = 'WA'
    )
;

