-- DevOps Demo
drop database if exists ejgallo_prod;
drop database if exists ejgallo_prod_bak;
drop database if exists ejgallo_dev;
use role dba_citibike;
create or replace warehouse ejgallo_wh warehouse_size = 'small' auto_suspend = 300;
use warehouse ejgallo_wh;
create database if not exists ejgallo_prod;
create or replace schema devops_demo_schema;

grant all on database ejgallo_prod to role dba_citibike;
grant all on schema  devops_demo_schema to role dba_citibike;

use database ejgallo_prod;
use schema devops_demo_schema;

--Create a table in the Database Schema

create or replace table src_customer
as 
select top 1000000 *
from snowflake_sample_data.tpch_sf1000.customer;

alter table src_customer set 
change_tracking = true;
