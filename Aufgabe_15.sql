SELECT FT.Week, DP.ArtId, DP.Name, COALESCE(SUM(FT.Quantity),0)
FROM (
    SELECT PSID, Quantity, Week
    FROM FactTab
        RIGHT OUTER JOIN DDate USING(DSID)
    WHERE WeekInYear BETWEEN 47 AND 50
        AND Year = 2019
    ) FT
    PARTITION BY (FT.Week)
    RIGHT OUTER JOIN DProduct DP USING(PSID)
WHERE DP.Prodgroup = 'equipment'
GROUP BY DP.ArtId, DP.Name, FT.Week
ORDER BY FT.Week, DP.ArtId, DP.Name;