--liquibase formatted sql
--changeset rgrzegorczyk:COUNTRIES  runOnChange:false context:v1 labels:jira-1
--comment COUNTRIES table
--rollback DROP table COUNTRIES CASCADE;
create table countries
    (country_id      char(2)
       constraint  country_id_nn not null,
      country_name    varchar2(40),
      region_id       number,
      constraint     country_c_id_pk
                primary key (country_id)
    );
comment on table countries
is 'country table. Contains 25 rows. References with locations table.';

comment on column countries.country_id
is 'Primary key of countries table.';

comment on column countries.country_name
is 'Country name';

comment on column countries.region_id
is 'Region ID for the country. Foreign key to region_id column in the departments table.';		