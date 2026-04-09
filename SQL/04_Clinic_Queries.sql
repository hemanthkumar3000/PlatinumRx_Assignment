SELECT sales_channel, SUM(amount) AS total_revenue
FROM clinic_sales
WHERE YEAR(datetime) = 2021
GROUP BY sales_channel;

SELECT c.uid, c.name, SUM(cs.amount) AS total_spent
FROM customer c
JOIN clinic_sales cs ON c.uid = cs.uid
WHERE YEAR(cs.datetime) = 2021
GROUP BY c.uid, c.name
ORDER BY total_spent DESC
LIMIT 10;

SELECT 
    m.month_no,
    IFNULL(s.revenue, 0) AS revenue,
    IFNULL(e.expense, 0) AS expense,
    IFNULL(s.revenue, 0) - IFNULL(e.expense, 0) AS profit,
    CASE
        WHEN IFNULL(s.revenue, 0) - IFNULL(e.expense, 0) > 0 THEN 'Profitable'
        ELSE 'Not-Profitable'
    END AS status
FROM
(
    SELECT 1 AS month_no UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION
    SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION
    SELECT 9 UNION SELECT 10 UNION SELECT 11 UNION SELECT 12
) m
LEFT JOIN (
    SELECT MONTH(datetime) AS month_no, SUM(amount) AS revenue
    FROM clinic_sales
    WHERE YEAR(datetime) = 2021
    GROUP BY MONTH(datetime)
) s ON m.month_no = s.month_no
LEFT JOIN (
    SELECT MONTH(datetime) AS month_no, SUM(amount) AS expense
    FROM expenses
    WHERE YEAR(datetime) = 2021
    GROUP BY MONTH(datetime)
) e ON m.month_no = e.month_no
ORDER BY m.month_no;
WITH clinic_profit AS (
    SELECT 
        c.city,
        c.cid,
        c.clinic_name,
        IFNULL(SUM(cs.amount), 0) - IFNULL((
            SELECT SUM(e.amount)
            FROM expenses e
            WHERE e.cid = c.cid
              AND MONTH(e.datetime) = 11
              AND YEAR(e.datetime) = 2021
        ), 0) AS profit
    FROM clinics c
    LEFT JOIN clinic_sales cs 
        ON c.cid = cs.cid
        AND MONTH(cs.datetime) = 11
        AND YEAR(cs.datetime) = 2021
    GROUP BY c.city, c.cid, c.clinic_name
),
ranked_clinics AS (
    SELECT *,
           RANK() OVER (PARTITION BY city ORDER BY profit DESC) AS rnk
    FROM clinic_profit
)
SELECT city, cid, clinic_name, profit
FROM ranked_clinics
WHERE rnk = 1;

WITH clinic_profit AS (
    SELECT 
        c.state,
        c.cid,
        c.clinic_name,
        IFNULL(SUM(cs.amount), 0) - IFNULL((
            SELECT SUM(e.amount)
            FROM expenses e
            WHERE e.cid = c.cid
              AND MONTH(e.datetime) = 11
              AND YEAR(e.datetime) = 2021
        ), 0) AS profit
    FROM clinics c
    LEFT JOIN clinic_sales cs 
        ON c.cid = cs.cid
        AND MONTH(cs.datetime) = 11
        AND YEAR(cs.datetime) = 2021
    GROUP BY c.state, c.cid, c.clinic_name
),
ranked_clinics AS (
    SELECT *,
           DENSE_RANK() OVER (PARTITION BY state ORDER BY profit ASC) AS rnk
    FROM clinic_profit
)
SELECT state, cid, clinic_name, profit
FROM ranked_clinics
WHERE rnk = 2;