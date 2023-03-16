--liquibase formatted sql
--changeset rgrzegorczyk:countr_reg_fk  runOnChange:false context:v2 labels:jira-4
--comment Added FK to regions table
alter table countries
add (constraint countr_reg_fk
            foreign key (region_id)
               references regions(region_id)
    );