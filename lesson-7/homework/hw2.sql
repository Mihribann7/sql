CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10,2)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50)
);



--1.
select CustomerName, OrderID, OrderDate
from Customers
left join Orders
on Customers.CustomerID = Orders.CustomerID



--2.
select CustomerName, OrderID, OrderDate
from Customers
left join Orders
on Customers.CustomerID = Orders.CustomerID
where Orders.CustomerID is null


--3
select Orders.OrderID, ProductName, Quantity
from Orders 
join OrderDetails on Orders.OrderID = OrderDetails.OrderID
join Products on OrderDetails.ProductID = Products.ProductID


--4
select Customers.CustomerName
from Customers
join Orders on Customers.CustomerID = Orders.CustomerID
group by Customers.CustomerID, Customers.CustomerName
having count(Orders.OrderID) > 2


--5
SELECT OrderID, ProductName, Price
FROM (
    SELECT 
        OrderDetails.OrderID,
        Products.ProductName,
        OrderDetails.Price,
        ROW_NUMBER() OVER (PARTITION BY OrderDetails.OrderID ORDER BY OrderDetails.Price DESC) AS rn
    FROM OrderDetails
    JOIN Products ON OrderDetails.ProductID = Products.ProductID
) AS expensive
WHERE rn = 1;


--6
select CustomerID, OrderDate, OrderID
from (
	select 
		Orders.CustomerID,
		Orders.OrderID,
		Orders.OrderDate,
		ROW_NUMBER() over (partition by Orders.CustomerID order by Orders.OrderDate desc) as rn
	from Orders
) as latest
where rn = 1


--7
select Customers.CustomerName
from Customers
join Orders on Customers.CustomerID = Orders.OrderID
join OrderDetails on Orders.OrderID = OrderDetails.OrderID
join Products on OrderDetails.ProductID = Products.ProductID
group by Customers.CustomerID, Customers.CustomerName
having SUM(CASE WHEN Products.Category = 'Electronics' THEN 1 ELSE 0 END) = COUNT(Products.ProductID);


--8
select Customers.CustomerName
from Customers
join Orders on Customers.CustomerID = Orders.OrderID
join OrderDetails on Orders.OrderID = OrderDetails.OrderID
join Products on OrderDetails.ProductID = Products.ProductID
group by Customers.CustomerID, Customers.CustomerName
having sum(case when Products.Category = 'Stationary' then 1 else 0 end) > 0


--9
select 
	Customers.CustomerID, 
	Customers.CustomerName,
	sum(OrderDetails.Price * OrderDetails.quantity) as TotalSpent
from Customers
join Orders on Customers.CustomerID = Orders.OrderID
join OrderDetails on Orders.OrderID = OrderDetails.OrderID
group by Customers.CustomerID, Customers.CustomerName





















