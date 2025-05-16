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
WITH PropertyBookingCounts AS (
    SELECT
        p.property_id,
        p.name,
        COUNT(b.booking_id) AS total_bookings
    FROM 
        PROPERTY p 
    LEFT JOIN
        BOOKING b ON p.property_id = b.property_id
    GROUP BY
        p.property_id, p.name
)
SELECT
    property_id,
    name,
    total_bookings,
    ROW_NUMBER() OVER (ORDER BY total_bookings DESC) AS row_num_rank,
    RANK() OVER (ORDER BY total_bookings DESC) AS rank_num
FROM 
    PropertyBookingCounts
ORDER BY 
    total_bookings DESC;