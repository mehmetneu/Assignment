
	create procedure Proc_DimRates as

	insert into [dbo].[DimRates]
	select 
	a.Datev1 as Date,
	a.Rate as NZD,
	b.Rate as USD
	from 
	(select * from [AdventureWorksSTG ].[dbo].[Currencies] where Curtype='NZD') A
	Inner Join (select * from [AdventureWorksSTG ].[dbo].[Currencies] where Curtype='USD') B on a.datev1=b.datev1

