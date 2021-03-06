SELECT COALESCE(TO_CHAR(WEEK), 'All:'),
       COALESCE(TO_CHAR(ARTID), 'Week:'),
       COALESCE(TO_CHAR(NAME), 'Week:'),
       COALESCE(SUM(QUANTITY), 0)
FROM FACTTAB F
    RIGHT OUTER JOIN (
        SELECT DSID, WEEK
        FROM DDATE
        WHERE WEEK BETWEEN 201947 AND 201950
    ) D USING (DSID)
    PARTITION BY (WEEK)
    RIGHT OUTER JOIN (
        SELECT PSID, ARTID, NAME
        FROM DPRODUCT
        WHERE PRODGROUP = 'equipment'
    ) P USING (PSID)
GROUP BY GROUPING SETS ((ARTID, NAME, WEEK), (WEEK), ())
--GROUP BY ROLLUP(WEEK, (ARTID, NAME));