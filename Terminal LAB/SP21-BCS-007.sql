-- Question 1:
-- Create a stored procedure, which is used to perform the requirements, given below:
-- 1.   Before inserting, check the detail about the product name. If the product name is 
-- available, update an existing product qty + inserted product qty.
-- 2.   If above condition not satisfied, insert the product information, as new record 
-- into the table.

-- Creating Procedure
CREATE PROCEDURE InsertOrUpdateProduct
(
  @ProductName nvarchar(40),
  @ProductQty int
)
AS
BEGIN
  DECLARE @ExistingPrd nvarchar(50)
  SELECT @ExistingPrd = ProductName FROM Products WHERE ProductName = @ProductName

  IF @ExistingPrd IS NULL
  BEGIN
    INSERT INTO Products (ProductName, UnitsInStock)
    VALUES (@ProductName, @ProductQty)
  END
  ELSE
  BEGIN
	DECLARE @ExistingQty int
	SELECT @ExistingQty = UnitsInStock FROM Products WHERE ProductName = @ProductName

    UPDATE Products
    SET UnitsInStock = UnitsInStock + @ProductQty
    WHERE ProductName = @ProductName
  END
END

-- Updating Existing
EXEC InsertOrUpdateProduct @ProductName = 'Chai', @ProductQty = 1
SELECT * FROM Products

-- Adding New if not exist
EXEC InsertOrUpdateProduct @ProductName = 'Lux', @ProductQty = 6
SELECT * FROM Products

-------------------------------------------------------------------------------------------------
-- Question 2:
-- Create a Trigger, which is used to perform the requirement, given below:
-- If a customer buys particular product, your stock must be updated according to the order 
-- of the customer. And if the quantity of the order product is larger than the stock quantity, 
-- your system should print a message “I offered --- number of products”. If customer agree 
-- then order proceed, otherwise rollback the transaction.

-- Creating Trigger
CREATE TRIGGER update_stock_quantity
ON [dbo].[Order Details]
AFTER INSERT
AS
BEGIN
    -- Update stock quantity
    UPDATE Products
    SET UnitsInStock = UnitsInStock - (SELECT Quantity FROM inserted)
    WHERE ProductID = (SELECT ProductID FROM inserted)
    
    -- Print message if ordered quantity is larger than stock quantity
    IF (SELECT UnitsInStock FROM Products WHERE ProductID = (SELECT ProductID FROM inserted)) < 0
    BEGIN
        DECLARE @productID INT = (SELECT ProductID FROM inserted)
        DECLARE @productName NVARCHAR(MAX) = (SELECT ProductName FROM Products WHERE ProductID = @productID)
        DECLARE @orderedQuantity INT = (SELECT Quantity FROM inserted)
        DECLARE @stockQuantity INT = (SELECT UnitsInStock FROM Products WHERE ProductID = @productID)
        PRINT 'I offered ' + CAST(@orderedQuantity - @stockQuantity AS NVARCHAR) + ' number of ' + @productName + ' products.'
        
        -- Rollback transaction if customer does not agree
        ROLLBACK TRANSACTION
    END
END
