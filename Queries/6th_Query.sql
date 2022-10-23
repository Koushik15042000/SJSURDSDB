#List out grouped listings and amenities for property type apartments.
SELECT 
    AP.Amenities_Id,
    AP.Listing_Id,
    A.Name,
    L.Name,
    L.City,
    L.Allowed_Occupants,
    L.Property_Type
FROM
    Listings L
        INNER JOIN
    Amenities_Provided AP ON AP.Listing_Id = L.Listings_Id
        INNER JOIN
    Amenities A ON A.Amenities_Id = AP.Amenities_Id
        INNER JOIN
    Host H ON L.Host_Id = H.Host_Id
WHERE
    L.Property_Type = 'Apartment'
GROUP BY AP.Amenities_Id , AP.Listing_Id , A.Name , L.City , L.Allowed_Occupants , L.Property_Type



