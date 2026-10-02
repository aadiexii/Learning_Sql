show databases;
use book_shop;
select database();

show tables;
desc books;
select * from books;
INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
           
-- DISTINCT Clause: Eliminates duplicate results and to get only distinct results 
select distinct author_lname from books; -- Distinct goes after select and before colomn name 

select author_fname, author_lname from books;
-- How we get DISTINCT Full names, 2 Ways
-- 1. Using concat String function
select distinct concat(author_fname, ' ', author_lname) from books;

-- 2. without concat, this will return unique of all colomn combinations
select distinct author_fname, author_lname, released_year from books;

-- ORDER BY Clause: 
select author_lname from books order by author_lname;
select book_id, author_fname, author_lname from books order by author_lname;

-- by default it sorts outs in ascending order but we can sort it our in des using desc
select book_id, author_fname, author_lname from books order by author_lname desc;

-- here we have number 2 with order by, this means sort things out in terms of second colomn that we are selecting
select book_id, author_fname, author_lname from books order by 2;

-- Order by multiple columns, selected column will be sorted by way its selected
select author_fname, author_lname from books order by author_fname, author_lname;
select author_fname, author_lname, released_year from books order by author_fname, author_lname, released_year desc;
select concat(author_fname, ' ', author_lname) as full_name from books order by full_name;


-- LIMIT clause
select title from books limit 4; 
select * from books order by released_year desc;
select * from books order by released_year desc limit 5;
select * from books order by released_year desc limit 0,5; -- we will get 5 rows with starting row as zero.
select * from books order by released_year desc limit 1,5; -- we will get 5 rows with starting row as one.

-- LIKE: Used for better searching, as when we have to do some fuzzy searching, not a exact searching
select title, author_fname, author_lname from books where author_fname like '%da%'; -- % means zero or more characters
select title, author_fname, author_lname from books where author_fname like 'da';
select title, author_fname, author_lname from books where author_fname like '%da';
select title, author_fname, author_lname from books where author_fname like 'da%';
select * from books where title like '%:%';
 
select author_fname from books where author_fname like '____'; -- here underscore means no of characters we want in final output
select author_fname from books where author_fname like '_a_';
select author_fname from books where author_fname like '_a%';

select title from books where title like '%\%%'; -- this means we have a title with a % sign in it, so to access that we have to escape the present %
select title from books where title like '%\_%';  -- same like previous


-- EXERCISE
select title from books where title like '%stories%';
select title, pages from books order by pages desc limit 1;
select concat(title, ' - ', released_year) as summary from books order by released_year desc limit 3;
select title, author_lname from books where author_lname like '% %';
select title, released_year, stock_quantity from books order by stock_quantity limit 3;
select title, author_lname from books order by author_lname,title; -- When we write ORDER BY author_lname, title, SQL sorts first by author_lname, and only when two rows have the same last name does it use title as a tiebreaker.
select concat('MY FAVO AUTHOR IS ', author_fname, ' ', author_lname, ';') as yell from books order by author_lname;