SELECT 
    L.Listings_Id,
    L.Name,
    L.Neighbourhood,
    L.Neighbourhood_Group,
    L.City,
    L.Property_Type,
    L.Allowed_Occupants
FROM
    Amenities_provided AP
        INNER JOIN
    Listings L ON AP.Listing_Id = L.Listings_Id
GROUP BY L.Listings_Id , L.Name , L.Neighbourhood , L.Neighbourhood_Group , L.City , L.Property_Type , L.Allowed_Occupants

