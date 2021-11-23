DROP INDEX I_Facttab_PSID;
CREATE BITMAP INDEX I_Facttab_PSID ON Facttab (PSID);

DROP INDEX I_Facttab_CSID;
CREATE BITMAP INDEX I_Facttab_CSID ON Facttab (CSID);

DROP INDEX I_Facttab_DSID;
CREATE BITMAP INDEX I_Facttab_DSID ON Facttab (DSID);