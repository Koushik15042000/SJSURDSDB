SELECT 
    B.Booking_ID,
    B.Customer_Id,
    B.Listing_Id,
    B.Payment_Id,
    B.Unit_Alloted,
    B.Price_Incurred,
    B.Booking_From,
    B.Booking_To,
    P.Payment_mode
FROM
    Bookings B
        INNER JOIN
    Payment P ON B.Booking_Id = P.Booking_Id
GROUP BY B.Booking_ID , B.Customer_Id , B.Listing_Id , B.Payment_Id , B.Unit_Alloted , B.Price_Incurred , B.Booking_From , B.Booking_To , P.Payment_mode
