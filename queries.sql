-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT ProductName, CategoryName
FROM Product
JOIN Category on Product.CategoryId = Category.Id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT o.Id, Shipper.CompanyName
FROM [Order] as o 
JOIN Shipper on o.ShipVia = Shipper.Id
WHERE o.OrderDate < date("2012-08-09");

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT Product.ProductName, OrderDetail.Quantity
FROM OrderDetail
JOIN Product on OrderDetail.ProductId = Product.Id
WHERE OrderDetail.OrderId = 10251
ORDER BY ProductName;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT o.Id as orderID, Customer.CompanyName as 'Customer Company Name', Employee.LastName as 'Employee Last Name'
FROM [Order] as o
JOIN Customer on o.CustomerId = Customer.Id
JOIN Employee on o.EmployeeId = Employee.Id;