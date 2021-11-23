DROP MATERIALIZED VIEW Facttab_Month;

CREATE  MATERIALIZED VIEW Facttab_Month (PSid, Name, MSid, SalesVolume, Quantity)
ENABLE QUERY REWRITE
AS  SELECT /*+ MV_MERGE */
        PSid, Name, Month, SUM(Facttab.Price*Quantity), SUM(Quantity) 
    FROM Facttab
        INNER JOIN DDate USING(DSid)
        INNER JOIN DProduct USING(PSid)
    GROUP BY  PSid, Name, Month ;