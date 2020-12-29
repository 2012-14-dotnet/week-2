use week2dmldb;
go

--JOIN
select slc.FirstName, slc.LastName, sla.AddressLine1, sla.City
from SalesLT.Address as sla
  inner join SalesLT.CustomerAddress as slca on slca.AddressID = sla.AddressID
  left join SalesLT.Customer as slc on slc.CustomerID = slca.CustomerID;

select slc.FirstName, slc.LastName, slsoh.OrderDate, sum(slsoh.TotalDue) as [Total Due]
from SalesLT.Customer as slc
  right join SalesLT.SalesOrderHeader as slsoh on slsoh.CustomerID = slc.CustomerID
  inner join SalesLT.SalesOrderDetail as slsod on slsod.SalesOrderID = slsoh.SalesOrderID
group by slc.FirstName, slc.LastName, slsoh.OrderDate;

select slc.FirstName, slc.MiddleName, slc.LastName, slsoh.OrderDate, sum(slsoh.TotalDue) as [Total Purchase]
from SalesLT.Customer as slc
  right join SalesLT.SalesOrderHeader as slsoh on slsoh.CustomerID = slc.CustomerID
  inner join SalesLT.SalesOrderDetail as slsod on slsod.SalesOrderID = slsoh.SalesOrderID
where slc.MiddleName is null and slsoh.TotalDue > 1000
group by slc.FirstName, slc.MiddleName, slc.LastName, slsoh.OrderDate
having sum(slsoh.TotalDue) > 10000;

--SUBQUERY
select slc.FirstName, slc.MiddleName, slc.LastName, slsoh.OrderDate, sum(slsoh.TotalDue) as [Total Purchase]
from SalesLT.Customer as slc
  right join
  (
    select CustomerId, OrderDate, TotalDue, SalesOrderID
  from SalesLT.SalesOrderHeader
  where TotalDue > 1000
) as slsoh on slsoh.CustomerID = slc.CustomerID
  inner join SalesLT.SalesOrderDetail as slsod on slsod.SalesOrderID = slsoh.SalesOrderID
where slc.MiddleName is null
group by slc.FirstName, slc.MiddleName, slc.LastName, slsoh.OrderDate
having sum(slsoh.TotalDue) > 10000;

--filter customer first

--CTE = common table expression
;with
  orders
  as
  (
    select CustomerId, OrderDate, TotalDue, SalesOrderID
    from SalesLT.SalesOrderHeader
    where TotalDue > 1000
  ),
  customers
  as
  (
    select FirstName, MiddleName, LastName, CustomerID
    from SalesLT.Customer
    where MiddleName is null
  )
select customers.FirstName, customers.MiddleName, customers.LastName, orders.OrderDate, sum(orders.TotalDue) as [Total Purchase]
from customers
  inner join orders on orders.CustomerID = customers.CustomerID
  inner join SalesLT.SalesOrderDetail as slsod on slsod.SalesOrderID = orders.SalesOrderID
group by customers.FirstName, customers.MiddleName, customers.LastName, orders.OrderDate
having sum(orders.TotalDue) > 10000;

--UNION
  select firstname
  from SalesLT.Customer
intersect
  select lastname
  from SalesLT.Customer

  select firstname
  from SalesLT.Customer
except
  select lastname
  from SalesLT.Customer

  select firstname
  from SalesLT.Customer
union
  select firstname
  from SalesLT.Customer

  select firstname
  from SalesLT.Customer
union all
  select name
  from SalesLT.Product
