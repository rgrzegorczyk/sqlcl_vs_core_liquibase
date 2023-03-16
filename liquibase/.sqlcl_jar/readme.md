# If you want to use standalone Liquibase and use changesets generated using SQLcl liquibase you need to have extension installed in your Liquibase environment

# Add the following jar files to the liquibase/lib folder:
dbtools-liquibase.jar
dbtools-apex.jar
guava-with-lf.jar
xmlparserv2_sans_jaxp_services.jar
dbtools-common.jar

## WARNING those files were taken from SQLcl version 22.4
## Check if there is a newer version released and copy never files.


# update your properties file by adding the following line:
change-exec-listener-class: liquibase.changelog.visitor.OracleActionChangeListener

# read more
https://docs.oracle.com/en/database/oracle/sql-developer-command-line/22.4/sqcug/using-liquibase.html#GUID-673321E9-1C06-4B9A-A373-52C2CB5AB7B0:~:text=upon%20capture%20completion.-,Deploy%20Objects,-Liquibase%20uses%20the

