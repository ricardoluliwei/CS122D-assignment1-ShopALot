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