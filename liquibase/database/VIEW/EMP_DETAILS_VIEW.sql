--liquibase formatted sql
--changeset rgrzegorczyk:EMP_DETAILS_VIEW  runOnChange:true context:v2 labels:jira-4
--comment EMP_DETAILS_VIEW first version
create or replace view emp_details_view
as
   select c.country_name,
          r.region_name
     from countries c
     join regions r
       on c.region_id = r.region_id;
commit;




       