--TOTAL BOOKINGS MADE BY EACH USER (AGGREGATION)--
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    COUNT(b.booking_id) AS total_bookings
FROM 
    "USER" u 
JOIN 
    BOOKING b ON u.user_id = b.user_id 
GROUP BY
    u.user_id, u.first_name, u.last_name
ORDER BY 
    total_bookings ASC;


--PROPERTY RANKING (WINDOW FUNCTIONS)--
