REM ********************************************************************
REM Create the REGIONS table to hold region information for locations
REM HR.LOCATIONS table has a foreign key to this table.

create table regions
    (region_id      number
       constraint  region_id_nn not null,
      region_name    varchar2(25)
    );

create unique index reg_id_pk
on regions (region_id);

alter table regions
add (constraint reg_id_pk
              primary key (region_id)
    );

create table countries
    (country_id      char(2)
       constraint  country_id_nn not null,
      country_name    varchar2(40),
      region_id       number,
      constraint     country_c_id_pk
                primary key (country_id)
    );

alter table countries
add (constraint countr_reg_fk
            foreign key (region_id)
               references regions(region_id)
    );

create table application_params
    (code varchar2(50),
      value    varchar2(500)
    );

create or replace view emp_details_view
as
   select c.country_name,
          r.region_name
     from countries c
     join regions r
       on c.region_id = r.region_id;
commit;

comment on table regions
is 'Regions table that contains region numbers and names. Contains 4 rows; references with the Countries table.';

comment on column regions.region_id
is 'Primary key of regions table.';

comment on column regions.region_name
is 'Names of regions. Locations are in the countries of these regions.';

comment on table countries
is 'country table. Contains 25 rows. References with locations table.';

comment on column countries.country_id
is 'Primary key of countries table.';

comment on column countries.country_name
is 'Country name';

comment on column countries.region_id
is 'Region ID for the country. Foreign key to region_id column in the departments table.';
commit;
