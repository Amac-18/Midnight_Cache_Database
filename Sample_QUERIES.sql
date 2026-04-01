
/* =========================
   SAMPLE QUERIES
   ========================= */


/* 1. Full Order Details */
SELECT 
    o.Order_ID,
    o.Order_Date,
    c.F_Name,
    c.L_Name,
    a.City,
    p.Product_Name,
    od.Quantity,
    p.Selling_Price,
    (od.Quantity * p.Selling_Price) AS Total
FROM orderprocess.Orders o
JOIN orderprocess.Customer c ON o.Customer_ID = c.Customer_ID
JOIN orderprocess.Address a ON o.Address_ID = a.Address_ID
JOIN orderprocess.Order_Detail od ON o.Order_ID = od.Order_ID
JOIN orderprocess.Product p ON od.Product_ID = p.Product_ID;


/* 2. Total Spent Per Customer */
SELECT 
    c.Customer_ID,
    c.F_Name,
    c.L_Name,
    SUM(od.Quantity * p.Selling_Price) AS Total_Spent
FROM orderprocess.Customer c
JOIN orderprocess.Orders o ON c.Customer_ID = o.Customer_ID
JOIN orderprocess.Order_Detail od ON o.Order_ID = od.Order_ID
JOIN orderprocess.Product p ON od.Product_ID = p.Product_ID
GROUP BY c.Customer_ID, c.F_Name, c.L_Name;


/* 3. Most Sold Product */
SELECT 
    p.Product_Name,
    SUM(od.Quantity) AS Total_Sold
FROM orderprocess.Product p
JOIN orderprocess.Order_Detail od ON p.Product_ID = od.Product_ID
GROUP BY p.Product_Name
ORDER BY Total_Sold DESC
LIMIT 1;


/* 4. Customers with Number of Orders */
SELECT 
    c.Customer_ID,
    c.F_Name,
    c.L_Name,
    COUNT(o.Order_ID) AS Total_Orders
FROM orderprocess.Customer c
LEFT JOIN orderprocess.Orders o 
    ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_ID, c.F_Name, c.L_Name;


/* 5. Products Never Ordered */
SELECT p.Product_Name
FROM orderprocess.Product p
LEFT JOIN orderprocess.Order_Detail od 
    ON p.Product_ID = od.Product_ID
WHERE od.Product_ID IS NULL;


/* 6. Suppliers and Product Count */
SELECT 
    s.Supplier_Name,
    COUNT(sp.Product_ID) AS Product_Count
FROM orderprocess.Supplier s
LEFT JOIN orderprocess.Supplier_Product sp 
    ON s.Supplier_ID = sp.Supplier_ID
GROUP BY s.Supplier_Name;


/* 7. Orders in 2026 */
SELECT *
FROM orderprocess.Orders
WHERE YEAR(Order_Date) = 2026;
