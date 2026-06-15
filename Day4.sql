show databases;
use shivampractise1;
select database();

-- get the details of the tables
show tables;
show columns from cats; 
desc cats;

-- INSERT
INSERT INTO cats(name, age) values ('Shivam', 22);
INSERT INTO cats(age, name) values (23, 'Rohit');
INSERT INTO cats(age, name) values (23, 'Rohit'), (26, 'Piyush');

-- SELECT
select * from cats;

-- Homework 
create table people(
    first_name varchar(100),
    last_name varchar(100),
    age int
);

show columns from people;
insert into people(first_name, last_name, age) values
('shivam', 'sharma', 22),
('shivam', 'kohli', 2),
('shivam', 'gupta', 22);

select * from people;
drop table people;

-- Working with NOTNULL
insert into cats(name) values ('aditya');
select * from cats;

insert into cats() values ();

create table cat1(
    name varchar(100) not null,
    age int not null
);
desc cat1;
insert into cat1(name) values ('shivam'); -- This will not work and say that age doesnt have default value
insert into cat1(name, age) values ('Piyush\'s cat', 23); -- add balckslash before the extra quote
select * from cat1;
insert into cat1(name, age) values ('Piyush\'s cat is "lucky"', 23);


-- Adding Default Values
select * from cats;
select * from cat1;
select * from cat2;

create table cat2(
    name varchar(20) default 'unnamed',
    age int default 26
);
insert into cat2(name) values ('shivam');
insert into cat2(age) values (26);

-- Introduction to PRIMARY KEY
create table cat3(
   cat_id int not null primary key,
   name varchar(20),
   age int
);
show tables;
desc cat4;

create table cat4(
    cat_id int auto_increment,
    name varchar(20),
    age int,
    primary key(cat_id)
);
insert into cat4() values ();
insert into cat4() values ();
insert into cat4() values ();
insert into cat4() values ();
select * from cat4;

insert into cat4(cat_id, name, age) values (4, 'shivam', 22); -- cat_id 4 always present so it will throw error as duplicate entry
insert into cat4(cat_id, name, age) values (5, 'shivam', 22); -- This works because 4 is not present

-- Homework 
create table employee(
    employee_id int primary key auto_increment,
    last_name varchar(20) not null,
    first_name varchar(20) not null,
    middle_name varchar(20),
    age int not null,
    current_status varchar(20) not null default 'employed'
);
desc employee
