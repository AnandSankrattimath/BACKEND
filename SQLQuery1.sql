use anand;
if not exists (SELECT * from sysobjects where name='anand' and xtype='U') create table anand (name varchar(30))
