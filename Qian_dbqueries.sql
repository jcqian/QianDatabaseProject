Use QIANsDb;
-- Juncheng Qian
-- select queries
SELECT CustomerID, FirstName,LastName,Email,PhoneNumber,ShippingAddress 
FROM Customers;
Select OrderID,CustomerID,OrderDate,ShipDate,TrackingID
From Orders;
SELECT OrderDetailsID,OrderID,ProductID,Quantity
From OrderDetails;
SELECT ProductID,ProductName,DesignerID,ProductDetail,Gender,Price,Size
From Product;
Select DesignerID, DesignerName,DesignerDescription,Country
From Designer;
GO

-- Aggregated function Average Price for each designer
select d.DesignerID,
d.DesignerName,
AVG(p.Price) as AveragePrice
from Product as p
join Designer as d
on p.DesignerID = d.DesignerID
group by d.DesignerName, d.DesignerID;

-- innerJoin
Select p.ProductID,
p.ProductName,
d.DesignerID,
d.DesignerName
From Product as p
inner join Designer as d
on p.DesignerID=d.DesignerID;



-- outerJoin because some customers has no order
Select c.FirstName, c.LastName, o.OrderID
From Customers as c
full outer join Orders as o
on c.CustomerID = o.CustomerID
order by c.LastName;

-- subquery i want to know what is the average price of the product from France
SELECT AVG(Price) as AverageProductPriceFromFrance FROM Product
WHERE DesignerID IN 
(SELECT DesignerID FROM Designer
where Country = 'France');