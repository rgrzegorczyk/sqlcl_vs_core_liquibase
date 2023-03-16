-- *********************************************************************
--  Liquibase (standalone) LIVE DEMO
-- *********************************************************************
-- this instruction will allow you to prepare your database
-- or use files from /liquibase/ location  to run few example SQLcl Liquibase commands
-- *********************************************************************

### DEMO standalone LIQUIBASE - prepare objects ##
You need to have OCI or other database and tnsnames set for "rgatp28_low" (change as you want for your database).
Script will recreate DEV nad UAT schemas with grants, WITHOUT any objects.

sql /nolog
conn ADMIN@rgatp28_low
@demo/scripts/demo_liquibase.sql;

# disconnect SQLcl to run standalone Liquibase
# use "liquibase" when using standalone Liquibase
# configuration
--Liquibase for DEV is configured using liquibase.properties file
--for UAT it is configured in uat.properties

# execute all changesets from /liquibase/ folder at DEV
--run this having terminal in location /liquibase/
liquibase update

# execute all changesets from /liquibase/ folder at UAT
liquibase --defaults-file=uat.properties update

## change "update" to "updateSQL" to preview SQL that will be executed when you'll run "update"
## SQL output file is configured in "properties"

# synchronize all the changes from /database/
If you haven't run Liquibase before at DEV you can tell Liquibase:
"Hey, all those changes are already in my database, just mark them as executed but DO NOT EXECUTE anything on my DB"
It will only insert some rows into DATABASECHANGELOG table

liquibase changelog-sync

--to preview SQL
liquibase changelog-sync

# rollback few last changes
--it will rollback last executed 500 changes
liquibase rollback-count 500
# WARNING your last N changesets need to have rollbacks defined to make it work!


# preview last changes (will outpu query from DATABASECHANGELOG into preview file)
liquibase history

# tell me if I have any changes not executed
liquibase status

# validate if everything is set correctly
liquibase validate




