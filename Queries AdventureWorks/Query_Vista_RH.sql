/*
Creamos vista de RRHH para el tablero de PowerBI, incluyendo las tablas:
-> EmployeeDepartmentHistory(f):	para BusinessEntityId, FechaInicioContrato, FechaFinContrato
-> Department(d):					para GroupName(Gerencia), Name(NombreDepartamento)
-> Person(d):						para NombreEmpleado
-> Employee(d):						para JobTitle, Gender, MaritalStatus, BirthDate
*/

CREATE OR ALTER VIEW RH_PowerBI as
SELECT
	EDH.BusinessEntityID,
	EDH.StartDate as FechaInicioContrato,
	EDH.EndDate as FechaFinContrato,
	D.GroupName as Gerencia,
	D.Name as Departamento,
	(P.FirstName + ' ' + P.LastName) as NombreEmpleado,
	E.JobTitle,
	E.Gender,
	E.MaritalStatus,
	E.BirthDate
FROM 
	HumanResources.EmployeeDepartmentHistory	EDH												--a
JOIN 
	HumanResources.Department					D ON EDH.DepartmentID = D.DepartmentID			--b
JOIN 
	Person.Person								P ON EDH.BusinessEntityID = P.BusinessEntityID	--c
JOIN 
	HumanResources.Employee						E ON EDH.BusinessEntityID = E.BusinessEntityID	--d
