SELECT f.month, SUM(f.quantity) as total
FROM fact1 f
    INNER JOIN article a ON a.aid = f.artid
    INNER JOIN customer c ON c.cid = f.custid
WHERE f.year = 2018
    AND LOWER(a.name) LIKE LOWER('%bike%')
    AND c.place = 'Regensburg'
GROUP BY f.month
ORDER BY total DESC;
