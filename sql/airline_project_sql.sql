-- 1. Basic SELECT and Filtering
-- Retrieve all records where the customer type is "Loyal Customer"
SELECT * 
FROM airlane
WHERE Customer_Type = 'First-time';

-- Show only Gender, Age, and Satisfaction for customers whose Age is above 30
SELECT Gender, Age, Satisfaction 
FROM airlane
WHERE Age > 30;

-- 2. Aggregation and Group By
-- Find the average flight distance for all records
SELECT AVG(Flight_Distance) AS Avg_Flight_Distance
FROM airlane;

-- Calculate the total number of records grouped by Satisfaction level
SELECT Satisfaction, COUNT(*) AS Total_Customers
FROM airlane
GROUP BY Satisfaction;

-- 3. Joins and Multi-table Queries (Using Self-Join)
-- Compare satisfaction between customers of the same age
SELECT A.ID AS Customer1_ID, B.ID AS Customer2_ID, A.Age, A.Satisfaction AS Customer1_Satisfaction, B.Satisfaction AS Customer2_Satisfaction
FROM airlane A
INNER JOIN airlane B ON A.Age = B.Age
WHERE A.ID < B.ID;

-- Retrieve records where both customers are of the same age and class
SELECT A.ID AS Customer1_ID, B.ID AS Customer2_ID, A.Age, A.Class
FROM airlane A
INNER JOIN airlane B ON A.Age = B.Age AND A.Class = B.Class;

-- 4. Advanced Filtering with LIKE and IN
-- Find all customers whose Satisfaction starts with "Satis"
SELECT * 
FROM airlane
WHERE Satisfaction LIKE 'Satis%';

-- Retrieve records for customers who traveled in Business or Eco class
SELECT * 
FROM airlane
WHERE Class IN ('Business', 'Eco');

-- 5. Subqueries
-- Find customers with Flight Distance above the average flight distance
SELECT * 
FROM airlane
WHERE Flight_Distance > (SELECT AVG(Flight_Distance) FROM airlane);

-- Retrieve records for customers who gave the maximum satisfaction rating
SELECT * 
FROM airlane
WHERE Satisfaction = (SELECT MAX(Satisfaction) FROM airlane);

-- 6. Case Statements
-- Add a column indicating "Frequent Flyer" if Flight Distance is over 1000; otherwise, "Occasional Flyer"
SELECT ID, Flight_Distance, 
    CASE 
        WHEN Flight_Distance > 1000 THEN 'Frequent Flyer'
        ELSE 'Occasional Flyer'
    END AS Flyer_Type
FROM airlane;

-- Add a label "Satisfied" if Satisfaction contains "Satis"; otherwise, "Not Satisfied"
SELECT ID, Satisfaction, 
    CASE 
        WHEN Satisfaction LIKE '%Satis%' THEN 'Satisfied'
        ELSE 'Not Satisfied'
    END AS Satisfaction_Label
FROM airlane;

-- 7. Window Functions
-- Show the average Flight Distance over the last 5 records for each customer
SELECT ID, Flight_Distance,
    AVG(Flight_Distance) OVER (ORDER BY ID ROWS 4 PRECEDING) AS Avg_Last_5_Records
FROM airlane;

-- Rank customers based on Flight Distance
SELECT ID, Flight_Distance,
    RANK() OVER (ORDER BY Flight_Distance DESC) AS Flight_Rank
FROM airlane;

-- 8. String Functions
-- Concatenate ID and Satisfaction to create a unique identifier
SELECT CONCAT(ID, '_', Satisfaction) AS Unique_ID 
FROM airlane;

-- Format Satisfaction column to replace spaces with underscores
SELECT REPLACE(Satisfaction, ' ', '_') AS Formatted_Satisfaction
FROM airlane;

-- 9. Temporary Tables
-- Create a temporary table for customers whose Class is "Business"
CREATE TEMPORARY TABLE business_class_customers AS
SELECT * 
FROM airlane
WHERE Class = 'Business';

-- Verify the temporary table content
SELECT * FROM business_class_customers;

-- 10. Indexing
-- Create an index on the Satisfaction column
CREATE INDEX idx_satisfaction ON airlane(Satisfaction);

-- 11. Stored Procedures
-- Create a stored procedure to fetch records where Age is above a given threshold
DELIMITER //
CREATE PROCEDURE GetCustomersByAge(IN age_threshold INT)
BEGIN
    SELECT * 
    FROM airlane
    WHERE Age > age_threshold;
END //
DELIMITER ;

-- 12. Triggers
-- Create a trigger to log original Satisfaction before an update
CREATE TRIGGER before_satisfaction_update
BEFORE UPDATE ON airlane
FOR EACH ROW
BEGIN
    INSERT INTO satisfaction_log(ID, Old_Satisfaction)
    VALUES (NEW.ID, OLD.Satisfaction);
END;

-- 13. Views
-- Create a view showing average ratings for various services by Satisfaction level
CREATE VIEW avg_ratings_by_satisfaction AS
SELECT 
    Satisfaction,
    AVG(Departure_and_Arrival_Time_Convenience) AS Avg_Convenience,
    AVG(Ease_of_Online_Booking) AS Avg_Booking,
    AVG(Seat_Comfort) AS Avg_Seat_Comfort
FROM airlane
GROUP BY Satisfaction;

-- 14. User-defined Functions
-- Create a function to calculate the difference between Flight Distance and Departure Delay
DELIMITER //
CREATE FUNCTION FlightDelayDifference(flight_id INT) RETURNS INT
BEGIN
    DECLARE delay_diff INT;
    SELECT (Flight_Distance - Departure_Delay) INTO delay_diff FROM airlane WHERE ID = flight_id;
    RETURN delay_diff;
END //
DELIMITER ;

-- 15. Complex Subqueries
-- Find the customer ID with the maximum cleanliness rating
SELECT ID 
FROM airlane
WHERE Cleanliness = (SELECT MAX(Cleanliness) FROM airlane);

-- 16. Common Table Expressions (CTE)
-- Calculate the daily average ratings for various services and filter those above 4.0
WITH Avg_Service_Ratings AS (
    SELECT 
        ID,
        (Departure_and_Arrival_Time_Convenience + Ease_of_Online_Booking + Seat_Comfort) / 3 AS Avg_Rating
    FROM airlane
)
SELECT ID, Avg_Rating
FROM Avg_Service_Ratings
WHERE Avg_Rating > 4.0;
