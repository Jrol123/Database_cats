SELECT Products.Title        AS Title,
       Categories.Name       AS CategoryName,
       Products.SellingPrice AS SellingPrice
FROM Products
         -- Для включения товаров без категорий
         LEFT JOIN Categories on Products.CategoryID = Categories.ID
WHERE Products.ID IN (SELECT ProductID
                      FROM PurchaseItems
                      GROUP BY ProductID)
  AND Products.ID IN (SELECT ProductID
                      FROM SalesItems
                      GROUP BY ProductID)
ORDER BY Products.SellingPrice DESC;