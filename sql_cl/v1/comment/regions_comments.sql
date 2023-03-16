
   COMMENT ON COLUMN "DEV"."REGIONS"."REGION_ID" IS 'Primary key of regions table.';
   COMMENT ON COLUMN "DEV"."REGIONS"."REGION_NAME" IS 'Names of regions. Locations are in the countries of these regions.';
   COMMENT ON TABLE "DEV"."REGIONS"  IS 'Regions table that contains region numbers and names. Contains 4 rows; references with the Countries table.';