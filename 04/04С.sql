SELECT Products.Title        AS Title,
       Categories.Name       AS CategoryName,
       Products.SellingPrice AS SellingPrice
FROM Products
         -- Для включения товаров без категорий
         LEFT JOIN Categories on Products.CategoryID = Categories.ID
         JOIN SalesItems on Products.ID = SalesItems.ProductID
         JOIN PurchaseItems on Products.ID = PurchaseItems.ProductID
WHERE PurchaseItems.QuantityBought == SalesItems.QuantitySold
ORDER BY Products.SellingPrice;