use master
go
-- materialized view
CREATE VIEW dbo.SillyView2
WITH SCHEMABINDING 
AS 
  SELECT LECTURER_ID, SUBJ_ID FROM dbo.SUBJ_LECT;
  go
  ALTER TABLE dbo.SUBJ_LECT drop COLUMN SUBJ_ID;
  ---updateble
  CREATE VIEW StudentView2
AS SELECT STUDENT_ID,NAME,KURS FROM STUDENT
GO
INSERT INTO StudentView2(STUDENT_ID,NAME,Kurs)
VALUES(2,'MARK',3);
-----not updateble
CREATE VIEW notUpdatableStudent
AS SELECT distinct KURS FROM STUDENT
GO
INSERT INTO notUpdatableStudent(Kurs)
VALUES(3);