--liquibase formatted sql
--changeset rgrzegorczyk:APPLICATION_PARAMS runOnchange:false  context:v1 labels:jira-1
--comment APPLICATION_PARAMS table
create table application_params
    (code varchar2(50),
      value    varchar2(500)
    );

--changeset michael:APP_PARAMS_add_col_description runOnChange:false  context:v1 labels:jira-2
--comment  Added column description
ALTER TABLE APPLICATION_PARAMS ADD DESCRIPTION VARCHAR2(500);
















   