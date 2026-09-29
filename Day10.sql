show databases;
use book_shop;
-- 1. Stroring String Text
create table friends (
     name varchar(10)
);

show tables;
desc friends;

insert into friends (name) values ('tom'), ('juan pablo'), ('james');
select * from friends;

-- When we want to store text of different size, in that case varchar is suitable.
-- In case of fixed size text like, abbreviations (HI, EN etc) in this case char is suitable

create table states (
     abbr char(2)
);

insert into states (abbr) values ('CA'), ('NY');
select * from states;

-- In case of char, if I store 'E' in states it will take a whitespace 'E ', something like this (CHAR HAS FIXED LENGTH)

-- 2. tinyint, int, smallint, mediumint, bigint
create table children (
    numbers tinyint
);

drop table if exists childer;
show tables;
desc children;

insert into children(numbers) values (2), (4);
select * from children;

-- tinyint stores values between -127 to 128. So same we have values of ranges for different types of number datatypes

-- In above way we can store number both negative and positive, but if we want that number is always positive then we cant add constraint as unsigned.
drop table children;
create table children (
    numbers tinyint unsigned
);
desc children;
insert into children(numbers) values (2), (4);
select * from children;
insert into children(numbers) values (0), (-4); -- this will throw error

-- 3. Decima Number
insert into children(numbers) values (80.3673), (4.6722);
select * from children; -- decimal number will be stored as 80, 4.

-- DECIMAL type -> DECIMAL(5,2) The maximum decimal can be upto 2 numbers and total no of digits will be 5 with the after decimal numbers.
create table products (
    price decimal(5,2)
);
show tables;
drop table products;
desc products;

-- when we exceed the number of digit after decimal it will truncate, but if we exceed the maximum size we get error

-- FLOAT and DOUBLE
-- stores larger number using less space but its comes at the cost of precision, so when high precision is needed we use float and double

-- 4. Dates and Times
-- a. DATE, stored date in format YYYY-MM-DD with no time
-- b. TIME, values with time but no date using format HH:MM:SS and it can store time or duration
-- c. DATETIME, values with date and time YYYY-MM-DD, HH:MM:SS

create table people (
    name varchar(50),
    birthdate date,
    birthtime time,
    birthdt datetime
);

desc people;
insert into people(name, birthdate, birthtime, birthdt) values
   ('shivam', '2004-05-14', '11:00:00', '2004-05-14 11:00:00'); 
   
   select * from people;
insert into people(name, birthdate, birthtime, birthdt) values
   ('piyush', '2004-04-17', '9:45:10', '2004-04-17 9:45:10'); -- 9 will be paded out to 09 
   
insert into people(name, birthdate, birthtime, birthdt) values
   ('juan', '2007-04-17', '9:45:15', '2007-04-17 9:45:15'); 
   
-- how to work with current date and time - we hav couple of built in functions
-- Three most important are CURDATE(), CURTIME() and NOW()
select curtime();
select curdate();
select now() as current_datetime;
select current_timestamp(); -- similar to now()

insert into people(name, birthdate, birthtime, birthdt) values
   ('shubham', current_date(), curtime(), current_timestamp()); 
select * from people;

-- some more useful date functions
-- a. If we want info from date stored into table
select name, birthdate , day(birthdate), dayofweek(birthdate), dayofyear(birthdate) from people; 
select name, birthdate , month(birthdate), monthname(birthdate) from people; 
select name, birthdate , week(birthdate) from people; 

select name, birthtime , monthname(birthtime) from people; -- this will not work, but will return current month for any row
select name, birthdt, year(birthdt), monthname(birthdt) from people; -- this will work as we have birthdt as DATETIME type
 
-- time functions
select name, birthtime, hour(birthtime), minute(birthtime), second(birthtime) from people; -- this functions also work with DATETIME type

-- FORMAT Dates
-- what if we date format to be 'April 11 1985'
select concat(monthname(birthdt), ' ',day(birthdt), ' ', year(birthdt)) as formatted_date from people;

-- instead use DATE_FORMAT() which comes with some specifier we need to remember
SELECT birthdate, date_format(birthdate, '%b') from people; -- %b gives appreviated months
SELECT birthdate, date_format(birthdate, '%a') from people; -- return the week at a particular date
SELECT birthdate, date_format(birthdate, '%d %a %b %D %e') from people; 

-- simarly we have TIME_FORMAT() function but its restriced to time but its not the case with the time
select birthdt, date_format(birthdt, '%r') from people;

-- DATE MATH Function, 
select birthdate, current_date(), datediff(curdate(), birthdt) as date_diff from people;  -- return no of days -> datediff(date1, date2) = date1-date2
select birthdate, current_date(), datediff(curdate(), birthdt) as date_diff from people;

select birthdate, current_date(), date_add(curdate(), interval 1 day) from people; -- add 1 day
select birthdate, current_date(), date_sub(curdate(), interval 1 day) from people; -- subtract 1 day
select birthdate, current_date(), date_sub(curdate(), interval 1 year) from people;
select birthdate, current_date(), date_sub(curdate(), interval 1 month) from people;

-- same we have timediff(), time_add() and time_sub()
select birthtime, current_time(), timediff(curtime(), birthtime) as time_diff from people;

-- we can actually do math using +, - etc operators
select now() - interval 18 year;
select name, birthdate, birthdate + interval 21 year from people;
select name, birthdate, year(birthdate + interval 21 year) as will_be_21_in from people;


-- TIMESTAMP, just like date time.. it takes less storage 
select now();
select timestamp('2026-09-30 04:00:03');

-- with timestamp also we can do bunch of operations using functions

create table captions (
    text varchar(150),
    created_at timestamp default current_timestamp -- or datetime function can be used
);

desc captions; 
insert into captions (text) values ('i love u'), ('beautiful');
select * from captions;

create table captions1 (
    text varchar(150),
    created_at timestamp default current_timestamp, -- or datetime function can be used
    updated_at timestamp on update current_timestamp -- whenever text changes the updated col will get updated 
);
insert into captions1 (text) values ('i love u'), ('beautiful');
select * from captions1;

set sql_safe_updates = 0;
update captions1 set text='I love u to' where text='i love u'; -- this will update evey row text
set sql_safe_updates = 1;



-- ASSIGNMENT
-- What's a good use case for CHAR?

-- Used for text that we know has a fixed length, e.g., State abbreviations, 
-- abbreviated company names, etc.
 
CREATE TABLE inventory (
    item_name VARCHAR(100),
    price DECIMAL(8,2),
    quantity INT
);
 
-- What's the difference between DATETIME and TIMESTAMP?

-- They both store datetime information, but there's a difference in the range, 
-- TIMESTAMP has a smaller range. TIMESTAMP also takes up less space. 
-- TIMESTAMP is used for things like meta-data about when something is created
-- or updated.


SELECT CURTIME();
 
SELECT CURDATE();
 
SELECT DAYOFWEEK(CURDATE());
SELECT DAYOFWEEK(NOW());
SELECT DATE_FORMAT(NOW(), '%w') + 1;
 
SELECT DAYNAME(NOW());
SELECT DATE_FORMAT(NOW(), '%W');
 
SELECT DATE_FORMAT(CURDATE(), '%m/%d/%Y');
 
SELECT DATE_FORMAT(NOW(), '%M %D at %h:%i');
 
CREATE TABLE tweets(
    content VARCHAR(140),
    username VARCHAR(20),
    created_at TIMESTAMP DEFAULT NOW()
);
 
INSERT INTO tweets (content, username) VALUES('this is my first tweet', 'coltscat');
SELECT * FROM tweets;
 
INSERT INTO tweets (content, username) VALUES('this is my second tweet', 'coltscat');
SELECT * FROM tweets;
