-- *********************************************************************
-- SQLcl Liquibase LIVE DEMO
-- *********************************************************************
-- this instruction will allow you to prepare your database
-- or use files from /sql_cl/ location to run few example SQLcl Liquibase commands
-- *********************************************************************

### DEMO SQLcl Liquibase - prepare objects ##
You need to have OCI or other database and tnsnames set for "rgatp28_low" (change as you want for your database).
Script will recreate DEV nad UAT schemas with grants + sampole objects on DEV schema only, UAT remains empty.
"SQLcl>" is not a part of a command. It's just an indicator saying that this code should be run inside SQLcl

sql /nolog
conn ADMIN@rgatp28_low
@demo/scripts/demo_sqlcl.sql;

# using SQLcl you can use "lb" or "liquibase" to invoke Liquibase.
# use "liquibase" when using standalone Liquibase

# export DEV schema
cd sql_cl/v1

# remove everything inside v1 first
sql /nolog
SQLcl> conn DEV/Qwerty12345$@rgatp28_low
SQLcl> liquibase generate-schema --split --sql

# update UAT with schema exported from DEV
# your terminal should be in location /sql_cl/
sql /nolog
SQLcl> conn UAT/Qwerty12345$@rgatp28_low
SQLcl> lb update --changelog-file v1/controller.xml

# export APEX objects from DEV
SQLcl> conn DEV/Qwerty12345$@rgatp28_low
SQLcl> liquibase generate-apex-object -applicationid 200
# it will produce files controller.xml and f200.sql
# rename controller.xml -> f200.xml
# put file in liquibase/apex/


# rollback-count-sql (show me the script executing all changes from controller.xml changelog)
# rollbacks last 999 changes
liquibase rollback-count-sql --changelog-file controller.xml --count 999 --output-file test_rollback.sql


# READ MORE about SQLcl Liquibase
https://docs.oracle.com/en/database/oracle/sql-developer-command-line/22.4/sqcug/using-liquibase.html#GUID-4CA25386-E442-4D9D-B119-C1ACE6B79539



# Helpful SQL during demo
# as ADMIN
select owner, object_name, object_type
  from all_objects
 where owner in ('DEV', 'UAT')
 order by owner, object_type, object_name;

 # preview databasechangelog
select id,
       author,
       filename
       /*
       ,dateexecuted
		   ,md5sum
       ,description
       ,comments
       ,contexts
       ,labels
       */
  from  DEV.DATABASECHANGELOG;
  /*UAT.DATABASECHANGELOG;*/
