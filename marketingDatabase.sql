show databases;

create database Mkt;

use Mkt;

show tables;
describe region;
select * from region;

create table region(
city varchar(50) primary key,
country char(20) default "India" check (country in ("India"))
);

drop table if exists dataC;
drop table if exists `marketing data-mysql - marketing`;

rename table `marketing data-mysql - marketing` to dataC;

create table dataC(
name varchar(40),
mno bigint primary key,
desg varchar(20) check (desg in ("Executives", "Middle Management", "Sr. Management")));

-- alter table dataC modify mno bigint ;
-- constraint mno_ft check (mno REGEXP '^[0-9]{12}');

alter table dataC
add column pCat varchar(20) check (pCat in ("Cars", "Tractors", "Trailers", "Truck", "Others")) not null,
add column religion varchar(20) check (religion in ("Christian", "Hindu", "Muslim", "Sikh")) ,
add column src varchar(20) check (src in("Exhibition", "Old Data")) ,
add column label varchar(20) check (label in ("India - Local", "India - OEM", "India - Other", "India - Shop")) not null,
add column city varchar(50);
-- add foreign key (city) references region(city) ;

alter table dataC 
modify name varchar(40),
modify mno bigint primary key;

alter table dataC
modify desg varchar(20) check (desg in ("Executives", "Middle Management", "Sr. Management")),
modify pCat varchar(20) check (pCat in ("Cars", "Tractors", "Trailers", "Truck", "Others")) not null,
modify religion varchar(20) check (religion in ("Christian", "Hindu", "Muslim", "Sikh")) ,
modify src varchar(20) check (src in("Exhibition", "Old Data")) ,
modify label varchar(20) check (label in ("India - Local", "India - OEM", "India - Other", "India - Shop")) not null,
modify city varchar(50),
add foreign key (city) references region(city) ;


describe dataC;
select * from dataC;
select count(*) from dataC;
select * from dataC where mno like '%919818912772%';
select * from dataC where pCat like '%Cars%';
select * from dataC where city like '%Karnal%';

SELECT * FROM dataC WHERE religion NOT IN ("Christian", "Hindu", "Muslim", "Sikh");
update dataC set religion = "Hindu" WHERE religion NOT IN ("Christian", "Hindu", "Muslim", "Sikh");

SELECT count(*) FROM dataC WHERE desg not in ("Executives", "Middle Management", "Sr. Management");
update dataC set desg = "Executives" where desg not in ("Executives", "Middle Management", "Sr. Management");

delete from dataC where mno = 919488222611;

insert into dataC(mno,  pCat, label, city) values (
919818912772, "Cars", "India - Local", "Karnal");


