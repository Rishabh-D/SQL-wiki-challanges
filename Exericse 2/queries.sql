CREATE TABLE Departments (
  Code INTEGER PRIMARY KEY,
  Name varchar(255) NOT NULL ,
  Budget decimal NOT NULL 
);

CREATE TABLE Employees (
  SSN INTEGER PRIMARY KEY,
  Name varchar(255) NOT NULL ,
  LastName varchar(255) NOT NULL ,
  Code INTEGER NOT NULL , 
  foreign key (Code) references Departments(Code) 
);

INSERT INTO Departments(Code,Name,Budget) VALUES(14,'IT',65000);
INSERT INTO Departments(Code,Name,Budget) VALUES(37,'Accounting',15000);
INSERT INTO Departments(Code,Name,Budget) VALUES(59,'Human Resources',240000);
INSERT INTO Departments(Code,Name,Budget) VALUES(77,'Research',55000);

INSERT INTO Employees(SSN,Name,LastName,Code) VALUES('123234877','Michael','Rogers',14);
INSERT INTO Employees(SSN,Name,LastName,Code) VALUES('152934485','Anand','Manikutty',14);
INSERT INTO Employees(SSN,Name,LastName,Code) VALUES('222364883','Carol','Smith',37);
INSERT INTO Employees(SSN,Name,LastName,Code) VALUES('326587417','Joe','Stevens',37);
INSERT INTO Employees(SSN,Name,LastName,Code) VALUES('332154719','Mary-Anne','Foster',14);
INSERT INTO Employees(SSN,Name,LastName,Code) VALUES('332569843','George','ODonnell',77);
INSERT INTO Employees(SSN,Name,LastName,Code) VALUES('546523478','John','Doe',59);
INSERT INTO Employees(SSN,Name,LastName,Code) VALUES('631231482','David','Smith',77);
INSERT INTO Employees(SSN,Name,LastName,Code) VALUES('654873219','Zacary','Efron',59);
INSERT INTO Employees(SSN,Name,LastName,Code) VALUES('745685214','Eric','Goldsmith',59);
INSERT INTO Employees(SSN,Name,LastName,Code) VALUES('845657245','Elizabeth','Doe',14);
INSERT INTO Employees(SSN,Name,LastName,Code) VALUES('845657246','Kumar','Swamy',14);


-- 2.1 Select the last name of all employees.

-- select lastname from Employees;

-- 2.2 Select the last name of all employees, without duplicates.

-- select distinct(lastname) from Employees;

-- 2.3 Select all the data of employees whose last name is "Smith".

-- select * from Employees 
-- where lastname = "Smith"

-- 2.4 Select all the data of employees whose last name is "Smith" or "Doe".

-- select * from Employees 
-- where lastname in ("Smith","Doe");

-- 2.5 Select all the data of employees that work in department 14.

-- select * from Employees 
-- where code = 14;

-- 2.6 Select all the data of employees that work in department 37 or department 77.

-- select * from Employees 
-- where code in (37,77);

-- 2.7 Select all the data of employees whose last name begins with an "S".

-- select * from Employees 
-- where lastname like "S%";

-- 2.8 Select the sum of all the departments' budgets.

-- select sum(budget) from Departments;

-- 2.9 Select the number of employees in each department (you only need to show the department code and the number of employees).

-- select Code, count(Code)
-- from Employees
-- group by Code;


-- 2.10 Select all the data of employees, including each employee's department's data.


-- select * from
-- Employees inner join Departments 
-- on Employees.Code = Departments.Code
 
 
-- 2.11 Select the name and last name of each employee, along with the name and budget of the employee's department.


-- select Employees.Name, Employees.lastname, Departments.Name, Departments.budget
-- from Employees inner join Departments 
-- on Employees.Code = Departments.Code;


-- 2.12 Select the name and last name of employees working for departments with a budget greater than $60,000.


-- select Employees.Name, Employees.lastname
-- from Employees inner join Departments 
-- on Employees.Code = Departments.Code
-- where Departments.budget>60000;


-- 2.13 Select the departments with a budget larger than the average budget of all the departments.


-- select Departments.Name from Departments
-- where Departments.budget > (
--     Select avg(Departments.budget) from Departments
--     );


-- 2.14 Select the names of departments with more than two employees.


-- select code
-- from Employees
-- group by code
-- having count(code)>2


-- 2.15 Very Important - Select the name and last name of employees working for departments with second lowest budget.

-- select Employees.name,Employees.lastname from Employees 
--             inner join (
--                       select code from Departments where budget = (
--                           select min(budget) from Departments where code not in (select code 
--                               from Departments where budget = (select min(budget)
--                                         from Departments)))
--                       )t
--                       on t.code = Employees.code;


-- --using window function
-- with cte as (

-- Select code,
-- dense_rank() over(order by Budget asc) as rnk 
-- from Departments

-- ) 

-- select * from Employees where code = (select code from cte where rnk =2);




-- 2.16  Add a new department called "Quality Assurance", with a budget of $40,000 and departmental code 11. 


-- Insert into Departments (Code,Name,Budget) VALUES(11,'Quality Assurance',40000);
-- Select * from Departments;



-- And Add an employee called "Mary Moore" in that department, with SSN 847-21-9811.

-- Insert Into Employees(SSN,Name,LastName,Code) VALUES(847-21-9811,"Mary","Moore",11);


-- Select * from Employees;


-- 2.17 Reduce the budget of all departments by 10%.


-- Update Departments 
-- set  budget = 0.9*budget


-- 2.18 Reassign all employees from the Research department (code 77) to the IT department (code 14).


-- Update Employees 
-- set code = 14 where code =77;


-- 2.19 Delete from the table all employees in the IT department (code 14).


-- Delete from Employees
-- where code =14


-- 2.20 Delete from the table all employees who work in departments with a budget greater than or equal to $60,000.



-- Delete from Employees 
-- where code in (select code from Departments
-- where budget >= 60000);


-- 2.21 Delete from the table all employees.


-- Delete from Employees;


