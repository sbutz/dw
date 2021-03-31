-- VFact1_Month
DROP VIEW VFact1_Month;
CREATE VIEW VFact1_Month (ArtId, Year, Month, Price, Quantity)
AS SELECT a.aid, to_char(o.orderdate, 'YYYY'),
        to_char(o.orderdate, 'MM'), a.price, SUM(op.quantity)
   FROM article a
        INNER JOIN orderposition op ON op.artid = a.aid
        INNER JOIN orders o ON o.ordid = op.ordid
   GROUP BY a.aid, a.price, to_char(o.orderdate, 'YYYY'),
        to_char(o.orderdate, 'MM');
