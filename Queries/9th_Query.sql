# Get the relationships between prices and minimum_nights
SELECT 
    L.Min_Booking_Days,
    L.Property_Type,
    ROUND(AVG(L. 1B1B_Price), 1) 1Bed,
    ROUND(AVG(L. 2B1B_Price), 1) 2and1Bed,
    ROUND(AVG(L. 2B2B_Price), 1) 2and2Bed,
    ROUND(AVG(L. 3B2B_Price), 1) 3and2Bed,
    ROUND(AVG(L. 3B3B_Price), 1) 3and3Bed,
    ROUND(AVG(L. 4B3B_Price), 1) 4and3Bed,
    ROUND(AVG(L. 4B4B_Price), 1) 4and4Bed
FROM
    Listings L
        INNER JOIN
    Reviews R ON L.Listings_Id = R.Listing_Id
GROUP BY L.Min_Booking_Days , L.Property_Type , L. 1B1B_Price , L. 2B1B_Price , L. 2B2B_Price , L. 3B2B_Price , L. 3B3B_Price , L. 4B3B_Price , L. 4B4B_Price
