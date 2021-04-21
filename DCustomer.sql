DROP TABLE DCustomer;
DROP SEQUENCE Seq_DCustomer;

CREATE SEQUENCE Seq_DCustomer;

CREATE TABLE DCustomer (
    CSid    INTEGER PRIMARY KEY,
    CustId  INTEGER NOT NULL,
    Name    VARCHAR2(30) NOT NULL,
    Place   VARCHAR2(20) NOT NULL,
    State   VARCHAR(26),
    Country VARCHAR(30) NOT NULL
);

INSERT INTO DCustomer
SELECT Seq_DCustomer.nextval, CId, Name, Place, State,
    CASE
        WHEN Plz_State.State IS NOT NULL THEN 'Germany'
        ELSE 'Foreign Country'
    END AS Country
FROM Customer
    LEFT JOIN Plz_State ON Code = SUBSTR(Zip,1,2);