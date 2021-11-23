DROP MATERIALIZED VIEW Facttab_Cust_Month;

CREATE  MATERIALIZED VIEW Facttab_Cust_Month (
    CSID, Name, State, MSID, SalesVolume, Quantity
)
ENABLE QUERY REWRITE
AS  SELECT /*+ MV_MERGE */
        CSID, Name, State, Month, SUM(FT.Price*FT.Quantity), SUM(FT.Quantity)
    FROM Facttab FT
        INNER JOIN DCustomer DC USING(CSID)
        INNER JOIN DDate DD USING(DSID)
    GROUP BY CSID, Name, State, Month;