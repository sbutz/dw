-- WIP: Lag/Lead braucht man noch
SELECT DC.CustId, DC.Name,
    COALESCE(SUM(FT.Quantity*FT.Price),0) AS Revenue
FROM Facttab FT
    INNER JOIN (
        SELECT * FROM DDate WHERE MonthInYear = 1 AND YEAR IN (2019)
    ) DD USING (DSID)
    RIGHT OUTER JOIN DCustomer DC USING(CSID)
GROUP BY DC.CustId, DC.Name
ORDER BY DC.CustId, DC.Name;