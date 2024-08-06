/*
Creamos vista de Ventas para el tablero de PowerBI:

Query generada automáticamente por el generador de Vistas visual de SQL Server
Luego fue indentada y se agregaron alias para mejorar su legibilidad
Incluye las tablas:
-> SalesOrderDetail(f):	para OrderID, Cantidad, ProductID, PrecioUnitario, Descuento, Total
-> SalesOrderHeader(d):	para Status, Fecha(FechaOrden), CustomerID, SalesPersonID
-> Product(d):			para Producto(NombreProducto)
-> SalesTerritory(d);	para TerritoryID, Region(Name)
-> Person(d):			para Vendedor(NombreVendedor)
*/

--SELECT        Sales.SalesOrderDetail.SalesOrderID AS OrderID, Sales.SalesOrderDetail.OrderQty AS Cantidad, Sales.SalesOrderDetail.ProductID, Production.Product.Name AS Producto, Sales.SalesOrderDetail.UnitPrice AS PrecioUnitario, 
--                         Sales.SalesOrderDetail.UnitPriceDiscount AS Descuento, Sales.SalesOrderDetail.LineTotal AS Total, Sales.SalesOrderHeader.Status, Sales.SalesOrderHeader.OrderDate AS Fecha, Sales.SalesOrderHeader.CustomerID, 
--                         Sales.SalesOrderHeader.SalesPersonID, Person.Person.FirstName + ' ' + Person.Person.LastName AS Vendedor, Sales.SalesTerritory.TerritoryID, Sales.SalesTerritory.Name AS Región
--FROM            Sales.SalesOrderDetail INNER JOIN
--                         Sales.SalesOrderHeader ON Sales.SalesOrderDetail.SalesOrderID = Sales.SalesOrderHeader.SalesOrderID INNER JOIN
--                         Production.Product ON Sales.SalesOrderDetail.ProductID = Production.Product.ProductID INNER JOIN
--                         Sales.SalesTerritory ON Sales.SalesOrderHeader.TerritoryID = Sales.SalesTerritory.TerritoryID AND Sales.SalesOrderHeader.TerritoryID = Sales.SalesTerritory.TerritoryID AND 
--                         Sales.SalesOrderHeader.TerritoryID = Sales.SalesTerritory.TerritoryID LEFT OUTER JOIN
--                         Person.Person ON Sales.SalesOrderHeader.SalesPersonID = Person.Person.BusinessEntityID


CREATE OR ALTER VIEW Ventas_PowerBI AS
SELECT 
    SOD.SalesOrderID AS OrderID, 
    SOD.OrderQty AS Cantidad, 
    SOD.ProductID, 
    PROD.Name AS Producto, 
    SOD.UnitPrice AS PrecioUnitario, 
    SOD.UnitPriceDiscount AS Descuento, 
    SOD.LineTotal AS Total, 
    SOH.Status, 
    SOH.OrderDate AS Fecha, 
    SOH.CustomerID, 
    SOH.SalesPersonID, 
    PERS.FirstName + ' ' + PERS.LastName AS Vendedor, 
    ST.TerritoryID, 
    ST.Name AS Region
FROM 
    Sales.SalesOrderDetail	SOD
INNER JOIN 
    Sales.SalesOrderHeader	SOH	ON SOD.SalesOrderID = SOH.SalesOrderID 
INNER JOIN 
    Production.Product		PROD ON SOD.ProductID = PROD.ProductID 
INNER JOIN 
    Sales.SalesTerritory	ST	ON SOH.TerritoryID = ST.TerritoryID 
LEFT OUTER JOIN 
    Person.Person			PERS ON SOH.SalesPersonID = PERS.BusinessEntityID
