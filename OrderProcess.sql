/* Table Creation Query Tab*/


/*Customer and Address Relationship Below*/


/* Customer Table*/
CREATE TABLE orderprocess.customer(
Customer_ID INT PRIMARY KEY AUTO_INCREMENT,
F_Name VARCHAR (255) NOT NULL,
L_Name VARCHAR(255) NOT NULL,
/*Check*/
constraint chk_fName_for_lettersonly
CHECK (F_NAME regexp '^[A-Za-z]+$'),
constraint chk_lname_for_lettersonly
CHECK (L_NAME regexp '^[A-Za-z]+$'));

/*Address Table (SuperType)*/
CREATE TABLE orderprocess.address(
Address_ID INT PRIMARY KEY AUTO_INCREMENT,
Address_Type VARCHAR(13) NOT NULL DEFAULT 'US', /*SubType Discreminator*/
/*Check*/
constraint chk_address_type
Check(Address_Type IN ('US', 'International')), 
Street_Name VARCHAR(255)NOT NULL,
Street_Number VARCHAR(255)NOT NULL,
Unit_Number INT NULL,
/*Check*/
constraint chk_unit_to_ensure_positiveval
Check (Unit_Number is null or Unit_Number>0),
City VARCHAR (255) NOT NULL,
Country VARCHAR(100) Not NULL default 'US');

/*Address Subtypes (US & International)*/
/*US*/
CREATE TABLE orderprocess.us(
Address_ID INT PRIMARY KEY,
State VARCHAR (2) NOT NULL,
/*Check*/
constraint chk_state_value
Check ( State In ('AL','AK','AZ','AR','CA','CO','CT','DE','FL','GA',
'HI','ID','IL','IN','IA','KS','KY','LA','ME','MD',
'MA','MI','MN','MS','MO','MT','NE','NV','NH','NJ',
'NM','NY','NC','ND','OH','OK','OR','PA','RI','SC',
'SD','TN','TX','UT','VT','VA','WA','WV','WI','WY')),
Zip_Code VARCHAR (10) NOT NULL,	
/*Foreign Key*/
constraint fk_us_address
 FOREIGN KEY (Address_ID) REFERENCES orderprocess.address(Address_ID));
 
/*International*/
CREATE TABLE orderprocess.international(
Address_ID INT PRIMARY KEY,
Province_Region VARCHAR (255) NOT NULL,
Postal_Code VARCHAR (50) NOT NULL,
/*Foreign Key*/
constraint fk_international_address
FOREIGN KEY (Address_ID) REFERENCES orderprocess.address(Address_ID));

/*CustomerAddress (Bridge Entity)*/
create table orderprocess.customeraddress(
Customer_ID int,
Address_ID int,
Primary key(Customer_ID, Address_ID),

/*Foreign Keys*/
constraint fk_customer_id
Foreign key(Customer_ID) References orderprocess.customer(Customer_ID),
constraint fk_address_id
Foreign key (Address_ID) references orderprocess.address(Address_ID)


);


/*Supplier and Platform Relationship Below */


/*Supplier Table*/
create table orderprocess.supplier(
Supplier_ID int primary key auto_increment,
Supplier_Name varchar (255) Not null,
Supplier_Email varchar(255) Null
);

/*Supplier_Platform Bridge table*/
create table orderprocess.supplier_platform(
Supplier_ID int Not null,
Platform_ID int Not null ,
primary key(Supplier_ID, Platform_ID),

/*Foreign Keys*/
constraint fk_supplier_id
Foreign key (Supplier_ID) references orderprocess.supplier(Supplier_ID),
constraint fk_platform_id
foreign key (Platform_ID) references orderprocess.platform(Platform_ID)

);
/*Platform Table*/
create table orderprocess.platform(
Platform_ID int primary key auto_increment,
Platform_Name Varchar (255) Not Null,
constraint platform_unique unique(Platform_Name)
);



/* Supplier and Product Relationship*/


/*Supplier_Product Bridge Table*/
create table orderprocess.supplier_product(
Supplier_ID int,
Product_ID int, 
Primary Key (Supplier_ID, Product_ID),
/*Foreign Keys*/ 
constraint fk_supplier_id2
Foreign key (Supplier_ID) references orderprocess.supplier(Supplier_ID),
constraint fk_product_id
Foreign key (Product_ID) references orderprocess.product(Product_ID)
);


/*Product Table */
create table orderprocess.product(
Product_ID int Primary key AUTO_INCREMENT,
Product_Type_ID int not null,
Product_Name varchar (255) not null,
Product_Description varchar (255) not null,
Base_Price numeric(10,2)not null,
Selling_Price numeric(10,2) not null,
/*Check*/
constraint chk_base_price
Check (Base_Price > 0),
constraint chk_selling_price
Check(Selling_Price > 0),
/*Foreign Key*/
Foreign Key(Product_Type_ID) references orderprocess.product_type(Product_Type_ID)
);
/*Product_Category_Def*/
create table orderprocess.product_type(
Product_Type_ID int Primary key auto_increment,
Product_Category varchar(255) not null);

/*Orders Table*/

create table orderprocess.orders(
Order_ID int Primary key auto_increment,
Customer_ID int not null,
Address_ID int not null,
Order_Date date not null,
Total_Amount numeric(10,2) not null,

/*Foreign Key*/
constraint fk_order_customer_ID
Foreign key(Customer_ID) references orderprocess.customer(Customer_ID),
constraint fk_order_address_ID
Foreign key(Address_ID) references orderprocess.address(Address_ID)
);

/*Specific Details Regarding customer Order Relationship between Product and order */ 
create table orderprocess.order_detail(
Order_ID int,
Product_ID int,
Primary key (Product_ID, Order_ID),
Quantity int not null,
/*Foreign Key*/
constraint fk_orderdetail_product_ID2
Foreign key(Product_ID) references orderprocess.product(Product_ID),
constraint fk_orderdetail_order_ID
Foreign key(Order_ID) references orderprocess.orders(Order_ID)
);





