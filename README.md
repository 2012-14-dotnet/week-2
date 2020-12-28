# SQL

- normalization (quality)
  process of reducing redundancy and increasing efficiency. (structured data for read/write operations)

  1. 1NF => each record must be unique and its values must be singular/atomic
  2. 2NF => handling partial dependency, each value must depend on the key, referential integrity
  3. 3NF => handling transient dependency, each value must only depend on the key

- multiplicity (quantity)
  number of connections/relations between records. (as many as necessary)

  1. 1-1
  1. 1-many
  1. many-many

- provider
  tooling to implement a sql database on a local/remote server

  1. Microsoft SQL Server, mssql, Transact-SQL/T-SQL
  1. PostgreSQL, pgsql

- language

  - DSL, domain-specific language, declarative, set theory
  - sub-languages: DDL, DML, DCL, TCL

## DDL

data definition language
- CREATE, create new instance of a structure
- ALTER, modify an existing structure
- DROP, archive an existing structure
- TRUNCATE, clone an existing struture while destroying the original one

structure
- database
- schema
- table
- view
- scalar function
- tabular function
- stored procedure
- trigger
- sequence

## DML

data manipulation language
- SELECT (DQL, data query language)
- INSERT
- UPDATE
- DELETE

use case
- statement/clause
- JOIN, inner/outer
- UNION
- query/subquery/nested, CTE
- aggregate functions, COUNT/SUM/AVG/MAX/MIN

## DCL

data control language
- GRANT
- REVOKE

use case
- permission, read/write/execute/modify
- audit
- replication/geolocation/failover, hot storage
- backup, cold storage, full/partial/differential

## TCL

transaction control language
- TRANSACTION
- COMMIT
- SAVEPOINT
- ROllBACK

propeties (ACID)
- atomicity = singular operation on a set of records
- consistency = singular operation must be repeatable
- isolation = singular operation must not have any effect of any other records (no side-effects)
- durability = singular operation data must be persisted (added/modified/deleted)

isolation levels
- READ UNCOMMITTED
- READ COMMITTED
- REPEATABLE READ
- SERIALIZABLE

## ORM

## questions
