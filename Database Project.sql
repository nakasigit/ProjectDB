CREATE DATABASE NTESLE
GO
USE NTESLE

CREATE TABLE Customer(
Customer_ID CHAR(5) PRIMARY KEY CHECK (Customer_ID LIKE 'CS[0-9][0-9][0-9]'),
Customer_Name VARCHAR(50) NOT NULL,
Customer_Phone VARCHAR(15) NOT NULL CHECK (Customer_Phone LIKE '+62[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
Customer_Address VARCHAR(100) NOT NULL
)

CREATE TABLE ProductType(
Product_Type_ID CHAR(5) PRIMARY KEY CHECK (Product_Type_ID LIKE 'PT[0-9][0-9][0-9]'),
Product_Type_Name VARCHAR(25) NOT NULL
)

CREATE TABLE Product(
Product_ID CHAR(5) PRIMARY KEY CHECK (Product_ID LIKE 'PD[0-9][0-9][0-9]'),
Product_Name VARCHAR(50) NOT NULL,
Product_Type CHAR(5) FOREIGN KEY REFERENCES ProductType(Product_Type_ID),
Product_Price INT NOT NULL CHECK (Product_Price >= 5000),
Product_Expire_Date DATE NOT NULL CHECK (YEAR(Product_Expire_Date) > 2020)
)

CREATE TABLE Staff(
Staff_ID CHAR(5) PRIMARY KEY CHECK (Staff_ID LIKE 'ST[0-9][0-9][0-9]'),
Staff_Name VARCHAR(50) NOT NULL,
Staff_Gender CHAR (6) NOT NULL CHECK (Staff_Gender LIKE 'Male' OR Staff_Gender LIKE 'Female'),
Staff_Phone_Number VARCHAR(15) NOT NULL CHECK (Staff_Phone_Number LIKE '+62[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
Staff_DOB DATE NOT NULL,
Staff_Salary INT NOT NULL CHECK (Staff_Salary BETWEEN 1000000 AND 10000000)
)

CREATE TABLE Sales_Transaction_Header(
Sales_Transaction_ID CHAR(5) PRIMARY KEY CHECK (Sales_Transaction_ID LIKE 'SL[0-9][0-9][0-9]'),
Staff_ID CHAR(5) FOREIGN KEY REFERENCES Staff(Staff_ID),
Customer_ID CHAR(5) FOREIGN KEY REFERENCES Customer(Customer_ID),
Sales_Date DATE NOT NULL
)

CREATE TABLE Sales_Transaction_Detail(
Sales_Transaction_ID CHAR(5) FOREIGN KEY REFERENCES Sales_Transaction_Header(Sales_Transaction_ID),
Product_ID CHAR(5) FOREIGN KEY REFERENCES Product(Product_ID),
Product_Quantity INT NOT NULL
PRIMARY KEY (Sales_Transaction_ID, Product_ID)
)

CREATE TABLE Ingredient(
Ingredient_ID CHAR(5) PRIMARY KEY CHECK (Ingredient_ID LIKE 'IG[0-9][0-9][0-9]'),
Ingredient_Name VARCHAR(50)NOT NULL,
Ingredient_Price INT NOT NULL,
Ingredient_Expire_DATE DATE NOT NULL CHECK (YEAR(Ingredient_Expire_DATE) > 2022)	 
)

CREATE TABLE Supplier(
Supplier_ID CHAR(5) PRIMARY KEY CHECK (Supplier_ID LIKE 'SU[0-9][0-9][0-9]'),
Supplier_Name VARCHAR(50) NOT NULL,
Supplier_Phone_Number VARCHAR(15) NOT NULL CHECK (Supplier_Phone_Number LIKE '+62[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
Supplier_Address VARCHAR(50) NOT NULL
)

CREATE TABLE Purchase_Transaction_Header(
Purchase_Transaction_ID CHAR(5) PRIMARY KEY CHECK (Purchase_Transaction_ID LIKE 'PU[0-9][0-9][0-9]'),
Staff_ID CHAR(5) FOREIGN KEY REFERENCES Staff(Staff_Id),
Supplier_ID CHAR(5) FOREIGN KEY REFERENCES Supplier(Supplier_ID),
Purchase_Date DATE NOT NULL
)

CREATE TABLE Purchase_Transaction_Detail(
Purchase_Transaction_ID CHAR(5) FOREIGN KEY REFERENCES Purchase_Transaction_Header(Purchase_Transaction_ID),
Ingredient_ID CHAR(5) FOREIGN KEY REFERENCES Ingredient(Ingredient_ID),
Ingredient_Quantity INT NOT NULL
PRIMARY KEY (Purchase_Transaction_ID, Ingredient_ID)
)

INSERT INTO Customer VALUES
('CS001', 'Sensei Ananda', '+6281313131313', 'Villa Bekasi Buruk 1 Bojonegoro 1'),
('CS002', 'Endru Rudiyono', '+6281414141414', 'Villa Bekasi Buruk 2 Lose Saga 4'),
('CS003', 'Jordan Antonios', '+6281515151515', 'Villa Bekasi Buruk 2 Granger 11'),
('CS004', 'Annas Sigit Adityo', '+6281111111111', 'Villa Bekasi Buruk 1 Latin 25'),
('CS005', 'Joerish Christopel', '+6282222222222', 'Villa Bekasi Buruk 3 Bojonegoro 5'),
('CS006', 'Antonios Joerish', '+6283333333333', 'Villa Bekasi Buruk 1 Granger 2'),
('CS007', 'Joerish Jordan Santoso', '+6284444444444', 'Villa Bekasi Buruk 3 Lose Saga 1'),
('CS008', 'Makmur Setiyo', '+6285555555555', 'Villa Bekasi Buruk 2 Latin 27'),
('CS009', 'Ardhito Pamungkas', '+6286666666666', 'Villa Bekasi Buruk 3 Bojonegoro 1'),
('CS010', 'Pradhito Ardhingkas', '+6287777777777', 'Villa Bekasi Buruk 1 Latin 61'),
('CS011', 'Sensei Rifki', '+6288888888888', 'Villa Bekasi Buruk 2 Granger 5'),
('CS012', 'Steve Jobs', '+6289999999999', 'Villa Bekasi Buruk 1 Granger 32'),
('CS013', 'Rob Jobs', '+6281010101010', 'Villa Bekasi Buruk 1 Lose Saga 5'),
('CS014', 'Bonding Prakoso', '+6281222222221', 'Villa Bekasi Buruk 2 Bojonegoro 1')

INSERT INTO Supplier VALUES
('SU001', 'Indofruit', '+628353895395', 'Bandung Jalan Jaya 5 No. 12'),
('SU002', 'iWant', '+628434378822', 'Jakarta Pusat Jalan Momentum 4'),
('SU003', 'Chochies', '+628493049532', 'Jakarta Selatan Jalan Puri 7'),
('SU004', 'Gandumn', '+628385748534', 'Bekasi Jalan Burik No. 1 Lateen 5'),
('SU005', 'Selera Saya', '+628342349422', 'Bekasi Jalan Cendana 25'),
('SU006', 'Bimoil', '+628439853952', 'Medan Jalan Serang 88'),
('SU007', 'PeLeN', '+628590375302', 'Papua Jalan Nugini 240'),
('SU008', 'Makmur Jaya', '+628135458322', 'California Jalan Soekarno 25'),
('SU009', 'SiGate', '+628182342125', 'Bandung Jalan Kebun Raya 65'),
('SU010', 'Orekel', '+628124842342', 'Bekasi Jalan Jeruk 27')

INSERT INTO Ingredient VALUES
('IG001', 'Susu', '1500000', '2024-01-11'),
('IG002', 'Air', '500000', '2024-01-10'),
('IG003', 'Coklat', '5000000', '2025-06-15'),
('IG004', 'Gandum', '2500000', '2024-01-08'),
('IG005', 'Tepung', '1750000', '2024-04-18'),
('IG006', 'Minyak', '5000000', '2024-12-01'),
('IG007', 'Telur', '980000', '2024-12-26'),
('IG008', 'Meises', '500000', '2024-01-08'),
('IG009', 'Waffer', '1950000', '2024-12-01'),
('IG010', 'Sugar', '6800000', '2024-12-01'),
('IG011', 'Kacang', '895000', '2024-12-01'),
('IG012', 'Sagu', '265800', '2024-12-01'),
('IG013', 'Biji Kopi', '800000', '2024-12-01'),
('IG014', 'Ikan', '1500000', '2023-12-01'),
('IG015', 'Jeruk', '750000', '2024-12-01')

INSERT INTO ProductType VALUES
('PT001', 'Biscuits'),
('PT002', 'Milk'),
('PT003', 'Vitamin'),
('PT004', 'Pet Food'),
('PT005', 'Coffee'),
('PT006', 'Mineral Water'),
('PT007', 'Noodle'),
('PT008', 'Cereals'),
('PT009', 'Frozen Food'),
('PT010', 'Candy')

INSERT INTO Product VALUES
('PD001', 'Beeskuat', 'PT001', '6500', '2024-03-01'),
('PD002', 'Reagale', 'PT001', '5000', '2021-01-06'),
('PD003', 'Rome', 'PT001', '6250', '2021-04-16'),
('PD004', 'Fritz Flag', 'PT002', '5500', '2021-04-26'),
('PD005', 'Malaymilk', 'PT002', '5000', '2024-06-26'),
('PD006', 'Rampage Milk', 'PT002', '6500', '2022-04-07'),
('PD007', 'Panda Brand', 'PT002', '8000', '2022-06-20'),
('PD008', 'Impoosh', 'PT003', '6000', '2023-06-14'),
('PD009', 'Vitaceemint', 'PT003', '7500', '2021-07-26'),
('PD010', 'Enervont-Dee', 'PT003', '8500', '2021-11-15'),
('PD011', 'Boldz', 'PT004', '18000', '2022-04-07'),
('PD012', 'WhisKun', 'PT004', '22000', '2022-11-01'),
('PD013', 'Miaw', 'PT004', '20000', '2021-04-21'),
('PD014', 'Lubak Fhite Coffee', 'PT005', '8000', '2022-06-20'),
('PD015', 'Kapal Aer', 'PT005', '6500', '2021-11-15'),
('PD016', 'Akuos', 'PT006', '10000', '2022-02-21'),
('PD017', 'Le Minta Le', 'PT006', '9500', '2022-11-01'),
('PD018', 'Malaymie', 'PT007', '5400', '2023-07-18'),
('PD019', 'Gaenaak', 'PT007', '6500', '2024-12-17'),
('PD020', 'Naruto', 'PT007', '10000', '2024-06-26'),
('PD021', 'Groovy Mie', 'PT007', '6500', '2022-06-08'),
('PD022', 'Kokoh Krans', 'PT008', '15000', '2022-04-07'),
('PD023', 'Oweo', 'PT008', '15000', '2022-02-03'),
('PD024', 'Hylos', 'PT008', '95000', '2021-11-15'),
('PD025', 'Sausej', 'PT009', '15000', '2023-08-04'),
('PD026', 'Tuna', 'PT009', '25000', '2021-07-26'),
('PD027', 'Pempek Kapal Selam', 'PT009', '15000', '2023-03-27'),
('PD028', 'Bakso Ikan', 'PT009', '18000', '2023-03-27'),
('PD029', 'Yuhee', 'PT010', '5550', '2024-06-26'),
('PD030', 'Milikkita', 'PT010', '6250', '2023-03-27')

INSERT INTO Staff VALUES
('ST001', 'Yohanes Kurniawan', 'Male', '+628156842593', '1972-12-19', '10000000'),
('ST002', 'Henkie Ongowarsito', 'Male', '+628138569158', '1999-11-14', '6500000'),
('ST003', 'Yulia Magalenda', 'Female', '+628982654868', '1999-07-11', '3500000'),
('ST004', 'Lifia Yola', 'Female', '+628136987562', '1993-10-09', '9500000'),
('ST005', 'Andreas Raharto Condrobimo', 'Male', '+628136963256', '1995-10-29', '6500000'),
('ST006', 'Cadelina', 'Female', '+628987451369', '1998-09-04', '3500000'),
('ST007', 'Haris Setyabudi', 'Male', '+628125985631', '1978-10-05', '10000000'),
('ST008', 'Angelia', 'Female', '+628786582013', '1998-12-19', '4500000'),
('ST009', 'Hendra Gusmantara', 'Male', '+628125984534', '1998-10-19', '4500000'),
('ST010', 'Yuli', 'Female', '+628786935218', '1998-05-19', '5000000')

INSERT INTO Sales_Transaction_Header VALUES
('SL001', 'ST001', 'CS001', '2019-01-09'),
('SL002', 'ST005', 'CS001', '2019-01-12'),
('SL003', 'ST002', 'CS007', '2019-01-15'),
('SL004', 'ST003', 'CS006', '2019-01-16'),
('SL005', 'ST002', 'CS002', '2019-01-19'),
('SL006', 'ST008', 'CS003', '2019-02-05'),
('SL007', 'ST004', 'CS003', '2019-02-26'),
('SL008', 'ST010', 'CS007', '2019-03-25'),
('SL009', 'ST010', 'CS014', '2019-03-27'),
('SL010', 'ST003', 'CS012', '2019-03-29'),
('SL011', 'ST006', 'CS005', '2019-04-02'),
('SL012', 'ST008', 'CS003', '2019-04-11'),
('SL013', 'ST002', 'CS001', '2019-04-12'),
('SL014', 'ST005', 'CS002', '2019-04-15'),
('SL015', 'ST003', 'CS013', '2019-04-17'),
('SL016', 'ST001', 'CS011', '2019-04-29'),
('SL017', 'ST009', 'CS007', '2019-09-19'),
('SL018', 'ST010', 'CS009', '2019-09-09'),
('SL019', 'ST009', 'CS004', '2019-10-29')

INSERT INTO Sales_Transaction_Detail VALUES
('SL001', 'PD021', '5'),
('SL001', 'PD001', '3'),
('SL001', 'PD025', '2'),
('SL002', 'PD015', '6'),
('SL002', 'PD012', '11'),
('SL002', 'PD002', '9'),
('SL003', 'PD012', '12'),
('SL003', 'PD016', '4'),
('SL003', 'PD007', '25'),
('SL004', 'PD015', '8'),
('SL004', 'PD021', '3'),
('SL004', 'PD010', '7'),
('SL004', 'PD013', '1'),
('SL004', 'PD006', '3'),
('SL004', 'PD004', '4'),
('SL004', 'PD009', '5'),
('SL005', 'PD018', '3'),
('SL005', 'PD009', '1'),
('SL005', 'PD005', '3'),
('SL005', 'PD014', '4'),
('SL005', 'PD011', '9'),
('SL006', 'PD017', '4'),
('SL006', 'PD001', '10'),
('SL006', 'PD003', '2'),
('SL007', 'PD008', '10'),
('SL007', 'PD017', '2'),
('SL008', 'PD003', '1'),
('SL008', 'PD021', '1'),
('SL009', 'PD009', '5'),
('SL009', 'PD002', '4'),
('SL009', 'PD025', '2'),
('SL009', 'PD021', '1'),
('SL010', 'PD024', '9'),
('SL010', 'PD001', '3'),
('SL010', 'PD009', '2'),
('SL010', 'PD022', '5'),
('SL011', 'PD014', '3'),
('SL011', 'PD018', '12'),
('SL011', 'PD005', '4'),
('SL011', 'PD008', '1'),
('SL011', 'PD006', '5'),
('SL012', 'PD001', '1'),
('SL012', 'PD005', '1'),
('SL012', 'PD013', '1'),
('SL013', 'PD018', '5'),
('SL013', 'PD007', '4'),
('SL014', 'PD009', '3'),
('SL014', 'PD001', '5'),
('SL014', 'PD016', '7'),
('SL014', 'PD014', '2'),
('SL015', 'PD006', '2'),
('SL015', 'PD022', '1'),
('SL015', 'PD015', '1'),
('SL016', 'PD019', '3'),
('SL016', 'PD003', '4'),
('SL016', 'PD001', '4'),
('SL017', 'PD006', '5'),
('SL017', 'PD020', '1'),
('SL017', 'PD009', '3'),
('SL018', 'PD001', '10'),
('SL018', 'PD004', '1'),
('SL019', 'PD024', '25'),
('SL019', 'PD017', '8'),
('SL019', 'PD009', '1'),
('SL019', 'PD004', '5')

INSERT INTO Purchase_Transaction_Header VALUES
('PU001', 'ST004', 'SU001', '2020-10-19'),
('PU002', 'ST002', 'SU002', '2019-07-16'),
('PU003', 'ST006', 'SU006', '2020-10-02'),
('PU004', 'ST001', 'SU005', '2019-05-21'),
('PU005', 'ST009', 'SU008', '2020-08-26'),
('PU006', 'ST002', 'SU005', '2019-09-03'),
('PU007', 'ST007', 'SU001', '2020-05-24'),
('PU008', 'ST008', 'SU008', '2019-09-11'),
('PU009', 'ST010', 'SU009', '2020-02-19'),
('PU010', 'ST002', 'SU008', '2019-05-08'),
('PU011', 'ST001', 'SU005', '2020-03-26'),
('PU012', 'ST005', 'SU005', '2019-05-15'),
('PU013', 'ST008', 'SU002', '2020-08-20'),
('PU014', 'ST002', 'SU003', '2020-11-21'),
('PU015', 'ST003', 'SU007', '2020-03-13')

INSERT INTO Purchase_Transaction_Detail VALUES
('PU001', 'IG002', 25),
('PU001', 'IG005', 65),
('PU001', 'IG003', 50),
('PU002', 'IG006', 25),
('PU002', 'IG007', 100),
('PU003', 'IG001', 155),
('PU003', 'IG002', 25),
('PU004', 'IG001', 35),
('PU004', 'IG010', 65),
('PU005', 'IG014', 50),
('PU005', 'IG002', 55),
('PU006', 'IG006', 50),
('PU006', 'IG010', 25),
('PU007', 'IG015', 65),
('PU007', 'IG007', 25),
('PU008', 'IG008', 250),
('PU009', 'IG011', 175),
('PU009', 'IG004', 200),
('PU010', 'IG010', 150),
('PU010', 'IG014', 25),
('PU011', 'IG010', 25),
('PU011', 'IG004', 150),
('PU012', 'IG010', 200),
('PU013', 'IG005', 250),
('PU014', 'IG007', 25),
('PU015', 'IG009', 25)

--------------------------------------------------------------------

-- Sales Transaction

-- A new Customer named 'Windah Basudara' wants to buy 'Le Minta Le' (PD017) 2 pcs and 'Hylos' (PD024) 1pcs handled by Haris Setyabudi (ST007) on 25 February 2020
-- Input a new data to Customer table for new customer
INSERT Customer VALUES
('CS015', 'Windah Basudara', '+6281232521251', 'Bekasi Street')
-- First, a Staff inputs a Header Transaction to start the transaction
INSERT Sales_Transaction_Header VALUES
('SL020', 'ST007', 'CS015', '2020-02-25')
-- Second, a Staff inputs a Detail Transaction to fill the transaction
INSERT Sales_Transaction_Detail VALUES
('SL020', 'PD017', 2),
('SL020', 'PD024', 1)
-- Third, a Staff checks the transactions detail about customer and customer's order based on transaction date
SELECT
	sth.Sales_Transaction_ID AS [Transaction ID],
	c.Customer_Name [Customer Name],
	Product_Name AS [Product Name],
	sth.Sales_Date [Transaction Date]
FROM
	Sales_Transaction_Header sth
	JOIN Sales_Transaction_Detail std ON std.Sales_Transaction_ID = sth.Sales_Transaction_ID
	JOIN Customer c ON c.Customer_ID = sth.Customer_ID
	JOIN Product p ON p.Product_ID = std.Product_ID
ORDER BY [Transaction Date]

--------------------------------------------------------------------

-- Purchase Transaction

-- a Staff named 'Yohanes Kurniawan' (ST001) wants to purchase 'Gula' (IG011) 225 pcs and 'Meises' (IG008) 200 pcs ingredients from a new Supplier named Jaya E-Sport on 17 August 2020
-- Input a new data to Supplier table for new supplier
INSERT Supplier VALUES
('SU011', 'Jaya E-Sport', '+628645649934', 'Surabaya Jalan Cengkeh 2')
-- First, a Staff inputs a Header Transaction to start the transaction
INSERT Purchase_Transaction_Header VALUES
('PU016', 'ST001', 'SU011', '2020-08-17')
-- Second, a Staff inputs a Detail Transaction to fill the transaction
INSERT Purchase_transaction_Detail VALUES
('PU016', 'IG011', 225),
('PU016', 'IG008', 200)
-- Third, a Staff checks the transactions detail about customer and customer's order based on transaction date
SELECT
	pth.Purchase_Transaction_ID AS [Transaction ID],
	s.Supplier_Name AS [Supplier Name],
	i.Ingredient_Name AS [Ingredient Name],
	Purchase_Date AS [Transaction Date]
FROM
	Purchase_Transaction_Header pth
	JOIN Purchase_Transaction_Detail ptd ON ptd.Purchase_Transaction_ID = pth.Purchase_Transaction_ID
	JOIN Supplier s ON s.Supplier_ID = pth.Supplier_ID
	JOIN Ingredient i ON i.Ingredient_ID = ptd.Ingredient_ID
ORDER BY [Transaction Date]

--------------------------------------------------------------------

-- 1.	Display SupplierName, IngredientName, Total Quantity (obtained from the sum of quantity purchased) for every Ingredient whose name contains “sugar” and bought in May.

SELECT
	s.Supplier_Name AS [Supplier Name],
	i.Ingredient_Name AS [Ingredient Name],
	SUM(ptd.Ingredient_Quantity) AS [Quantity Purchased]
FROM Purchase_Transaction_Header pth
	JOIN Purchase_Transaction_Detail ptd ON pth.Purchase_Transaction_ID = ptd.Purchase_Transaction_ID
	JOIN Supplier s ON pth.Supplier_ID = s.Supplier_ID
	JOIN Ingredient i ON i.Ingredient_ID = ptd.Ingredient_ID
WHERE
	Ingredient_Name LIKE 'Sugar'
	AND MONTH(pth.Purchase_Date) = 5
GROUP BY
	s.Supplier_Name,
	i.Ingredient_Name

-- 2.	Display StaffName, StaffGender, StaffSalary, and Total Transaction (obtained from the total
-- number of sales) for every staff whose salaries are between 6 million to 7 million and the total transaction is more than 1.

SELECT
	s.Staff_Name AS [Staff Name],
	s.Staff_Gender AS [Gender],
	s.Staff_Salary AS [Salary],
	COUNT(sth.Sales_Transaction_ID) AS [Total Transaction]
FROM Staff s
	JOIN Sales_Transaction_Header sth ON s.Staff_ID = sth.Staff_ID
WHERE
	Staff_Salary BETWEEN 6000000 AND 7000000
GROUP BY
	s.Staff_Name,
	s.Staff_Gender,
	s.Staff_Salary
HAVING
	COUNT(sth.Sales_Transaction_ID) > 1

-- 3.	Display CustomerName, Customer Phone Number (obtained by replacing “+62” with “0”), ProductName, Total Transaction (obtained from the total number of transaction), and
-- Total Product Price (obtained from the sum of all product price purchased) for every product whose name has at least two words and expired year after 2021.

SELECT
	c.Customer_Name AS [Customer Name],
	REPLACE(c.Customer_Phone, '+62', '0') AS [Customer Phone Number],
	p.Product_Name AS [Product Name],
	COUNT(sth.Sales_Transaction_ID) AS [Total Transaction],
	SUM(p.Product_Price) AS [Total Product Price]
FROM
	Customer c
	JOIN Sales_Transaction_Header sth ON c.Customer_ID = sth.Customer_ID
	JOIN Sales_Transaction_Detail std ON std.Sales_Transaction_ID = sth.Sales_Transaction_ID
	JOIN Product p ON p.Product_ID = std.Product_ID
WHERE
	p.Product_Name LIKE '% %'
	AND YEAR(p.Product_Expire_Date) > 2021
GROUP BY
	c.Customer_Name,
	c.Customer_Phone,
	p.Product_Name

-- 4.	Display Total Price (obtained from the sum of ingredient price), IngredientName, and Total Transaction (obtained from the count
-- of purchase transaction) for every purchase transaction which done by a staff whose age is more than 19 years old in 2020 and the ingredient’s expired year after
-- 2024. Then sort the data in ascending format based on the total price.