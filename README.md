# 07_09_ASSI_intermediate_SQL

 ## Table of contents
 * [**Introduction**](#introduction)
 * [**Relational diagram**](#relational-diagram)

 
 ## Introduction
 
In this task, we have to create a database using intermediate sql querys, it is a task in which we have to try to put all the knowledge acquired during the current course and also try to apply in our database script the following data.

```
Integrity constraints
Referential integrity
Cascading actions in referential integrity
Date, time or timestamp data types
Binary large objects
Domains
Indexes
Users
Privileges
Roles
```

## Relational diagram


## Scripts
### ddl.sql
 This file contains the script to generate the database in postgres and the type of data to be inserted.

 _Example_:

 - Create the database and check if the database is unique.
```
SELECT 'CREATE DATABASE [db_name]' WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = '[db_name]')\gexec 
```
