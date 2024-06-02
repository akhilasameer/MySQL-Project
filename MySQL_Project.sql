CREATE DATABASE Library1;

USE LIbrary1;

-- BRANCH TABLE
CREATE TABLE  Branch(
Branch_no INT PRIMARY KEY,
Manager_Id INT ,
Branch_address VARCHAR (50),
Contact_no VARCHAR(20)
);


-- INSERT VALUES IN BRANCH TABLE.
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) VALUES
(1, 101, '123 Main St, Springfield, IL', '555-1234'),
(2, 102, '456 Elm St, Shelbyville, IL', '555-5678'),
(3, 103, '789 Oak St, Capital City, IL', '555-8765'),
(4, 104, '101 Maple St, Ogdenville, IL', '555-4321'),
(5, 105, '202 Pine St, North Haverbrook, IL', '555-2345'),
(6, 106, '303 Cedar St, Brockway, IL', '555-6789'),
(7, 107, '404 Birch St, Cypress Creek, IL', '555-9876'),
(8, 108, '505 Walnut St, West Springfield, IL', '555-3456'),
(9, 109, '606 Chestnut St, East Springfield, IL', '555-7654'),
(10, 110, '707 Ash St, South Springfield, IL', '555-4567');

SELECT * FROM Branch;

-- EMPLOYEE TABLE
CREATE TABLE Employee(
Emp_Id INT PRIMARY KEY,
Emp_name VARCHAR(30),
Position VARCHAR(25),
Salary DECIMAL(10,2),
Branch_no iNT,
FOREIGN KEY(Branch_no) REFERENCES Branch(Branch_no)
);
-- INSERT VALUES IN EMPLOYEE TABLE
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(1, 'Alice Johnson', 'Manager', 75000.00, 1),
(2, 'Bob Smith', 'Assistant Manager', 55000.00, 2),
(3, 'Carol White', 'Sales Representative', 45000.00, 3),
(4, 'David Brown', 'Clerk', 30000.00, 4),
(5, 'Eve Davis', 'Manager', 75000.00, 5),
(6, 'Frank Wilson', 'Assistant Manager', 55000.00, 6),
(7, 'Grace Lee', 'Sales Representative', 45000.00, 7),
(8, 'Hank Thompson', 'Clerk', 30000.00, 8),
(9, 'Ivy Martinez', 'Manager', 75000.00, 9),
(10, 'Jack Garcia', 'Assistant Manager', 55000.00, 10);

SELECT * FROM Employee;

-- CUSTOMER TABLE
CREATE TABLE Customer(
Customer_Id INT PRIMARY KEY,
Customer_name VARCHAR(30),
Customer_address VARCHAR(50),
Reg_date DATE
);

-- INSERT VALUES IN CUSTOMER TABLE
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) VALUES
(1, 'John Doe', '123 Maple St, Springfield, IL', '2024-01-15'),
(2, 'Jane Smith', '456 Oak St, Shelbyville, IL', '2024-02-20'),
(3, 'Alice Brown', '789 Pine St, Capital City, IL', '2024-03-10'),
(4, 'Bob Johnson', '101 Elm St, Ogdenville, IL', '2024-04-25'),
(5, 'Charlie Davis', '202 Cedar St, North Haverbrook, IL', '2024-05-05'),
(6, 'Diana Clark', '303 Birch St, Brockway, IL', '2024-06-15'),
(7, 'Eve Martinez', '404 Walnut St, Cypress Creek, IL', '2024-07-20'),
(8, 'Frank Wilson', '505 Chestnut St, West Springfield, IL', '2024-08-30'),
(9, 'Grace Lee', '606 Ash St, East Springfield, IL', '2024-09-10'),
(10, 'Hank Thompson', '707 Willow St, South Springfield, IL', '2024-10-01');

SELECT * FROM Customer;

-- BOOKS TABLE
CREATE TABLE BOOKS(
ISBN INT PRIMARY KEY,
Book_title VARCHAR(50),
Category VARCHAR(30),
Rental_Price DECIMAL(10,2),
Status VARCHAR(5) CHECK (Status IN('Yes','No')),
Author VARCHAR(30),
Publisher VARCHAR(50)
);


-- INSERT VALUES IN BOOKS TABLE.
INSERT INTO BOOKS (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
(1001, 'The Great Gatsby', 'Fiction', 3.99, 'Yes', 'F. Scott Fitzgerald', 'Scribner'),
(1002, 'The Catcher in the Rye', 'Fiction', 4.99, 'No', 'J.D. Salinger', 'Little, Brown and Company'),
(1003, 'Sapiens: A Brief History of Humankind', 'Non-Fiction', 5.99, 'Yes', 'Yuval Noah Harari', 'Harper'),
(1004, 'The Selfish Gene', 'Science', 6.99, 'No', 'Richard Dawkins', 'Oxford University Press'),
(1005, '1984', 'Dystopian', 4.49, 'Yes', 'George Orwell', 'Secker & Warburg'),
(1006, 'To Kill a Mockingbird', 'Fiction', 5.49, 'No', 'Harper Lee', 'J.B. Lippincott & Co.'),
(1007, 'Harry Potter and the Sorcerer\'s Stone', 'Fantasy', 3.99, 'Yes', 'J.K. Rowling', 'Bloomsbury'),
(1008, 'The Girl with the Dragon Tattoo', 'Thriller', 4.49, 'Yes', 'Stieg Larsson', 'Norstedts Förlag'),
(1009, 'The Alchemist', 'Philosophical', 6.49, 'No', 'Paulo Coelho', 'HarperOne'),
(1010, 'Brave New World', 'Science Fiction', 7.99, 'Yes', 'Aldous Huxley', 'Chatto & Windus');

SELECT * FROM BOOKS;

-- IssueStatus TABLE.
CREATE TABLE IssueStatus(
Issue_Id INT PRIMARY KEY,
Issued_cust INT,
Issued_book_name VARCHAR(30),
Issue_date DATE,
Isbn_book INT,
FOREIGN KEY (Issued_cust) REFERENCES Customer(customer_id),
FOREIGN KEY (Isbn_book) REFERENCES BOOKS(Isbn)
);

-- INSERT VALUES IN ISSUESTATUS TABLE.
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) VALUES
(101,1,'To Kill a Mockingbird','2024-05-18',1001),
(102,2,'The Hobbit','2024-05-17',1002),
(103,3,'1984','2024-05-16',1003),
(104,4,'The Hunger Games','2024-05-15',1004),
(105,5,'The Kite Runner','2024-05-14',1005),
(106,6,'The Catcher in the Rye','2024-05-13',1006),
(107,7,'Slaughterhouse-Five','2024-05-12',1007),
(108,8,'Gone Girl','2024-05-11',1008),
(109,9,'The Da Vinci Code','2024-05-10',1009),
(110,10,'Little Fires Everywhere','2024-05-09',1010);

SELECT * FROM IssueStatus;

-- RETURNSTATUS TABLE
CREATE TABLE ReturnStatus(
Return_Id INT PRIMARY KEY,
Return_cust VARCHAR(50),
Return_book_name VARCHAR(50),
Return_date DATE,
Isbn_book2 INT,
FOREIGN KEY (Isbn_book2) REFERENCES BOOKS(ISBN)
);

-- INSERT VALUES IN RETURNSTATUS TABLE.
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) VALUES
(1, 201, 'To Kill a Mockingbird', '2024-05-18', '1001'),
(2, 202, 'The Hobbit', '2024-05-17', '1002'),
(3, 203, '1984', '2024-05-16', '1003'),
(4, 204, 'The Hunger Games', '2024-05-15', '1004'),
(5, 205, 'The Kite Runner', '2024-05-14', '1005'),
(6, 206, 'The Catcher in the Rye', '2024-05-13', '1006'),
(7, 207, 'Slaughterhouse-Five', '2024-05-12', '1007'),
(8, 208, 'Gone Girl', '2024-05-11', '1008'),
(9, 209, 'The Da Vinci Code', '2024-05-10', '1009'),
(10, 210, 'Little Fires Everywhere', '2024-05-09', '1010');

SELECT * FROM ReturnStatus;

# 1. Retrieve the book title, category, and rental price of all available books.

SELECT Book_title,category,Rental_price FROM BOOKS WHERE Status = 'Yes';

# 2. List the employee names and their respective salaries in descending order of salary.

SELECT Emp_name,Salary FROM employee ORDER BY  Salary DESC;

# 3. Retrieve the book titles and the corresponding customers who have issued those books.
SELECT Issued_book_name,Customer_name FROM IssueStatus
JOIN Customer ON IssueStatus.Issued_cust = Customer.customer_id;

# 4. Display the total count of books in each category.

SELECT Category, COUNT(*) AS Total_Count FROM BOOKS GROUP BY Category;

# 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT Emp_name,Position FROM Employee WHERE Salary > 50000.00;

# 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT Customer_name FROM Customer WHERE Reg_date < '2022-01-01'
AND Customer_id NOT IN(SELECT Issued_cust FROM IssueStatus);

# 7. Display the branch numbers and the total count of employees in each branch.
SELECT Branch_no,COUNT(*)AS Employees_Count FROM employee GROUP BY Branch_no;

# 8. Display the names of customers who have issued books in the month of June 2023.
SELECT Customer_name FROM Customer
WHERE Customer_id IN(
SELECT DISTINCT Customer_id FROM IssueStatus
WHERE YEAR(Issue_date) = 2023
AND MONTH(Issue_date) = 6
);

# 9. Retrieve book_title from book table containing history. 
SELECT Book_title FROM books WHERE Book_title LIKE '%history%';

# 10. Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
SELECT Branch_no,COUNT(*)AS Employees_Count FROM Employee GROUP BY Branch_no HAVING Employees_Count > 5;