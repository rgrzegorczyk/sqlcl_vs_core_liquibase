CREATE OR REPLACE FORCE EDITIONABLE VIEW "DEV"."EMP_DETAILS_VIEW" 
 ( "COUNTRY_NAME", "REGION_NAME"
  )  DEFAULT COLLATION "USING_NLS_COMP"  AS 
  select c.country_name,
          r.region_name
     from countries c
     join regions r
       on c.region_id = r.region_id