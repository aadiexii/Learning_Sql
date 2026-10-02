-- Day1 was about learning basic command like create, use, drop etc.

CREATE TABLE IF NOT exists users (
  user_id int,
  user_name varchar(30),
  email varchar(30),
  is_active boolean,
  account_balance decimal,
  signup_dataTime datetime,
  last_seen datetime
)
  
CREATE TABLE IF NOT exists users1 (
  user_id int,
  user_name varchar(30),
  email varchar(30),
  is_active boolean,
  account_balance decimal,
  signup_dataTime datetime,
  last_seen datetime
)

show tables

drop table if exists users

-- here order doesnt matter, just we have be clear on 
insert into users (user_id, user_name, email) 
values (1, 'shivam sharma', 'shivam@gmail.com'), 
       (2, 'shivam sharma', 'shivam@gmail.com'),
       (3, 'shivam sharma', 'shivam@gmail.com'),
       (4, 'shivam sharma', 'shivam@gmail.com')

select * from users
select user_name, email from users

alter table users rename to users_table 


drop table users
  
CREATE TABLE IF NOT exists users (
  -- user_id int primary key,
  user_id int,
  user_name varchar(30),
  email varchar(30),
  is_active boolean,
  account_balance decimal,
  signup_dataTime datetime,
  last_seen datetime,

  primary key (user_id)
)
  
CREATE TABLE IF NOT exists orders (
  -- user_id int primary key,
  order_id int,
  -- user_id int references users(user_id),
  user_id int references users(user_id),
  amount decimal,
  order_date date,

  foreign key (user_id) references users(user_id)
)

show tables
insert into users (user_id, user_name, email) value (2, 'rhot', 'rhot@gmail.com')
select * from users

insert into orders(order_id, user_id, amount) value (1, 1, 120)
select * from orders
drop table if exists orders

drop table users
CREATE TABLE IF NOT exists users (
  user_id int primary key auto_increment,
  user_name varchar(30),
  email varchar(30),
  is_active boolean,
  account_balance decimal,
  signup_dataTime datetime,
  last_seen datetime
);

show tables
insert into users (user_name, email) value ('shivam', 'sh@gmail.com')
select * from users
drop table users


CREATE TABLE IF NOT exists users (
  user_id int auto_increment,
  user_name varchar(30),
  email varchar(30) not null,
  is_active boolean not null,
  account_balance decimal,
  signup_dataTime datetime,
  last_seen datetime,
  age int,
  primary key (user_id),
  unique key (email),
  check (age >=18 and age <= 32)
);

insert into users (user_name, email, is_active, age) value ('shivam', 'shivam@gmail.com', false, 22)
select * from users

CREATE database Shivam_Sql1
drop database Shivam_Sql1