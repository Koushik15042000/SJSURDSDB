#Get the average of prices per neighbourhood_group and room types.
SELECT 
    L.Neighbourhood_Group,
    L.Property_Type,
    ROUND(AVG(1B1B_Price), 1) 1Bed,
    ROUND(AVG(2B1B_Price), 1) 2and1Bed,
    ROUND(AVG(2B2B_Price), 1) 2and2Bed,
    ROUND(AVG(3B2B_Price), 1) 3and2Bed,
    ROUND(AVG(3B3B_Price), 1) 3and3Bed,
    ROUND(AVG(4B3B_Price), 1) 4and3Bed,
    ROUND(AVG(4B4B_Price), 1) 4and4Bed
FROM
    Listings L
GROUP BY L.Neighbourhood_Group , L.Property_Type , 1B1B_Price , 2B1B_Price , 2B2B_Price , 3B2B_Price , 3B3B_Price , 4B3B_Price , 4B4B_Price
ORDER BY L.Neighbourhood_Group

