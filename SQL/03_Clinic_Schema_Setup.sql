CREATE DATABASE clinic_management;
USE clinic_management;
CREATE TABLE clinics (
    cid VARCHAR(50) PRIMARY KEY,
    clinic_name VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100)
);
CREATE TABLE customer (
    uid VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100),
    mobile VARCHAR(20)
);

CREATE TABLE clinic_sales (
    oid VARCHAR(50) PRIMARY KEY,
    uid VARCHAR(50),
    cid VARCHAR(50),
    amount DECIMAL(10,2),
    datetime DATETIME,
    sales_channel VARCHAR(50),
    FOREIGN KEY (uid) REFERENCES customer(uid),
    FOREIGN KEY (cid) REFERENCES clinics(cid)
);
CREATE TABLE expenses (
    eid VARCHAR(50) PRIMARY KEY,
    cid VARCHAR(50),
    description VARCHAR(255),
    amount DECIMAL(10,2),
    datetime DATETIME,
    FOREIGN KEY (cid) REFERENCES clinics(cid)
);

INSERT INTO clinics VALUES
('cnc-0100001', 'XYZ Clinic', 'Hyderabad', 'Telangana', 'India'),
('cnc-0100002', 'ABC Clinic', 'Visakhapatnam', 'Andhra Pradesh', 'India'),
('cnc-0100003', 'Health First', 'Hyderabad', 'Telangana', 'India');

INSERT INTO customer VALUES
('uid-001', 'Jon Doe', '97XXXXXXXX'),
('uid-002', 'Priya Sharma', '98XXXXXXXX'),
('uid-003', 'Rahul Verma', '99XXXXXXXX');

INSERT INTO clinic_sales VALUES
('ord-00100-00100', 'uid-001', 'cnc-0100001', 24999, '2021-09-23 12:03:22', 'sodat'),
('ord-00100-00101', 'uid-002', 'cnc-0100002', 15000, '2021-10-15 14:20:00', 'walkin'),
('ord-00100-00102', 'uid-001', 'cnc-0100001', 18000, '2021-11-10 10:45:00', 'online'),
('ord-00100-00103', 'uid-003', 'cnc-0100003', 22000, '2021-11-18 09:30:00', 'sodat'),
('ord-00100-00104', 'uid-002', 'cnc-0100002', 12000, '2021-12-05 11:00:00', 'walkin');

INSERT INTO expenses VALUES
('exp-0100-00100', 'cnc-0100001', 'first-aid supplies', 557, '2021-09-23 07:36:48'),
('exp-0100-00101', 'cnc-0100002', 'electricity', 2500, '2021-10-16 08:00:00'),
('exp-0100-00102', 'cnc-0100001', 'staff salary', 8000, '2021-11-11 09:00:00'),
('exp-0100-00103', 'cnc-0100003', 'rent', 10000, '2021-11-18 08:30:00'),
('exp-0100-00104', 'cnc-0100002', 'cleaning', 1500, '2021-12-06 07:45:00');