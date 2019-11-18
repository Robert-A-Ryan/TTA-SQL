USE AdventureWorks2014
GO

CREATE PROC dbo.uspGetAddress
AS
SELECT * FROM Person.Address
GO

EXEC dbo.uspGetAddress

CREATE PROC dbo.uspGetAddressCity @City nvarchar(30)
AS
SELECT *
FROM Person.Address
Where City = @City
GO

EXEC dbo.uspGetAddressCity @City = 'New York';


CREATE PROCEDURE dbo.uspGetAddressCount @City nvarchar(30), @AddressCount int OUT
AS
SELECT @AddressCount = count(*)
FROM AdventureWorks2014.Person.Address
WHERE City = @City;
GO

DECLARE @AddressCount int
EXEC dbo.uspGetAddressCount @City = 'Calgary', @AddressCount = @AddressCount OUT
SELECT @AddressCount

CREATE PROCEDURE dbo.uspTryCatchTest
AS
BEGIN TRY
	SELECT 1/0
END TRY
BEGIN CATCH
	SELECT ERROR_NUMBER() AS ErrorNumber
	,ERROR_SEVERITY() AS ErrorSeverity
	,ERROR_STATE() AS ErrorState
	,ERROR_PROCEDURE() AS ErrorProcedure
	,ERROR_LINE() AS ErrorLine
	,ERROR_MESSAGE() AS ErrorMessage;
END CATCH

EXEC dbo.uspTryCatchTest;


DROP PROC dbo.uspGetAddress, dbo.uspGetAddressCity, dbo.uspGetAddressCount, dbo.uspTryCatchTest;
GO


/*MY PROCEDURE*/
CREATE PROC dbo.SalesHistoryByEmployee @LastName nvarchar(50), @CountryRegionCode nvarchar(3)
AS
SELECT
	PP.FirstName AS 'First Name', PP.LastName AS 'Last Name', SSP.SalesYTD AS 'Employee Sales YTD', SST.SalesYTD AS 'Territory Sales YTD'
FROM Person.Person PP
JOIN Sales.SalesPerson SSP
	ON SSP.BusinessEntityID = PP.BusinessEntityID
JOIN Sales.SalesTerritory SST
	ON SST.TerritoryID = SSP.TerritoryID
WHERE (LastName LIKE @LastName + '%'
	OR LastName = ISNULL(@LastName, LastName))
AND (CountryRegionCode LIKE @CountryRegionCode + '%'
	OR CountryRegionCode = ISNULL(@CountryRegionCode, CountryRegionCode))
GO


EXEC dbo.SalesHistoryByEmployee 'mit', 'us'
GO