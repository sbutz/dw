DROP TABLE FactTab;
DROP SEQUENCE Seq_FactTab;

CREATE SEQUENCE Seq_FactTab;

CREATE TABLE FactTab (
    FId      INTEGER PRIMARY KEY,
    CSID     INTEGER NOT NULL REFERENCES DCustomer,
    DSID     INTEGER NOT NULL REFERENCES DDate,
    PSID     INTEGER NOT NULL REFERENCES DProduct,
    Quantity INTEGER NOT NULL CHECK (Quantity > 0),
    Price    NUMERIC(12,2) NOT NULL CHECK(Price > 0)
);

INSERT INTO FactTab
SELECT Seq_FactTab.nextval, CSID, DSID, PSID, OP.Quantity, OP.TotalPrice/OP.Quantity
FROM Orders O
    INNER JOIN Orderposition OP USING(OrdId)
    INNER JOIN DCustomer DC USING(CustId)
    INNER JOIN DDate DD ON DD.Salesdate = O.Orderdate
    INNER JOIN DProduct DP ON DP.ArtId = OP.ArtId;