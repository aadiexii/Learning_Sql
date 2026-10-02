show databases;
use book_shop;


show tables;
drop table states;

-- LOGICAL OPERATORS
-- 1. != and =
select * from books where released_year != 2017; -- != -> not equal, = -> equal
select title, author_lname from books where author_lname != 'Gaiman';

-- 2. NOT LIKE, opposite to like which we studied in section Day8
select title from books where title like '% %';
select title from books where title not like '% %';  

-- 3. Greater than -> >
select * from books where pages > 350;
desc books;

select 80 > 40; -- will return 1, true 
select title, pages from books where pages > 500; -- this goes from every from check if its greater thn 500 or not

select 1 > null; -- NULL means "unknown," not "nothing" or zero. Any comparison with an unknown value is itself unknown, so 1 > NULL evaluates to NULL rather than TRUE or FALSE.

-- 4. Less than -> <
select title, released_year, pages from books where pages <200;

-- >= , <= 
select title, released_year, pages from books where pages <= 208 order by pages desc;
select title, released_year, pages from books where pages >= 208 order by pages asc;

-- 5. LOGICAL AND -> &&
select * from books where author_lname = 'Eggers' && released_year > 2010;
select * from books where author_lname = 'Eggers' and released_year > 2010 and title like  'A%';

-- how and works -> both LEFT and RIGHT condition has to be true
select 1>0 and 8 = 8; -- both side will return 1, hence 1

-- select title with atleast 15 characters and also large num of pages
select * from books where char_length(title) > 20 and pages > 400;

-- 6. LOGICAL OR  - ANY ONE FROM LEFT or RIGHT condition has to be true
select * from books where author_lname = 'Eggers' OR released_year > 2010;

-- how and works -> ANY ONE FROM LEFT or RIGHT condition has to be true
select 1>0 or 8 > 8; -- any one side will return 1, hence 


-- 7.BETWEEN and NOT BETWEEN
-- before between
select * from books where released_year > 2004 and released_year <= 2015;

-- after between
select * from books where released_year between 2004 and 2015; -- between makes it more cleaner

select * from books where released_year not between 2004 and 2015;

-- 8. Comparing Dates
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

insert into people(name, birthdate, birthtime, birthdt) values
   ('hazel', '2000-04-17', '7:45:15', '2000-04-17 7:45:15');
   
select * from people;
select * from people where birthdate < '2005-01-01'; -- this works but we have more option
select * from people where year(birthdate) < 2005;

select * from people where hour(birthtime) > 7;
 
-- CAST() function -> converts a value from one data type to another.
select cast('9:00:00' as time);

select * from people where birthtime between '11:00:00' and '17:00:00'; -- sql qill figure out what we want

select * from people where birthtime between cast('11:00:00' as time) and cast('17:00:00' as time); -- here we are actually comparing time, not a string like in previous

-- 9. IN Operator and NOT IN - include and not include
select title from books where author_lame = 'Carver' or author_lname = 'Lahiri' or author_lname = 'Smith'; -- we can have lot of such ORs, instead that we can use IN 
select title from books where author_lname in ('Carver','Lahiri');

select title from books where author_lname not in ('Carver', 'Lahiri');

-- select all the books not published in even years
select title, released_year from books where released_year not in (2000, 2002, 2004, 2008, 2010);
select * from books;

-- There is still better way for doing such queries where we dont use in and not in, instead we will use % - Modulo Operator
select 10 % 4;
select 17 % 6;

select * from books where released_year % 2 != 0 and released_year > 2000 order by released_year desc;


-- 10. Case Statements - CASE is SQL's if/else. It checks conditions in order and returns the value for the first one that is true.
select title, released_year, 
    case
        when released_year >= 2000 then 'Mordern Lit'
        else '20th Centuary Lit'
	end as genra
from books;

select title, stock_quantity, 
    case
        when stock_quantity between 0 and 50 then '*'
        when stock_quantity between 51 and 100 then '**'
        else '***'
	end as pattern
from books;

-- only one of the when statement runs acc to the condition, if non condition runs then else statement runs
select title, stock_quantity, 
    case
        when stock_quantity <= 50 then '*'
        when stock_quantity <= 100 then '**'
        else '***'
	end as pattern
from books;

-- 11. IS NULL and IS NOT NULL
select * from books where author_lname = null; -- this doesnt works, for comparing with null we have to work with IS NULL
select * from books where author_lname is null;
select * from books where author_lname is not null;

SET SQL_SAFE_UPDATES = 0;
delete from books where title is null;
SET SQL_SAFE_UPDATES = 1;

select * from books where title is null;



-- ASSIGNMENT
select 10 != 10;
select 15 > 14 and 99-5 <= 95;
select 1 in (5,3) or 9 between 8 and 10; 

select * from books where released_year < 1980;
select * from books where author_lame = 'Eagers' or author_lname = 'Chabon';

select * from books where pages between 100 and 200; 

select * from books where substr(author_lname, 1, 1) = 'C' or substr(author_lname, 1, 1) = 'S';
select * from books where author_lname like 'C%' or author_lname like 'S%';

select title, author_lname,
    case 
        when title like '%stories%' then 'Short Stories'
        when title like '%Just Kids%' or title like '%A Heartbreaking Work%' then 'Memoir'
        else 'Novel'
    end as TYPE
from books;

select author_fname, author_lname,
     case 
         when count(*) = 1 then '1 book' 
         else concat(count(*), ' ', 'book')
     end as COUNT
from books where author_lname is not null group by author_fname, author_lname;
    