CREATE DATABASE QIANsDb;
GO

USE QIANsDb;
GO

-- Team Member: Juncheng Qian 
CREATE TABLE Customers(
  CustomerID varchar(50) NOT NULL PRIMARY KEY,
  FirstName varchar(50) NOT NULL,
  LastName varchar(50) NOT NULL,
  Email varchar(50) NOT NULL,
  PhoneNumber varchar(50) NOT NULL,
  ShippingAddress varchar(100) NOT NULL);

CREATE TABLE Orders(
  OrderID bigint NOT NULL PRIMARY KEY,
  CustomerID varchar(50) NOT NULL,
  OrderDate date NOT NULL,
  ShipDate date NOT NULL,
  TrackingID varchar(50) NOT NULL);



CREATE TABLE OrderDetails(
  OrderDetailsID varchar(50) NOT NULL PRIMARY KEY,
  OrderID bigint NOT NULL,
  ProductID varchar(50) NOT NULL,
  Quantity int NOT NULL);

 CREATE TABLE Designer(
  DesignerID varchar(50) NOT NULL PRIMARY KEY,
  DesignerName varchar(50) NOT NULL,
  DesignerDescription varchar(200) NOT NULL,
  Country Varchar(50) NOT NULL);

CREATE TABLE Product(
  ProductID varchar(50) NOT NULL PRIMARY KEY,
  DesignerID varchar(50) NOT NULL,
  ProductName varchar(50) NOT NULL,
  ProductDetail varchar(50) NOT NULL,
  Gender varchar(50) NOT NULL,
  Price BIGINT NOT NULL,
  Size varchar(50) NOT NULL);


-- Create the relationship
ALTER TABLE Orders ADD CONSTRAINT FK_Order_Customer
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID);
GO

ALTER TABLE OrderDetails ADD CONSTRAINT FK_OrderDetail_Order
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID);
GO

ALTER TABLE OrderDetails ADD CONSTRAINT FK_OrderDetail_Product
FOREIGN KEY (ProductID) REFERENCES Product(ProductID);
GO

ALTER TABLE Product ADD CONSTRAINT FK_Product_Design
FOREIGN KEY (DesignerID) REFERENCES Designer(DesignerID);
GO


-- Add customers
INSERT INTO Customers(CustomerID, FirstName, LastName, Email, PhoneNumber, ShippingAddress) VALUES 
('C00001', 'Nic', 'Fishman', 'nfishman@hotmail.com', '5105989876', '3026 Brannon Avenue Jacksonville Florida 32202'),
('C00002', 'Meredith', 'Spear', 'mspear@yahoo.com', '9563266949', '3051 Jerome Avenue Laredo Texas 78040'),
('C00003', 'George', 'Rivera', 'GRivera@outlook.com', '9034488450', '4836 Florence Street Dallas Texas 75207'),
('C00004', 'Johanna', 'Hunter', 'JHunter@gmail.com', '2537984002', '2762 Dale Avenue Tacoma Washington 98402'),
('C00005', 'Samuel', 'Russell', 'SRussell@hotmail.com', '7704807792', '3889 Elk Creek Road Norcross Georgia 30093'),
('C00006', 'Lisa', 'Merrick', 'LMerrick@yahoo.com', '2544121204', '2101 Sussex Court Waco Texas 76705'),
('C00007', 'Jimmy', 'Moreno', 'JMoreno@gmail.com', '5623470338', '646 Reynolds Alley Paramount California 90723'),
('C00008', 'Belinda', 'Sierra', 'BSierra@gmail.com', '8284550419', '3567 Diamond Street Hickory North Carolina 28601'),
('C00009', 'Ashley', 'Thorton', 'AThorton@gmail.com', '2173456176', '1538 Bolman Court HARRISON Idaho 83833'),
('C00010', 'Ted', 'Byars', 'TByars@hotmail.com', '7148208164', '4694 Sunny Day Drive Los Angeles California 90017'),
('C00011', 'Ben', 'Bard', 'BBard@hotmail.com', '7144325425', '4325 Sunny Day Drive Los Angeles California 90017');
GO
-- Add a few designer
INSERT INTO Designer(DesignerID,DesignerName,DesignerDescription,Country) VALUES
('D1', 'Acne Studio',' A creative collective and lifestyle brand that started off in Stockholm in 1996','Sweden'),
('D2', 'Adieu','Eclectic shoe line Adieu is the shared vision of Benjamin Caron and Isabelle Guédon, a cordwainer and textile designer','France'),
('D3', 'Balmain','Pierre Balmain opened his quintessentially Parisian couture house in 1945, creating an aesthetic that became synonymous with easy sophistication and simple elegance','France'),
('D4', 'Christian Peau','Founded in Kobe in 2002, Japanese design house Christian Peau produces handcrafted leather goods distinguished by their exceptional treatment and finish','Japan'),
('D5', 'Dior Homme','The clean, classic lines and simple silhouettes of Dior Homme Eyewear, designed by Kris Van Assche, are as modern and timeless as the fashion house itself','France'),
('D6', 'Etudes','Artists Aurélien Arbet and Jérémie Egry founded the collective in Paris in 2012','France'),
('D7', 'Giuliano Fujiwara','Helmed since 2013 by Canadian-Italian designer Antonio Azzuolo, the Giuliano Fujiwara line was established in Milan in 1986 by designer Yoshiaki Fujiwara','Italy'),
('D8', 'Helmut Lang','Austrian designer Helmut Langs namesake label, launched in 1986, came to define the stripped-down, post-grunge luxury of the 90s','Austria'),
('D9', 'Lanvin','The oldest fashion house still in operation, Lanvin was founded in 1889 by 22-year-old Parisian milliner Jeanne Lanvin','France'),
('D10', 'Raf Simons','Belgian designer Raf Simons launched his namesake men’s collection in 1995, after switching from an industrial design course to fashion at Antwerp’s Royal Academy','Belgium');
GO
-- Add a few Products
INSERT INTO Product(ProductID,DesignerID,ProductName,ProductDetail,Gender,Price,Size) VALUES
('P1','D1','Jeans','Slim-fit','Male',230,'L'),
('P2','D3','Jeans','Slim-fit','Male',970,'M'),
('P3','D5','Shirts','Slim-fit','Male',340,'S'),
('P4','D7','Sweaters','Slim-fit','Male',432,'L'),
('P5','D9','Shoes','High-Top','Male',653,'38'),
('P6','D10','Shoes','High-Top','Male',326,'40'),
('P7','D2','Jeans','Slim-fit','Male',143,'XL'),
('P8','D4','Shoes','High-Top','Male',543,'42'),
('P9','D6','Sweaters','Regular-fit','Male',654,'M'),
('P10','D8','Sweaters','Slim-fit','Male',345,'L'),
('P11','D10','Shoes','Low-Top','Male',755,'36'),
('P12','D3','Jeans','Slim-fit','Male',1230,'L'),
('P13','D3','Jeans','Regular-fit','Male',1230,'M'),
('P14','D1','Coats','Regular-fit','Male',2230,'M'),
('P15','D1','Jeans','Regular-fit','Male',230,'S'),
('P16','D1','Sweaters','Slim-fit','Male',599,'M'),
('P17','D8','Shirts','Slim-fit','Male',299,'M'),
('P18','D4','Shoes','Low-Top','Male',460,'44');
GO

-- Add a few orders
INSERT INTO Orders(OrderID,CustomerID, OrderDate, ShipDate,TrackingID) VALUES 
(6009001,'C00001','29-JUN-2016', '02-FEB-2016','XYZ001'),
(6009002,'C00002', '01-FEB-2016', '03-FEB-2016','XYZ002'),
(6009003,'C00002', '01-FEB-2016', '03-FEB-2016','XYZ003'),
(6009004,'C00003', '02-FEB-2016', '04-FEB-2016','XYZ004' ),
(6009005,'C00004', '04-FEB-2016', '05-FEB-2016','XYZ005' ),
(6009006,'C00005', '05-FEB-2016', '06-FEB-2016','XYZ006' ),
(6009007,'C00006', '06-FEB-2016', '08-FEB-2016','XYZ007' ),
(6009008,'C00007', '07-FEB-2016', '09-FEB-2016','XYZ008' ),
(6009009,'C00008', '11-FEB-2016', '12-FEB-2016','XYZ009' ),
(6009010,'C00009', '13-FEB-2016', '15-FEB-2016','XYZ010' ),
(6009011,'C00010', '15-FEB-2016', '16-FEB-2016','XYZ011' ),
(6009012,'C00001', '16-FEB-2016', '18-FEB-2016','XYZ012' ),
(6009013,'C00002', '16-FEB-2016', '19-FEB-2016','XYZ013' ),
(6009014,'C00003', '18-FEB-2016', '23-FEB-2016','XYZ014' ),
(6009015,'C00004', '20-FEB-2016', '24-FEB-2016','XYZ015' ),
(6009016,'C00005', '21-FEB-2016', '24-FEB-2016','XYZ016' ),
(6009017,'C00006', '22-FEB-2016', '24-FEB-2016','XYZ017' ),
(6009018,'C00001', '25-FEB-2016', '26-FEB-2016','XYZ018' ),
(6009019,'C00002', '25-FEB-2016', '26-FEB-2016','XYZ019' ),
(6009020,'C00003', '26-FEB-2016', '27-FEB-2016','XYZ020' ),
(6009021,'C00004', '27-FEB-2016', '28-FEB-2016','XYZ012' );
GO

INSERT INTO OrderDetails(OrderDetailsID, OrderID, ProductID, Quantity) VALUES 
('O1',6009001,'P15',1),
('O2',6009002,'P11',1),
('O3',6009003,'P13',1),
('O4',6009004,'P1',1),
('O5',6009005,'P2',1),
('O6',6009006,'P9',1),
('O7',6009007,'P8',1),
('O8',6009008,'P7',1),
('O9',6009009,'P10',1),
('O10',6009010,'P3',1),
('O11',6009011,'P4',1),
('O12',6009012,'P5',1),
('O13',6009013,'P6',1),
('O14',6009014,'P7',1),
('O15',6009015,'P8',1),
('O16',6009016,'P9',1),
('O17',6009017,'P10',1),
('O18',6009018,'P11',1),
('O19',6009019,'P12',1),
('O20',6009020,'P13',1),
('O21',6009021,'P14',1);
GO
