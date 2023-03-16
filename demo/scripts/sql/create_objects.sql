SET ECHO OFF
SET VERIFY OFF

conn DEV/Qwerty12345$@rgatp28_low
ALTER SESSION SET NLS_LANGUAGE=American;
ALTER SESSION SET NLS_TERRITORY=America;


-- create tables, sequences and constraint
@@objects/1_structure.sql

-- procedures, triggers
@@objects/2_code.sql

-- dml, test data
@@objects/3_dml.sql

--connect again as ADMIN
conn ADMIN/Qwerty12345$@rgatp28_low
show user

/* Uncomment this to create objects on UAT
However it is not neccessary because it will be created using Liquibase

conn UAT/Qwerty12345$@rgatp28_low
ALTER SESSION SET NLS_LANGUAGE=American;
ALTER SESSION SET NLS_TERRITORY=America;

-- create tables, sequences and constraint
@@scripts/1_structure.sql

-- procedures, triggers
@@scripts/2_code.sql

-- dml, test data
@@scripts/3_dml.sql
*/