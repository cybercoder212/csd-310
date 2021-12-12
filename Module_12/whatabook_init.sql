
/*
    Title: whatabook.init.sql
    Author: Yitzchok Kaplan
    Date: December 6, 2021
    Description: WhatABook database initialization script.
*/

-- drop test user if exists 
DROP USER IF EXISTS 'whatabook_user'@'localhost';

-- create whatabook_user and grant them all privileges to the whatabook database 
CREATE USER 'whatabook_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Mysql123!';

-- grant all privileges to the whatabook database to user whatabook_user on localhost 
GRANT ALL PRIVILEGES ON whatabook.* TO'whatabook_user'@'localhost';

-- drop contstraints if they exist
ALTER TABLE wishlist DROP FOREIGN KEY fk_book;
ALTER TABLE wishlist DROP FOREIGN KEY fk_user;

-- drop tables if they exist
DROP TABLE IF EXISTS store;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS wishlist;
DROP TABLE IF EXISTS user;

/*
    Create table(s)
*/
CREATE TABLE store (
    store_id    INT             NOT NULL    AUTO_INCREMENT,
    locale      VARCHAR(500)    NOT NULL,
    PRIMARY KEY(store_id)
);

CREATE TABLE book (
    book_id     INT             NOT NULL    AUTO_INCREMENT,
    book_name   VARCHAR(200)    NOT NULL,
    author      VARCHAR(200)    NOT NULL,
    details     VARCHAR(500),
    PRIMARY KEY(book_id)
);

CREATE TABLE user (
    user_id         INT         NOT NULL    AUTO_INCREMENT,
    first_name      VARCHAR(75) NOT NULL,
    last_name       VARCHAR(75) NOT NULL,
    PRIMARY KEY(user_id) 
);

CREATE TABLE wishlist (
    wishlist_id     INT         NOT NULL    AUTO_INCREMENT,
    user_id         INT         NOT NULL,
    book_id         INT         NOT NULL,
    PRIMARY KEY (wishlist_id),
    CONSTRAINT fk_book
    FOREIGN KEY (book_id)
        REFERENCES book(book_id),
    CONSTRAINT fk_user
    FOREIGN KEY (user_id)
        REFERENCES user(user_Id)
);

/*
    insert store record 
*/
INSERT INTO store(locale)
    VALUES('1234 Sample Rd S, Bellevue, NE 68005');

/*
    insert book records 
*/
INSERT INTO book(book_name, author, details)
    VALUES('Moby-Dick', 'Herman Melville', 'The whale, 1851, Novel ');

INSERT INTO book(book_name, author, details)
    VALUES('Alice in Wonderland', 'Lewis Carroll', 'The original 1865 edition, Novel');

INSERT INTO book(book_name, author, details)
    VALUES('Through the Looking-Glass', 'Lewis Carroll', "Sequel to Alice's Adventures in Wonderland, 1871, Novel");

INSERT INTO book(book_name, author, details)
    VALUES("The Three Musketeers", 'Alexandre Dumas', "French historical adventure novel, 1844");

INSERT INTO book(book_name, author, details)
    VALUES('The Prince of Thieves', 'Alexandre Dumas', "Tales of Robin Hood, Book one, 1872");

INSERT INTO book(book_name, author, details)
    VALUES("Robin Hood the Outlaw", 'Alexandre Dumas', "Tales of Robin Hood, Book two, 1873");

INSERT INTO book(book_name, author, details)
    VALUES('The Count of Monte Cristo', 'Alexandre Dumas', "Romantic Novel, 1944-46");

INSERT INTO book(book_name, author, details)
    VALUES('Pinocchio', 'Carlo Collodi', "Chidren's Novel, 1883");

INSERT INTO book(book_name, author, details)
    VALUES('The Wonderful Wizard of Oz', 'L. Frank Baum', "Chidren's Novel, 1900");

/*
    insert user
*/ 
INSERT INTO user(first_name, last_name) 
    VALUES('Bruce', 'Greyson');

INSERT INTO user(first_name, last_name)
    VALUES('Fred', 'Smith');

INSERT INTO user(first_name, last_name)
    VALUES('Tom', 'Ford');

/*
    insert wishlist records 
*/
INSERT INTO wishlist(user_id, book_id) 
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Bruce'), 
        (SELECT book_id FROM book WHERE book_name = 'The Count of Monte Cristo')
    );

INSERT INTO wishlist(user_id, book_id)
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Fred'),
        (SELECT book_id FROM book WHERE book_name = 'Alice in Wonderland')
    );

INSERT INTO wishlist(user_id, book_id)
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Tom'),
        (SELECT book_id FROM book WHERE book_name = 'The Three Musketeers')
    );
