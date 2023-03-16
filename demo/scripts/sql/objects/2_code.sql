REM procedure and statement trigger to allow dmls during business hours:
create or replace procedure secure_dml
is
begin
   if TO_CHAR(SYSDATE, 'HH24:MI') not between '08:00' and '18:00'
      or TO_CHAR(SYSDATE, 'DY') in ('SAT', 'SUN')
   then
      RAISE_APPLICATION_ERROR(-20205,
                              'You may only make changes during normal office hours');
   end if;
end secure_dml;
/

create or replace trigger secure_countries
before insert or update or delete on countries
begin
   secure_dml;
end secure_countries;
/
alter trigger secure_countries disable;

create or replace trigger secure_regions
before insert or update or delete on regions
begin
   null;
end secure_regions;
/
alter trigger secure_regions disable;

commit;
