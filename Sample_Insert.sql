/* Test Script*/

/*Instance of Customer*/
Insert into orderprocess.customer(F_Name,L_Name)
Values 
('John', 'Smith');
Insert into orderprocess.customer(F_Name,L_Name)
Values 
('John', 'Doe');
Insert into orderprocess.customer(F_Name,L_Name)
Values 
('Jane', 'Doe');

select * from orderprocess.customer;

/*Instance of Address*/
/*Insertion of US and International Address*/
Insert into orderprocess.address(Address_Type,Street_Name,Street_Number,Unit_Number,City,Country)
Values
('US', 'ElmoStreet','123',Null,'Portland','United States'),
('International', '东直门南大街','10',1203,'北京','China');
select * from orderprocess.address;

/*Insertion Into Subtypes*/

/*US Insert*/
Insert into orderprocess.us(Address_ID,State, Zip_Code)
Values
(1,'ME','04101');
select * from orderprocess.us;

/*International Insert*/
Insert into orderprocess.international(Address_ID,Province_Region, Postal_Code)
Values
(2,'Beijing Municipality','100027');

select * from orderprocess.international;

/*Customer_Address Bridge Inserts*/
insert into orderprocess.customer_address(Customer_ID, Address_ID)
values
(1,1),
(2,2),
(3,2);
 
select*from orderprocess.customer_address;

/*Product_Type Inserts*/
insert into orderprocess.product_type(product_category)
values
('Keyboard Cap'),
('Controller Grip'),
('Keyboard Accessory')
;

select*from orderprocess.product_type;

/*Product Inserts*/
insert into orderprocess.product(Product_Type_ID,Product_Name,Product_Description,Base_Price,Selling_Price)
Values
(1,'Nebula Nova Pastel Key Caps',' A Set of 108 mechanical keyboard keycaps in pastel colors, PBT material.',25.00,39.99),
(2, 'Galaxy Grip Set', 'Set of soft-touch controller grips with textured design for better control.', 12.00, 21.99),
(3, 'Wrist Rest Pad', 'Ergonomic wrist rest pad with memory foam and non-slip base for long gaming sessions.', 15.00, 29.99)
;
select*from orderprocess.product;

/*Supplier Inserts */

insert into orderprocess.supplier(Supplier_Name,Supplier_Email) 
values
('PixelPink', 'contact@pixelpink.com'),
('GamerGlow', 'support@gamerglow.io')
;
select*from orderprocess.supplier;

/*Supplier_Product Bridge Inserts*/

insert into orderprocess.supplier_product( Supplier_ID, Product_ID)
values
(1,2),
(1,3),
(2,1)
;

select*from orderprocess.supplier_product;

/*Platform Inserts*/

insert into orderprocess.platform(Platform_Name)
values
('Alibaba'),
('Aliexpress');

select*from orderprocess.platform;

/*Supplier_Platform Bridge Inserts*/

insert into orderprocess.supplier_platform(Supplier_ID, Platform_ID)
values
(1,2),
(2,1);

select*from orderprocess.supplier_platform;

/*Order_ID Inserts*/

insert into orderprocess.orders(Customer_ID, Address_ID, Order_Date,Total_Amount)
values
(1,1, '2026-03-11',50.00),
(2,2, '2026-05-11',60.00),
(3,2, '2025-04-12',70.00);

select * from orderprocess.orders;

/* Order_Detail Bridge Inserts*/

insert into orderprocess.order_detail(Order_ID, Product_ID, Quantity)
values
(1,1, 3),
(2,3,4),
(3,2,1);

select*from orderprocess.order_detail;







