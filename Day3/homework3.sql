--1
select distinct City
from Customers
where city in
(select city from Employees)
--2
select City
from Customers
where city not in 
(Select City from Employees)
--3
select a.CustomerID, SUM(c.Quantity) as QTY
From Customers a Left JOIN Orders b
On a.CustomerID=b.CustomerID
LEFT JOIN [Order Details] c
ON b.OrderID=c.OrderID
Group by a.CustomerID
--4
select a.City, SUM(c.Quantity) QTY
From Customers a left join Orders b
on a.CustomerID=b.CustomerID
left join [Order Details] c
on b.OrderID=c.OrderID
Group by a.City
Order by a.City
--5
select a.City from Customers a
Group by a.City
Having Count(a.City)>2

select distinct a.City 
from Customers a
where a.City in 
(select b.City
from Customers b
group by b.City 
having Count(b.City)>=2)
--6
select distinct a.City
from Customers a inner join Orders b
on a.CustomerID =b.CustomerID
inner join [Order Details]c
on c.OrderID=b.OrderID
group by a.City, c.ProductID
having count(c.ProductID)>2
--7
select * from Customers
where Customers.City not in
(select ShipCity from Orders inner join Customers on Orders.ShipCity=Customers.City)
--8
WITH Order_cte
as(
SELECT oc.ShipCity,oc.ProductID, oc.average,DENSE_RANK() over (partition by                        
oc.ProductID order by oc.number) rnk FROM (                        
SELECT TOP(5) od.ProductID,o.ShipCity, SUM(Quantity) number,AVG(od.UnitPrice)                        
average FROM dbo.Orders o left join dbo.[Order Details] od on o.OrderID=od.OrderID                        
GROUP BY o.ShipCity, od.ProductID
ORDER BY number DESC 
 )oc
 )
 select * from Order_cte
 --9
 select a.City from Employees a
 where a.City not in
 (select b.City 
 from Customers b inner join Orders c
 on b.CustomerID=c.CustomerID)

 select distinct a.City
 from Employees a
 left join Customers b
 on a.City=b.City
 where b.City is not Null
 --10
select * from                    
(select Top 1 e.City, count(o.OrderID) countOrder 
from Employees e inner join Orders o                    
on e.EmployeeID = o.EmployeeID                        
group by e.City)a                        
inner join (                    
select Top 1 c.City, count(r.Quantity) countQuantity 
from [Order Details] r inner join                    
Orders d on r.OrderID = d.OrderID                        
inner join Customers c on c.CustomerID = d.CustomerID 
group by c.City)b                                        
on a.City = b.City 
--11
--Find duplicate rows by using GROUP BY Clause and use delete to remove these duplicate rows
--12
SELECT deptname,empid,salary                     
FROM(                    
SELECT a.deptname, b.empid, b.salary, rank() OVER 
( PARTITION BY b.deptid 
ORDER BY b.salary DESC ) rnk                    
FROM dept a, employee b                    
WHERE a.deptid = b.deptid                    
WHERE rnk <= 3                    
ORDER BY deptname,rnk
--13
select * from 
((select * from deptid, count(*) as departNumber
from Employee
group by deptid
order by departNumber
limit 1) a
inner join 
(select Dept.deptid, deptname,count(*) as employeeNumber
from Dept inner join Employee 
on Employee.deptid=Dept.deptid
groupp by deptid,deptname)b)
--14
SELECT deptname,empid,salary                    
FROM (                    
SELECT d.deptname, e.empid, e.salary, rank() OVER 
( PARTITION BY e.deptid 
ORDER BY e.salary DESC ) AS rnk                   
FROM dept d inner join employee e                                     
on d.deptid = e.deptid                                    
WHERE rnk <= 3                        
ORDER BY deptname,rnk 


