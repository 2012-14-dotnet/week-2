use week2dmldb;
go

--SELECT
select 'hello sql';
-- stdout functionality
select 1+1;

select *
-- horizontal filtering, column filter
from SalesLT.Customer;

select firstname, lastname
from SalesLT.Customer;

select firstname, lastname
from SalesLT.Customer
where firstname = 'john' or lastname = 'john';

select firstname, lastname
from SalesLT.Customer
where firstname >= 'john' and firstname < 'joho';

select firstname, lastname
from SalesLT.Customer
where firstname like 'john%';
-- any following characters, 0 or more

select firstname, lastname
from SalesLT.Customer
where firstname like '%john%';
-- think of negation

select firstname, lastname
from SalesLT.Customer
where firstname not like '%john%';
-- % = 0 or more, _ = exactly 1, [] = within range

select firstname, lastname
from SalesLT.Customer
where firstname like '%a%' and FirstName like '%b%' and FirstName like '%c%';

select firstname, lastname
from SalesLT.Customer
where firstname like '%[abc]%';

-- how many firstname Jacob we have as customers?
select firstname
from SalesLT.Customer
where firstname = 'jacob';

-- how many Jacob Dean we have as customers?
select count(*) as [number of jacob]
from SalesLT.Customer
where firstname = 'jacob' and lastname = 'dean';

-- i want all the fn John and if same last name, use as 1 record
select count(*) as [number], FirstName, LastName
from SalesLT.Customer
where firstname = 'john'
group by firstname, LastName;

select count(*) as [number], FirstName, LastName
from SalesLT.Customer
where firstname = 'john'
group by firstname, LastName
having count(FirstName) = 2;

select count(*) as [number], customerid, FirstName, LastName
from SalesLT.Customer
where firstname = 'john'
group by customerid, firstname, LastName
having count(FirstName) = 1
order by customerid asc, LastName desc;

--Execution Flow
--FROM
--WHERE
--GROUP BY
--HAVING
--SELECT
--ORDER BY
