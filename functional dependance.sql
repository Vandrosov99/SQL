
	Drop table if exists #test

	create table #test(
	A int not null,
	B int not null,
	C int not null,
	D int not null)

	INSERT INTO #test (A,B,C,D)
	VALUES (1,2,3,4)
	INSERT INTO #test (A,B,C,D)
	VALUES (1,3,3,5)
	INSERT INTO #test (A,B,C,D)
	VALUES (1,3,3,5)
	INSERT INTO #test (A,B,C,D)
	VALUES (1,2,3,4) 
	 

	select * from #test
	
	IF EXISTS(select * From #test t1, #test t2 where((t1.A = t2.A AND t1.B = t2.B) AND (t1.C !=t2.C OR t1.D != t2.D)))
		Select 'FALSE'
	esle
		select 'True'