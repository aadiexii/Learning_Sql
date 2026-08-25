-- CRUD Challenge Section -> Section 5

show databases;
use shivampractise1;
show tables;

create table Shirt_Data (
     shirt_id int primary key auto_increment,
     article varchar(100),
     color varchar(100),
	 shirt_size varchar(1),
     last_worn int
);

show tables;
desc shirt_data;

insert into shirt_data(article, color, shirt_size, last_worn) 
values ('t-shirt', 'white', 'S', 10),
	('t-shirt', 'green', 'S', 200),
	('polo shirt', 'black', 'M', 10),
	('tank top', 'blue', 'S', 50),
	('t-shirt', 'pink', 'S', 0),
	('polo shirt', 'red', 'M', 5),
	('tank top', 'white', 'S', 200),
	('tank top', 'blue', 'M', 15); 

insert into shirt_data(article, color, shirt_size, last_worn)
values ('polo shirt', 'purple', 'M', '50');
select * from shirt_data;
select article, color from shirt_data;
select article, color, shirt_size, last_worn from shirt_data where shirt_size='M';

set sql_safe_updates = 0;
update shirt_data set shirt_size='L' where article='polo shirt';
update shirt_data set last_worn = 0 where last_worn = 15;
update shirt_data set shirt_size='XS', color='off white' where color='white';

alter table shirt_data 
modify column shirt_size varchar(2);

delete from shirt_data where last_worn = 200;
delete from shirt_data where article = 'tank top';
delete from shirt_data;

drop table shirt_data;
show tables;