-- Question 1: Out-of-the-Dollar (OTD) Rate by City

SELECT 
    CITY,
    COUNT(ORDERID) AS Total_Orders,
    ROUND(AVG(CASE WHEN Delivery_Status = 'On-Time' THEN 1.0 ELSE 0 END) * 100, 2) AS OTD_Percentage
FROM Order_Performance_Details
GROUP BY CITY
ORDER BY OTD_Percentage ASC;

-- Question 2: Preliminary customer retention analysis (for existing and new customers)

WITH Customer_Stats AS (
    SELECT 
        USERID,
        COUNT(ORDERID) AS Order_Count,
        MIN(DATE_) AS First_Purchase,
        MAX(DATE_) AS Latest_Purchase
    FROM Orders
    GROUP BY USERID
)
SELECT 
    CASE WHEN Order_Count > 1 THEN 'Returning Customer' ELSE 'New Customer' END AS Customer_Segment,
    COUNT(USERID) AS Total_Users,
    AVG(Order_Count) AS Avg_Orders_Per_User
FROM Customer_Stats
GROUP BY CASE WHEN Order_Count > 1 THEN 'Returning Customer' ELSE 'New Customer' END;

-- Question 3: Top 5 Categories with the Most Order Delays

SELECT 
    cat.CATEGORY1,
    COUNT(o.ORDERID) AS Total_Late_Orders
FROM Orders o
JOIN Order_Details od ON o.ORDERID = od.ORDERID
JOIN Categories cat ON od.ITEMID = cat.ITEMID
WHERE DATEDIFF(day, o.DATE_, o.SHIPDATE) > 3
GROUP BY cat.CATEGORY1
ORDER BY Total_Late_Orders DESC
LIMIT 5;