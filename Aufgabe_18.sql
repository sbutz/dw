-- Facttab_Month
SELECT /*+REWRITE*/ SUM(FT.Quantity*FT.Price)
FROM Facttab FT
    INNER JOIN DDate DD USING(DSID)
GROUP BY DD.Month;

-- Facttab_Prodgroup
SELECT /*+REWRITE*/ SUM(FT.Quantity*FT.Price), DP.Prodgroup
FROM Facttab FT
    INNER JOIN DProduct DP USING(PSID)
GROUP BY DP.Prodgroup;

-- Facttab_Cust_Month
SELECT /*+REWRITE*/ DC.Name, DD.Month, SUM(FT.Quantity*FT.Price)
FROM Facttab FT
    INNER JOIN DCustomer DC USING(CSID)
    INNER JOIN DDate DD USING(DSID)
GROUP By DD.Month, DC.Name
ORDER BY DD.Month, DC.Name;