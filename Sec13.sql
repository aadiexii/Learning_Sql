create database shop;
use shop;

create table customers (
    id int primary key auto_increment,
    first_name varchar(100),
    last_name varchar(100),
    email varchar(100)
);

create table orders (
    id int primary key auto_increment,
    order_date date,
    amount decimal(8,2),
    customer_id int 
);

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');

INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);

-- re-creating with foreign key:
drop table customers;
drop table orders;

create table customers (
    id int primary key auto_increment,
    first_name varchar(100),
    last_name varchar(100),
    email varchar(100)
);

create table orders (
    id int primary key auto_increment,
    order_date date,
    amount decimal(8,2),
    customer_id int,
    foreign key (customer_id) references customers(id) 
);

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');

INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);

select * from orders where customer_id = (select id from customers where id = 1);

select * from orders where customer_id = (select id from customers where last_name = 'George');

-- Cross join attempt:
select * from customers, orders;

-- INNER JOIN:
select * from customers 
join orders
on customers.id = orders.customer_id;

select * from customers 
join orders on orders.customer_id = customers.id;

select * from orders 
join customers on orders.customer_id = customers.id;

select first_name, last_name, order_date, amount from customers 
join orders on customers.id = orders.customer_id;

select first_name, last_name, sum(amount) as total_order_amount from customers 
join orders on customers.id = orders.customer_id
group by first_name, last_name;

select first_name, last_name, sum(amount) as total_order_amount from customers 
join orders on customers.id = orders.customer_id
group by first_name, last_name order by total_order_amount;

select first_name, last_name, sum(amount) as total_order_amount from customers 
join orders on customers.id = orders.customer_id
group by first_name, last_name order by total_order_amount desc;

-- LEFT JOIN (with your original comments):
select first_name, last_name, order_date, amount from customers -- here customer becomes the left side
left join orders -- orders becomes the left side
on customers.id = orders.customer_id;

select order_date, amount, first_name, last_name  from orders 
left join customers 
on customers.id = orders.customer_id;

select first_name, last_name, amount from customers
join orders on customers.id = orders.customer_id;

select first_name, last_name, sum(amount) as total_amount from customers
join orders on customers.id = orders.customer_id
group by first_name, last_name;

select first_name, last_name, ifnull(sum(amount), 0) as total_amount from customers
join orders on customers.id = orders.customer_id
group by first_name, last_name;

select first_name, last_name, ifnull(sum(amount), 0) as total_amount from customers
left join orders on customers.id = orders.customer_id
group by first_name, last_name;

-- RIGHT JOIN:
select first_name, last_name, order_date, amount from customers 
right join orders on customers.id = orders.customer_id;

select first_name, last_name, order_date, amount from orders 
right join customers on customers.id = orders.customer_id;

insert into orders(amount, order_date) values ( 100, current_date());

select * from orders;

select first_name, last_name, order_date, amount from customers 
right join orders on customers.id = orders.customer_id;


-- ON DELETE CASCADE
delete from customer where last_name = 'George'; -- The delete fails because orders.customer_id has a foreign key to customers.id with no ON DELETE CASCADE, so MySQL blocks deleting a customer who still has orders (and your table name customer should also be customers).
 
create table customers (
    id int primary key auto_increment,
    first_name varchar(100),
    last_name varchar(100),
    email varchar(100)
);

create table orders (
    id int primary key auto_increment,
    order_date date,
    amount decimal(8,2),
    customer_id int,
    foreign key (customer_id) references customers(id) on delete cascade 
);

show databases;
use shop;
show tables;
drop table orders;
drop table customers;
desc orders;

select * from customers;
SET SQL_SAFE_UPDATES = 0;
delete from customers where last_name = 'George'; 
SET SQL_SAFE_UPDATES = 1;

-- Assignment
create table students (
    id int primary key auto_increment,
    first_name varchar(100)
);

create table papers (
	title varchar(200),
    grade int,
    student_id int,
    foreign key (student_id) references students(id) 
);

show tables;
INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');
select * from students;

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);
select * from papers;

select first_name, title, grade from students
inner join papers on papers.student_id = students.id order by grade desc;

select first_name, ifnull(title, 'MISSING') as title,  ifnull(grade, 0) as grade  from students
left join papers on papers.student_id = students.id;

select first_name, ifnull(avg(grade), 0) as average from students
left join papers on students.id = papers.student_id group by first_name order by average desc;

select 
    first_name, 
    ifnull(avg(grade), 0) as average, 
    case 
       when ifnull(avg(grade), 0) > 75 then 'PASSING'
       else 'FAILING'
	end as passing_status from students
left join papers on students.id = papers.student_id group by first_name order by average desc;