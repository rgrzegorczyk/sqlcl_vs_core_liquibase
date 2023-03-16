rem cleans schemas DEV,UAT
rem run as ADMIN

--This script prepares database for SQLclLiquibase demo
--removes  everything on DEV and UAT schemas
--drop user DEV and UAT
--and create some objects on DEV
--!rm @@demo/scripts/log_demo.log
>! log_demo_sqlcl_liquibase.log

SET TERMOUT OFF
SET ECHO OFF
SET VERIFY OFF
SET TIMING ON
spool log_demo_sqlcl_liquibase.log
conn ADMIN/Qwerty12345$@rgatp28_low

--drops DEV and UAT
@@sql/drop_users.sql;
--creates DEV nad UAT users
@@sql/create_users.sql;
--by default creates objects at DEV schema
@@sql/create_objects.sql;


SET TERMOUT OFF
show user
spool off
