-- Aufgabe 2.1
-- Cost 217
SELECT f.custid, c.name, SUM(f.price*f.quantity) AS total
FROM fact1 f
    INNER JOIN customer c ON c.cid = f.custid
GROUP BY f.custid, c.name
ORDER BY total DESC
FETCH FIRST 3 ROWS ONLY;

-- Aufgabe 2.2
-- Cost 212
SELECT f.artid, a.name, SUM(f.price*f.quantity) AS total
FROM fact1 f
    INNER JOIN article a ON a.aid = f.artid
WHERE f.custid IN (117, 6, 5)
GROUP BY f.artid, a.name
ORDER BY total DESC
FETCH FIRST 3 ROWS ONLY;

-- Aufgabe 2.3
-- Cost 217
SELECT f.artid, a.name, SUM(f.price*f.quantity) AS total
FROM fact1 f
    INNER JOIN article a ON a.aid = f.artid
GROUP BY f.artid, a.name
ORDER BY total DESC
FETCH FIRST 3 ROWS ONLY;

-- Aufgabe 2.4
-- 215
SELECT f.custid, c.name, SUM(f.quantity) AS total
FROM fact1 f
    INNER JOIN customer c ON c.cid = f.custid
    INNER JOIN article a ON f.artid = a.aid
WHERE a.name LIKE '%Mountainbike%'
GROUP BY f.custid, c.name
ORDER BY total DESC
FETCH FIRST 3 ROWS ONLY;

-- Aufgabe 2.5
-- Cost 214
SELECT f.salesdate, SUM(f.quantity*f.price) AS total
FROM fact1 f
GROUP BY f.salesdate
ORDER BY total DESC
FETCH FIRST 3 ROWS ONLY;

-- Aufgabe 2.6
-- Cost 417
SELECT f.artid, a.name, SUM(f.quantity) AS total
FROM fact1 f
    INNER JOIN article a ON a.aid = f.artid
WHERE f.artid != 100013 AND EXISTS(
    SELECT 1
    FROM fact1 f1
    WHERE f1.orderid = f.orderid AND f1.artid = 100013
)
GROUP BY f.artid, a.name
ORDER BY total DESC
FETCH FIRST 3 ROWS ONLY;
