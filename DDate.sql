DROP TABLE DDate;

CREATE TABLE DDate (
    DSid            INTEGER PRIMARY KEY,
    SalesDate       DATE,
    Day             SMALLINT,
    Week            INT,
    WeekInYear      SMALLINT,
    Month           INT,
    MonthInYear     SMALLINT,
    MonthName       VARCHAR2(15),
    Quarter         INT,
    QuarterInYear   SMALLINT,
    Year            INT
);

DECLARE
    i INT := 0;
    startdate DATE := date'2000-01-01';
BEGIN
    WHILE startdate <= date'2039-12-31' LOOP
        INSERT INTO DDate (
            DSid, SalesDate, Day, Week, WeekInYear, Month, MonthInYear,
            MonthName, Quarter, QuarterInYear, Year)
        VALUES (
            i, startdate, to_char(startdate, 'DD'), to_char(startdate, 'YYYYIW'),
            to_char(startdate, 'IW'), to_char(startdate, 'YYYYMM'),
            to_char(startdate, 'MM'), to_char(startdate, 'Month'),
            to_char(startdate, 'YYYYQ'), to_char(startdate, 'Q'),
            to_char(startdate, 'YYYY')
            );
        i := i + 1;
        startdate := startdate + 1;
    END LOOP;
END;
