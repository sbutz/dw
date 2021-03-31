-- Aufgabe 2.1
SELECT c.cid, c.name, SUM (op.totalprice)
FROM customer c
    INNER JOIN orders o ON o.custid = c.cid
    INNER JOIN orderposition op ON o.ordid = op.ordid
GROUP BY c.cid, c.name
ORDER BY SUM(op.totalprice) DESC
FETCH FIRST 3 ROWS ONLY;

-- Aufgabe 2.2
SELECT a.aid, a.name, SUM(op.totalprice)
FROM customer c
    INNER JOIN orders o ON o.custid = c.cid
    INNER JOIN orderposition op ON o.ordid = op.ordid
    INNER JOIN article a ON a.aid = op.artid
WHERE c.cid IN (117, 6, 5)
GROUP BY a.aid, a.name
ORDER BY SUM(op.totalprice) DESC
FETCH FIRST 3 ROWS ONLY;

-- Aufgabe 2.3
SELECT a.aid, a.name, SUM(op.totalprice)
FROM article a
    INNER JOIN orderposition op ON op.artid = a.aid
GROUP BY a.aid, a.name
ORDER BY SUM(op.totalprice) DESC
FETCH FIRST 3 ROWS ONLY;

-- Aufgabe 2.4
SELECT c.cid, c.name, SUM (op.quantity)
FROM customer c
    INNER JOIN orders o ON o.custid = c.cid
    INNER JOIN orderposition op ON o.ordid = op.ordid
    INNER JOIN article a ON a.aid = op.artid
WHERE a.name LIKE '%Mountainbike%'
GROUP BY c.cid, c.name
ORDER BY SUM (op.quantity) DESC
FETCH FIRST 3 ROWS ONLY;

-- Aufgabe 2.5
SELECT o.orderdate, SUM(op.totalprice)
FROM orders o
    NATURAL INNER JOIN orderposition op
GROUP BY o.orderdate
ORDER BY SUM(op.totalprice) DESC
FETCH FIRST 3 ROWS ONLY;

-- Aufgabe 2.6
SELECT a.aid, a.name, SUM(op1.quantity)
FROM article a
    INNER JOIN orderposition op1 ON op1.artid = a.aid
    INNER JOIN orders o ON o.ordid = op1.ordid
    INNER JOIN orderposition op2 ON op2.ordid = o.ordid AND op2.artid = 100013
WHERE a.aid != 100013
GROUP BY a.aid, a.name
ORDER BY SUM(op1.quantity) DESC
FETCH FIRST 3 ROWS ONLY;
