--Identifies all packages that haven't been shipped yet

CREATE VIEW Active_Packages AS
SELECT p.PID, p.Weight, p.Cost, p.Pack_Type, p.Promised_Year
FROM Package p
WHERE NOT EXISTS (
  SELECT 1
  FROM Ship s
  WHERE s.PID = p.PID
)

--Shows the 10 most recent shipments along with the customer name

CREATE VIEW Recent_Shipments AS
SELECT s.PID, s.COID, s.CID, s.Date_Shipped, c.Name AS Customer_Name
FROM Ship s
INNER JOIN Customer c ON s.CID = c.CID
ORDER BY s.Date_Shipped DESC
LIMIT 10

--Total costs incurred for each package per year

CREATE VIEW Package_History_Yearly AS
SELECT p.PID, h.History_Year, SUM(h.Cost) AS Total_Cost
FROM Package p
INNER JOIN History h ON p.PID = h.PID
GROUP BY p.PID, h.History_Year
ORDER BY p.PID, h.History_Year

--Displays each customer's total number of shipments and their most recent shipment date

CREATE VIEW Customer_Shipping_History AS
SELECT c.Name AS Customer_Name, COUNT(*) AS Total_Shipments, MAX(s.Date_Shipped) AS Last_Shipment
FROM Customer c
INNER JOIN Ship s ON c.CID = s.CID
GROUP BY c.Name
ORDER BY c.Name

--Distribution of packages shipped by each company, ranked by the total number of packages

CREATE VIEW Company_Package_Distribution AS
SELECT co.Comp_Name, COUNT(*) AS Total_Packages
FROM Company co
INNER JOIN Ship s ON co.COID = s.COID
GROUP BY co.Comp_Name
ORDER BY Total_Packages DESC
