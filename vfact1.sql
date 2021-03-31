DROP VIEW VFact1;
CREATE VIEW VFact1 (ArtId, CustId, OrdId, SalesDate, Price, Quantity)
AS SELECT ArtId, CustId, OrdId, OrderDate, Totalprice/Quantity, Quantity
   FROM Orders 
       NATURAL INNER JOIN  Orderposition;
