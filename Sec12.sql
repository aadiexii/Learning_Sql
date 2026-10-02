show databases;
use book_shop;
-- More Contraints

show tables;
-- 1. Unique Constraint
create table contacts (
     name varchar(100) not null,
     phone varchar(15) not null unique
);

insert into contacts (name, phone) values 
    ('shivam', '9881316679');
    
select * from contacts;

insert into contacts (name, phone) values 
    ('piyush', '9881316679'); -- we will get an error as phone number should be unique for every row
    
-- 2. Check Constraint
create table parties (
    name varchar(50),
    age int check (age > 18)
);

insert into parties(name, age)
values ('shivam', 19);

insert into parties(name, age)
values ('shivam', 17); -- this will throw error - Check constraint 'parties_chk_1' is violated, as age should be > 18

select reverse('hello');

show tables;
create table palindrome (
    word varchar(100) check(reverse(word) = word)
);

insert into palindrome (word)
values ('hello');

insert into palindrome (word)
values ('olo');

select * from palindrome;

-- 3. Named Constraint --  A named constraint is just a constraint you give your own name using CONSTRAINT name, so you can easily drop or modify it later.
create table words (
    word varchar(50),
    line int,
    constraint word_min_length check(char_length(word) > 6)
);

select * from words;
insert into words (word, line) values 
    ('heythere', 1);
    
insert into words (word, line) values 
    ('hey', 1); -- Now error will display as -> Check constraint 'word_min_length' is violated.	
    
    
-- 4. Multi Column Checks
CREATE TABLE companies (
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    CONSTRAINT name_address UNIQUE (name , address) -- combination of name and address should be unique
);

insert into companies(name, address)
values ('shivam', 'migsun villasa');

select * from companies;

CREATE TABLE houses (
  purchase_price INT NOT NULL,
  sale_price INT NOT NULL,
  CONSTRAINT sprice_gt_pprice CHECK(sale_price >= purchase_price)
);
    
insert into houses(purchase_price, sale_price)
values (21, 22);

select * from houses;

insert into houses(purchase_price, sale_price)
values (22, 21);

-- 5. Alter table statements -- Basically we can add a contraint or remove a contraint from a table, basically this is where we use Alter
show tables;
desc companies;

select * from companies;

-- add column
alter table companies
add column phone_number varchar(15); -- new column named phone_number willl be added with all columns null because we have not mentioned not null

-- if we mention there, that the column should be not null the in case of string the default values will ve added there as an empty string
-- and in case of integer 0 will be added or we can add it by default using DEFAULT constraint

alter table companies
add column employee_count int not null;
select * from companies;

-- drop a table
alter table companies 
drop column phone_number;
select * from companies;
desc companies;


-- Renaming Tables
-- use RENAME TO .... rename a table
show tables;

rename table companies to categories; -- we can use directly use this sentence or with combination of alter and rename to 
show tables;

alter table categories rename to category;

-- Renaming Columns
-- use RENAME COLUMN to rename a column 
desc category;
alter table category
rename column employee_count to sex_count;
desc category;

-- modifying the existing column data type -> use MODIFY to change and existing columns type OR CHANGE(using change we can change the name of colmn and its contraints also)
desc category;

alter table category
modify sex_count varchar(10); 

alter table category
change address address varchar(255) not null default 'not known';

select * from category;
insert into category(name) values ('piyush');


-- alter table constraints
-- add constraint 
show tables;
desc houses;

select * from houses;

alter table houses
add constraint positive_pp check (purchase_price >= 0);

insert into houses(purchase_price, sale_price) 
values (-1, 22); -- this will not work as we have added contraint around pp

-- drop constraint
alter table houses
drop constraint positive_pp;

insert into houses(purchase_price, sale_price) 
values (-1, 22); -- now this will work

select * from houses;

-- There are many suct alter methods, can be studied from the docs

