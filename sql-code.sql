create database rhb;
use rhb;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address TEXT,
    date_of_birth DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    card_number VARCHAR(16) UNIQUE NOT NULL,
    card_type ENUM('Visa', 'MasterCard', 'Amex') NOT NULL,
    credit_limit DECIMAL(10,2),
    balance DECIMAL(10,2),
    opened_date DATE,
    status ENUM('Active', 'Closed', 'Suspended') DEFAULT 'Active',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    account_id INT NOT NULL,
    transaction_date DATETIME,
    merchant_name VARCHAR(100),
    category VARCHAR(50),
    amount DECIMAL(10,2),
    currency VARCHAR(10) DEFAULT 'MYR',
    description TEXT,
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);
CREATE TABLE rewards (
    reward_id INT PRIMARY KEY AUTO_INCREMENT,
    account_id INT NOT NULL,
    reward_points INT DEFAULT 0,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);


INSERT INTO customers (full_name, email, phone, address, date_of_birth)
VALUES 
('Alice Tan', 'alice.tan@example.com', '0123456789', '123 Jalan Ampang, Kuala Lumpur', '1990-05-20'),
('John Lee', 'john.lee@example.com', '0198765432', '88 Jalan Tun Razak, Kuala Lumpur', '1985-08-15');
INSERT INTO accounts (customer_id, card_number, card_type, credit_limit, balance, opened_date)
VALUES 
(1, '4567123412341234', 'Visa', 10000.00, 3500.50, '2021-04-01'),
(2, '5432123412341234', 'MasterCard', 15000.00, 7800.00, '2022-01-10');
-- Transactions for Alice (account_id = 1)
INSERT INTO transactions (account_id, transaction_date, merchant_name, category, amount, description)
VALUES 
(1, '2025-04-01 10:15:00', 'Shopee', 'Online Shopping', 150.00, 'Electronics purchase'),
(1, '2025-04-02 14:20:00', 'Starbucks', 'Food & Beverage', 18.50, 'Latte and muffin'),
(1, '2025-04-03 09:00:00', 'Petronas', 'Fuel', 90.00, 'Petrol refill'),
(1, '2025-04-05 20:30:00', 'Lazada', 'Online Shopping', 250.75, 'Fashion items'),
(1, '2025-04-06 16:45:00', 'Watsons', 'Health & Beauty', 72.90, 'Skincare products');

-- Transactions for John (account_id = 2)
INSERT INTO transactions (account_id, transaction_date, merchant_name, category, amount, description)
VALUES 
(2, '2025-04-01 12:10:00', 'Giant', 'Groceries', 320.20, 'Weekly grocery shopping'),
(2, '2025-04-02 18:50:00', 'McDonalds', 'Food & Beverage', 25.90, 'Dinner combo meal'),
(2, '2025-04-04 15:30:00', 'Zalora', 'Clothing', 180.00, 'Shirt and pants'),
(2, '2025-04-06 10:00:00', 'Tesco', 'Groceries', 215.45, 'Monthly essentials'),
(2, '2025-04-07 21:10:00', 'TGV Cinemas', 'Entertainment', 45.00, 'Movie tickets');

INSERT INTO rewards (account_id, reward_points)
VALUES 
(1, 1200),
(2, 2050);

INSERT INTO transactions (account_id, transaction_date, merchant_name, category, amount, description) VALUES
(2, '2025-04-01 12:10:00', 'Giant', 'Groceries', 320.20, 'Weekly grocery shopping'),
(2, '2025-04-02 18:50:00', 'McDonalds', 'Food & Beverage', 25.90, 'Dinner combo meal'),
(2, '2025-04-04 15:30:00', 'Zalora', 'Clothing', 180.00, 'Shirt and pants'),
(2, '2025-04-06 10:00:00', 'Tesco', 'Groceries', 215.45, 'Monthly essentials'),
(2, '2025-04-07 21:10:00', 'TGV Cinemas', 'Entertainment', 45.00, 'Movie tickets'),
(2, '2025-04-08 14:30:00', 'Shell', 'Fuel', 110.60, 'Petrol refill'),
(2, '2025-04-09 11:00:00', 'Watsons', 'Pharmacy', 63.20, 'Health supplies'),
(2, '2025-04-10 09:45:00', 'Uniqlo', 'Clothing', 230.00, 'Spring wardrobe'),
(2, '2025-04-11 13:25:00', 'Starbucks', 'Food & Beverage', 18.90, 'Latte and muffin'),
(2, '2025-04-12 19:00:00', 'Grab', 'Transport', 32.00, 'Ride to event'),
(2, '2025-04-13 17:40:00', 'Shopee', 'Online Shopping', 90.50, 'Household items'),
(2, '2025-04-14 08:15:00', 'Guardian', 'Pharmacy', 48.75, 'Daily essentials'),
(2, '2025-04-15 16:30:00', 'Domino\'s Pizza', 'Food & Beverage', 56.00, 'Pizza for dinner'),
(2, '2025-04-16 11:10:00', 'Lazada', 'Online Shopping', 150.00, 'Electronics accessories'),
(2, '2025-04-17 20:00:00', 'Petronas', 'Fuel', 95.40, 'Fuel top-up'),
(2, '2025-04-18 09:00:00', 'IKEA', 'Home & Living', 370.25, 'Furniture purchase'),
(2, '2025-04-19 13:10:00', 'Aeon', 'Groceries', 190.10, 'Weekend groceries'),
(2, '2025-04-20 18:20:00', 'KFC', 'Food & Beverage', 35.50, 'Family meal'),
(2, '2025-04-21 15:00:00', 'Harvey Norman', 'Electronics', 1299.00, 'Smartphone purchase'),
(2, '2025-04-22 10:40:00', 'Watsons', 'Pharmacy', 28.30, 'Personal care'),
(2, '2025-04-23 12:25:00', 'TGV Cinemas', 'Entertainment', 40.00, 'Movie outing'),
(2, '2025-04-24 16:50:00', 'Giant', 'Groceries', 145.70, 'Groceries top-up'),
(2, '2025-04-25 08:30:00', 'Petronas', 'Fuel', 88.90, 'Fuel'),
(2, '2025-04-26 14:20:00', 'Starbucks', 'Food & Beverage', 21.00, 'Cappuccino'),
(2, '2025-04-27 17:30:00', 'Uniqlo', 'Clothing', 180.00, 'Casual wear'),
(2, '2025-04-28 19:00:00', 'Shopee', 'Online Shopping', 55.40, 'Kitchen items'),
(2, '2025-04-29 11:30:00', '7-Eleven', 'Convenience Store', 12.80, 'Snacks'),
(2, '2025-04-30 10:10:00', 'Lazada', 'Online Shopping', 130.00, 'Bluetooth earphones'),
(2, '2025-05-01 20:15:00', 'Tesco', 'Groceries', 200.00, 'Monthly shopping'),
(2, '2025-05-02 18:00:00', 'McDonalds', 'Food & Beverage', 26.90, 'Meal combo'),
(2, '2025-05-03 09:20:00', 'Guardian', 'Pharmacy', 34.20, 'Supplements'),
(2, '2025-05-04 13:30:00', 'Shell', 'Fuel', 105.60, 'Petrol'),
(2, '2025-05-05 15:00:00', 'IKEA', 'Home & Living', 480.50, 'Storage furniture'),
(2, '2025-05-06 19:50:00', 'Zalora', 'Clothing', 160.00, 'Workwear'),
(2, '2025-05-07 11:40:00', 'Aeon', 'Groceries', 170.20, 'Daily needs'),
(2, '2025-05-08 14:10:00', 'KFC', 'Food & Beverage', 40.00, 'Lunch box'),
(2, '2025-05-09 17:15:00', 'Domino\'s Pizza', 'Food & Beverage', 50.00, 'Family dinner'),
(2, '2025-05-10 20:30:00', 'Lazada', 'Online Shopping', 75.00, 'Headphones'),
(2, '2025-05-11 09:50:00', 'Watsons', 'Pharmacy', 23.50, 'Shampoo and soap'),
(2, '2025-05-12 13:00:00', 'Uniqlo', 'Clothing', 210.00, 'Jeans and t-shirt'),
(2, '2025-05-13 15:45:00', 'TGV Cinemas', 'Entertainment', 42.00, 'Evening show'),
(2, '2025-05-14 10:30:00', 'Petronas', 'Fuel', 100.00, 'Full tank'),
(2, '2025-05-15 12:20:00', 'Grab', 'Transport', 22.40, 'Ride to work'),
(2, '2025-05-16 14:30:00', 'Shopee', 'Online Shopping', 68.00, 'Office supplies'),
(2, '2025-05-17 16:10:00', 'McDonalds', 'Food & Beverage', 29.50, 'Snack set'),
(2, '2025-05-18 18:00:00', 'Tesco', 'Groceries', 205.00, 'Home groceries'),
(2, '2025-05-19 09:00:00', 'Guardian', 'Pharmacy', 45.60, 'Health and beauty'),
(2, '2025-05-20 11:30:00', 'Shell', 'Fuel', 98.80, 'Fuel top-up'),
(2, '2025-05-21 13:50:00', 'Starbucks', 'Food & Beverage', 16.90, 'Cold brew'),
(2, '2025-05-22 15:30:00', 'Zalora', 'Clothing', 190.00, 'New jacket'),
(2, '2025-05-23 17:45:00', 'Aeon', 'Groceries', 175.50, 'Essentials'),
(2, '2025-05-24 19:10:00', '7-Eleven', 'Convenience Store', 9.90, 'Quick snack'),
(2, '2025-05-25 08:30:00', 'Lazada', 'Online Shopping', 120.00, 'Gaming mouse'),
-- Add 50 more below similarly
(2, '2025-05-26 14:00:00', 'Watsons', 'Pharmacy', 55.50, 'Sunscreen'),
(2, '2025-05-27 10:20:00', 'Grab', 'Transport', 25.00, 'Airport trip'),
(2, '2025-05-28 12:00:00', 'Domino\'s Pizza', 'Food & Beverage', 48.30, 'Lunch with friends'),
(2, '2025-05-29 15:45:00', 'Giant', 'Groceries', 199.99, 'Pantry restock'),
(2, '2025-05-30 18:10:00', 'McDonalds', 'Food & Beverage', 23.80, 'Value meal'),
(2, '2025-05-31 20:00:00', 'Uniqlo', 'Clothing', 250.00, 'Formal wear'),
(2, '2025-06-01 11:15:00', 'IKEA', 'Home & Living', 600.00, 'Dining table set'),
(2, '2025-06-02 13:40:00', 'Tesco', 'Groceries', 185.00, 'Monthly grocery'),
(2, '2025-06-03 10:00:00', 'Shell', 'Fuel', 112.50, 'Petrol'),
(2, '2025-06-04 17:30:00', 'Starbucks', 'Food & Beverage', 19.90, 'Iced mocha'),
(2, '2025-06-05 09:10:00', 'Lazada', 'Online Shopping', 89.90, 'Keyboard cover'),
(2, '2025-06-06 14:20:00', 'Shopee', 'Online Shopping', 59.00, 'Phone stand'),
(2, '2025-06-07 16:50:00', 'Guardian', 'Pharmacy', 40.00, 'Toiletries'),
(2, '2025-06-08 11:30:00', 'Grab', 'Transport', 31.00, 'Meeting commute'),
(2, '2025-06-09 13:20:00', 'McDonalds', 'Food & Beverage', 27.80, 'McChicken set'),
(2, '2025-06-10 15:40:00', 'Petronas', 'Fuel', 101.10, 'Refill'),
(2, '2025-06-11 18:05:00', 'TGV Cinemas', 'Entertainment', 36.00, 'Movie night'),
(2, '2025-06-12 20:30:00', 'Aeon', 'Groceries', 220.00, 'Weekend shopping'),
(2, '2025-06-13 09:00:00', 'Watsons', 'Pharmacy', 26.70, 'Deodorant'),
(2, '2025-06-14 14:10:00', 'Uniqlo', 'Clothing', 180.00, 'Hoodie and jeans'),
(2, '2025-06-15 16:25:00', 'Zalora', 'Clothing', 145.00, 'Shoes'),
(2, '2025-06-16 10:30:00', 'Shell', 'Fuel', 87.60, 'Half tank'),
(2, '2025-06-17 12:50:00', 'Grab', 'Transport', 28.00, 'Short ride'),
(2, '2025-06-18 15:00:00', 'Shopee', 'Online Shopping', 77.70, 'Gadget tools'),
(2, '2025-06-19 17:15:00', 'Starbucks', 'Food & Beverage', 21.40, 'Afternoon coffee'),
(2, '2025-06-20 19:40:00', 'Domino\'s Pizza', 'Food & Beverage', 52.00, 'Weekend treat');


