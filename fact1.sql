DROP TABLE Fact1;

CREATE TABLE Fact1 (
	FId	INTEGER Constraint PK_Fact1	PRIMARY KEY,
	ArtId	INTEGER	Constraint PK_Fact1_A	REFERENCES Article,
	CustId	INTEGER	Constraint PK_Fact1_C	REFERENCES Customer,
	OrderId	INTEGER	Constraint PK_Fact1_O	REFERENCES Orders,
	SalesDate DATE,
	Year	INTEGER,
	Month	INTEGER,
	Price	Numeric(10,2),
	Quantity SMALLINT
);


--TODO: insert befehl, sequence
