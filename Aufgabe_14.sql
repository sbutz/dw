SELECT FT.Salesdate, DP.ArtId, DP.Name, COALESCE(SUM(FT.Quantity),0)
FROM (
    SELECT PSID, Quantity, Salesdate
    FROM FactTab
        RIGHT OUTER JOIN DDate USING(DSID)
    WHERE Month = '201911'
    ) FT PARTITION BY (FT.Salesdate)
    RIGHT OUTER JOIN DProduct DP USING(PSID)
WHERE DP.Prodgroup = 'man bicycle'
GROUP BY FT.Salesdate, DP.ArtId, DP.Name
ORDER BY FT.Salesdate, DP.ArtId, DP.Name;
