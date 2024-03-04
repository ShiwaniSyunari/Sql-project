3. Perform the following with help of the above database:
a. Get all the details from the person table including email ID, phone
number and phone number type
select P.*,PE.EmailAddress,PP.PhoneNumber,PT.Name
from[Person].[Person] P inner join[Person].[EmailAddress] PE
on p.BusinessEntityID=PE.BusinessEntityID inner join
[Person].[PersonPhone] PP on P.BusinessEntityID =pp.BusinessEntityID 
inner join [Person].[PhoneNumberType] PT on pp.PhoneNumberTypeID =PT.PhoneNumberTypeID
b. Get the details of the sales header order made in May 2011
select * from [Sales].[SalesOrderHeader]
where year(OrderDate)=2011 and month(OrderDate)=05
c. Get the details of the sales details order made in the month of May
2011
select * from [Sales].[SalesOrderHeader] SOH
inner join [Sales].[SalesOrderDetail] SOD
on SOH.SalesOrderID=SOD.SalesOrderID
where month (SOH.orderdate)=05 and YEAR(soh.OrderDate)=2011
d. Get the total sales made in May 2011
select top 1* from [sales].[SalesOrderDetail]
select top 1* from [sales].[SalesOrderHeader]

select SUM(sod.linetotal) from [sales].[SalesOrderHeader] SOH
inner join [sales].[SalesOrderDetail] SOD
on SOH.SalesOrderID =SOD.SalesOrderID
where month(SOH.orderdate)=05 and year(soh.orderdate)= 2011
e. Get the total sales made in the year 2011 by month order by
increasing sales
select SUM(sod.linetotal) AS TOTALSALES,DATENAME(MM,OrderDate) from [sales].[SalesOrderHeader] SOH
inner join [sales].[SalesOrderDetail] SOD
on SOH.SalesOrderID=SOD.SalesOrderID
where year(OrderDate)=2011
GROUP BY datename(MM, OrderDate)
ORDER BY TOTALSALES
