/*
Creamos vista de Producción para el tablero de PowerBI, incluyendo las tablas:
-> WorkOrder(f):		para WorkOrderID, FechaInicio, FechaVencimiento, ProductID, Cantidad, Almacenado (cantidad)
-> Product(d):			para Producto (NombreProducto), CostoStandard, PrecioLista
-> WorkOrderRouting:	solo se usó para linkear con la tabla Location
-> Location(d):			para LocationID, Name (LocationName)
-> ProductModel(d):		para ProductModelID, ProductModel (NombreCategoria)
*/

CREATE OR ALTER VIEW Produccion_PowerBI as
SELECT
	WO.WorkOrderID,
	WO.StartDate as FechaInicio,
	WO.DueDate as FechaVencimiento,
	L.LocationID,
	L.Name as Location,
	WO.ProductID,
	P.Name as Producto,
	PM.ProductModelID,
	PM.Name ProductModel,
	WO.OrderQty as Cantidad,
	WO.StockedQty as Almacenado,
	P.StandardCost as CostoStandard,
	P.ListPrice as PrecioLista
FROM 
	Production.WorkOrder			WO											--a
JOIN 
	Production.Product				P	ON WO.ProductID = P.ProductID			--b
JOIN 
	Production.WorkOrderRouting		WOR ON WO.WorkOrderID = WOR.WorkOrderID		--c
JOIN 
	Production.Location				L	ON WOR.LocationID = L.LocationID		--d
JOIN 
	Production.ProductModel			PM	ON P.ProductModelID = PM.ProductModelID	--e