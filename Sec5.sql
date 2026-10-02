show databases;
use shivampractise1;
show tables;
drop table employee;
show tables;

create table cat(
    cat_id int auto_increment,
    name varchar(100),
    breed varchar(100),
    age int,
    primary key(cat_id)
);
create table cat1(
    cat_id int auto_increment,
    name varchar(100),
    breed varchar(100),
    age int,
    primary key(cat_id)
);
desc cat;

INSERT INTO cat(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);
INSERT INTO cat1(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);


-- READ
select * from cat;
select name from cat;
select age from cat;
select name, age from cat;


-- WHERE clause -> lets get specific
select * from cat where age=4;
select name, age from cat where age=4;
select name from cat where age=4; -- we done need age to be selected to work on where clause with age. 
select * from cat where name='Egg';
select * from cat where name='egg'; -- here even if we do keep e in egg lowercase then also it will work (case insensitive)

-- rapid fire exercices
select cat_id from cat;
select name, breed from cat;
select cat_id, age from cat where cat_id=age; -- cat_id and age where they both are equal


-- Alias (AS) -> easier to read results
select cat_id as ID, age from cat where cat_id=age;


-- UPDATE - How do we alter the existing table
SET SQL_SAFE_UPDATES = 0;
desc cat1; 
select * from cat1;

update cat1 set breed='gandu'; -- this will update all the breed names to gandu (Be carefull as we are updating without where clause)
update cat1 set breed='gandu', age=14;

select * from cat1;
update cat1 set age=15 where breed='Maine coon';

-- rapid fire exercice
update cat1 set name='Jack' where name='Jackson';
update cat1 set name='Ringo' where name='B Shorthair';
update cat1 set age=12 where name='Maine Coon';
update cat1 set cat_id=15 where cat_id=9;

-- DELETE - delete things (rows) in the table
delete from cat1; -- this wil delete and will remain table with no rows -- clear out tables
select * from cat1;

desc cat1;

delete from cat1 where name='egg';
delete from cat1 where age=4;
delete from cat1 where cat_id=age;
delete from cat1;