--liquibase formatted sql
--changeset rgrzegorczyk:SECURE_DML  runOnChange:true context:v1 labels:jira-1
--comment Secure dml proc first version
create or replace procedure secure_dml
is
begin
   if TO_CHAR(SYSDATE, 'HH24:MI') not between '08:00' and '18:00'
      or TO_CHAR(SYSDATE, 'DY') in ('SAT', 'SUN')
   then
      RAISE_APPLICATION_ERROR(-20205,
                              'You may only make changes during normal office hours');
   end if;
end secure_dml;
/
