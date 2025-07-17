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

-- % ��ͤӷ����١�͹˹�� 㹵�����ҧ��� n and land �ҡ��� %land �������ҷء�ӷ��ŧ���´��� land --
select * from Employees where firstname like 'n%'
select * from Employees where firstname like '%n'

select * from customers where Country like '%land' 

-- ��ͧ��â������١��ҷ����ͺ���ѷ�ժ������ chi --
select * from customers where CompanyName like '%chi%'
select * from customers where CompanyName like '%nese%'

-- ��ͧ��â������١��ҷ����ͺ���ѷ ���ͪ��ͼ��Դ��� �յ���ѡ�� ny -- 
select * from customers 
where CompanyName like '%ny%' or ContactName like'%ny%'

-- ��ͧ��â����ž�ѡ�ҹ����ժ��ͻ�Сͺ ���µ���ѡ�� 5 ��� --
select * from Employees where firstname like'_____'

-- ��ͧ��â����ž�ѡ�ҹ ����դ���ѡ��㹪��ͷ���� A  --
select * from Employees where FirstName like '_a%t'

-- ��ͧ��â����ž�ѡ�ҹ������ѡ�ùӢ�鹵鹴��� A,R,S -- 
select * from Employees where FirstName like '[ars]%'

-- ��ͧ��â����ž�ѡ�ҹ������ѡ�ùӢ�鹵鹴��� A ���֧ M -- 
select * from Employees where FirstName like '[a-m]%'

-- ���¡��Ƿ����᷹����ѡ�÷��������� Wildcard ��Сͺ���� %,_,[],- --

-- ��èѴ���§������ (order by) Desc ��� �ҡ仹��� ��Ҥ�������觷������� Desc ��͹���� ASC ��� ������ҡ --
select ProductID,ProductName,UnitPrice 
from Products 
order by UnitPrice Desc

-- ��èѴ���§������ �� �� order by, ASC
select CompanyName,ContactName
from Customers
order by ContactName ASC

-- ��èѴ���§������ �� �� order by, ASC,DESC
select CategoryID,ProductName,UnitPrice
from Products
order by CategoryID ASC , UnitPrice DESC

