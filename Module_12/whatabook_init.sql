DROP USER IF EXISTS 'whatabook_user'@'localhost';

CREATE USER 'whatabook_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'MySQL8IsGreat!';

GRANT ALL PRIVILEGES ON whatabook.* TO'whatabook_user'@'localhost';

ALTER TABLE wishlist DROP FOREIGN KEY fk_book;
ALTER TABLE wishlist DROP FOREIGN KEY fk_user;

DROP TABLE IF EXISTS store;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS wishlist;
DROP TABLE IF EXISTS user;

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


INSERT INTO store(locale)
    VALUES('1 Broadway, New York, NY 10004');


INSERT INTO book(book_name, author, details)
    VALUES('Go Tell the Bees That I Am Gone','Diana Gabaldon', 'Outlander Series #9');

INSERT INTO book(book_name, author, details)
    VALUES('Tokyo Revengers Omnibus', 'Ken Wakui', 'B&N Exclusive Edition');

INSERT INTO book(book_name, author, details)
    VALUES('The Lyrics 1956 to the Present', 'Paul McCartney', 'Two-Volume Set');

INSERT INTO book(book_name, author)
    VALUES('Once Upon a Broken Heart', 'Stephanie Garber');

INSERT INTO book(book_name, author)
    VALUES('The Judges List', 'John Grisham');

INSERT INTO book(book_name, author)
    VALUES('The Real Anthony Fauci', 'Robert F. Kennedy Jr.');

INSERT INTO book(book_name, author)
    VALUES('One Piece: Pirate Recipes', 'Sanji');

INSERT INTO book(book_name, author)
    VALUES('Fear No Evil', 'James Patterson');

INSERT INTO book(book_name, author)
    VALUES('The Wish', 'Nicholas Sparks');


INSERT INTO user(first_name, last_name) 
    VALUES('James', 'Smith');

INSERT INTO user(first_name, last_name)
    VALUES('Robert', 'Williams');

INSERT INTO user(first_name, last_name)
    VALUES('John', 'Brown');

INSERT INTO wishlist(user_id, book_id) 
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'James'),
        (SELECT book_id FROM book WHERE book_name = 'The Wish')
    );

INSERT INTO wishlist(user_id, book_id)
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Robert'),
        (SELECT book_id FROM book WHERE book_name = 'The Real Anthony Fauci')
    );

INSERT INTO wishlist(user_id, book_id)
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'John'),
        (SELECT book_id FROM book WHERE book_name = 'The Lyrics 1956 to the Present')
    );
