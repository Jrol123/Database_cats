SELECT Sellers.LastName || ' ' || Sellers.FirstName         AS SellerFullName,
       SUM(SalesItems.QuantitySold * Products.SellingPrice) AS TotalRevenue,
       COUNT(DISTINCT Sales.ID)                             AS CountOfSales
FROM SalesItems
         INNER JOIN Sales on SalesItems.SaleID = Sales.ID
         INNER JOIN Sellers on Sales.SellerID = Sellers.ID
         INNER JOIN Products on SalesItems.ProductID = Products.ID
GROUP BY Sellers.ID
ORDER BY TotalRevenue DESC
LIMIT 10;