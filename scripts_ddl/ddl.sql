use week2ddldb;
go

--CREATE
--create database week2ddldb;

create schema Pizza;
go

create table Pizza.Pizza
(
  PizzaId tinyint not null identity(1,1)
    ,
  CrustId tinyint not null
    ,
  SizeId tinyint not null
    ,
  [Name] varchar(100) not null
    ,
  Active bit default(1)
    ,
  DateModified datetime2(3)
);

create table Pizza.Crust
(
  CrustId tinyint not null identity(1,1)
    ,
  [Name] varchar(100) not null
    ,
  Active bit default(1)
);

create table Pizza.Size
(
  SizeId tinyint not null identity(1,1)
    ,
  [Name] varchar(100) not null
    ,
  Active bit default(1)
);

create table Pizza.Topping
(
  ToppingId smallint not null identity(1,1)
    ,
  [Name] varchar(100) not null
    ,
  Active bit default(1)
);

create table Pizza.PizzaTopping
(
  PizzaToppingId int not null identity(1,1)
    ,
  PizzaId tinyint not null
    ,
  ToppingId smallint null
);

--ALTER
alter table Pizza.Pizza
    add constraint PK_PizzaId primary key clustered (PizzaId);
go

alter table Pizza.Crust
    add constraint PK_CrustId primary key clustered (CrustId);
go

alter table Pizza.Size
    add constraint PK_SizeId primary key clustered (SizeId);
go

alter table Pizza.Topping
    add constraint PK_Topping primary key clustered (ToppingId);
go

alter table Pizza.PizzaTopping
    add constraint PK_PizzaToppingId primary key clustered (PizzaToppingId);
go

alter table Pizza.Pizza
    add constraint FK_CrustId foreign key (CrustId) references Pizza.Crust(CrustId);
go

alter table Pizza.Pizza
    add constraint FK_SizeId foreign key (SizeId) references Pizza.Size(SizeId);
go

alter table Pizza.PizzaTopping
    add constraint FK_PizzaId foreign key (PizzaId) references Pizza.Pizza(PizzaId);
go

alter table Pizza.PizzaTopping
    alter column ToppingId smallint null;
go

alter table Pizza.PizzaTopping
    add constraint FK_ToppingId foreign key (ToppingId) references Pizza.Topping(ToppingId);
go

--DROP
--drop table Pizza.PizzaTopping;

--TRUNCATE
--truncate table Pizza.PizzaTopping;
