SELECT *
FROM (
         SELECT d.salesdate,
                SUM(f.price * f.quantity)                                  AS DailyRevenue,
                SUM(SUM(f.price * f.quantity)) OVER (PARTITION BY d.month ORDER BY d.salesdate) AS DailyAccum,
                AVG(SUM(f.price * f.quantity))
                    OVER (ORDER BY d.salesdate ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING)
                                                                           AS Accum3Rows,
                AVG(SUM(f.price * f.quantity))
                    OVER (ORDER BY d.salesdate RANGE BETWEEN 1 PRECEDING AND 1 FOLLOWING)
                                                                           AS Accum3Range
         FROM Facttab f
             INNER JOIN (
                 SELECT DSID, DDate.salesdate, month
                 FROM DDate
                 WHERE salesdate BETWEEN DATE'2018-12-31' AND DATE '2019-02-01'
             ) d USING (DSID)
                      INNER JOIN (
                 SELECT PSID
                 FROM DProduct
                 WHERE ProdgrId = 400
             ) p USING (PSID)
         GROUP BY d.salesdate, d.month
         ORDER BY d.salesdate
     )
    WHERE salesdate BETWEEN DATE'2019-01-01' AND DATE '2019-01-31';