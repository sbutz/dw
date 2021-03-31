DROP TABLE Fact1_Month;
DROP SEQUENCE SEQ_Fact1m;

CREATE SEQUENCE SEQ_Fact1m;
CREATE TABLE Fact1_Month(
	MId      INTEGER Constraint PK_Fact1m	PRIMARY KEY,
	ArtId	 INTEGER Constraint PK_Fact1m_A	REFERENCES Article,
	Year	 INTEGER,
	Month	 INTEGER,
	Price	 NUMERIC(10,2),
	Quantity SMALLINT
);

INSERT INTO Fact1_Month (MId, ArtId, Year, Month, Price, Quantity)
SELECT SEQ_Fact1m.nextval, MT.*
FROM (
    SELECT a.aid, to_char(o.orderdate, 'YYYY'),
        to_char(o.orderdate, 'MM'), a.price, SUM(op.quantity)
    FROM article a
        INNER JOIN orderposition op ON op.artid = a.aid
        INNER JOIN orders o ON o.ordid = op.ordid
    GROUP BY a.aid, a.price, to_char(o.orderdate, 'YYYY'),
        to_char(o.orderdate, 'MM')
) MT;
