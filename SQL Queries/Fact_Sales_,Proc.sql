	create procedure pre_fact_sales as

	insert into [AdventureWorksDW].[dbo].[FactSales]
	select distinct SOD.ProductID AS ProductKey,
		FORMAT(SOH.OrderDate,'yyyyMMdd') AS OrderDateKey,
		format( SOH.DueDate,'yyyyMMdd')  AS DueDateKey,
		format( SOH.ShipDate,'yyyyMMdd') as ShipDateKey,
		soh.CustomerID as CustomerKey,
		soh.CurrencyRateID,
		soh.SalesOrderNumber,
		RANK() OVER(PARTITION BY  sod.salesorderid ORDER BY sod.salesorderdetailid  DESC) as SalesOrderLineNumber, 
		soh.RevisionNumber as RevisionNumber,
		sod.OrderQty as OrderQuantity,
		sod.UnitPrice,
		sod.UnitPriceDiscount as DiscountAmount,
		sod.LineTotal as TotalProductCost,
		(sod.LineTotal)- (sod.OrderQty*sod.UnitPriceDiscount) as SalesAmount,
		soh.TaxAmt,
		soh.Freight,
		soh.PurchaseOrderNumber as CustomerPONumber,
		soh.OrderDate,
		soh.DueDate,
		soh.ShipDate
	from [SalesLT].[STGSalesOrderHeader] soh
	inner join [SalesLT].[STGSalesOrderDetail] sod on soh.SalesOrderID=sod.SalesOrderID

