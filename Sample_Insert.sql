/* -------- Customer Inserts -------- */
INSERT INTO orderprocess.Customer (F_Name, L_Name)
VALUES 
('Alex', 'Test'),
('Casey', 'User'),
('Jordan', 'Client'),
('Taylor', 'Account'),
('Morgan', 'Buyer');

SELECT * FROM orderprocess.Customer;


/* -------- Address Inserts -------- */
INSERT INTO orderprocess.Address 
(Address_Type, Street_Name, Street_Number, Unit_Number, City, Country)
VALUES
('US', 'Alpha St', '101', NULL, 'CityA', 'United States'),
('US', 'Beta Ave', '202', 10, 'CityB', 'United States'),
('International', 'Gamma Rd', '303', NULL, 'CityC', 'CountryX');

SELECT * FROM orderprocess.Address;


/* -------- Subtype: US -------- */
INSERT INTO orderprocess.US (Address_ID, State, Zip_Code)
VALUES
(3, 'TX', '70001'),
(4, 'CA', '90001');

SELECT * FROM orderprocess.US;


/* -------- Subtype: International -------- */
INSERT INTO orderprocess.International (Address_ID, Province_Region, Postal_Code)
VALUES
(5, 'RegionX', 'X1X 1X1');

SELECT * FROM orderprocess.International;


/* -------- Customer_Address Bridge -------- */
INSERT INTO orderprocess.Customer_Address (Customer_ID, Address_ID)
VALUES
(4, 3),
(5, 4),
(6, 5);

SELECT * FROM orderprocess.Customer_Address;


/* -------- Product Types -------- */
INSERT INTO orderprocess.Product_Type (Product_Category)
VALUES
('Keyboard Cap'),
('Controller Grip'),
('Keyboard Accessory'),
('Accessory'),
('Peripheral');

SELECT * FROM orderprocess.Product_Type;


/* -------- Products -------- */
INSERT INTO orderprocess.Product 
(Product_Type_ID, Product_Name, Product_Description, Base_Price, Selling_Price)
VALUES
(1, 'Nebula Keycaps', 'Mechanical keyboard keycaps set', 25.00, 39.99),
(2, 'Grip Set', 'Controller grip accessories', 12.00, 21.99),
(3, 'Wrist Pad', 'Ergonomic wrist rest', 15.00, 29.99),
(4, 'Standard Mouse', 'Basic wired mouse', 10.00, 15.00),
(5, 'Mechanical Keyboard', 'RGB mechanical keyboard', 40.00, 75.00);

SELECT * FROM orderprocess.Product;


/* -------- Suppliers -------- */
INSERT INTO orderprocess.Supplier (Supplier_Name, Supplier_Email) 
VALUES
('SupplierA', 'contact@suppliera.com'),
('SupplierB', 'support@supplierb.com');

SELECT * FROM orderprocess.Supplier;


/* -------- Supplier_Product Bridge -------- */
INSERT INTO orderprocess.Supplier_Product (Supplier_ID, Product_ID)
VALUES
(1, 1),
(1, 2),
(2, 3),
(1, 4),
(2, 5);

SELECT * FROM orderprocess.Supplier_Product;


/* -------- Platforms -------- */
INSERT INTO orderprocess.Platform (Platform_Name)
VALUES
('PlatformA'),
('PlatformB'),
('PlatformC');

SELECT * FROM orderprocess.Platform;


/* -------- Supplier_Platform Bridge -------- */
INSERT INTO orderprocess.Supplier_Platform (Supplier_ID, Platform_ID)
VALUES
(1, 1),
(1, 2),
(2, 3);

SELECT * FROM orderprocess.Supplier_Platform;


/* -------- Orders -------- */
INSERT INTO orderprocess.Orders (Customer_ID, Address_ID, Order_Date)
VALUES
(1, 1, '2026-01-01'),
(2, 2, '2026-02-01'),
(3, 3, '2026-03-01'),
(4, 3, '2026-01-15'),
(5, 4, '2026-02-20'),
(6, 5, '2026-03-20');

SELECT * FROM orderprocess.Orders;


/* -------- Order Details -------- */
INSERT INTO orderprocess.Order_Detail (Order_ID, Product_ID, Quantity)
VALUES
(1, 1, 2),
(1, 2, 1),
(2, 3, 3),
(3, 4, 1),
(4, 5, 2),
(5, 1, 1),
(6, 2, 4);

SELECT * FROM orderprocess.Order_Detail;

