select * from Employees
select EmployeeID,FirstName,LastName from Employees

select * from Employees
where City = 'london' 

select EmployeeID,FirstName,LastName from Employees
where city = 'london'

select distinct city,Country 
from Customers

select * from Products
where UnitPrice <= 5

select * from Customers
where (city = 'london') or (city = 'vancouver')

select * from Customers
where not(Country = 'usa' or city = 'vancouver')

select * from Products
where (UnitPrice >= 50) and (UnitsinStock < 20)

select * from Products
where (UnitPrice between 50 and 100)

select * from Products
where (UnitPrice >= 0 and Unitprice <= 10)

select * from Customers
where country  = 'brazil'
      or country  = 'argentina'
      or country  = 'maxico'

select * from Customers
where country in ('brazil','argentina','mexico')

select * from Customers where fax is null

select * from customers where fax is not null

select * from customers where not fax is  null

-- % คือคำที่อยูก่อนหน้า ในตัวอย่างคือ n and land หากใส่ %land เเปลว่าเขาทุกคำที่ลงท้ายด้วย land --
select * from Employees where firstname like 'n%'
select * from Employees where firstname like '%n'

select * from customers where Country like '%land' 

-- ต้องการข้อมูลลูกค้าที่ชื่อบริษัทมีชื่อว่า chi --
select * from customers where CompanyName like '%chi%'
select * from customers where CompanyName like '%nese%'

-- ต้องการข้อมูลลูกค้าที่ชื่อบริษัท หรือชื่อผู้ติดต่อ มีตัวอักษร ny -- 
select * from customers 
where CompanyName like '%ny%' or ContactName like'%ny%'

-- ต้องการข้อมูลพนักงานที่มีชื่อประกอบ ด้วยตัวอักษร 5 ตัว --
select * from Employees where firstname like'_____'

-- ต้องการข้อมูลพนักงาน ที่มีคัวอักษรในชื่อที่เป็น A  --
select * from Employees where FirstName like '_a%t'

-- ต้องการข้อมูลพนักงานที่มีอักษรนำขึ้นต้นด้วย A,R,S -- 
select * from Employees where FirstName like '[ars]%'

-- ต้องการข้อมูลพนักงานที่มีอักษรนำขึ้นต้นด้วย A จนถึง M -- 
select * from Employees where FirstName like '[a-m]%'

-- เรียกตัวที่ใช้แทนตัวอักษรทั้งหลายว่า Wildcard ประกอบด้วย %,_,[],- --

-- การจัดเรียงข้อมูล (order by) Desc คือ มากไปน้อย ถ้าคลุมคำสั่งที่ไม่มี Desc ก่อนจะเป็น ASC คือ น้อยไปมาก --
select ProductID,ProductName,UnitPrice 
from Products 
order by UnitPrice Desc

-- การจัดเรียงข้อมูล โดย ใช้ order by, ASC
select CompanyName,ContactName
from Customers
order by ContactName ASC

-- การจัดเรียงข้อมูล โดย ใช้ order by, ASC,DESC
select CategoryID,ProductName,UnitPrice
from Products
order by CategoryID ASC , UnitPrice DESC

--//  24.7.2568  //
-- 1.ต้องการรหัสพนักงาน คำนำหน้า ชื่อ นามสกุล ของำนักงานที่อยู่ในเมือง london
select EmployeeID,FirstName,LastName from Employees
where city = 'london'

-- 2.ต้องการข้อมูลสินค้าที่มีรหัสประเภท 1,2,4,8 และมีราคา ช่วง 50-100$
select * from Products
where ProductID in(1,2,4,8) and (UnitPrice between 50 and 100)

-- 3.ต้องการประเทศ เมือง ชื่อบริษัทลูกค้า ชื่อผู้ติดต่อ เบอร์โทร ของลูกค้าทั้งหมด
select Country, city, CompanyName, ContactName,Phone  
from Customers

-- 4.ข้อมูลของสินค้ารหัสประเภทที่ 1 ราคาไม่เกิน 50 หรือสินค้ารหัสประเภทที่ 8 ราคาไม่เกิน 75
select * from Products
where (ProductID = '1' and UnitPrice <=50) or (ProductID = '8' and UnitPrice <=75)

--5. ชื่อบริษัทลูกค้า ที่อยู่ใน ประเทศ USA ที่ไม่มีหมายเลข FAX  เรียงตามลำดับชื่อบริษัท 
