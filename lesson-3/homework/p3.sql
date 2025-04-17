WITH MostExpensivePerCategory AS (
    SELECT *
    FROM Products p1
    WHERE Price = (
        SELECT MAX(Price)
        FROM Products p2
        WHERE p1.Category = p2.Category
    )
)
SELECT 
    DISTINCT Category,
    ProductName,
    Price,
    Stock,
    IIF(Stock = 0, 'Out of Stock', 
        IIF(Stock BETWEEN 1 AND 10, 'Low Stock', 'In Stock')) AS InventoryStatus
FROM MostExpensivePerCategory
ORDER BY Price DESC
OFFSET 5 ROWS;
