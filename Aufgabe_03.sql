-- Aufgabe 3
-- Cost 14
SELECT month, year, SUM(quantity*price) AS total
FROM fact1_month
GROUP BY month, year
ORDER BY total DESC
FETCH FIRST 1 ROWS ONLY;

-- Cost 215
SELECT month, year, SUM(quantity*price) AS total
FROM fact1
GROUP BY month, year
ORDER BY total DESC
FETCH FIRST 1 ROWS ONLY;

-- Cost 214
SELECT to_char(o.orderdate, 'YYYY-MM'), SUM(op.totalprice) AS total
FROM orderposition op
    INNER JOIN orders o ON op.ordid = o.ordid
GROUP BY to_char(o.orderdate, 'YYYY-MM')
ORDER BY total DESC
FETCH FIRST 1 ROWS ONLY;

