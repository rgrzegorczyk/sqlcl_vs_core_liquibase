
  CREATE OR REPLACE EDITIONABLE TRIGGER "DEV"."SECURE_REGIONS" 
before insert or update or delete on regions
begin
   null;
end secure_regions;

/
ALTER TRIGGER "DEV"."SECURE_REGIONS" DISABLE;