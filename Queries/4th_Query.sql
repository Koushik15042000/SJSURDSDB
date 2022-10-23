SELECT 
    Host_Id,
    Response_Time,
    Acceptance_Rate,
    License_Number,
    Verification_Status,
    Category
FROM
    Host
        INNER JOIN
    Verification ON Verification_Status = Verification_Id
ORDER BY Host_Id

