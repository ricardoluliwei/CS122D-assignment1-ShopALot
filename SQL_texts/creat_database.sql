-- Entity tables below: --

DROP TABLE IF EXISTS Users; 
CREATE TABLE Users (
    user_id char(5) PRIMARY KEY, 
    email varchar(100), 
    first_name varchar(50) NOT NULL, 
    last_name varchar(50) NOT NULL
);

DROP TABLE IF EXISTS Customers; 
CREATE TABLE Customers (
    user_id char(5) PRIMARY KEY REFERENCES Users (user_id)
);

DROP TABLE IF EXISTS Shoppers; 
CREATE TABLE Shoppers (
    user_id char(5) PRIMARY KEY REFERENCES Users (user_id), 
    capacity INTEGER 
);

DROP TABLE IF EXISTS Vehicles; 
CREATE TABLE Vehicles (
    state char(2) NOT NULL, 
    license_plate varchar(15) NOT NULL, 
    year INTEGER, 
    model varchar(20), 
    make varchar(20) NOT NULL, 
    color varchar(10) NOT NULL,
    PRIMARY KEY (state, license_plate) 
);

DROP TABLE IF EXISTS Stores; 
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

DROP TABLE IF EXISTS Product;s
CREATE TABLE Products(
    product_id char(5) PRIMARY KEY, 
    category varchar(50) NOT NULL, 
    name varchar(50) NOT NULL, 
    description varchar(50) NOT NULL, 
    list_price decimal(9,2) NOT NULL
);

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

-- Relationship tables below: --

DROP TABLE IF EXISTS UserPhon;e
CREATE TABLE UserPhone(
    user_id char(5), 
    type varchar(10), 
    number varchar(20),
    PRIMARY KEY (user_id, number)     
);

DROP TABLE IF EXISTS OrderItems; 
CREATE TABLE OrderItems (
    item_id char(5), 
    qty INTEGER, 
    selling_price decimal(9, 2), 
    order_id char(5), 
    product_id char(5),
    PRIMARY KEY (item_id, order_id) 
); 

DROP TABLE IF EXISTS StockedBy; 
CREATE TABLE StockedBy (
    product_id char(5), 
    store_id char(5), 
    qty INTEGER,
    PRIMARY KEY (product_id, store_id) 
);

DROP TABLE IF EXISTS Own; 
CREATE TABLE Own (
    state char(2), 
    license_plate char(15), 
    user_id char(5),
    PRIMARY KEY (state, license_plate, user_id) 
);

DROP TABLE IF EXISTS WorkFor; 
CREATE TABLE WorkFor (
    store_id char(5), 
    shopper_id char(5),
    PRIMARY KEY (store_id, shopper_id) 
);