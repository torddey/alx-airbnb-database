
--INNER JOIN SCRIPT--
SELECT 
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    u.first_name,
    u.last_name,
    u.email 
FROM 
    BOOKING b
INNER JOIN 
    "USER" u ON b.user_id = u.user_id;


--LEFT JOIN SCRIPT--
SELECT 
    p.property_id,
    p.name,
    p.description,
    r.review_id,
    r.user_id AS reviewer_id, --Alias the user_id from the REVIEW TABLE
    r.rating, 
    r.comment,
    r.created_at AS review_created_at
FROM 
    PROPERTY p 
LEFT JOIN      
    REVIEW r ON p.property_id = r.property_id
ORDER BY
    p.name ASC;

--FULL OUTER JOIN SCRIPT--
SELECT 
    u.user_id AS user_id,
    u.first_name,
    u.last_name,
    u.email,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date
FROM 
    "USER" u       
FULL OUTER JOIN
    BOOKING b ON u.user_id = b.user_id;


EXPLAIN ANALYZE SELECT b.*
FROM BOOKING b
WHERE b.user_id = 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14'; 