CREATE DataBase placement;
USE placement;
CREATE TABLE EmployeeProjects (
    id INT PRIMARY KEY,
    empID INT,
    name VARCHAR(50),
    startdate DATE,
    clientID INT
);
INSERT INTO EmployeeProjects (id, empID, name, startdate, clientID) VALUES
(1, 1, 'A', '2021-04-21', 3),
(2, 2, 'B', '2021-03-12', 1),
(3, 3, 'C', '2021-01-16', 5),
(4, 3, 'D', '2021-04-27', 2),
(5, 5, 'E', '2021-05-01', 4);

CREATE TABLE EmployeeDetails (
    id INT PRIMARY KEY,
    fname VARCHAR(50),
    lname VARCHAR(50),
    Age INT,
    emailID VARCHAR(100),
    PhoneNo VARCHAR(15),
    City VARCHAR(50)
);
INSERT INTO EmployeeDetails (id, fname, lname, Age, emailID, PhoneNo, City) VALUES
(1, 'Aman', 'Proto', 32, 'aman@gmail.com', '898', 'Delhi'),
(2, 'Yagya', 'Narayan', 44, 'yagya@gmail.com', '222', 'Palam'),
(3, 'Rahul', 'BD', 22, 'rahul@gmail.com', '444', 'Kolkata'),
(4, 'Jatin', 'Hermit', 31, 'jatin@gmail.com', '666', 'Raipur'),
(5, 'PK', 'Pandey', 21, 'pk@gmail.com', '555', 'Jaipur');

CREATE TABLE clients (
    id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    emailID VARCHAR(100),
    PhoneNo VARCHAR(20),
    City VARCHAR(50),
    empID INT
);
INSERT INTO clients (id, first_name, last_name, age, emailID, PhoneNo, City, empID) VALUES
(1, 'Mac', 'Rogers', 47, 'mac@hotmail.com', '333', 'Kolkata', 3),
(2, 'Max', 'Poirier', 27, 'max@gmail.com', '222', 'Kolkata', 3),
(3, 'Peter', 'Jain', 24, 'peter@abc.com', '111', 'Delhi', 1),
(4, 'Sushant', 'Aggarwal', 23, 'sushant@yahoo.com', '45454', 'Hyderabad', 5),
(5, 'Pratap', 'Singh', 36, 'p@xyz.com', '77767', 'Mumbai', 2);

SELECT * FROM clients;
SELECT * FROM employeeprojects;

-- joins
SELECT e.id, e.fname, e.lname, p.id, p.name
FROM employeedetails AS e
INNER JOIN employeeprojects AS p
ON e.id = p.empid;

SELECT e.id, e.emailID, e.PhoneNo, c.first_name, c.last_name
FROM employeedetails AS e
INNER JOIN clients AS c
on e.id = c.empid
WHERE e.city = "Jaipur" AND c.city = "Hyderabad";

SELECT e.id, e.fname, e.lname, p.id, p.name
FROM employeedetails AS e
LEFT JOIN employeeprojects as p
ON e.id = p.empid;

-- subqueries
SELECT * FROM employeedetails 
WHERE age in
(SELECT age FROM employeedetails WHERE age>30);

SELECT * FROM employeedetails
WHERE id in
(SELECT empID from employeeprojects GROUP BY empID HAVING COUNT(empid)>1);

SELECT * FROM employeedetails 
WHERE age> (SELECT AVG(age) FROM employeedetails);

SELECT MAX(age) FROM employeedetails
WHERE(employeedetails.fname LIKE '%a%');

-- VIEWS
CREATE VIEW custom_view AS SELECT fname, age FROM employeedetails;
SELECT * FROM custom_view;
