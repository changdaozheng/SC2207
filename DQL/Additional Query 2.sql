WITH A AS (

    SELECT TOP 5 CustomerID, SUM(ItemPrice*ItemQty) AS total_sum
    FROM ItemsInOrder AS iio, OrderStatus AS os
    WHERE iio.OrderID=os.OrderID AND iio.ItemID = os.ItemID AND iio.StockID = os.StockID AND iio.PubID = os.PubID AND iio.BookstoreID = os.BookstoreID AND os.OrderState<>'Returned'
    GROUP BY CustomerID
    ORDER BY SUM(ItemPrice*ItemQty) DESC
)

SELECT CustomerName, total_sum
FROM A, Customers
WHERE A.CustomerID = Customers.CustomerID
