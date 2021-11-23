DROP MATERIALIZED VIEW Facttab_Prodgroup;

CREATE  MATERIALIZED VIEW Facttab_Prodgroup (
    CSID, ProdgrId, Prodgroup, Price, TotalPrice, Quantity
)
ENABLE QUERY REWRITE
AS  SELECT /*+ MV_MERGE */
        CSID, ProdgrId, Prodgroup, SUM(DP.Price), SUM(FT.Price*FT.Quantity), SUM(FT.Quantity)
    FROM Facttab FT
        INNER JOIN DProduct DP USING(PSID)
    GROUP BY CSID, ProdgrId, Prodgroup