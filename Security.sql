create database  DB1;
go
CREATE SCHEMA  cat ;
go;

go

Drop table if exists Table_Parts
Create table cat.Table_Parts(
pid int primary key not null,
pname nvarchar(20) unique not null,
pcolor nvarchar(20) check(pcolor = 'red' OR pcolor = 'green' OR pcolor = 'yellow')
)

go

 Drop table if exists Table_Suppliers
Create Table cat.Table_Suppliers(
s_id   int primary key not null,
sname varchar (20) unique ,
[address] varchar(20)
)
go
 
 Drop table if exists cat.Table_Catalog
Create Table cat.Table_Catalog(
s_id int not null,
pid int   null,
cost money not null
 check 
(cost <= 1000 and cost > 0 ) 
) 
go 

Alter Table cat.Table_Catalog
add 
FOREIGN KEY  (s_id)  REFERENCES cat.Table_Suppliers(s_id)
ON DELETE CASCADE
go 

Alter Table cat.Table_Catalog 
add 
FOREIGN KEY(pid) REFERENCES cat.Table_Parts(pid)
ON DELETE CASCADE
go

 INSERT INTO cat.Table_Suppliers(s_id,sname,address)
 values(1,'Xre','Adr dd')
  INSERT INTO cat.Table_Suppliers(s_id,sname,address)
 values(2,'Xde','Adr gh')
 
 INSERT INTO cat.Table_Parts(pid,pname,pcolor)
 Values(5,'Py','red')
 INSERT INTO cat.Table_Parts(pid,pname,pcolor)
 Values(10,'Phh','red')
 INSERT INTO cat.Table_Parts(pid,pname,pcolor)
 Values(11,'Yu11','yellow')
 INSERT INTO cat.Table_Parts(pid,pname,pcolor)
 Values(12,'Yzfv','yellow')

 INSERT INTO cat.Table_Catalog(s_id,pid,cost)
 Values(1,5,2)
  INSERT INTO cat.Table_Catalog(s_id,pid,cost)
 Values(1,10,40.5)
  INSERT INTO cat.Table_Catalog(s_id,pid,cost)
 Values(2,11,6)
  INSERT INTO cat.Table_Catalog(s_id,pid,cost)
 Values(2,12,4)
 --create user 
 create user VOVA without login;
 execute as user = 'VOVA';
 insert into cat.Table_Parts(pid,pcolor,pname)
 
 values(15,'red','tony')
 revert;
 select * from cat.Table_Parts
 Grant INSERT ON cat.Table_Parts TO VOVA;
 go
 execute as user = 'VOVA'
  insert into cat.Table_Parts(pid,pcolor,pname)
 
 values(20,'red','andrey')
 revert;

 Create role SELROLE;
 ALTER ROLE SELROLE ADD MEMBER VOVA;

 GRANT SELECT ON cat.Table_Catalog to VOVA;
 execute as user = 'Vova'

 select * from cat.Table_Catalog;
 Revoke SELECT ON cat.Table_Catalog from VOVA;
 drop user VOVA;
 revert;



  create user Tony without login;
 execute as user = 'Tony';
 select * from cat.Table_Catalog
 revert;
  Create role SELROLE1;
 ALTER ROLE SELROLE1 ADD MEMBER Tony;
  GRANT SELECT ON cat.Table_Catalog to SELROLE1;
  execute as user = 'Tony';
  revert;
select * from cat.Table_Catalog
 Revoke SELECT ON cat.Table_Catalog from SELROLE1;
 execute as user = 'Tony';
 select * from cat.Table_Catalog
 ------
 revert;
   Create role SELROLE2;
   create user Tony2 without login
    ALTER ROLE SELROLE2 ADD MEMBER Tony2;
     GRANT SELECT ,INSERT, UPDATE ,DELETE ON cat.Table_Catalog to SELROLE2;
	 execute as user ='Tony2'
	 Select * from cat.Table_Catalog
	 -----
	 revert;
	   GRANT SELECT ON cat.Table_Catalog to SELROLE1;
	   execute as user = 'Tony';
	   select * from cat.Table_Catalog
	   revert;
	   ----






