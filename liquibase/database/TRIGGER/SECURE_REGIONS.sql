--liquibase formatted sql
--changeset rgrzegorczyk:SECURE_REGIONS  runOnChange:true context:v2 labels:jira-4
--comment SECURE_REGIONS first version
create or replace trigger secure_regions
before insert or update or delete on regions
begin
   null;
end secure_regions;
/
alter trigger secure_regions disable;