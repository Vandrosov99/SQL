create database laba_8_7
go
use laba_8_7
go
create table Table_Suplliers
(
s_id int identity primary key ,
sname varchar(20) unique,
address varchar(20) not null
)
go
 INSERT INTO Table_Suplliers(sname,address)
 VALUES('Xre','Adr dd')
  INSERT INTO Table_Suplliers(sname,address)
 VALUES('Zde','Adr gh')
 go
 
 select * from Table_Suplliers

go
--drop table if exists sup_log 
create table sup_log(
    Id INT IDENTITY PRIMARY KEY,
    supID INT NOT NULL,
    Operation NVARCHAR(200) NOT NULL,
    CreateAt DATETIME NOT NULL DEFAULT GETDATE()
)

go

Create trigger Sup_INSERT
on Table_Suplliers
After Insert 
as 
Insert Into sup_log	(supID,Operation)
select s_id,'inserted name ' + sname + 'inserted address ' + address
from inserted
go

INSERT INTO Table_Suplliers(sname,address)
VALUES('vasya','Kolokywkina')
go
select * from sup_log
 go
CREATE TRIGGER SUP_DELETE
ON Table_Suplliers
AFTER DELETE
AS
INSERT INTO sup_log( supID,Operation)
SELECT  s_id,'Удалено имя : ' +  sname+ ' Адресс :  ' + address
FROM DELETED
go

select * from Table_Suplliers

DELETE FROM Table_Suplliers
WHERE s_id = 2

select * from Table_Suplliers

go

Create Trigger Sup_Update 
ON Table_Suplliers
after Update 
as 
INSERT INTo sup_log(supID,Operation)
Select s_id,'Update имя : ' +  sname+ ' Update Адресс :  ' + address
from inserted

go
select * from Table_Suplliers
go
Update Table_Suplliers
set sname = 'chaha'
where s_id = 1 
select * from Table_Suplliers

select * from sup_log;
select * from Table_Suplliers;

Alter Table orders 
add 
FOREIGN KEY  (s_id)  REFERENCES Table_Catalog(s_id)
go 