-- Frage 1
SELECT DP.Name, DD.WeekInYear AS week, SUM(FT.Quantity) AS quantity
FROM FactTab FT
    INNER JOIN DDate DD USING(DSID)
    INNER JOIN DCustomer DC USING(CSID)
    INNER JOIN DProduct DP USING(PSID)
WHERE DP.Prodgroup = 'man bicycle'
    AND DD.Year = 2018
    AND DC.State = 'Hessen'
GROUP BY DP.Name, DD.WeekInYear
ORDER BY week, name;

-- Frage 2
SELECT DD.Quarter as quarter, SUM(FT.Quantity*FT.Price) AS Revenue,
    COALESCE(DC.State, 'Foregin Country') AS State
FROM FactTab FT
    INNER JOIN DDate DD USING(DSID)
    INNER JOIN DCustomer DC USING(CSID)
WHERE DD.Year = 2017
GROUP BY DD.Quarter, DC.State
ORDER BY quarter, State;