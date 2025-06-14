use employee;
select * from email_personalization;

# Extract Full Historical Campaign & Engagement Data
SELECT 
    Customer_ID,
    First_Name,
    Last_Name,
    Email,
    Signup_Date,
    Last_Purchase_Date,
    Last_Email_Opened_Date,
    Last_Clicked_Link,
    Total_Purchases,
    Average_Spend,
    Email_Engagement_Score,
    Is_Subscriber
FROM email_personalization
ORDER BY Last_Email_Opened_Date DESC;

# Campaign Activity in the Last 90 Days
SELECT 
    Customer_ID,
    Email,
    Last_Email_Opened_Date,
    Last_Clicked_Link,
    Email_Engagement_Score
FROM email_personalization 
WHERE Last_Email_Opened_Date >= DATE_SUB(CURDATE(), INTERVAL 90 DAY)
ORDER BY Last_Email_Opened_Date DESC;

# Top Engaged Customers
SELECT 
    Customer_ID,
    First_Name,
    Email,
    Email_Engagement_Score,
    Total_Purchases,
    Average_Spend
FROM email_personalization  
ORDER BY Email_Engagement_Score DESC
LIMIT 10;

# Segment Customers by Engagement Levels
SELECT 
    CASE 
        WHEN Email_Engagement_Score >= 80 THEN 'Highly Engaged'
        WHEN Email_Engagement_Score BETWEEN 40 AND 79 THEN 'Moderately Engaged'
        ELSE 'Low Engagement'
    END AS Engagement_Segment,
    COUNT(*) AS Customer_Count
FROM email_personalization   
GROUP BY Engagement_Segment;

#Find Customers Who Haven’t Engaged in one Months
SELECT 
    Customer_ID,
    Email,
    Last_Email_Opened_Date,
    Email_Engagement_Score
FROM email_personalization  
WHERE Last_Email_Opened_Date < DATE_SUB(CURDATE(), INTERVAL 30 DAY)
ORDER BY Last_Email_Opened_Date;








