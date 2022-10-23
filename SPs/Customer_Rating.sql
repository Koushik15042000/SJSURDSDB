CREATE PROCEDURE `Customer_Rating`(Customer_ID INT)
BEGIN

SELECT C.Customer_Id,C.First_Name,C.Last_Name,C.Gender,C.Email_ID,C.Age,C.City,R.Rating
FROM Customer C 
INNER JOIN Reviews R ON C.Customer_id = R.Reviewer_Id
WHERE C.Customer_Id = @Customer_ID;

END