--liquibase formatted sql
--changeset rgrzegorczyk:REGIONS  runOnChange:false context:v1 labels:jira-1
--comment REGIONS table
create table regions
    (region_id      number
       constraint  region_id_nn not null,
      region_name    varchar2(25)
    );
comment on table regions
is 'Regions table that contains region numbers and names. Contains 4 rows; references with the Countries table.';

comment on column regions.region_id
is 'Primary key of regions table.';

comment on column regions.region_name
is 'Names of regions. Locations are in the countries of these regions.';

--changeset rgrzegorczyk:REGIONS_add_PK context:v1 labels:jira-1
--comment Added primary key
create unique index reg_id_pk
on regions (region_id);

alter table regions
add (constraint reg_id_pk
              primary key (region_id)
    );

--changeset john:REGIONS_add_col context:v1 labels:jira-3
--comment Added new column
alter table REGIONS add COUNTRY_NAME varchar2(50);

--changeset rgrzegorczyk:pre_column_modify context:v1 labels:jira-7
--preconditions onFail:MARK_RAN onError:CONTINUE onUpdateSQL:TEST
--precondition-sql-check expectedResult:1 select count(*) from regions where region_name is not null and rownum=1;
--comment Script to run before modifying column. Executed if column is not null. MARK RAN on error in case that 
/*Create backup column*/
alter table regions add region_name_backup varchar2(25);
/* Move data to backup column*/
update regions
   set region_name_backup = region_name
 where region_name is not null;
 /* Clear column that will be modified*/
update regions
   set region_name = null
 where region_name is not null;

--changeset rgrzegorczyk:REGIONS_modify_col context:v1 labels:jira-7
--preconditions onFail:CONTINUE onUpdateSQL:TEST
--precondition-sql-check expectedResult:0 select count(*) from regions where region_name is not null and rownum=1;
--comment Change region_name from varchar to number. Additonal precondition to be sure that column is empty
alter table regions modify region_name number;


