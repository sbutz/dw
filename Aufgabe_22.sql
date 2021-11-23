SELECT DP.Prodgroup, DC.Name,
        SUM(FT.Price*FT.Quantity) AS Revenue,
        TO_CHAR(100 * RATIO_TO_REPORT(SUM(FT.Price*FT.Quantity))
            OVER(PARTITION BY DP.Prodgroup), '90D99') AS Percent
FROM Facttab FT
    INNER JOIN (
        SELECT DSID
        FROM DDate
        WHERE Month = '201902'
    ) DD USING(DSID)
    RIGHT OUTER JOIN (
        SELECT CSID, Name
        FROM DCustomer
        WHERE State = 'Bayern'
    ) DC USING(CSID)
    PARTITION BY (CSID, Name) RIGHT OUTER JOIN DProduct DP USING (PSID)
GROUP BY DP.Prodgroup, DC.Name
ORDER BY DP.Prodgroup, DC.Name;
