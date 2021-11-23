DROP TABLE DProduct;
DROP SEQUENCE Seq_DProduct;

CREATE SEQUENCE Seq_DProduct;

CREATE TABLE DProduct (
    PSid        INTEGER PRIMARY KEY,
    ArtId       INTEGER NOT NULL,
    Name        VARCHAR2(35) NOT NULL,
    ProdgrId    INTEGER NOT NULL CHECK (ProdgrId IN (100,200,300,400,500,600)),
    Prodgroup   VARCHAR2(25) NOT NULL CHECK (Prodgroup IN ('man bicycle', 'lady bicycle',
                                            'juvenile bicycle', 'mountainbike',
                                            'equipment', 'intermediate equipment')),
    Color       VARCHAR2(10),
    Price       NUMERIC(10,2) NOT NULL
)
PARTITION BY LIST ( ProdgrId )
(
    PARTITION BIKES VALUES (100, 200, 300, 400),
    PARTITION EQUIPMENT VALUES (500, 600),
    PARTITION OTHER VALUES (DEFAULT)
);

INSERT INTO DProduct
SELECT Seq_DProduct.nextval, AId, Name,
    CASE
        WHEN LOWER(Name) LIKE '%man%bike%'      THEN 100
        WHEN LOWER(Name) LIKE '%woman%bike%'     THEN 200
        WHEN LOWER(Name) LIKE '%juvenile%bike%' THEN 300
        WHEN LOWER(Name) LIKE '%mountainbike%'  THEN 400
        WHEN AId > 500000                       THEN 500
        WHEN AId BETWEEN 200000 AND 500000      THEN 600
    END AS ProdgrId,
    CASE
        WHEN LOWER(Name) LIKE '%man%bike%'      THEN 'man bicycle'
        WHEN LOWER(Name) LIKE '%woman%bike%'     THEN 'lady bicycle'
        WHEN LOWER(Name) LIKE '%juvenile%bike%' THEN 'juvenile bicycle'
        WHEN LOWER(Name) LIKE '%mountainbike%'  THEN 'mountainbike'
        WHEN AId > 500000                       THEN 'equipment'
        WHEN AId BETWEEN 200000 AND 500000      THEN 'intermediate equipment'
    END AS Prodgroup,
    Color,
    Price
FROM Article;
        
            
UPDATE DProduct
SET prodgrid = 200, prodgroup = 'lady bicycle'
WHERE lower(name) like '%woman%bike%';
