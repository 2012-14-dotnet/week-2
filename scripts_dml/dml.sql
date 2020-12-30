use week2dmldb;
go

--INSERT
insert into SalesLT.Address
  (AddressLine1, AddressLine2, City, StateProvince, CountryRegion, PostalCode, rowguid, ModifiedDate)
values
  ('1 Reunion Center', null, 'Dallas', 'Texas', 'United States', 75200, '268af621-76d7-4c78-9441-144fd139821b', '2020-12-30')
,
  ('2 Reunion Center', null, 'Dallas', 'Texas', 'United States', 75200, '268af621-76d7-4c78-9441-144fd139821c', '2020-12-30')
,
  ('3 Reunion Center', null, 'Dallas', 'Texas', 'United States', 75200, '268af621-76d7-4c78-9441-144fd139821d', '2020-12-30');

--UPDATE
update SalesLT.Address
set PostalCode = 75201
where ModifiedDate = '2020-12-30';

update SalesLT.Address
set ModifiedDate = '2020-12-30 10:13:30'
where ModifiedDate = '2020-12-30';

select *
from SalesLT.Address
where ModifiedDate >= '2020-12-30' and ModifiedDate < '2020-12-31';
select *
from SalesLT.Address
where ModifiedDate between '2020-12-30' and '2020-12-31';
select *
from SalesLT.Address
where day(ModifiedDate) = 30 and month(ModifiedDate) = 12 and year(ModifiedDate) = 2020;
select *
from SalesLT.Address
where DATEPART(day, ModifiedDate) = 30;

--DELETE
delete SalesLT.Address
where DATEPART(day, ModifiedDate) = 30;

--remove any address not associated with a customer
delete a
from SalesLT.Address as a
  left join SalesLT.CustomerAddress as ca on ca.AddressID = a.AddressID
where ca.CustomerID is null;

select c.FirstName as first, p.Name as last
from SalesLT.Customer as c
cross join SalesLT.Product as p;
