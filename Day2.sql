---- Day2 was about deep diving into commands select, where, as, distinct, as, order by asc/desc, limit.


CREATE TABLE countries(
  id int primary key auto_increment,
  country varchar(65) not null,
  population bigint null,
  area int not null,
  region varchar(64) not null
)

insert into countries (country, population, area, region) values 
('India', 230000, 2000, 'New Delhi'),
('Pakistan', 23000, 200, 'Karachi'),
('Russia', 2300000, 20000, 'Dagestan'),
('USA', 20000, 2300, 'New York');

-- select and from
select * from countries
select id as primary_id, country as country_name from countries
  
-- from and comparision, logical, arithmetic operators
-- comparision
select * from countries where region = 'New York'
select * from countries where region <> 'New York'
select id as primary_id, country as country_name from countries where area > 200
-- logical
select id as primary_id, country as country_name from countries where area > 200 AND population > 23000
select id as primary_id, country as country_name from countries where not(region = 'New Delhi')
-- use paranthesis when we there are complex operations
select id as primary_id, country as country_name from countries where 
(region = 'New York' or region = 'New Delhi') and population > 100
-- arthmetic
select 10 + 5 as result -- Can be used without any table
select country, area * 2 as area_square from countries
select country, population/area as density from countries -- we have to be careful that here area cant be zero

insert into countries (country, population, area, region) value
('Test', 230000, 0, 'Test-data');
select country, population/area as density from countries;
show warnings -- this shows warning as Devision by zero so to handle this we use NULLIF
select country, population/ nullif(area, 0) as density from countries;
show warnings -- no warnings will be shown

-- order by and limit
select country, area from countries
order by area desc
select country, area from countries
order by area asc
limit 4
-- if area is tie and and we want sort it by population then we will introduce second parameter
select country, area, population from countries
order by area asc, population desc
limit 2

-- distinct and as
insert into countries (country, population, area, region) value
('Test1', 20000, 200, 'Test-data1'),
('Test2', 230000, 2300, 'Test-data2');
select distinct area as area_name from countries
order by area asc