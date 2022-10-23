SELECT 
    C.Customer_Id,
    C.First_Name,
    C.Last_Name,
    C.Gender,
    C.Email_ID,
    V.Category
FROM
    Customer C
        INNER JOIN
    Verification V ON C.Verification_Status = V.Verification_Id
ORDER BY Customer_Id