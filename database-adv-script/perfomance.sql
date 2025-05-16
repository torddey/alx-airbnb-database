EXPLAIN
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    u.user_id AS user_id,
    u.first_name,
    u.last_name,
    p.property_id AS property_id,
    p.name AS property_name,
    pay.payment_id,
    pay.amount,
    pay.payment_date
FROM
    BOOKING b
JOIN
    "USER" u ON b.user_id = u.user_id
JOIN
    PROPERTY p ON b.property_id = p.property_id
LEFT JOIN
    PAYMENT pay ON b.booking_id = pay.booking_id;