--liquibase formatted sql
--changeset rgrzegorczyk:SECURE_COUNTRIES  runOnChange:true   context:v2 labels:jira-4
--comment SECURE_COUNTRIES first version
create or replace trigger secure_countries
before insert or update or delete on countries
begin
   secure_dml;
end secure_countries;
/
alter trigger secure_countries disable;

