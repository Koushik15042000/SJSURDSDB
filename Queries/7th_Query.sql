#Returns host with the biggest number of listings.
SELECT 
    H.Host_ID,
    H.Name,
    L.Neighbourhood,
    L.Neighbourhood_Group,
    H.City,
    L.Property_Type
FROM
    Listings L
        INNER JOIN
    Host H ON H.Host_Id = L.Host_Id
GROUP BY H.Host_ID , H.Name , L.Neighbourhood , L.Neighbourhood_Group , H.City , L.Property_Type
HAVING MAX(H.Listings_Count)

