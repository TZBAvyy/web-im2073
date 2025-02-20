@echo off
SET MYSQL_HOME=C:\repo\mysql-8.4.4-winx64
SET PATH=%MYSQL_HOME%\bin;%PATH%

echo Starting MySQL server...
mysqld --console

pause