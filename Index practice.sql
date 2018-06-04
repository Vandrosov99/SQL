use master
go
CREATE TABLE Worker
(
    Id INT IDENTITY PRIMARY KEY,
    last_name NVARCHAR(30) NOT NULL,
    position NVARCHAR(20) NOT NULL,
    salary INT DEFAUL 0
)
go
--SURNAMES SAMPLE
CREATE TABLE Surnames
(
    Id INT IDENTITY PRIMARY KEY,
    surname NVARCHAR(30) NOT NULL,
)
INSERT INTO Surnames (surname )
VALUES ('SUR_1'),('SUR_2'),('SUR_3'),('SUR_4'),('SUR_5'),('SUR_6'),('SUR_7'),('SUR_8'),('SUR_9'),('SUR_10')
go
--POSITIONS SAMPLE
CREATE TABLE Positions
(
    Id INT IDENTITY PRIMARY KEY,
    positions NVARCHAR(30) NOT NULL,
)
INSERT INTO Positions (positions )
VALUES ('POS_1'),('POS_2'),('POS_3'),('POS_4'),('POS_5')
---1---
DECLARE @i int;
SET @i = 0
WHILE @i < 4000000
BEGIN
INSERT INTO Worker (last_name, position,salary)
VALUES ((select top 1 surname from Surnames order by newid()),(select top 1 positions from Positions order by newid()), RAND()*(10-5)+5)
SET @i = @i + 1
END

---2---
CREATE INDEX IndexWorker ON Worker (last_name, position, salary); 
----3---
SELECT *
FROM Worker WITH(INDEX(IndexWorker))	
----4--
 SELECT * FROM Worker
WHERE last_name = 'SUR_1'