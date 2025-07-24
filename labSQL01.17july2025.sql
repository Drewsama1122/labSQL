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
where CategoryID in(1,2,4,8) and (UnitPrice between 50 and 100)

-- 3.ต้องการประเทศ เมือง ชื่อบริษัทลูกค้า ชื่อผู้ติดต่อ เบอร์โทร ของลูกค้าทั้งหมด
select Country, city, CompanyName, ContactName,Phone  
from Customers
order by 1,2,3

-- 4.ข้อมูลของสินค้ารหัสประเภทที่ 1 ราคาไม่เกิน 50 หรือสินค้ารหัสประเภทที่ 8 ราคาไม่เกิน 75
select * from Products
where (CategoryID = '1' and UnitPrice <=50) or (CategoryID = '8' and UnitPrice <=75)
order by CategoryID
--5. ชื่อบริษัทลูกค้า ที่อยู่ใน ประเทศ USA ที่ไม่มีหมายเลข FAX  เรียงตามลำดับชื่อบริษัท 
select CompanyName from Customers
where Country = 'USA' and FAX is NULL
order by CompanyName

--6. ต้องการรหัสลูกค้า ชื่อบริษัท และชื่อผู้ติดต่อ เฉพาะ ชื่อบิรษัทที่มีคำว่า "con" 
select CustomerID, CompanyName, ContactName from Customers
where CompanyName like '%con%'

-- **ตัวอย่าง Query แบบ "คอลัมน์คำนวณชั่วคราว"
select ProductID, ProductName, UnitPrice, UnitsinStock 
    ,Unitprice * UnitsinStock AS StockValue
from Products

--** ตัวอย่าง Query แบบ "คอลัมน์คำนวณชั่วคราว"
select ProductID as รหัส, ProductName as สินค้า 
    ,UnitsinStock + UnitsOnOrder as จำนวนคงเหลือทั้งหมด
    ,ReorderLevel as จุดสั่งซื้อ
from Products
where(UnitsInStock + UnitsOnOrder) < ReorderLevel

--**ตัวอย่าง Query แบบ "คอลัมน์คำนวณชั่วคราว" **ภาษีมูลค่าเพิ่ม 7 %
select ProductID,ProductName,
    UnitPrice,ROUND(UnitPrice * 0.07,2) as Vat7
from Products

--**ตัวอย่าง Query แบบ "คอลัมน์คำนวณชั่วคราว" **ชื่อนามสกุลพนักงาน
select EmployeeID
    ,TitleOfCourtesy + FirstName + space(1) + LastName as [Employee Name]
from Employees

-- ต้องการคำนวนรายการขายสินค้าในรายการขายที่ 10250 ใช้ตาราง [Order Details]
select orderID , ProductID, UnitPrice,Quantity,Discount,

    round(UnitPrice * Quantity * (1- Discount),2) as NetPrice
    
from [Order Details]
where orderID = 10250

-- (Aggregate Function)
-- คำสั่ง Count ** แสดงข้อมูลจำนวนสินค้าที่มีเก็บไว้ต่ำกว่า 15 ชิ้น
select count(*) as จำนวนสินค้า
from Products
where UnitsInStock < 15

--**ต้องการจำนวนพนักงาน

select count(*) as จำนวนพนักงาน
from Employees
--**ต้องการทราบจำนวนลูกค้าที่อยู่ในประเทศ Brazil

select count(*) as จำนวนลูกค้าจากBrazil
from Customers 
where Country = 'Brazil'
--**ต้องการทราบจำนวนรายการสินค้าในใบสั่งซื้อหมายเลข 10250 

select count(*) from[Order Details] where OrderID = 10250 

--**ต้องการทราบจำนวนใบสั่งซื้อที่ถูกส่งไปประเทศ Japan

select count(*) from Orders where ShipCountry = 'USA'

--**คำสั่ง MAX,MIN,SUM,AVG **แสดงข้อมูลราคาสูงที่สุด, ราคาต่ำสุด, ราคาเฉลี่ยของสินค้าทุกชิ้น และจำนวนสินค้าทั้งหมด

select min(UnitPrice) as ราคาต่ำสุด,max(UnitPrice) as ราคาสุงสุด,
       AVG(UnitPrice) as ราคาเฉลี่ย
from Products

--**ต้องการราคาเฉลี่ย ราคาสูงที่สุด และราคาต่ำสุด ของสินค้ารหัส 5 ที่ขายได้ [order details]

select AVG(UnitPrice),max(UnitPrice),min(UnitPrice)
from [Order Details]
where ProductID = 5

select *
from [Order Details]
where ProductID = 5

--**การจัดกลุ่มข้อมูล โดยใช้ GROUP BY ** แสดงชื่อประเทศ และจำนวนลูกค้าที่อยู่ในแต่ละประเทศ จากตารางลูกค้า

SELECT Country , COUNT(*) as จำนวนลูกค้า
FROM Customers
GROUP BY Country
having count(*) <5
order by [จำนวนลูกค้า] desc

--**แสดงชื่อประเทศ เมือง และจำนวนลูกค้าที่อยู่ในแต่ละประเทศ จากตารางลูกค้า

SELECT Country, City, COUNT(*) as จำนวนลูกค้า
FROM Customers
GROUP BY Country, City
having count(*) > 1
--ถ้าต้องการให้เเสดงจำนวนลูกค้ามากไปน้อย ใช้ order by [จำนวนลูกค้า] desc

--**ต้องการข้อมูลจำนวนใบสั่งซื้อที่ส่งไปในเเต่ละประเทศ

select ShipCountry, count(*) as จำนวนใบสั่งซื้อ
from Orders
group by ShipCountry
having count(*) > 100
order by [จำนวนใบสั่งซื้อ] desc

--**ต้องการจำนวนใบสั่งซื้อที่ส่งไปในเเต่ล่ะประเทศเฉพาะในปี 1997
--**ในประเทศที่มีจำนวนน้อยกว่า 5 รายการ

select ShipCountry, count(*) as จำนวนใบสั่งซื้อ
from Orders
where YEAR(OrderDate) = 1997
group by ShipCountry
having count(*) <5 

--**ต้องการรหัสสินค้า จำนวนที่ขายได้ทั้งหมด

select ProductID, sum(Quantity) as จำนวนที่ขายได้,
      max(UnitPrice) as ราคาสูงสุด, min(UnitPrice) as ราคาต่ำสุด,
      AVG(UnitPrice) as ราคาเฉลี่ย
from [Order Details]
group by ProductID
-- ถ้าต้องการจำนวนที่ขายได้มากกว่า100 ใช้ having  sum(Quantity) > 1000
order by ProductID

--**ต้องการรหัสใบสั่งซื้อ และยอดขายรวมในเเต่ละใบสั่งซื้อ

select orderID, sum(UnitPrice * Quantity * (1- Discount)) as TotalPrice
from [Order Details]
group by OrderID
