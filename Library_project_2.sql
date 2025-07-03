-- Project TASK


-- ### 2. CRUD Operations


-- Task 1. Create a New Book Record
-- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"

INSERT INTO books(isbn,book_title,category,rental_price,status,author,publisher)
VALUES('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')

-- Task 2: Update an Existing Member's Address

UPDATE members
SET member_address = '125 Main St'
WHERE member_id = 'C101'

-- Task 3: Delete a Record from the Issued Status Table
-- Objective: Delete the record with issued_id = 'IS104' from the issued_status table.

DELETE FROM issued_status
WHERE issued_id = 'IS104'

-- Task 4: Retrieve All Books Issued by a Specific Employee
-- Objective: Select all books issued by the employee with emp_id = 'E101'.

SELECT* 
FROM issued_status 
WHERE issued_emp_id = 'E101'



-- Task 5: List Members Who Have Issued More Than One Book
-- Objective: Use GROUP BY to find members who have issued more than one book.

SELECT issued_emp_id,
       COUNT(issued_id)
FROM issued_status
GROUP BY 1
HAVING COUNT(2)>1


-- ### 3. CTAS (Create Table As Select)

-- Task 6: Create Summary Tables**: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt

CREATE TABLE books_cnts
AS
SELECT b.isbn,b.book_title,COUNT(i.issued_id) AS book_issued_cnt
FROM books as b
JOIN issued_status AS i
ON b.isbn = i.issued_book_isbn
GROUP BY 1,2

-- ### 4. Data Analysis & Findings

-- Task 7. **Retrieve All Books in a Specific Category:

SELECT*
FROM books
WHERE category = 'Classic';


-- Task 8: Find Total Rental Income by Category:
SELECT category,SUM(rental_price)
FROM books
GROUP  BY category;


-- Task 9. **List Members Who Registered in the Last 180 Days**:

SELECT* 
FROM members
WHERE reg_date>= CURRENT_DATE - INTERVAL '180 days';

INSERT INTO members(member_id,member_name,member_address,reg_date) 
VALUES
('C120','Walid','75 Paris Fr','2025-06-15'),



-- Task 10: List Employees with Their Branch Manager's Name and their branch details**:
SELECT*
FROM employees AS e 
JOIN branch AS b
ON e.branch_id =b.branch_id
JOIN employees AS e1
ON b.branch_id =e1.branch_id
;

-- Task 11. Create a Table of Books with Rental Price Above a Certain Threshold
CREATE TABLE books_7
AS
SELECT* 
FROM books_7
WHERE rental_price > 7
;

-- Task 12: Retrieve the List of Books Not Yet Returned

SELECT
  DISTINCT i.issued_book_name
FROM issued_status as i
LEFT join return_status as r
on i.issued_id = r.issued_id
WHERE return_id IS NULL
;
 
 
