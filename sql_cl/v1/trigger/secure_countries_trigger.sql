
  CREATE OR REPLACE EDITIONABLE TRIGGER "DEV"."SECURE_COUNTRIES" 
before insert or update or delete on countries
begin
   secure_dml;
end secure_countries;

/
ALTER TRIGGER "DEV"."SECURE_COUNTRIES" DISABLE;