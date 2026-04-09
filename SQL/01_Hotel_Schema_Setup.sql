CREATE DATABASE hotel_management;
USE hotel_management;
CREATE TABLE users (
    user_id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100),
    phone_number VARCHAR(20),
    mail_id VARCHAR(100),
    billing_address VARCHAR(255)
);

CREATE TABLE bookings (
    booking_id VARCHAR(50) PRIMARY KEY,
    booking_date DATETIME,
    room_no VARCHAR(50),
    user_id VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE items (
    item_id VARCHAR(50) PRIMARY KEY,
    item_name VARCHAR(100),
    item_rate DECIMAL(10,2)
);
CREATE TABLE booking_commercials (
    id VARCHAR(50) PRIMARY KEY,
    booking_id VARCHAR(50),
    bill_id VARCHAR(50),
    bill_date DATETIME,
    item_id VARCHAR(50),
    item_quantity DECIMAL(10,2),
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id),
    FOREIGN KEY (item_id) REFERENCES items(item_id)
);

INSERT INTO users VALUES
('21wrcxuy-67erfn', 'John Doe', '97XXXXXXXX', 'john.doe@example.com', 'XX, Street Y, ABC City'),
('22abcdxy-88ghjk', 'Alice Smith', '98XXXXXXXX', 'alice.smith@example.com', 'YY, Street Z, DEF City'),
('23mnopqr-99lmno', 'Bob Johnson', '99XXXXXXXX', 'bob.johnson@example.com', 'ZZ, Street A, GHI City');

INSERT INTO bookings VALUES
('bk-09f3e-95hj', '2021-09-23 07:36:48', 'rm-bhf9-aerjn', '21wrcxuy-67erfn'),
('bk-q034-q4o', '2021-10-15 10:20:30', 'rm-a12b-c34d', '22abcdxy-88ghjk'),
('bk-x123-y789', '2021-11-10 14:15:00', 'rm-z98x-w76v', '21wrcxuy-67erfn'),
('bk-p456-k321', '2021-11-18 18:45:00', 'rm-l11m-n22o', '23mnopqr-99lmno');

INSERT INTO items VALUES
('itm-a9e8-q8fu', 'Tawa Paratha', 18),
('itm-a07vh-aer8', 'Mix Veg', 89),
('itm-w978-23u4', 'Paneer Butter Masala', 220),
('itm-z111-x222', 'Tea', 20);

INSERT INTO booking_commercials VALUES
('q34r-3q4o8-q34u', 'bk-09f3e-95hj', 'bl-0a87y-q340', '2021-09-23 12:03:22', 'itm-a9e8-q8fu', 3),
('q3o4-ahf32-o2u4', 'bk-09f3e-95hj', 'bl-0a87y-q340', '2021-09-23 12:03:22', 'itm-a07vh-aer8', 1),
('134lr-oyfo8-3qk4', 'bk-q034-q4o', 'bl-34qhd-r7h8', '2021-10-15 12:05:37', 'itm-w978-23u4', 5),
('34qj-k3q4h-q34k', 'bk-x123-y789', 'bl-88xyz-1234', '2021-11-10 15:00:00', 'itm-z111-x222', 10),
('88aa-bbcc-ddee', 'bk-p456-k321', 'bl-77abc-5678', '2021-11-18 19:10:00', 'itm-w978-23u4', 6);