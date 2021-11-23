SELECT DC.CustId, DC.Name,
        COALESCE(SUM(FT.Quantity*FT.Price),0) AS Revenue,
        SUM(COALESCE(SUM(FT.Quantity*FT.Price),0)) OVER(ORDER BY DC.Name, DC.CustId) AS Accu,
        RANK () OVER (ORDER BY COALESCE(SUM(FT.Quantity*FT.Price),0) DESC) AS Rank
FROM Facttab FT
    RIGHT OUTER JOIN DCustomer DC USING(CSID)
GROUP BY DC.CustId, DC.Name
ORDER BY  DC.Name, DC.CustId;