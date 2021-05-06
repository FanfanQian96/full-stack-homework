--1
select count(*) 
from Production.Product
--2
select count(*)
from Production.Product
where ProductSubcategoryID is not NULL
--3
select ProductSubcategoryID, count(ProductSubcategoryID) as CountedProducts
from Production.Product
group by ProductSubcategoryID
--4
select count(*)
from Production.Product
where ProductSubcategoryID is NULL
--5
SELECT *
from Production.ProductInventory
--6
select ProductID, sum(Quantity) as TheSum
from Production.ProductInventory
where LocationID=40
group by ProductID
having sum(Quantity) <100
--7
select Shelf, ProductID , sum(Quantity)as TheSum
from Production.ProductInventory
where LocationID=40
GROUP BY ProductID,Shelf
HAVING SUM(Quantity)<100
--8
SELECT AVG(Quantity) as TheAvg
from Production.ProductInventory
where LocationID=10
--9
Select ProductID, Shelf,AVG(Quantity)as TheAvg
from Production.ProductInventory
group by shelf,ProductID
--10
select ProductID,Shelf,AVG(Quantity) as TheAvg
from Production.ProductInventory
where Shelf<>'N/A'
group by Shelf, ProductID
--11
select Color, Class, Count(*) As TheCount, AVG(ListPrice) as AvgPrice
from Production.Product
where Class is NOT NULL AND Color is NOT NULL
group by GROUPING SETS((Color),(Class))
--12
Select distinct b.Name as Country, a.Name as Province
from Person.StateProvince as a
inner join Person.CountryRegion as b
on a.CountryRegionCode=b.CountryRegionCode
--13
Select distinct b.Name as Country, a.Name as Province
from Person.StateProvince as a
inner join Person.CountryRegion as b
on a.CountryRegionCode=b.CountryRegionCode
where b.Name='Germany' or b.Name='Canada'


