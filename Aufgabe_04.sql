-- Aufgabe 4.1
-- Cost 217
SELECT f.custid, c.name, SUM(f.price*f.quantity) AS total
FROM Vfact1 f
    INNER JOIN customer c ON c.cid = f.custid
GROUP BY f.custid, c.name
ORDER BY total DESC
FETCH FIRST 3 ROWS ONLY;

-- Aufgabe 4.2
-- Cost 212
SELECT f.artid, a.name, SUM(f.price*f.quantity) AS total
FROM Vfact1 f
    INNER JOIN article a ON a.aid = f.artid
WHERE f.custid IN (117, 6, 5)
GROUP BY f.artid, a.name
ORDER BY total DESC
FETCH FIRST 3 ROWS ONLY;

-- Aufgabe 4.3
-- Cost 149
SELECT f.artid, a.name, SUM(f.price*f.quantity) AS total
FROM Vfact1 f
    INNER JOIN article a ON a.aid = f.artid
GROUP BY f.artid, a.name
ORDER BY total DESC
FETCH FIRST 3 ROWS ONLY;

-- Aufgabe 4.4
-- Cost 215
SELECT f.custid, c.name, SUM(f.quantity) AS total
FROM Vfact1 f
    INNER JOIN customer c ON c.cid = f.custid
    INNER JOIN article a ON f.artid = a.aid
WHERE a.name LIKE '%Mountainbike%'
GROUP BY f.custid, c.name
ORDER BY total DESC
FETCH FIRST 3 ROWS ONLY;

-- Aufgabe 4.5
-- Cost 214
SELECT f.salesdate, SUM(f.quantity*f.price) AS total
FROM Vfact1 f
GROUP BY f.salesdate
ORDER BY total DESC
FETCH FIRST 3 ROWS ONLY;

-- Aufgabe 4.6
-- Cost 150
SELECT f.artid, a.name, SUM(f.quantity) AS total
FROM Vfact1 f
    INNER JOIN article a ON a.aid = f.artid
WHERE f.artid != 100013 AND EXISTS(
    SELECT 1
    FROM Vfact1 f1
    WHERE f1.ordid = f.ordid AND f1.artid = 100013
)
GROUP BY f.artid, a.name
ORDER BY total DESC
FETCH FIRST 3 ROWS ONLY;

-- Cost 1199
SELECT month, year, SUM(quantity*price) AS total
FROM Vfact1_month
GROUP BY month, year
ORDER BY total DESC
FETCH FIRST 1 ROWS ONLY;

