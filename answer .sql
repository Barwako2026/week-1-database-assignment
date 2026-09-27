CREATE DATABASE library_db;

USE library_db;

CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    author VARCHAR(100) NOT NULL,
    published_year INT,
    available BOOLEAN DEFAULT TRUE
);

CREATE TABLE members (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    joined_on DATE
);

CREATE TABLE loans (
    id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    member_id INT,
    loan_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(id),
    FOREIGN KEY (member_id) REFERENCES members(id)
);

INSERT INTO books (title, author, published_year, available) VALUES
('1984', 'George Orwell', 1949, TRUE),
('To Kill a Mockingbird', 'Harper Lee', 1960, TRUE),
('The Hobbit', 'J.R.R. Tolkien', 1937, FALSE);

INSERT INTO members (name, email, joined_on) VALUES
('Amina Yusuf', 'amina.yusuf@example.com', '2025-01-15'),
('Brian Otieno', 'brian.otieno@example.com', '2025-03-02');

INSERT INTO loans (book_id, member_id, loan_date, return_date) VALUES
(3, 2, '2026-09-10', NULL);

SELECT * FROM books;
SELECT * FROM members;
SELECT * FROM loans;
SELECT title, author FROM books WHERE available = TRUE;

SELECT members.name, books.title, loans.loan_date
FROM loans
JOIN members ON loans.member_id = members.id
JOIN books ON loans.book_id = books.id;
