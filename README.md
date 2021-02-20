# EAMdatabase
A relational database about the Greek Defence Systems, created using MySQL and MariaDB.

The project consists of two SQL Txt files:
1. ```EAMdbDump``` : contains the entire DB structure
2. ```users``` : creates the users and grants them rights

It also includes a MySQL Workbench file: ```EAMdb```. A folder with SQL query examples [queries](https://github.com/mcmaniou/EAMdatabase/tree/main/queries). And an [image](https://github.com/mcmaniou/EAMdatabase/blob/main/EAMdb.png) of the DB structure.

### Entities
* factory
* machine
* project
* supplier
* client
* product, with three sub-classes:
  * arm
  * munition
  * weapon_and_missile_system

### Users
* administrator: responsible for the complete management of the database. His rights are:
  * Access (read / write) to all the data of the database.
* employee: responsible for managing orders and constantly updating the database. His rights are:
  * Access (read / write) to data related to orders, products and research projects.
  * Access (read) the data of all other users in order to communicate with the latter if necessary.
  * Access to the company profile and the possibility of updating it.
* customer: aims to search and market products. His rights are:
  * Access (read) the data concerning the products.
  * Access (read) to data concerning the factories.
  * Execution (read / write) of orders aimed at the purchase of products.
* supplier: aims to sell supplies. His rights are:
  * Access (read) to data concerning the factories. 
* themistoklis: aims to grade the project. He has no rights.
