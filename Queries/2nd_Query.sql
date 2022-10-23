SELECT 
    H.Host_Id,
    H.Age,
    H.Gender,
    H.Unit_no,
    H.Street_Address,
    H.City,
    H.Zip_code,
    H.About,
    H.Host_Since
FROM
    Host H
        INNER JOIN
    Listings L ON L.Host_Id = H.Host_Id
GROUP BY H.Host_Id , H.Age , H.Gender , H.Unit_no , H.Street_Address , H.City , H.Zip_code , H.About , H.Host_Since , H.Response_Time

