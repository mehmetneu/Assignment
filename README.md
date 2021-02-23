# Assignment
Read me


In this exercise I created end-to-end solution using mostly* MS Tools.
I used below tools:
   SQL Server Management Studio 2018
   Microsoft SQL Server Express (64-bit) 2018
   Microsoft SQL Server Developer (64-bit) 2018
   Microsoft Visual Studio Tools for Applications 2019(for the SSIS)
   Python 3.8
   Power BI Desktop and Portal

First of all, I will explain step by step what I have done;  
Q1:How to build and run the solution?
1.	Microsoft SQL Server Express (64-bit) 2018, I installed OLTP database on it.
2.	Microsoft SQL Server Developer (64-bit) 2018, I installed 2 different databases on it. One of them is my Staging database name: AdventureWorksSTGAgain, I installed a 2nd database on the same Server, which is my DWH database: AdventureWorksDW.
3.	 https://exchangeratesapi.io/ I pulled the NZD exchange rates between 2018-01-01 and 2021-31-01 using Python and added it to my STG scheme (Code details in "Curr_Get_API" Folder.).
3.  Please find the all SSIS transformation in the "Assignment" folder.
4.	Then I moved this rate information by Transforming it into DWH Scheme with "Proc_DimRates" SP.
5.	To create the FactSales table, the FactSales table under the DWH Scheme has been filled in with "Proc_FactSales" SP using the SalesOrderHeader and SalesOrderDetail tables.
 Final Step, Reporting;
    In this step, the desired report is created by using both SQL Query and Power BI. You can browse the "Report Result" Folder for details.

Q2,3,4 below:
I did this work for single Initial Load and FactSales. I could not construct an incremental structure. It would be nice to set this up.
I also did the same work on Azure in the form of Migration and it worked fine, but I couldn't share it with you because the limit on the demo Account (£ 200) on the Azure side was over. Much faster.
I was able to manage it all with a single Platfrom on Azure Synapse Analytics. You can also quickly draw currencies with the Rest API call connector, and you can quickly report the result via Power BI, whether Hybrit or Full Cloud.







