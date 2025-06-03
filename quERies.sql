create database Bookz;
use Bookz;
select * from books ;
select * from customers ;
select * from orders ;
-- 1. Q: Write a SQL query to find the top 5 best-selling books by total quantity sold.
SELECT b.Title, SUM(o.Quantity) AS Total_Sold
FROM Orders o
JOIN Books b ON o.Book_ID = b.Book_ID
GROUP BY b.Title
ORDER BY Total_Sold DESC
LIMIT 5;

-- 2. Q: Find the customer who has spent the most on book purchases.

SELECT c.Name, SUM(o.Total_Amount) AS Total_Spent
FROM Orders o
JOIN Customers c ON o.Customer_ID = c.Customer_ID
GROUP BY c.Name
ORDER BY Total_Spent DESC
LIMIT 1;

-- 3. Q: List books that have never been ordered.

SELECT b.Title
FROM Books b
LEFT JOIN Orders o ON b.Book_ID = o.Book_ID
WHERE o.Book_ID IS NULL;
-- 4. Q: Calculate the average order value.
SELECT ROUND(AVG(Total_Amount), 2) AS Avg_Order_Value
FROM Orders;

-- 5. Q: What is the most popular genre based on quantity sold?

SELECT b.Genre, SUM(o.Quantity) AS Total_Quantity
FROM Orders o
JOIN Books b ON o.Book_ID = b.Book_ID
GROUP BY b.Genre
ORDER BY Total_Quantity DESC
LIMIT 1;

-- 6. Q: Which country has the highest number of customers?

SELECT Country, COUNT(*) AS Customer_Count
FROM Customers
GROUP BY Country
ORDER BY Customer_Count DESC
LIMIT 1;

-- 7. Q: Find the total revenue generated per year.

SELECT YEAR(Order_Date) AS Year, SUM(Total_Amount) AS Revenue
FROM Orders
GROUP BY YEAR(Order_Date)
ORDER BY Year;


-- 8. Q: Identify customers who have placed more than 5 orders.

SELECT Customer_ID, COUNT(*) AS Order_Count
FROM Orders
GROUP BY Customer_ID
HAVING COUNT(*) > 5;

-- 9. Q: List the top 3 cities with the highest total order value.

SELECT c.City, SUM(o.Total_Amount) AS Total_Value
FROM Orders o
JOIN Customers c ON o.Customer_ID = c.Customer_ID
GROUP BY c.City
ORDER BY Total_Value DESC
LIMIT 3;

-- 10. Q: Calculate the total stock value on hand for all books.

SELECT ROUND(SUM(Price * Stock), 2) AS Stock_Value
FROM Books;









