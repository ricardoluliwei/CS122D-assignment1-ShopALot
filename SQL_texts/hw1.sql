--Creat Table DDLs--


DROP TABLE IF EXISTS StockedBy; 
DROP TABLE IF EXISTS Own; 
DROP TABLE IF EXISTS WorkFor; 

DROP TABLE IF EXISTS UserPhone;
DROP TABLE IF EXISTS OrderItems; 

DROP TABLE IF EXISTS Orders; 

DROP TABLE IF EXISTS Customers; 
DROP TABLE IF EXISTS Shoppers; 

DROP TABLE IF EXISTS Vehicles; 
DROP TABLE IF EXISTS Stores; 
DROP TABLE IF EXISTS Products;


DROP TABLE IF EXISTS Users; 


-- Entity tables below: --
CREATE TABLE Users (
    user_id char(5) PRIMARY KEY, 
    email varchar(100), 
    first_name varchar(50) NOT NULL, 
    last_name varchar(50) NOT NULL
);

CREATE TABLE UserPhone(
    user_id char(5), 
    type varchar(10), 
    number varchar(20),
    PRIMARY KEY (user_id, number),     
    FOREIGN KEY (user_id) REFERENCES Users(user_id) 
);

CREATE TABLE Customers (
    user_id char(5) PRIMARY KEY,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) 
);

CREATE TABLE Shoppers (
    user_id char(5) PRIMARY KEY,  
    capacity INTEGER, 
    FOREIGN KEY (user_id) REFERENCES Users(user_id) 
);

CREATE TABLE Vehicles (
    state char(2) NOT NULL, 
    license_plate varchar(15) NOT NULL, 
    year INTEGER, 
    model varchar(50), 
    make varchar(50) NOT NULL, 
    color varchar(10) NOT NULL,
    PRIMARY KEY (state, license_plate) 
);

CREATE TABLE Stores (
    store_id char(5) PRIMARY KEY, 
    name varchar(50) NOT NULL, 
    street varchar(100) NOT NULL, 
    city varchar(50) NOT NULL,
    state char(2) NOT NULL, 
    zip_code char(5) NOT NULL, 
    phone varchar(20) NOT NULL, 
    categories varchar(300) NOT NULL
);

CREATE TABLE Products(
    product_id char(5) PRIMARY KEY, 
    category varchar(100) NOT NULL,
    name varchar(100) NOT NULL, 
    description varchar(100) NOT NULL, 
    list_price decimal(9,2) 
);

CREATE TABLE Orders (
    order_id char(5) PRIMARY KEY, 
    total_price decimal(9,2) NOT NULL, 
    time_placed timestamp NOT NULL, 
    pickup_time timestamp, 
    customer_id char(5) NOT NULL, 
    shopper_id char(5) NOT NULL, 
    state char(2) NOT NULL, 
    license_plate varchar(15) NOT NULL, 
    store_id char(5) NOT NULL, 
    time_fulfilled timestamp,

    FOREIGN KEY (customer_id) REFERENCES Customers(user_id),
    FOREIGN KEY (shopper_id) REFERENCES Shoppers(user_id),
    FOREIGN KEY (store_id) REFERENCES Stores(store_id),
    FOREIGN KEY (state,license_plate) REFERENCES Vehicles(state,license_plate)
);


CREATE TABLE OrderItems (
    item_id char(5), 
    qty INTEGER, 
    selling_price decimal(9, 2), 
    order_id char(5), 
    product_id char(5),
    PRIMARY KEY (item_id, order_id),

    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
); 

-- Relationship tables below: --
CREATE TABLE StockedBy (
    product_id char(5), 
    store_id char(5), 
    qty INTEGER,
    PRIMARY KEY (product_id, store_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (store_id) REFERENCES Stores(store_id)
);

CREATE TABLE Own (
    state char(2), 
    license_plate char(15), 
    user_id char(5),
    PRIMARY KEY (state, license_plate, user_id),
    FOREIGN KEY (state,license_plate) REFERENCES Vehicles(state,license_plate),
    FOREIGN KEY (user_id) REFERENCES Customers(user_id)
);

CREATE TABLE WorkFor (
    store_id char(5), 
    shopper_id char(5),
    PRIMARY KEY (store_id, shopper_id),
    FOREIGN KEY (store_id) REFERENCES Stores(store_id),
    FOREIGN KEY (shopper_id) REFERENCES Shoppers(user_id)
);
-- Data Loading --
COPY Users (user_id, email, first_name, last_name)
FROM '/Users/ricardo/Desktop/UCI Course/2021 Spring/CS122D/assignments/assignments1/ShopALot.com Data/users.csv'
DELIMITER ','
CSV HEADER;

COPY UserPhone(user_id, type, number)
FROM '/Users/ricardo/Desktop/UCI Course/2021 Spring/CS122D/assignments/assignments1/ShopALot.com Data/phones.csv'
DELIMITER ','
CSV HEADER;

COPY Customers (user_id)
FROM '/Users/ricardo/Desktop/UCI Course/2021 Spring/CS122D/assignments/assignments1/ShopALot.com Data/customers.csv'
DELIMITER ','
CSV HEADER;

COPY Shoppers (user_id, capacity)
FROM '/Users/ricardo/Desktop/UCI Course/2021 Spring/CS122D/assignments/assignments1/ShopALot.com Data/shoppers.csv'
DELIMITER ','
CSV HEADER;

COPY Vehicles (state, license_plate, year, model, make, color)
FROM '/Users/ricardo/Desktop/UCI Course/2021 Spring/CS122D/assignments/assignments1/ShopALot.com Data/vehicles.csv'
DELIMITER ','
CSV HEADER;

COPY Stores (store_id, name, street, city, state, zip_code, phone, categories)
FROM '/Users/ricardo/Desktop/UCI Course/2021 Spring/CS122D/assignments/assignments1/ShopALot.com Data/stores.csv'
DELIMITER ','
CSV HEADER;

COPY Products(product_id, category, name, description, list_price)
FROM '/Users/ricardo/Desktop/UCI Course/2021 Spring/CS122D/assignments/assignments1/ShopALot.com Data/products.csv'
DELIMITER ','
CSV HEADER;

COPY Orders (order_id, total_price, time_placed, pickup_time, customer_id, shopper_id, state, license_plate, store_id, time_fulfilled)
FROM '/Users/ricardo/Desktop/UCI Course/2021 Spring/CS122D/assignments/assignments1/ShopALot.com Data/orders.csv'
DELIMITER ','
CSV HEADER;

COPY OrderItems (item_id, qty, selling_price, order_id, product_id)
FROM '/Users/ricardo/Desktop/UCI Course/2021 Spring/CS122D/assignments/assignments1/ShopALot.com Data/orderitems.csv'
DELIMITER ','
CSV HEADER;

COPY StockedBy (product_id, store_id, qty)
FROM '/Users/ricardo/Desktop/UCI Course/2021 Spring/CS122D/assignments/assignments1/ShopALot.com Data/stockedby.csv'
DELIMITER ','
CSV HEADER;

COPY Own (state, license_plate, user_id)
FROM '/Users/ricardo/Desktop/UCI Course/2021 Spring/CS122D/assignments/assignments1/ShopALot.com Data/own.csv'
DELIMITER ','
CSV HEADER;

COPY WorkFor (store_id, shopper_id)
FROM '/Users/ricardo/Desktop/UCI Course/2021 Spring/CS122D/assignments/assignments1/ShopALot.com Data/workfor.csv'
DELIMITER ','
CSV HEADER;


--Query Answers--
-- Problem A --

-- Write a query to print out how many stores, customers, 
-- and products there are in the given datasets - i.e., the total numbers of each.

SELECT COUNT(*) as stores_count
FROM stores
;

SELECT COUNT(*) as customers_count
FROM customers
;

SELECT COUNT(*) as products_count
FROM products
;

-- Problem B --

-- The stores in Seattle,WA recently received a big flurry of orders and they need shoppers 
-- who are able to handle at least 5 orders at a time. List all the shoppers
-- with a capacity of at least 5 who work for one or more of the stores
-- located in Seattle, WA.

SELECT u.user_id, u.first_name, u.last_name 
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


-- Problem C --

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
;

-- Problem D --

-- At the beginning of the pandemic, the number of hoarders hit an all-time high!
-- Find all hoarding orders between 05/01/2020 (time placed) and 07/01/2020 (time placed).
-- An order with more than 25 of any particular item (e.g. toilet paper, hand sanitizer, ...) 
-- can be considered a hoarding order. Print the order ID, total price, and time placed for these orders.

SELECT o.order_id, o.total_price, o.time_placed
FROM orders o, orderitems oi
WHERE o.order_id = oi.order_id AND date '2020-05-01' <= o.time_placed::date AND o.time_placed::date <= date '2020-07-01'
AND oi.qty >= 25
;

-- Problem E --

-- To study the users’ shopping habits, you want to explore trends in the average order’s total price during the peak of the pandemic. 
-- Suppose the peak date was 04/01/2020 (time placed). 
-- What was the average total price of all orders over the prior seven days? (Hint: Take advantage of the timestamp type.)

SELECT AVG(o.total_price)
FROM orders o
WHERE o.time_placed::date <= date '2020-04-01' AND o.time_placed >= (date '2020-04-01' - 7)
;
-- Problem F --

-- People like to shop for everything they need at one stop if possible, 
-- which means that a store with a larger variety of categories may be more attractive to customers. 
-- Read the “Hints on Multivalued Data” appendix at the end of this assignment. 
-- Use the PostgreSQL string_to_array() function to list the store ID, the name, the store’s category list, 
-- and the length of the list for each store with a zip code of 44401. You may also find the array_length() function useful.


SELECT s.store_id, s.name, categories_array , array_length(categories_array, 1)
FROM stores s, string_to_array(s.categories, ', ') as categories_array
WHERE s.zip_code = '44401'
;

-- Problem G --

-- Continuing from the previous problem, use the UNNEST operator of PostgreSQL to create a normalized list with the store ID, 
-- the name, and the category for each store with a zip code of 44401. 
-- (Keep the list entries for each business together by using an ORDER BY clause.)


SELECT s.store_id, s.name, category
FROM stores s, UNNEST(string_to_array(s.categories, ', ')) as category
WHERE s.zip_code = '44401'
ORDER BY s.store_id
;

-- Problem H --

-- Your boss would like to know the top five store categories (i.e.,thefivecategories that appear the most frequently as a store category) 
-- as well as the number of stores that include each such category and the minimum, maximum, 
-- and average list prices of the products in each such category.

WITH category_count AS (
SELECT category, COUNT (DISTINCT s.store_id) as num_stores
FROM stores s, UNNEST(string_to_array(s.categories, ', ')) as category
GROUP BY category
ORDER BY num_stores DESC
LIMIT 5
)

SELECT cc.category, cc.num_stores, MIN(p.list_price), MAX(p.list_price), AVG(p.list_price)
FROM category_count AS cc, products AS p
WHERE cc.category = p.category
GROUP BY cc.category, cc.num_stores
ORDER BY cc.num_stores DESC
;

-- Problem I --

-- Suppose your boss wants to identify orders totalling more than $650 in an effort to identify high-value customers. 
-- How many orders have a total price greater than $650? While you are working on this query, 
-- use the EXPLAIN ANALYZE command to explore PostgreSQL’s view of the statistics for the query. 
-- How selective is this requirement? And how long does this query actually take to run?

SELECT COUNT(*)
FROM orders o 
WHERE o.total_price > 650
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

-- Problem J --

-- We would like to do some clean-up in order to ensure the consistency of our data. 
-- In particular, we want to make sure that the total price on record for each order is accurate. 
-- (Your boss heard a rumor that one of the application’s web developers may have skipped CS122B.) 
-- Some orders have inconsistencies between the recorded total price and the sum of the items’ prices. 
-- Write a query to identify the offending orders and to report the number of such orders. 
-- Once you have done that, write and run an update query to fix the incorrect total prices.

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

SELECT COUNT(*)
FROM inconsistent_order_price
;

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

-- Problem K --

-- With the correct total prices in place, create an index on the total price column 
-- and run query I and use the EXPLAIN ANALYZE command once again. 
-- Compare the query’s running time with and without the index and briefly 
-- state what you think the main reason(s) for any running time difference is.

CREATE INDEX idx_total_price ON orders(total_price);

SELECT COUNT(*)
FROM orders o 
WHERE o.total_price > 650
;

EXPLAIN (ANALYZE TRUE)
SELECT COUNT(*)
FROM orders o 
WHERE o.total_price > 650
;

-- Answers to Question
/*
The running time is 0.164 ms, it is much faster than without index.
The main reason is that after index, the total_price are sorted and stored in some kind of data structure(default is btree).
So it is much quicker to find the total_price that are > 650
*/

-- Problem L -- 

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

-- Problem M (extra credit) --                                                                     

-- [Extra Credit] A new analytical request has been given to you from your boss: For each category, 
-- rank the products in that category in descending order of their list prices. 
-- Use SQL’s window-based aggregation (i.e., the OVER clause) to find the ranks. 
-- Print out the product IDs, product names, categories, list prices, and ranks.
-- Read the “Advanced Aggregation in SQL” handout on the course wiki for more information about window queries in SQL. 
-- Print the first 10 rows.


SELECT p.product_id, p.name, p.category, p.list_price, RANK() OVER (PARTITION BY P.category ORDER BY (p.list_price) DESC)
FROM products p
LIMIT 10
;




			