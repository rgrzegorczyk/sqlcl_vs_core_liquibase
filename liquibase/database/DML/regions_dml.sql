--liquibase formatted sql
--changeset rgrzegorczyk:intial_REGIONS_dml  runOnChange:false context:v1 labels:jira-1
--comment insert into regions. It won't work because we changed region_name datatype
truncate table regions;
insert into regions(region_id, region_name)
values
(1,
   'Europe'
);

insert into regions(region_id, region_name)
values
(2,
   'Americas'
);

insert into regions(region_id, region_name)
values
(3,
   'Asia'
);

insert into regions(region_id, region_name)
values
(4,
   'Middle East and Africa'
);
