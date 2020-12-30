use week2dmldb;
go

--TRIGGER
-- for = prior to execution of query
-- after = following execution of query, if query successful
-- instead of = replace execution of query
-- inserted = special table for insert queries
-- deleted = special table for update queries
create trigger tr_DeleteAddress on SalesLT.Address
instead of delete
as
    update a
    set ModifiedDate = SYSUTCDATETIME()
    from SalesLT.Address as a
  inner join deleted on deleted.AddressID = a.AddressID;

select *
from SalesLT.Address;

delete SalesLT.Address where AddressID = 9;
