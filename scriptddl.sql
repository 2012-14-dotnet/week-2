IF SCHEMA_ID(N'Pizza') IS NULL EXEC(N'CREATE SCHEMA [Pizza];');
GO


CREATE TABLE [Pizza].[Crust]
(
  [CrustId] tinyint NOT NULL IDENTITY,
  [Name] varchar(100) NOT NULL,
  [Active] bit NULL DEFAULT (((1))),
  CONSTRAINT [PK_Crust] PRIMARY KEY ([CrustId])
);
GO


CREATE TABLE [Pizza].[Size]
(
  [SizeId] tinyint NOT NULL IDENTITY,
  [Name] varchar(100) NOT NULL,
  [Active] bit NULL DEFAULT (((1))),
  CONSTRAINT [PK_Size] PRIMARY KEY ([SizeId])
);
GO


alter TABLE [Pizza].[Topping]
    add [Price] decimal(18,2) NOT NULL;
GO


CREATE TABLE [Pizza].[Pizza]
(
  [PizzaId] tinyint NOT NULL IDENTITY,
  [CrustId] tinyint NOT NULL,
  [SizeId] tinyint NOT NULL,
  [Name] varchar(100) NOT NULL,
  [Active] bit NULL DEFAULT (((1))),
  [DateModified] datetime2(3) NULL,
  CONSTRAINT [PK_Pizza] PRIMARY KEY ([PizzaId]),
  CONSTRAINT [FK_CrustId] FOREIGN KEY ([CrustId]) REFERENCES [Pizza].[Crust] ([CrustId]) ON DELETE NO ACTION,
  CONSTRAINT [FK_SizeId] FOREIGN KEY ([SizeId]) REFERENCES [Pizza].[Size] ([SizeId]) ON DELETE NO ACTION
);
GO


CREATE TABLE [Pizza].[PizzaTopping]
(
  [PizzaToppingId] int NOT NULL IDENTITY,
  [PizzaId] tinyint NOT NULL,
  [ToppingId] smallint NOT NULL,
  CONSTRAINT [PK_PizzaTopping] PRIMARY KEY ([PizzaToppingId]),
  CONSTRAINT [FK_PizzaId] FOREIGN KEY ([PizzaId]) REFERENCES [Pizza].[Pizza] ([PizzaId]) ON DELETE NO ACTION,
  CONSTRAINT [FK_ToppingId] FOREIGN KEY ([ToppingId]) REFERENCES [Pizza].[Topping] ([ToppingId]) ON DELETE NO ACTION
);
GO


CREATE INDEX [IX_Pizza_CrustId] ON [Pizza].[Pizza] ([CrustId]);
GO


CREATE INDEX [IX_Pizza_SizeId] ON [Pizza].[Pizza] ([SizeId]);
GO


CREATE INDEX [IX_PizzaTopping_PizzaId] ON [Pizza].[PizzaTopping] ([PizzaId]);
GO


CREATE INDEX [IX_PizzaTopping_ToppingId] ON [Pizza].[PizzaTopping] ([ToppingId]);
GO


