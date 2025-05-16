--NON-CORRELATED SUBQUERY--
SELECT 
    p.property_id,
    p.name,
    p.description
FROM
    PROPERTY p  
WHERE 
    p.property_id IN (
        SELECT
            r.property_id
        FROM
            REVIEW r 
        GROUP BY
            r.property_id
        HAVING
            AVG(r.rating) > 4.0
    );


--CORRELATED SUBQUERY--
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM 
    "USER" u 
WHERE 
    (SELECT COUNT(b.booking_id)
    FROM BOOKING b
    WHERE b.user_id = u.user_id) > 3;