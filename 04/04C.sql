SELECT Products.Title        AS Title,
       Categories.Name       AS CategoryName,
       Products.SellingPrice AS SellingPrice
--        PurchaseItems.QuantityBought,
--        SalesItems.QuantitySold
--        SUM(PurchaseItems.QuantityBought),
--        SUM(SalesItems.QuantitySold)
FROM Products
         LEFT JOIN Categories on Products.CategoryID = Categories.ID
         JOIN SalesItems on Products.ID = SalesItems.ProductID
         JOIN PurchaseItems on Products.ID = PurchaseItems.ProductID
GROUP BY Products.Title, Products.SellingPrice
HAVING SUM(DISTINCT QuantitySold) == SUM(DISTINCT QuantityBought)
ORDER BY Products.SellingPrice DESC;