rem cleans schemas DEV,UAT
rem run as ADMIN

--This script prepares database for Liquibase standalone demo
--removes  users and everything on DEV and UAT schemas
--create users DEV and UAT, no objects, add required grants only
--objects will be created using SQL files in liqubase/database location
--clears existing log_demo.log
>! log_demo_standalone_liquibase.log

SET TERMOUT OFF
SET ECHO OFF
SET VERIFY OFF
SET TIMING ON
spool log_demo_standalone_liquibase.log
conn ADMIN/Qwerty12345$@rgatp28_low

--drops DEV and UAT
@@sql/drop_users.sql;
--creates DEV nad UAT users
@@sql/create_users.sql;


SET TERMOUT OFF
show user
spool off
