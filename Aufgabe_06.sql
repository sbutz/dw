-- Aufgabe 6a
SELECT f.Year, SUM(f.Price * f.Quantity)
FROM fact1_Month f
WHERE f.Month = 4
GROUP BY f.Year
ORDER BY f.YEAR;

-- Aufgabe 6b
SELECT c.cid, c.name, c.zip, c.place, SUM(f.Price * f.Quantity)
FROM customer c
    INNER JOIN fact1 f ON f.custid = c.cid
WHERE c.zip LIKE '9%'
GROUP BY c.cid, c.name, c.zip, c.place
ORDER BY c.name;

-- Aufgabe 6c
SELECT a.aid, a.name, SUM(f.quantity)
FROM article a
    INNER JOIN fact1_month f ON f.artid = a.aid
WHERE a.color = 'red' AND LOWER(a.name) LIKE LOWER('%bike%')
GROUP BY a.aid, a.name
ORDER BY a.name;