create table SUBJECT
(
  SUBJ_ID   NUMERIC not null,
  SUBJ_NAME VARCHAR(60),
  HOUR      NUMERIC,
  SEMESTER   NUMERIC
);
alter table SUBJECT
  add primary key (SUBJ_ID);
create table UNIVERSITY
(
  UNIV_ID   NUMERIC not null,
  UNIV_NAME VARCHAR(160),
  RATING    NUMERIC,
  CITY      VARCHAR(60)
);
alter table UNIVERSITY
  add primary key (UNIV_ID);
create table LECTURER
(
  LECTURER_ID NUMERIC not null,
  SURNAME     VARCHAR(60),
  NAME        VARCHAR(60),
  CITY        VARCHAR(60),
  UNIV_ID     NUMERIC
);
alter table LECTURER
  add primary key (LECTURER_ID);
alter table LECTURER
  add constraint UNIVLECT_FOR_KEY foreign key (UNIV_ID)
  references UNIVERSITY (UNIV_ID);
create table STUDENT
(
  STUDENT_ID NUMERIC not null,
  SURNAME    VARCHAR(60),
  NAME       VARCHAR(60),
  STIPEND    NUMERIC(16,2),
  KURS       NUMERIC,
  CITY       VARCHAR(60),
  BIRTHDAY   DATE,
  UNIV_ID    NUMERIC
);
alter table STUDENT
  add primary key (STUDENT_ID);
alter table STUDENT
  add constraint UNIV_FOR_KEY foreign key (UNIV_ID)
  references UNIVERSITY (UNIV_ID);
create table EXAM_MARKS
(
  EXAM_ID    NUMERIC not null,
  STUDENT_ID NUMERIC not null,
  SUBJ_ID    NUMERIC not null,
  MARK       NUMERIC,
  EXAM_DATE  DATE
);
alter table EXAM_MARKS
  add primary key (EXAM_ID,STUDENT_ID,SUBJ_ID);
alter table EXAM_MARKS
  add constraint STUDENT_FOR_KEY foreign key (STUDENT_ID)
  references STUDENT (STUDENT_ID);
alter table EXAM_MARKS
  add constraint SUBJECT_FOR_KEY foreign key (SUBJ_ID)
  references SUBJECT (SUBJ_ID);
create index STUDENT_ID_1 on EXAM_MARKS (STUDENT_ID);
create table SUBJ_LECT
(
  LECTURER_ID NUMERIC not null,
  SUBJ_ID     NUMERIC not null
);
alter table SUBJ_LECT
  add primary key (LECTURER_ID,SUBJ_ID);
alter table SUBJ_LECT
  add constraint LECT_FOR_KEY foreign key (LECTURER_ID)
  references LECTURER (LECTURER_ID);
alter table SUBJ_LECT
  add constraint SUBJ_FOR_KEY foreign key (SUBJ_ID)
  references SUBJECT (SUBJ_ID);