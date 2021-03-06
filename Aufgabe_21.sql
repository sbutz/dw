ALTER SESSION SET QUERY_REWRITE_INTEGRITY = TRUSTED;

-- Date_Dim
SELECT /*+REWRITE*/ DD.Year, SUM(FT.Quantity*FT.Price)
FROM Facttab FT
    INNER JOIN DDate DD USING(DSID)
GROUP BY DD.Year
ORDER BY DD.Year;