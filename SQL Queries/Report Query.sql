
select format(fs.orderdate, 'yyyy/MM/dd') as CalendarYear, 
       p.Color as ProductColour , 
		sum(salesamount*(NZD/USD)) as SalesAmountUSD_to_NZD,
		sum(salesamount*1) as SalesAmountUSD,
		count(SalesOrderNumber) as TotalQuantityOrdered
from [dbo].[FactSales] fs
left outer join [dbo].[DimCurrencyRate] dcr on dcr.CurrencyRateID=fs.CurrencyRateID
left  join [dbo].[DimRates] dr on format( dr.date,'yyyyMMdd') =format( dcr.CurrencyRateDate,'yyyyMMdd') 
left  join [dbo].[DimProductt] p on p.Productid=fs.productkey
where p.Color is not null
    and fs.CurrencyRateID is not null
	and  dr.usd is not null
group by fs.orderdate, p.Color

