DROP DIMENSION Date_Dim;

CREATE DIMENSION Date_Dim
    LEVEL Day           IS DDate.SalesDate
    LEVEL Week          IS DDate.Week
    LEVEL WeekInYear    IS DDate.WeekInYear
    LEVEL Month         IS DDate.Month
    LEVEL MonthInYear   IS DDate.MonthInYear
    LEVEL Quarter       IS DDate.Quarter
    LEVEL QuarterInYear IS DDate.QuarterInYear
    LEVEL Year          IS DDate.Year
    
    HIERARCHY Week_rollup
        (Day CHILD OF Week CHILD OF Year)
    HIERARCHY Calendar_rollup
        (Day CHILD OF Month CHILD OF Quarter CHILD OF Year)
    
    ATTRIBUTE Week DETERMINES (WeekInYear)
    ATTRIBUTE Month DETERMINES (MonthInYear, Monthname)
    ATTRIBUTE Quarter DETERMINES (QuarterInYear)
    ;