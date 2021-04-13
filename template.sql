--Creat Table DDLs--
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS orderitems;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS own;
DROP TABLE IF EXISTS phones;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS shoppers;
DROP TABLE IF EXISTS stockedby;
DROP TABLE IF EXISTS stores;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS vehicles;
DROP TABLE IF EXISTS wordfor;

-- Entity tables below: --
CREATE TABLE Users (
    user_id char(5) PRIMARY KEY, 
    email varchar(100), 
    first_name varchar(50) NOT NULL, 
    last_name varchar(50) NOT NULL
);

CREATE TABLE Customers (
    user_id char(5) PRIMARY KEY REFERENCES Users (user_id)
);

CREATE TABLE Shoppers (
    user_id char(5) PRIMARY KEY REFERENCES Users (user_id), 
    capacity INTEGER 
);

CREATE TABLE Vehicles (
    state char(2) NOT NULL, 
    license_plate varchar(15) NOT NULL, 
    year INTEGER, 
    model varchar(20), 
    make varchar(20) NOT NULL, 
    color varchar(10) NOT NULL,
    PRIMARY KEY (state, license_plate) 
);

CREATE TABLE Stores (
    store_id varchar(5) PRIMARY KEY, 
    name varchar(50), 
    street varchar(100), 
    city varchar(50),
    state char(2), 
    zip_code char(5), 
    phone varchar(20), 
    categories varchar(50)
);

CREATE TABLE Products(
    product_id char(5) PRIMARY KEY, 
    category varchar(50) NOT NULL, 
    name varchar(50) NOT NULL, 
    description varchar(50) NOT NULL, 
    list_price decimal(9,2) NOT NULL
);

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

-- Relationship tables below: --

CREATE TABLE UserPhone(
    user_id char(5), 
    type varchar(10), 
    number varchar(20),
    PRIMARY KEY (user_id, number)     
);

CREATE TABLE OrderItems (
    item_id char(5), 
    qty INTEGER, 
    selling_price decimal(9, 2), 
    order_id char(5), 
    product_id char(5),
    PRIMARY KEY (item_id, order_id) 
); 

CREATE TABLE StockedBy (
    product_id char(5), 
    store_id char(5), 
    qty INTEGER,
    PRIMARY KEY (product_id, store_id) 
);

CREATE TABLE Own (
    state char(2), 
    license_plate char(15), 
    user_id char(5),
    PRIMARY KEY (state, license_plate, user_id) 
);

CREATE TABLE WorkFor (
    store_id char(5), 
    shopper_id char(5),
    PRIMARY KEY (store_id, shopper_id) 
);

-- Data Loading --
COPY Users (user_id, email, first_name, last_name)
FROM 'ShopALot.com\ Data/users.csv'
DELIMITER ','
CSV HEADER;

COPY UserPhone(user_id, type, number)
FROM 'ShopALot.com\ Data/phones.csv'
DELIMITER ','
CSV HEADER;

COPY Customers (user_id)
FROM 'ShopALot.com\ Data/customers.csv'
DELIMITER ','
CSV HEADER;

COPY Shoppers (user_id, capacity)
FROM 'ShopALot.com\ Data/shoppers.csv'
DELIMITER ','
CSV HEADER;

COPY Vehicles (state, license_plate, year, model, make, color)
FROM 'ShopALot.com\ Data/vehicles.csv'
DELIMITER ','
CSV HEADER;

COPY Stores (store_id, name, street, city, state, zip_code, phone, categories)
FROM 'ShopALot.com\ Data/stores.csv'
DELIMITER ','
CSV HEADER;

COPY Products(product_id, category, name, description, list_price)
FROM 'ShopALot.com\ Data/products.csv'
DELIMITER ','
CSV HEADER;

COPY Orders (order_id, total_price, time_placed, pickup_time, customer_id, shopper_id, state, license_plate, store_id, time_fulfilled)
FROM 'ShopALot.com\ Data/orders.csv'
DELIMITER ','
CSV HEADER;

COPY OrderItems (item_id, qty, selling_price, order_id, product_id)
FROM 'ShopALot.com\ Data/orderitems.csv'
DELIMITER ','
CSV HEADER;

COPY StockedBy (product_id, store_id, qty)
FROM 'ShopALot.com\ Data/stockedby.csv'
DELIMITER ','
CSV HEADER;

COPY Own (state, license_plate, user_id)
FROM 'ShopALot.com\ Data/own.csv'
DELIMITER ','
CSV HEADER;

COPY WorkFor (store_id, shopper_id)
FROM 'ShopALot.com\ Data/workfor.csv'
DELIMITER ','
CSV HEADER;


--Query Answers--
-- Problem A --

-- Problem B --

-- Problem C --

-- Problem D --

-- Problem E --

-- Problem F --

-- Problem G --

-- Problem H --

-- Problem I --

-- Problem J --

-- Problem K --

-- Problem L -- 

-- Problem M (extra credit) --                                                                     




			