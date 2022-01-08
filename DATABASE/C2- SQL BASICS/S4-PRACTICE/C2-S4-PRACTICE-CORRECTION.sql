-- EXRCICE 1

-- Q3
/* author table */
CREATE TABLE authors (
    author_id INT(10) AUTO_INCREMENT NOT NULL,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    country VARCHAR(100),
    PRIMARY KEY (author_id)
) ;

/* book table */
CREATE TABLE books (
    book_id INT(10) AUTO_INCREMENT NOT NULL,
    title VARCHAR(100) NOT NULL,
    publish_year YEAR,
    language VARCHAR(100),
    author_id INT(10),
    PRIMARY KEY (book_id),
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
) ;

--Q4 

INSERT INTO authors 
    (name, date_of_birth, country)
VALUES 
    ('Victor Hugo', '1802-02-26', 'France'),
    ('William Shakespeare', NULL, 'United-Kingdom'),
    ('Ernest Hemingway', '1899-07-21', 'USA'),
    ('Stefan Zweig', '1881-11-28', 'Austria'),
    ('Fiodor Dostoïevski', NULL, 'Russia')
;

INSERT INTO books
    (title, publish_year, language, author_id)
VALUES 
    ('Les Misérables', NULL, 'French', (SELECT author_id FROM authors WHERE name = 'Victor Hugo')),
    ('A Moveable Feast', 1964, 'English', (SELECT author_id FROM authors WHERE name = "Ernest Hemingway")),
    ('Notre-Dame de Paris', NULL, 'French', (SELECT author_id FROM authors WHERE name = 'Victor Hugo')),
    ('The Royal Game', 1941, 'German', (SELECT author_id FROM authors WHERE name = 'Stefan Zweig')),
    ('Amok', 1922, 'German', (SELECT author_id FROM authors WHERE name = 'Stefan Zweig'))
;

/* There are many different syntax to do this. Here we should give them the syntax for the foreign key since the don't know how to use Select yet.*/
/* MySQL supports years from 1901 to 2155 */


--Q5

DELETE FROM books WHERE publish_year is NULL;
DELETE FROM books WHERE language = 'English';


-- EXERCICE 2 

--Q3

CREATE TABLE users (
    user_id INT(10) AUTO_INCREMENT NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    nick_name VARCHAR(100),
    PRIMARY KEY (user_id)
)
;


CREATE TABLE posts (
    post_id INT(10) AUTO_INCREMENT NOT NULL,
    body VARCHAR(100) NOT NULL,
    user_id INT(10),
    PRIMARY KEY (post_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
)
;

--Q4

INSERT INTO users
    (first_name, nick_name)
VALUES
    ('Ronan', 'roro'),
    ('Sokea', NULL),
    ('Edouard', 'doudou')
;

INSERT INTO posts 
    (body, user_id) 
VALUES
    ('Hello all!', (SELECT user_id FROM users WHERE first_name = 'Ronan')),
    ('I like rice', (SELECT user_id FROM users WHERE first_name = 'Ronan')),
    ('YES YES ', (SELECT user_id FROM users WHERE first_name = 'Sokea'))
;

--Q5 

DELETE FROM users WHERE first_name = 'Edouard';

--Q6

DELETE FROM users WHERE first_name = 'Ronan';

--Q7

DELETE FROM books WHERE body = 'Hello all!';
DELETE FROM books WHERE body = 'I like rice';


--Q9

INSERT INTO posts 
    (body, user_id)
VALUES 
    ('Last question', 48);