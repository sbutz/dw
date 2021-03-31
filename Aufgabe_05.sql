-- Aufgabe 5.1
-- Cost 150
SELECT f.custid, c.name, SUM(f.price*f.quantity) AS total
FROM Mfact1 f
    INNER JOIN customer c ON c.cid = f.custid
GROUP BY f.custid, c.name
ORDER BY total DESC
FETCH FIRST 3 ROWS ONLY;

-- Aufgabe 5.2
-- Cost 145
SELECT f.artid, a.name, SUM(f.price*f.quantity) AS total
FROM Mfact1 f
    INNER JOIN article a ON a.aid = f.artid
WHERE f.custid IN (117, 6, 5)
GROUP BY f.artid, a.name
ORDER BY total DESC
FETCH FIRST 3 ROWS ONLY;

-- Aufgabe 5.3
-- Cost 150
SELECT f.artid, a.name, SUM(f.price*f.quantity) AS total
FROM Mfact1 f
    INNER JOIN article a ON a.aid = f.artid
GROUP BY f.artid, a.name
ORDER BY total DESC
FETCH FIRST 3 ROWS ONLY;

-- Aufgabe 5.4
-- Cost 148
SELECT f.custid, c.name, SUM(f.quantity) AS total
FROM Mfact1 f
    INNER JOIN customer c ON c.cid = f.custid
    INNER JOIN article a ON f.artid = a.aid
WHERE a.name LIKE '%Mountainbike%'
GROUP BY f.custid, c.name
ORDER BY total DESC
FETCH FIRST 3 ROWS ONLY;

-- Aufgabe 5.5
-- Cost 146
SELECT f.salesdate, SUM(f.quantity*f.price) AS total
FROM Mfact1 f
GROUP BY f.salesdate
ORDER BY total DESC
FETCH FIRST 3 ROWS ONLY;
    
-- Aufgabe 5.6
-- Cost 283
SELECT f.artid, a.name, SUM(f.quantity) AS total
FROM Mfact1 f
    INNER JOIN article a ON a.aid = f.artid
WHERE f.artid != 100013 AND EXISTS(
    SELECT 1
    FROM Mfact1 f1
    WHERE f1.orderid = f.orderid AND f1.artid = 100013
)
GROUP BY f.artid, a.name
ORDER BY total DESC
FETCH FIRST 3 ROWS ONLY;
