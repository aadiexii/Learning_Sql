show databases;
drop database shivampractise1;

create database book_shop;
use book_shop;
select database();

show tables;

CREATE TABLE books 
	(
		book_id INT AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

show tables;
desc books;
select * from books;

-- CONCAT FUNCTION
select concat(author_fname, '12345') from books;
select concat(author_fname, ' ', author_lname) from books;
select concat(author_fname, ' ', author_lname) as author_name from books;

select concat_ws('-', author_fname, author_lname) from books;

-- SUBSTRING FUNCTION
select substring('hello world', 1, 7); -- (str, staring point, length)
select substring('hello world', 7); -- from 7 till last, no length mentioned
select substring('hello world', -3); -- indexing start from right ad goes to left
select substring('hello world', -3, 1);

select title from books;
select substring(title, 1, 15) from books;
-- SUBSTR() also works, is thats too much typing for you

-- Combine Concat and substr
select concat(substring(title, 1, 10), '...') from books;
select concat(substr(author_fname, 1, 1), '.', substr(author_lname, 1, 1), '.') as author_initials from books;


-- REPLACE Function
select replace('hello world', 'hell', '&**&^') as replaced_value;
select replace(title, ' ', '__')  as replaced_value from books;

-- REVERSE Function
select reverse("hello world") as reversed_value;
select reverse(author_fname) as reversed_value from books;
select concat(author_fname, reverse(author_fname)) as revered_value from books;

-- CHAR_LENGTH funtion
select char_length('hello world');

-- LENGTH() is different from CHAR_LENGTH, as it stores size in bytes and char_length tell the number of characters

-- UPPER and LOWER Function
select upper('shjaskJHSkajsah');
select lower('DJGHDSGDSDHASGJDGSA');

-- INSERT
select insert('hello world', 7, 0, 'my ') as insert_value;
select insert('hello world', 7, 4, 'my') as insert_value;
select insert('hello world', 7, 2, 'my') as insert_value;


-- Exercise
SELECT REVERSE(UPPER('Why does my cat look at me with such hatred?'));

SELECT REPLACE(title, ' ', '->') AS title FROM books;

SELECT 
    author_lname AS forwards, REVERSE(author_lname) AS backwards
FROM
    books;
    

SELECT UPPER(CONCAT(author_fname, ' ', author_lname)) AS 'full name in caps' FROM books;


SELECT CONCAT(title, ' was released in ', released_year) AS blurb FROM books;

SELECT title, CHAR_LENGTH(title) AS character_count FROM books;

SELECT 
    CONCAT(SUBSTR(title, 1, 10), '...') AS short_title,
    CONCAT(author_lname, ',', author_fname) AS author,
    CONCAT(stock_quantity, ' in stock') AS quantity
FROM
    books;