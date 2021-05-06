--14
select distinct a.ProductName
from Products as a inner join [Order Details] as b
on a.ProductID=b.ProductID
inner join Orders as c 
on c.OrderID=b.OrderID
where c.OrderDate between '1995-10-21' and '2020-10-21'
--15
select top 5 ShipPostalCode
from Orders
group by ShipPostalCode
order by count(ShipPostalCode) DESC
--16
select top 5 ShipPostalCode
from Orders
where OrderDate between '1995-10-21' and '2020-10-21'
group by ShipPostalCode
order by count(ShipPostalCode) DESC
--17
select City, count(ContactName)as Number
from Customers
Group by City
--18
select City,Count(ContactName)as Number
from Customers
group by City
Having count(ContactName)>10
--19
select distinct a.ContactName 
from Customers as a inner join Orders as b
on a.CustomerID=b.CustomerID
where OrderDate between '1998-01-01' and '2020-10-21'
--20

--21
select a.ContactName, count(a.ContactName)
from Customers as a inner join Orders as b
on a.CustomerID=b.CustomerID
group by a.ContactName
order by count(a.ContactName) DESC
--22
select a.ContactName, count(a.ContactName)
from Customers as a inner join Orders as b
on a.CustomerID=b.CustomerID
inner join [Order Details] c
on c.OrderID=b.OrderID
group by a.ContactName
having sum(c.Quantity)>100
order by sum(c.Quantity) DESC
--23
SELECT a.CompanyName,b.CompanyName 
from Suppliers as a cross join Shippers as b
--24
select distinct a.OrderDate, b.ProductName
from Products b inner join [Order Details] c
on b.ProductID=c.ProductID
inner join Orders as a
on a.OrderID =c.OrderID
--25
select *
from Employees as a inner join Employees as b
on a.Title=b.Title
--26
select a.EmployeeID,a.LastName,a.FirstName,a.Title
from Employees as a inner join Employees as b
on a.EmployeeID=b.ReportsTo
where a.Title like'%manager%'
group by a.EmployeeID,a.LastName,a.FirstName,a.Title
having count(b.ReportsTo)>2
--27
select city, ContactName,'Customer' as Type
from Customers 
union 
select city, ContactName,'Supplier' as Type
from Suppliers
--28
select *
from F1 inner join F2
on F1.T1=F2.T2
--29
select *
from F1 LEFT JOIN F2 ON F1.T1=F2.T2
