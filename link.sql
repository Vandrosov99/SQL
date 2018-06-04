use LectionSQL
go

 Drop table if exists Table_Parts
Create table Table_Parts(
pid int primary key not null,
pname nvarchar(20) unique not null,
pcolor nvarchar(20) check(pcolor = 'red' OR pcolor = 'green' OR pcolor = 'yellow')
)

go

 Drop table if exists Table_Suppliers
Create Table Table_Suppliers(
s_id   int primary key not null,
sname varchar (20) unique ,
[address] varchar(20)
)
go
 
 Drop table if exists Table_Catalog
Create Table Table_Catalog(
s_id int not null,
pid int   null,
cost money not null
 check 
(cost <= 1000 and cost > 0 ) 
) 
go 

Alter Table Table_Catalog
add 
FOREIGN KEY  (s_id)  REFERENCES Table_Suppliers(s_id)
ON DELETE CASCADE
go 

Alter Table Table_Catalog 
add 
FOREIGN KEY(pid) REFERENCES Table_Parts(pid)
ON DELETE CASCADE
go

 INSERT INTO Table_Suppliers(s_id,sname,address)
 values(1,'Xre','Adr dd')
  INSERT INTO Table_Suppliers(s_id,sname,address)
 values(2,'Xde','Adr gh')
 
 INSERT INTO Table_Parts(pid,pname,pcolor)
 Values(5,'Py','red')
 INSERT INTO Table_Parts(pid,pname,pcolor)
 Values(10,'Phh','red')
 INSERT INTO Table_Parts(pid,pname,pcolor)
 Values(11,'Yu11','yellow')
 INSERT INTO Table_Parts(pid,pname,pcolor)
 Values(12,'Yzfv','yellow')

 INSERT INTO Table_Catalog(s_id,pid,cost)
 Values(1,5,2)
  INSERT INTO Table_Catalog(s_id,pid,cost)
 Values(1,10,40.5)
  INSERT INTO Table_Catalog(s_id,pid,cost)
 Values(2,11,6)
  INSERT INTO Table_Catalog(s_id,pid,cost)
 Values(2,12,4)


 select * from Table_Parts
 select * from Table_Suppliers
 select * from Table_Catalog





