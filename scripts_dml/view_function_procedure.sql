use week2dmldb;
go

--VIEW
--read-only query, control access to sensistive data
create view vw_CustomerAddress
as
  select c.firstname, c.lastname, a.city
  from SalesLT.Customer as c
    inner join SalesLT.CustomerAddress as ca on ca.CustomerID = c.CustomerID
    inner join SalesLT.Address as a on a.AddressID = ca.AddressID;
go

alter view vw_CustomerAddress
with
  schemabinding
as
  select c.firstname, c.lastname, a.city
  from SalesLT.Customer as c
    inner join SalesLT.CustomerAddress as ca on ca.CustomerID = c.CustomerID
    inner join SalesLT.Address as a on a.AddressID = ca.AddressID;
go

--FUNCTION
create function fn_CustomerAddress(@name nvarchar(100))
returns table
as
    return
        select c.firstname, c.lastname, a.city
from SalesLT.Customer as c
  inner join SalesLT.CustomerAddress as ca on ca.CustomerID = c.CustomerID
  inner join SalesLT.Address as a on a.AddressID = ca.AddressID
where c.FirstName = @name;
go

select *
from vw_CustomerAddress
where firstname = 'john';
select *
from fn_CustomerAddress('john');
go

--FUNCTION
/*
public string CustomerName(string fn)
{
    return fn;
}
*/
create function fn_CustomerName(@fn nvarchar(100), @mn nvarchar(100), @ln nvarchar(100))
returns nvarchar(302)
as
begin
  declare @name nvarchar(302) = @fn + ' ' + @mn + ' ' + @ln;
  return @name;
end;
go

alter function fn_CustomerName(@fn nvarchar(100), @mn nvarchar(100), @ln nvarchar(100))
returns nvarchar(302)
as
begin
  -- declare @name nvarchar(302) = @fn + isnull(null, isnull(' ' + @mn, '')) + ' ' + @ln;
  -- return @name;
  declare @name nvarchar(302) = @fn + coalesce(null, ' ' + @mn, '') + ' ' + @ln;
  return @name;
end;
go

select dbo.fn_CustomerName(firstname, middlename, lastname) as fullname
from SalesLT.Customer;
go

--STORED PROCEDURE
create procedure sp_AddCustomerAddress(@cust int,
  @street nvarchar(100),
  @city nvarchar(100))
as
begin
  begin transaction
  --check customer
  declare @cid int;
  select @cid = CustomerID
  from SalesLT.Customer
  where CustomerID = @cust;

  if (@cid is not null)
    begin
    --check address
    begin try
            declare @aid int;
            select @aid = addressid
    from SalesLT.Address
    where AddressLine1 = @street and City = @city; --potential logical error
        end try
        begin catch
            insert into SalesLT.Address
      (AddressLine1, City)
    values
      (@street, @city); --potential data error
        end catch;
  end;

  -- if (@cid is not null and @aid is null)
  -- begin
  --     insert into SalesLT.Address(AddressLine1, City)
  --     values (@street, @city); --potential data error
  -- end;

  if (@cid is not null and @aid is not null)
    begin
    --insert customer address
    insert into SalesLT.CustomerAddress
      (CustomerID, AddressID)
    values
      (@cid, @aid);
    --potential constraint error, data error

    commit transaction;
  end;
    else
    begin
    rollback transaction;
  end;
end;
go


begin try
    execute sp_AddCustomerAddress 1, '123 main st', 'dallas';
end try
begin catch
    print @@errormessage
end catch
