--1
begin tran
select * from Region with(holdlock)
select * from Employees with(holdlock)
select * from Territories with(holdlock)
select * from EmployeeTerritories with(holdlock)
insert into Region (RegionID,RegionDescription) values (5,'Middle Earth')
insert into Territories(TerritoryID,TerritoryDescription,RegionID)
values(99999,'Gondor', 5)
insert into Employees(LastName,FirstName,Region) values ('King','Aragorn',5)
insert into EmployeeTerritories(EmployeeID,TerritoryID) values (10,99999)
rollback

--2
begin tran
update Territories set TerritoryDescription='Arnor' where
TerritoryDescription='Gondor'
--3
begin tran
delete from Region where RegionDescription='Middle Earth'
rollback
begin tran
select * from Region with(holdlock)
select * from Employees with(holdlock)
select * from Territories with(holdlock)
commit tran
--4
create view  view_product_order_Qian as 
select a.ProductName, Count(b.Quantity) as QuantityCount 
from Products a inner join [Order Details]b
on a.ProductID=b.ProductID
group by a.ProductName
--5
create proc sp_product_order_quantity_Qian
(@ product_id int,
@ total_quantity float output)as
begin
select @product_id= p.ProductID
from Products p
join [Order Details] od
on p.ProductID=od.ProductID
where sum(od.quantity)= @total_quantity
group by p.ProductID
end
--6
alter proc temp
@id int,
@total int out
as
begin
	select @id=view_product_order_city_Qian.ProductID, @total=view_product_order_city_Qian.QuantityCount
	from view_product_order_city_Qian
	where view_product_order_city_Qian.ProdcutID=@id
	end

declare @id int,@total int
exec temp,@total out
print @total
--7
create proc sp_move_employees_Qian
@terroity_name char(50) = 'tory'
as
if exists(select e.EmployeeID,count(t.TerritoryDescription) c 
from Territories t
join employeeterritories et on t.TerritoryID=et.TerritoryID
join Employees e on et.EmployeeID=e.EmployeeID
where TerritoryDescription=@terroity_name and count(t.TerritoryDescription)>0 )
begin 
insert into Territories(TerritoryID,TerritoryDescription,RegionID) values
(98432,'Stevens Point',11)
insert into Region(RegionID,RegionDescription) values(11,'North')
end
go
--8
create trigger trg_ins_Qian on territories
for update as
if exists(select e.employeeid, count(t.TerritoryDescription)from Territories t
join employeeterritories et on t.TerritoryID=et.TerritoryID
join Employees e on et.EmployeeID=e.EmployeeID
where t.TerritoryDescription= 'stevens point'
group by e.EmployeeID
having count(t.TerritoryDescription)>100)
begin
update Territories set TerritoryDescription= 'Tory' where
TerritoryDescription='stevens point'
End
drop trigger trg_ins_Qian
--9
create table people_Qian (id int,name char(20),cityid int)create table city_Qian (cityid int,city char(20))
insert into people_Qian(id,name,cityid) values(1,'Aaron Rodgers',2)
insert into people_Qian(id,name,cityid) values(2,'Russell Wilson',1)
insert into people_Qian(id,name,cityid) values(3,'Jody Nelson',2)
insert into city_Qian(cityid,city) values(1,'Settle')
insert into city_Qian(cityid,city) values(2,'Green Bay')

create view Packers_tingting_Qian as
select * from people_Qian p join city_Qian c 
on p.cityid=c.cityid where c.city='Green bay'

begin tran
rollback
drop table people_Qian
drop table city_Qian
drop view Packers_tingting_Qian
--10
create proc sp_birthday_employees_Qian as
begin
select employeeid,LastName,FirstName,Title,
TitleOfCourtesy,BirthDate,HireDate,Photo into birthday_employees_Qian from
Employees
where month(BirthDate)=2
end
drop table birthday_employees_Qian
--11
create proc sp_Qian_1 as
select c.city, count(c.CustomerID) from Customers c
inner join (
select x.CustomerID, count(x.CustomerID) xx from (select distinct c.CustomerID,
p.ProductID from Products p
join [Order Details] od on p.ProductID=od.ProductID
join Orders o on od.OrderID=o.OrderID
join Customers c on o.CustomerID=c.CustomerID) x
group by x.CustomerID
having count(x.CustomerID)<2) s
on c.CustomerID= s.CustomerID
group by city
having count(c.CustomerID) >1
--12
declare @fullname varchar(20)
select @fullname = firstname + lastname+ middlename+'.' from people
print @fullname

select firstname +''+lastname+middlename+ '.' as fullname from table1

--15
declare @student varchar(20)
declare @marks int
set @student
set @marks= (select max(marks) from student where sex='F')
print @student
--16
declare @student varchar(20)
declare @marks int
set @student
set @marks= (select max(marks) from student order by sex)
print @student


