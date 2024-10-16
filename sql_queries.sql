CREATE DATABASE ORG;
USE ORG;

CREATE TABLE Worker(
	Worker_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    First_Name CHAR(25),
    Last_Name CHAR(25),
    Salary INT(15),
    Joining_Date DATETIME,
    Department CHAR(25)
);	

INSERT INTO WORKER (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
(1, 'Monika', 'Arora', 100000, '2014-02-20 09:00:00', 'HR'),
(2, 'Niharika', 'Verma', 80000, '2014-06-11 09:00:00', 'Admin'),
(3, 'Vishal', 'Singhal', 300000, '2014-02-20 09:00:00', 'HR'),
(4, 'Amitabh', 'Singh', 500000, '2014-02-20 09:00:00', 'Admin'),
(5, 'Vivek', 'Bhati', 500000, '2014-06-11 09:00:00', 'Admin'),
(6, 'Vipul', 'Diwan', 200000, '2014-06-11 09:00:00', 'Account'),
(7, 'Satish', 'Kumar', 75000, '2014-01-20 09:00:00', 'Account'),
(8, 'Geetika', 'Chauhan', 90000, '2014-04-11 09:00:00', 'Admin');

CREATE TABLE BONUS (
    WORKER_REF_ID INT,
    BONUS_AMOUNT INT(10),
    BONUS_DATE DATETIME,
    FOREIGN KEY (WORKER_REF_ID) REFERENCES WORKER(WORKER_ID) ON DELETE CASCADE
);

INSERT INTO BONUS (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
(1, 5000, '2016-02-20 00:00:00'),
(2, 3000, '2016-06-11 00:00:00'),
(3, 4000, '2016-02-20 00:00:00'),
(1, 4500, '2016-02-20 00:00:00'),
(2, 3500, '2016-06-11 00:00:00');

CREATE TABLE TITLE (
    WORKER_REF_ID INT,
    WORKER_TITLE VARCHAR(50),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY (WORKER_REF_ID) REFERENCES WORKER(WORKER_ID) ON DELETE CASCADE
);

INSERT INTO TITLE (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
(1, 'Manager', '2016-02-20 00:00:00'),
(2, 'Executive', '2016-06-11 00:00:00'),
(8, 'Executive', '2016-06-11 00:00:00'),
(5, 'Manager', '2016-06-11 00:00:00'),
(4, 'Asst. Manager', '2016-06-11 00:00:00'),
(7, 'Executive', '2016-06-11 00:00:00');

-- 	1.	Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
SELECT First_Name AS Worker_Name FROM worker;
-- 	2.	Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
SELECT upper(First_Name) FROM Worker;
-- 	3.	Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
SELECT DISTINCT Department FROM Worker;
-- 	4.	Write an SQL query to print the first three characters of FIRST_NAME from Worker table.
SELECT substring(first_name, 1, 3) FROM Worker;
-- 	5.	Write an SQL query to find the position of the alphabet (‘b’) in the first name column ‘Amitabh’ from Worker table.
SELECT INSTR(first_name, 'b') FROM Worker WHERE first_name = 'Amitabh';
-- 	6.	Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
SELECT RTRIM(first_name) FROM Worker;
-- 	7.	Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
SELECT LTRIM(first_name) FROM Worker;
-- 	8.	Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
SELECT DISTINCT department, Length(department) FROM Worker;
