-- MFact1
DROP MATERIALIZED VIEW MFact1;
CREATE MATERIALIZED VIEW MFact1 (ArtId, CustId, OrderId,  SalesDate, Price,
    Quantity)
REFRESH COMPLETE
    START WITH SYSDATE+2/24
    NEXT       ROUND(SYSDATE+1) + 1/24
AS SELECT ArtId, CustId, OrdId, OrderDate, Totalprice/Quantity, Quantity
FROM Orders
    NATURAL INNER JOIN  Orderposition;
