SELECT b.user_id, b.room_no
FROM bookings b
JOIN (
    SELECT user_id, MAX(booking_date) AS last_booking
    FROM bookings
    GROUP BY user_id
) lb
ON b.user_id = lb.user_id AND b.booking_date = lb.last_booking;

SELECT b.booking_id, SUM(i.item_rate * bc.item_quantity) AS total_billing_amount
FROM bookings b
JOIN booking_commercials bc ON b.booking_id = bc.booking_id
JOIN items i ON bc.item_id = i.item_id
WHERE b.booking_date >= '2021-11-01'
  AND b.booking_date < '2021-12-01'
GROUP BY b.booking_id;

SELECT bc.bill_id, SUM(i.item_rate * bc.item_quantity) AS bill_amount
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
WHERE bc.bill_date >= '2021-10-01'
  AND bc.bill_date < '2021-11-01'
GROUP BY bc.bill_id
HAVING SUM(i.item_rate * bc.item_quantity) > 1000;

WITH item_monthly AS (
    SELECT 
        MONTH(bc.bill_date) AS month_no,
        i.item_name,
        SUM(bc.item_quantity) AS total_quantity
    FROM booking_commercials bc
    JOIN items i ON bc.item_id = i.item_id
    WHERE YEAR(bc.bill_date) = 2021
    GROUP BY MONTH(bc.bill_date), i.item_name
),
ranked_items AS (
    SELECT *,
           RANK() OVER (PARTITION BY month_no ORDER BY total_quantity DESC) AS most_rank,
           RANK() OVER (PARTITION BY month_no ORDER BY total_quantity ASC) AS least_rank
    FROM item_monthly
)
SELECT month_no, item_name, total_quantity,
       CASE
           WHEN most_rank = 1 THEN 'Most Ordered'
           WHEN least_rank = 1 THEN 'Least Ordered'
       END AS item_status
FROM ranked_items
WHERE most_rank = 1 OR least_rank = 1
ORDER BY month_no, item_status;

WITH customer_bills AS (
    SELECT 
        MONTH(bc.bill_date) AS month_no,
        u.user_id,
        u.name,
        bc.bill_id,
        SUM(i.item_rate * bc.item_quantity) AS bill_value
    FROM users u
    JOIN bookings b ON u.user_id = b.user_id
    JOIN booking_commercials bc ON b.booking_id = bc.booking_id
    JOIN items i ON bc.item_id = i.item_id
    WHERE YEAR(bc.bill_date) = 2021
    GROUP BY MONTH(bc.bill_date), u.user_id, u.name, bc.bill_id
),
ranked_bills AS (
    SELECT *,
           DENSE_RANK() OVER (PARTITION BY month_no ORDER BY bill_value DESC) AS bill_rank
    FROM customer_bills
)
SELECT month_no, user_id, name, bill_id, bill_value
FROM ranked_bills
WHERE bill_rank = 2
ORDER BY month_no;