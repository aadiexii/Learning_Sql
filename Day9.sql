show databases;
use book_shop;

desc books;
select * from books;

-- Aggreagate Funtions

-- 1. COUNT funtions: returns the no of rows
-- how many books are in db
select count(*) from books;
select title, count(*) from books; -- this doesnt work because both does different things, count is boiling whole bunch or rows into one value whereas title is not. Both are incompatible.

-- how many author_fname
select count(author_fname) from books; -- this will give the no of rows for which author_fname is present(author_fname is not null)
-- how many distinct author_fname
select count(distinct author_fname) from books; -- this will return only distinct author_fname

-- how many titles that contains "the"
select * from books where title like "%the%";
select count(*) from books where title like "%the%";


-- 2. GROUP BY clause: Hard to understand - summarizes or aggregates identical data into single rows
select author_lname from books group by author_lname;
select count(author_fname) from books;
select author_lname, count(author_lname) as books_writter from books group by author_lname; -- each group has same author_lname so the count() counts the rows of each group
select author_lname, count(author_lname) as books_writter from books group by author_lname order by books_writter desc;

-- Both queries give the same result because count(released_year) skips NULLs, but since you're grouping by released_year, every row in a group already has a valid non-NULL value, making both counts identical.
select released_year, count(released_year) as same_released_year from books group by released_year;
select released_year, count(*) as same_released_year from books group by released_year;


-- 3. MIN and MAX funtion
select max(released_year) as max, min(released_year) as min from books; -- will return min and max year

-- min() and max() on strings just return the first and last value alphabetically, like sorting A to Z and picking the two ends.
select min(author_fname) , max(author_fname) as min from books;

-- How to find the title of the longest book
-- Note: Whenever we aggregate things it only works when data is in common.
-- option 1
select title from books order by pages desc limit 1; 

select title from books;
select max(pages) from books;
-- option 2: using sub queries
select title, pages from books where pages = (select max(pages) from books); 

insert into books(title, pages) values ('my life in words',634);
select title, pages from books where pages = (select max(pages) from books);

select title, released_year from books order by released_year asc limit 3,1; -- this will include null value
select title, released_year from books where released_year = (select min(released_year) from books); -- this will neglect the null and then return the min

-- 4. Group by multiple colomns
select author_lname, count(*) from books group by author_lname;

-- what if I wanna group by last name and the first name
select author_lname, count(*) from books group by author_lname, author_fname; -- it will first group by lname then fname
-- first for harris we get 2 if we group by lname then harris will devide 1,1 after we group by fname
select author_fname, author_lname, count(*) from books group by author_lname, author_fname;

-- 5. MIN/MAX with group by
-- find the each year author published their first book
select author_fname, author_lname, count(*) as TOTAL_BOOKS, min(released_year) as MIN_YEAR, max(released_year) as MAX_YEAR, max(pages) as BOOK_Pages from books group by author_fname, author_lname;


-- 6. SUM Aggregate Function
select sum(pages) from books;

-- sum all the pages each author has written
select author_fname, author_lname, count(*) as total_books, sum(pages) as total_no_of_pages from books group by author_fname, author_lname;

select author_lname, count(*), sum(released_year) from books group by author_lname;
select sum(author_lname) from books; -- this will return 0, as this are not numbers

-- 7. AVG Aggregate function
-- calculate the average released_year across books
select author_lname, avg(released_year) from books group by author_lname;
 
select released_year, avg(stock_quantity), count(*) as quantity from books group by released_year order by quantity desc;

-- There are various Aggregate Function, which can be seen in docs. 

-- Assignment Section
select count(title) as no_of_books from books;
select released_year, count(released_year) from books group by released_year;
select sum(stock_quantity) from books;
select count(*), avg(released_year)  from books group by author_fname, author_lname;
select concat(author_fname, ' ', author_lname) as full_name, length(concat(author_fname, ' ', author_lname)) as length from books order by length desc limit 1;
select concat(author_fname, ' ', author_lname) as full_name, pages from books where pages = (select max(pages) from books);
select concat(author_fname, ' ', author_lname) as full_name, pages from books order by pages desc limit 1;
select released_year, count(*), avg(pages) from books group by released_year order by released_year asc;
