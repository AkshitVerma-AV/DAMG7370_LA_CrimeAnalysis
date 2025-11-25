/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      QUIZ_NOV17_TEAM7.DM1
 *
 * Date Created : Monday, November 24, 2025 19:47:34
 * Target DBMS : Databricks
 */

/* 
 * TABLE: DIM_AREA_LAPD 
 */

CREATE TABLE DIM_AREA_LAPD
(
    AREA_KEY       int         NOT NULL,
    AREA_CODE      string      NOT NULL,
    AREA_NAME      string      NOT NULL,
    BUREAU_NAME    string      NOT NULL,
    CONSTRAINT PK3 PRIMARY KEY (AREA_KEY) 
)
;


/* 
 * TABLE: DIM_CRIME_LAPD 
 */

CREATE TABLE DIM_CRIME_LAPD
(
    CRIME_KEY            int         NOT NULL,
    CRM_CD_1             int         NOT NULL,
    CRM_CD_2             int         NOT NULL,
    CRM_CD_3             int         NOT NULL,
    CRM_CD_4             int         NOT NULL,
    CRM_CD_DESC          string      NOT NULL,
    PART_1_2             int         NOT NULL,
    CRIME_CATEGORY       string      NOT NULL,
    CRIME_SUBCATEGORY    string      NOT NULL,
    CONSTRAINT PK5 PRIMARY KEY (CRIME_KEY) 
)
;


/* 
 * TABLE: DIM_DATE_LAPD 
 */

CREATE TABLE DIM_DATE_LAPD
(
    DATE_KEY            int         NOT NULL,
    FULL_DATE           date        NOT NULL,
    YEAR                int         NOT NULL,
    QUARTER_NUMBER      int         NOT NULL,
    MONTH_NUMBER        int         NOT NULL,
    MONTH_NAME          string      NOT NULL,
    DAY_OF_MONTH        int         NOT NULL,
    DAY_OF_WEEK         int         NOT NULL,
    DAY_OF_WEEK_NAME    string      NOT NULL,
    CONSTRAINT PK1 PRIMARY KEY (DATE_KEY) 
)
;


/* 
 * TABLE: DIM_LOCATION_LAPD 
 */

CREATE TABLE DIM_LOCATION_LAPD
(
    LOCATION_KEY    int                 NOT NULL,
    RPT_DICT_NO     string              NOT NULL,
    AREA_KEY        int                 NOT NULL,
    LOCATION        string              NOT NULL,
    CROSS_STREET    string              NOT NULL,
    LAT             decimal(10, 6)      NOT NULL,
    LON             decimal(10, 6)      NOT NULL,
    CONSTRAINT PK4 PRIMARY KEY (LOCATION_KEY) 
)
;


/* 
 * TABLE: DIM_MODUS_OPERANDI_LAPD 
 */

CREATE TABLE DIM_MODUS_OPERANDI_LAPD
(
    MODUS_OPERANDI_KEY    int         NOT NULL,
    MO_CODE               string      NOT NULL,
    MO_DESC               string      NOT NULL,
    MO_TYPE               string      NOT NULL,
    CONSTRAINT PK2_1 PRIMARY KEY (MODUS_OPERANDI_KEY) 
)
;


/* 
 * TABLE: DIM_PREMISE_LAPD 
 */

CREATE TABLE DIM_PREMISE_LAPD
(
    PREMISE_KEY         int         NOT NULL,
    PREMIS_CD           int         NOT NULL,
    PREMIS_DESC         string      NOT NULL,
    PREMISE_CATEGORY    string      NOT NULL,
    CONSTRAINT PK7 PRIMARY KEY (PREMISE_KEY) 
)
;


/* 
 * TABLE: DIM_STATUS_LAPD 
 */

CREATE TABLE DIM_STATUS_LAPD
(
    STATUS_KEY     int         NOT NULL,
    STATUS_CODE    string      NOT NULL,
    STATUS_DESC    string      NOT NULL,
    CONSTRAINT PK9 PRIMARY KEY (STATUS_KEY) 
)
;


/* 
 * TABLE: DIM_TIME_LAPD 
 */

CREATE TABLE DIM_TIME_LAPD
(
    TIME_KEY     int         NOT NULL,
    HOUR         int         NOT NULL,
    MINUTE       int         NOT NULL,
    TIME_BAND    string      NOT NULL,
    CONSTRAINT PK2 PRIMARY KEY (TIME_KEY) 
)
;


/* 
 * TABLE: DIM_VICTIM_LAPD 
 */

CREATE TABLE DIM_VICTIM_LAPD
(
    VICTIM_KEY             int         NOT NULL,
    VICTIM_AGE_RAW         int         NOT NULL,
    VICTIM_AGE_GRP         string      NOT NULL,
    VICTIM_SEX             string      NOT NULL,
    VICTIM_DESCENT         string      NOT NULL,
    VICTIM_DESCENT_DESC    string      NOT NULL,
    CONSTRAINT PK8 PRIMARY KEY (VICTIM_KEY) 
)
;


/* 
 * TABLE: DIM_WEAPON_LAPD 
 */

CREATE TABLE DIM_WEAPON_LAPD
(
    WEAPON_KEY        int         NOT NULL,
    WEAPON_USED_CD    string      NOT NULL,
    WEAPON_DESC       string      NOT NULL,
    WEAPON_GROUP      string      NOT NULL,
    CONSTRAINT PK6 PRIMARY KEY (WEAPON_KEY) 
)
;


/* 
 * TABLE: FACT_CRIME_INCIDENT 
 */

CREATE TABLE FACT_CRIME_INCIDENT
(
    CRIME_INCIDENT_KEY    int         NOT NULL,
    AREA_KEY              int         NOT NULL,
    LOCATION_KEY          int         NOT NULL,
    CRIME_KEY             int         NOT NULL,
    VICTIM_KEY            int         NOT NULL,
    PREMISE_KEY           int         NOT NULL,
    STATUS_KEY            int         NOT NULL,
    WEAPON_KEY            int         NOT NULL,
    TIME_OCC_KEY          int         NOT NULL,
    DATE_RPT_KEY          int         NOT NULL,
    DATE_OCC_KEY          int         NOT NULL,
    MODUS_OPERANDI_KEY    int         NOT NULL,
    DR_NO                 string      NOT NULL,
    INCIDENT_COUNT        int         NOT NULL,
    CONSTRAINT PK10 PRIMARY KEY (CRIME_INCIDENT_KEY, AREA_KEY, LOCATION_KEY, CRIME_KEY, VICTIM_KEY, PREMISE_KEY, STATUS_KEY, WEAPON_KEY, TIME_OCC_KEY, DATE_RPT_KEY, DATE_OCC_KEY, MODUS_OPERANDI_KEY) 
)
;


/* 
 * TABLE: FACT_CRIME_INCIDENT 
 */

ALTER TABLE FACT_CRIME_INCIDENT ADD CONSTRAINT RefDIM_CRIME_LAPD7 
    FOREIGN KEY (CRIME_KEY)
    REFERENCES DIM_CRIME_LAPD
;

ALTER TABLE FACT_CRIME_INCIDENT ADD CONSTRAINT RefDIM_VICTIM_LAPD8 
    FOREIGN KEY (VICTIM_KEY)
    REFERENCES DIM_VICTIM_LAPD
;

ALTER TABLE FACT_CRIME_INCIDENT ADD CONSTRAINT RefDIM_PREMISE_LAPD9 
    FOREIGN KEY (PREMISE_KEY)
    REFERENCES DIM_PREMISE_LAPD
;

ALTER TABLE FACT_CRIME_INCIDENT ADD CONSTRAINT RefDIM_STATUS_LAPD10 
    FOREIGN KEY (STATUS_KEY)
    REFERENCES DIM_STATUS_LAPD
;

ALTER TABLE FACT_CRIME_INCIDENT ADD CONSTRAINT RefDIM_WEAPON_LAPD11 
    FOREIGN KEY (WEAPON_KEY)
    REFERENCES DIM_WEAPON_LAPD
;

ALTER TABLE FACT_CRIME_INCIDENT ADD CONSTRAINT RefDIM_MODUS_OPERANDI_LAPD25 
    FOREIGN KEY (MODUS_OPERANDI_KEY)
    REFERENCES DIM_MODUS_OPERANDI_LAPD
;

ALTER TABLE FACT_CRIME_INCIDENT ADD CONSTRAINT RefDIM_DATE_LAPD1 
    FOREIGN KEY (DATE_OCC_KEY)
    REFERENCES DIM_DATE_LAPD
;

ALTER TABLE FACT_CRIME_INCIDENT ADD CONSTRAINT RefDIM_DATE_LAPD3 
    FOREIGN KEY (DATE_RPT_KEY)
    REFERENCES DIM_DATE_LAPD
;

ALTER TABLE FACT_CRIME_INCIDENT ADD CONSTRAINT RefDIM_TIME_LAPD4 
    FOREIGN KEY (TIME_OCC_KEY)
    REFERENCES DIM_TIME_LAPD
;

ALTER TABLE FACT_CRIME_INCIDENT ADD CONSTRAINT RefDIM_AREA_LAPD5 
    FOREIGN KEY (AREA_KEY)
    REFERENCES DIM_AREA_LAPD
;

ALTER TABLE FACT_CRIME_INCIDENT ADD CONSTRAINT RefDIM_LOCATION_LAPD6 
    FOREIGN KEY (LOCATION_KEY)
    REFERENCES DIM_LOCATION_LAPD
;


