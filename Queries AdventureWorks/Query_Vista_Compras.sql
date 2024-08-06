/*
Creamos vista de Compras para el tablero de PowerBI, incluyendo las tablas:
-> PurchaseOrderDetail(f):	para OrderID, FechaVencimiento, ProductID, CantidadPedida, CantidadRecibida, CantidadDevuelta, PrecioUnitario, MontoTotal
-> PurchaseOrderHeader(d):	para FechaOrden, FechaEnvio, ProveedorID
-> ProductVendor(d):		para AverageLeadTime (TiempoEntregaPromedio)
-> Product(d):				para Product (NombreProducto)
-> Vendor(d):				para Proveedor (NombreProveedor)
*/

CREATE OR ALTER VIEW Compras_PowerBI as		-- Crea la vista si no existe, o la altera si ya existe
SELECT
	POD.PurchaseOrderDetailID as OrderID,
	POH.OrderDate as FechaOrden,
	POH.ShipDate as FechaEnvio,
	POD.DueDate as FechaVencimiento,
	POD.ProductID,
	P.Name as Descripcion,
	POD.OrderQty as CantidadPedida,
	POD.ReceivedQty as CantidadRecibida,
	POD.RejectedQty as CantidadDevuelta,
	POD.UnitPrice as PrecioUnitario,
	POD.LineTotal as MontoTotal,
	POH.VendorID as ProveedorID,
	V.Name as Proveedor,
	PV.AverageLeadTime
FROM 
	Purchasing.PurchaseOrderDetail	POD													--a
JOIN 
	Purchasing.PurchaseOrderHeader	POH ON POD.PurchaseOrderID = POH.PurchaseOrderID	--b
JOIN 
	Purchasing.ProductVendor		PV	ON POD.ProductID = PV.ProductID					--c
JOIN 
	Production.Product				P	ON PV.ProductID = P.ProductID					--d
JOIN 
	Purchasing.Vendor				V	ON POH.VendorID = V.BusinessEntityID			--e