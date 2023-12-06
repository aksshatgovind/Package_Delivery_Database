CREATE DATABASE Package_Delivery_System;
USE Package_Delivery_System;

CREATE TABLE Bill(
    BID INT PRIMARY KEY,
    Address VARCHAR(255),
    City VARCHAR(255),
    Pay_Type VARCHAR(255)
);

CREATE TABLE Package(
    PID INT PRIMARY KEY,
    Weight INT NOT NULL,
  	Cost INT NOT NULL,
    Pack_Type VARCHAR(255),
  	Promised_Year VARCHAR(255)
);

CREATE TABLE Customer(
    CID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
  	Address VARCHAR(255),
  	Account_No INT NOT NULL,
    Pack_Type VARCHAR(255)
);

CREATE TABLE Company(
  COID INT PRIMARY KEY,
  Comp_Name VARCHAR(255) NOT NULL,
  Address VARCHAR(255) NOT NULL,
  City VARCHAR(50),
  Budget INT
);

CREATE TABLE Ship(
  PID INT NOT NULL,
  COID INT NOT NULL,
  CID INT NOT NULL,
  Date_Shipped DATE NOT NULL,
  PRIMARY KEY (PID, COID, CID),
  FOREIGN KEY (PID) REFERENCES Package(PID) ON DELETE CASCADE,
  FOREIGN KEY (COID) REFERENCES Company(COID) ON DELETE CASCADE,
  FOREIGN KEY (CID) REFERENCES Customer(CID) ON DELETE CASCADE
);

CREATE TABLE Track(
  PID INT NOT NULL,
  CID INT NOT NULL,
  Location VARCHAR(100) NOT NULL,
  Vehicle VARCHAR(50) NOT NULL,
  Date_Tracked DATE NOT NULL,
  PRIMARY KEY (PID, CID),
  FOREIGN KEY (PID) REFERENCES Package(PID) ON DELETE CASCADE,
  FOREIGN KEY (CID) REFERENCES Customer(CID) ON DELETE CASCADE
);

CREATE TABLE History (
  PID INT NOT NULL,
  HID INT PRIMARY KEY,
  History_Year INT NOT NULL,
  Cost INT,
  FOREIGN KEY (PID) REFERENCES Package(PID) ON DELETE CASCADE
);


INSERT INTO Bill (BID, Address, City, Pay_Type) VALUES
(061222, 'Martin St.', 'Francisco', 'Cash'),
(121023, 'Sunset Ave.', 'Los Angeles', 'Credit Card'),
(052824, 'Green Blvd.', 'New York', 'Debit Card'),
(110425, 'Ocean View Dr.', 'Miami', 'Cash on Delivery'),
(030126, 'Park Lane', 'Chicago', 'PayPal'),
(082527, 'Cherry St.', 'Seattle', 'Gift Card'),
(120728, 'Main St.', 'Washington D.C.', 'Bank Transfer'),
(091329, 'Forest Ave.', 'Boston', 'Check'),
(051930, 'Maple Blvd.', 'Atlanta', 'Mobile Wallet'),
(102331, 'Beach Rd.', 'Dallas', 'Cash');

SELECT * FROM Bill;

INSERT INTO Package (PID, Weight, Cost, Pack_Type, Promised_Year) VALUES
(667001, 12, 450, 'Secondary', '2026'),
(801202, 15, 380, 'Standard', '2024'),
(135903, 8, 275, 'Basic', '2025'),
(724604, 20, 590, 'Express', '2023'),
(531805, 10, 350, 'Overnight', '2023'),
(908306, 18, 520, 'International', '2025'),
(472107, 7, 220, 'Gift', '2024'),
(259608, 11, 395, 'Large', '2023'),
(037409, 9, 300, 'Small', '2026'),
(615810, 14, 420, 'Special', '2024');

SELECT * FROM Package;

INSERT INTO Customer (CID, Name, Address, Account_No, Pack_Type) VALUES
(444801, 'Aksshat', 'Beverly Hills', 2100290120025, 'Express'),
(829302, 'Anya', 'Manhattan', 3200540839045, 'Basic'),
(567703, 'David', 'Chicago', 8700120940123, 'Overnight'),
(314504, 'Emma', 'Miami', 4500980321094, 'Large'),
(248005, 'Liam', 'San Francisco', 7800310456021, 'Small'),
(091206, 'Olivia', 'Los Angeles', 5900650748032, 'Gift'),
(123407, 'Noah', 'Seattle', 6300820579014, 'Special'),
(987608, 'Sophia', 'Washington D.C.', 4100230857064, 'Secondary'),
(654309, 'William', 'Boston', 2700460983015, 'Standard'),
(543210, 'Charlotte', 'Atlanta', 1500790432086, 'Express');

SELECT * FROM Customer;

INSERT INTO Company (COID, Comp_Name, Address, City, Budget) VALUES
(2301, 'Kanters', 'Park Lane', 'Boston', 800000),
(5823, 'Horizon Tech', 'Main St.', 'San Francisco', 1200000),
(4091, 'Green Leaf Solutions', 'Oakwood Blvd.', 'Los Angeles', 750000),
(7162, 'Global Motors', 'Industrial Ave.', 'Chicago', 2500000),
(3905, 'Sun Valley Apparel', 'Sunset Blvd.', 'Seattle', 400000),
(1284, 'Coastal Realty', 'Ocean View Dr.', 'Miami', 1000000),
(6532, 'Tech Solutions Inc.', 'Silicon Valley Road', 'Palo Alto', 900000),
(2341, 'Organic Foods', 'Greenfield St.', 'Portland', 600000),
(8710, 'Travel & Tours', 'Airport Blvd.', 'Denver', 500000),
(0913, 'Books & Co.', 'Library Plaza', 'New York', 300000);

SELECT * FROM Company;

INSERT INTO Ship (PID, COID, CID, Date_Shipped) VALUES
(801202, 7162, 829302, '2023-11-01'),
(135903, 3905, 567703, '2023-11-07'),
(724604, 2301, 314504, '2023-10-20'),
(531805, 1284, 248005, '2023-10-25'),
(908306, 8710, 091206, '2023-11-08'),
(472107, 6532, 123407, '2023-10-15'),
(259608, 4091, 987608, '2023-10-30'),
(037409, 2341, 654309, '2023-11-03'),
(615810, 0913, 543210, '2023-10-27');

SELECT * FROM Ship;

INSERT INTO Track (PID, CID, Location, Vehicle, Date_Tracked) VALUES
(667001, 444801, 'Los Angeles Hub', 'Truck', '2023-12-01'),
(801202, 829302, 'New York Sorting Center', 'Plane', '2023-12-02'),
(135903, 567703, 'Chicago Delivery Center', 'Van', '2023-12-03'),
(724604, 314504, 'Miami International Airport', 'Cargo Plane', '2023-12-04'),
(531805, 248005, 'San Francisco Post Office', 'Truck', '2023-12-05'),
(908306, 091206, 'International Transit', 'Ship', '2023-12-06'),
(472107, 123407, 'Seattle Delivery Hub', 'Bike', '2023-12-07'),
(259608, 987608, 'Washington D.C. Warehouse', 'Truck', '2023-12-08'),
(037409, 654309, 'Boston Distribution Center', 'Van', '2023-12-09'),
(615810, 543210, 'Atlanta Sorting Facility', 'Plane', '2023-12-10'),
(135903, 829302, 'New York Delivery Center', 'Truck', '2023-12-11'),
(908306, 314504, 'Miami Port', 'Ship', '2023-12-12'),
(724604, 123407, 'Seattle Customer Address', 'Bike', '2023-12-13'),
(037409, 091206, 'Los Angeles Customer Address', 'Van', '2023-12-14'),
(615810, 567703, 'Chicago Customer Address', 'Truck', '2023-12-15');

SELECT * FROM Track;

INSERT INTO History (PID, HID, History_Year, Cost) VALUES
(667001, 1, 2023, 50),
(801202, 2, 2023, 45),
(135903, 3, 2023, 35),
(724604, 4, 2023, 60),
(531805, 5, 2023, 55),
(908306, 6, 2023, 100),
(472107, 7, 2023, 25),
(259608, 8, 2023, 40),
(037409, 9, 2023, 30),
(615810, 10, 2023, 45),
(135903, 11, 2023, 25),
(908306, 12, 2023, 75),
(724604, 13, 2023, 80),
(037409, 14, 2023, 20),
(615810, 15, 2023, 35);

SELECT * FROM History;
