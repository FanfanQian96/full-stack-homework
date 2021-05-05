--1
select ProductID, Name, Color, ListPrice 
from Production.Product
--2
select ProductID, Name, Color, ListPrice 
from Production.Product
where ListPrice=0
--3
select ProductID, Name, Color, ListPrice 
from Production.Product
where Color is NULL
--4
select ProductID, Name, Color, ListPrice 
from Production.Product
where Color is not NULL
--5
select ProductID, Name, Color, ListPrice 
from Production.Product
where Color is not NULL and ListPrice >0
--6
select CONCAT(Name,',',Color) as 'Name and Color'
from Production.Product
where Color is not NULL
--7
select 'Name:'+Production.Product.Name+'--COLOR:'+Color as ' Name and Color'
from Production.Product
where Name like'%Crankarm%' or Name like'%Chainring%'
Order by ProductID
--8
select ProductId, Name
from Production.Product
where ProductID between '400' and '500'
--9
select ProductID, Name, Color
from Production.Product
where Color ='black'or Color='blue'
--10
select ProductID, Name,Color
from Production.Product
where Name like's%'
--11
select Name, ListPrice
from Production.Product
where Name like's%'
order by Name
--12
select Name, ListPrice
from Production.Product
where Name like'A%' or Name like 'S%'
order by Name
--13
select [Name], ListPrice
from Production.Product
where [Name] like 'spo[^k]%'
order by [Name]
--14
select Distinct Color
from Production.Product
order by Color
--15
select Distinct ProductSubcategoryID, Color
from Production.Product
where ProductSubcategoryID is not NULL and Color is not Null
--16
select ProductSubCategoryID, LEFT([Name],35)as[Name], Color, ListPrice
from Production.Product
WHERE Color IN ('Red','Black')  AND ProductSubCategoryID = 1 OR ListPrice BETWEEN 1000 AND 2000    
ORDER BY ProductID
--17
select ProductSubCategoryID, LEFT([Name],35)as[Name], Color, ListPrice
from Production.Product
WHERE Color IN ('Red','Black')  AND ProductSubCategoryID = 1 OR ListPrice BETWEEN 1000 AND 2000    
ORDER BY ProductID


