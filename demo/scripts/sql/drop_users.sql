rem run as ADMIN

SET ECHO OFF
SET VERIFY OFF

REM =======================================================
REM cleanup section
REM =======================================================

DROP USER DEV CASCADE;
purge recyclebin;

DROP USER UAT CASCADE;
purge recyclebin;