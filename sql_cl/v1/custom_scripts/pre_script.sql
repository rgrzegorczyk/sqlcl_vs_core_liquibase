--liquibase formatted sql
--changeset rgrzegorczyk:pre_regions_script  context:ALL labels:ALL
--comment  Custom script you would like to execute before creating/altering regions table
--rollback SELECT 1 FROM DUAL;
SELECT 1 FROM DUAL;