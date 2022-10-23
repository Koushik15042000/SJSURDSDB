DELIMITER $$
CREATE PROCEDURE average_of_reviews()
BEGIN
SELECT Listing_ID, ROUND(AVG(Rating),1) 
FROM reviews GROUP BY Listing_ID;
END $$