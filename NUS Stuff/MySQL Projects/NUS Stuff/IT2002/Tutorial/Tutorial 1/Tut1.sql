--  INSERT INTO book VALUES ('An Introduction to Database Systems', 'paperback' ,
-- 640,
-- 'English',
-- 'C.J. Date',
-- 'Pearson',
-- '2003-01-01' ,
-- '0321197844' ,
-- '978-0321197849') ;

-- SELECT *
-- FROM book;

--  INSERT INTO book VALUES ('An Introduction to Database Systems', 'paperback' ,
-- 640,
-- 'English',
-- 'C.J. Date',
-- 'Pearson',
-- '2003-01-01' ,
-- '0321197844' ,
-- '978-0201385908') ; Error as it violates ISBN10 unique constraint

--  INSERT INTO student VALUES (
-- 	'TIKKI TAVI',
-- 	'tikki@gmail.com',
-- 	'2010-01-01',
-- 	'School of Computing',
-- 	'CS',
-- 	NULL)

-- UPDATE student
-- SET department = 'Computer Science'
-- WHERE department = 'CS'

-- SELECT *
-- FROM student
-- WHERE department = 'Computer Science';

--  INSERT INTO book VALUES (
--     'An Introduction to Database Systems',
--     'paperback',
--     640,
--     'English',
--     'C.J.Date ',
--     'Pearson',
--     '2003-01-01 ' ,
--     '0321197844' ,
--     '978-0201385908') ;

-- INSERT INTO student VALUES (
-- 'TIKKI TAVI' ,
-- 'tikki@gmail.com' ,
-- '2010-01-01' ,
-- 'School of Computing',
-- 'CS',
-- NULL );
-- SELECT *
-- FROM student;

-- INSERT INTO student (email, name, year, faculty, department)
-- VALUES (
-- 'rikki@gmail.com',
-- 'RIKKI TAVI',
-- '2010-01-01',
-- 'School of Computing',
-- 'CS');

-- INSERT INTO COPY 
-- VALUES (
-- 'tikki@gmail.com',
-- '978-0321197849', 
-- 1,
-- 'TRUE');

-- SELECT * FROM copy;

-- CREATE TABLE department (
-- department VARCHAR(32) PRIMARY KEY,
-- faculty VARCHAR(62) NOT NULL);

-- INSERT INTO department
-- SELECT DISTINCT department, faculty 
-- FROM STUDENT;

-- ALTER TABLE student
-- DROP COLUMN faculty;

-- ALTER TABLE student
-- ADD FOREIGN KEY (department) REFERENCES department(department);

