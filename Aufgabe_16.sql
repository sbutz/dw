-- Aufgabe 14 ohne Partition By
SELECT DD.Salesdate, DP.ArtId, DP.Name, COALESCE(SUM(FT.Quantity),0)
FROM FactTab FT
    RIGHT OUTER JOIN (
        (
            SELECT DSID, Salesdate
            FROM DDate
            WHERE Month = '201911'
        ) DD
        CROSS JOIN
        (
            SELECT PSID, ArtId, Name
            FROM DProduct
            WHERE ProdgrId = 100
        ) DP
    ) USING (DSID, PSID)
GROUP BY DD.Salesdate, DP.ArtId, DP.Name
ORDER BY DD.Salesdate, DP.ArtId, DP.Name;

-- Aufgabe 15 ohne Partition By
SELECT DD.WeekInYear, DP.ArtId, DP.Name, COALESCE(SUM(FT.Quantity),0)
FROM FactTab FT
    RIGHT OUTER JOIN (
        (
            SELECT DSID, WeekInYear
            FROM DDate
            WHERE Week BETWEEN 201947 AND 201950
        ) DD
        CROSS JOIN
        (
            SELECT PSID, ArtId, Name
            FROM DProduct
            WHERE ProdgrId = 500
        ) DP
    ) USING (DSID, PSID)
GROUP BY DD.WeekInYear, DP.ArtId, DP.Name
ORDER BY DD.WeekInYear, DP.ArtId, DP.Name;