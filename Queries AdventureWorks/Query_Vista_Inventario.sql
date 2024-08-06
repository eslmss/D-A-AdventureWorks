/*
Creamos vista de Almacén/Inventario para el tablero de PowerBI, incluyendo las tablas:
-> ProductInventory(f): para FechaEntrada, ProductID, Quantity
-> Product(d):			para Producto(NombreProducto),
-> Location(d):			para LocationID, Location(NombreLocation)
-> ProductModel(d):		para ProductModelID, ProductLine("ProductCategory")
*/

CREATE OR ALTER VIEW Inventario_PowerBI as
SELECT
	PI.ModifiedDate as FechaEntrada,
	PI.ProductID,
	P.Name as Producto,
	PM.ProductModelID,
	PM.Name as ProductLine,
	L.LocationID,
	L.Name AS Location,
	PI.Quantity
FROM 
	Production.ProductInventory	PI											--a
JOIN 
	Production.Product			P	ON PI.ProductID = P.ProductID			--b
JOIN 
	Production.Location			L	ON PI.LocationID = L.LocationID			--c
JOIN 
	Production.ProductModel		PM	ON P.ProductModelID = PM.ProductModelID	--d

--SELECT * FROM Production.ProductCategory
--SELECT * FROM Production.ProductModel
--SELECT * FROM Production.ProductSubcategory