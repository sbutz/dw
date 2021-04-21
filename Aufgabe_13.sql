SELECT DP.ArtId AS artid, DP.Name AS name, COALESCE(SUM(FT.Quantity),0) AS quantity
FROM FactTab FT
    INNER JOIN (
        SELECT *
        FROM DDate
        WHERE Week = 201950
    ) DD USING (DSID)
    RIGHT OUTER JOIN DProduct DP USING(PSID)
WHERE DP.Prodgroup = 'equipment'
GROUP BY DP.ArtId, DP.Name
ORDER BY DP.ArtId, DP.Name;