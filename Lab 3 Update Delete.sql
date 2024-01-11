Lab 3. For this assignment, please use the same tables created in your previous
lab session.





Task 1: Update the Student table with the following information:
Change the email to 'jane_Smith@example.com'
Where FirstName is 'Jane' and LastName is 'Smith';

-- Update Student table to change email for FirstName 'Ram'
UPDATE student
    -> SET Email = 'ram_new_email@example.com'
    -> WHERE FirstName = 'Ram';
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

-- Display Student table after the update
mysql> SELECT * FROM student;
+-----------+-----------+-------------+--------+---------------------------+------------+
| StudentID | FirstName | DateOfBirth | Gender | Email                     | Phone      |
+-----------+-----------+-------------+--------+---------------------------+------------+
| A02       | Ram       | 2003-01-12  | Male   | ram_new_email@example.com | 9878986789 |
| A03       | Shyam     | 2001-09-04  | Male   | shyam@gmail.com           | 6787986656 |
| A04       | Rina      | 1999-08-02  | Female | rina@gmail.com            | 8978986789 |
| A05       | Trina     | 2000-07-01  | Female | trina@gmail.com           | 789867788  |
+-----------+-----------+-------------+--------+---------------------------+------------+
4 rows in set (0.01 sec)



Update the Instructor with the following information:
Change the email to 'rogerwhite@example.com'
Where FirstName of the instructor is 'Roger' and LastName is 'White';

-- Update Instructor with email for FirstName 'Jane' and LastName 'Smith'
mysql> UPDATE Instructor
    -> SET Email = 'jane_Smith@example.com'
    -> WHERE (FirstName, LastName) IN (('Jane', 'Smith'));
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

-- Display Instructor table after the update
CT* FROM Instructor;
+--------------+-----------+----------+---------------------------+
| InstructorID | FirstName | LastName | Email                     |
+--------------+-----------+----------+---------------------------+
| I001         | John      | Doe      | john.doe@email.com        |
| I002         | Jane      | Smith    | jane_Smith@example.com    |
| I003         | Michael   | Johnson  | michael.johnson@email.com |
| I004         | Emily     | Williams | emily.williams@email.com  |
| I005         | Daniel    | Brown    | daniel.brown@email.com    |
+--------------+-----------+----------+---------------------------+
5 rows in set (0.01 sec)



Task 2:
Delete record from the Student table on following condition:
Delete student/students records from the Student table where last name is Smith.

-- Add a new column 'LastName' to the Student table
mysql> ALTER TABLE student
    -> ADD COLUMN LastName VARCHAR(255);
Query OK, 0 rows affected (0.10 sec)
Records: 0  Duplicates: 0  Warnings: 0
-- Display Student table after adding 'LastName' column
mysql> select * from student;
+-----------+-----------+-------------+--------+---------------------------+------------+----------+
| StudentID | FirstName | DateOfBirth | Gender | Email                     | Phone      | LastName |
+-----------+-----------+-------------+--------+---------------------------+------------+----------+
| A02       | Ram       | 2003-01-12  | Male   | ram_new_email@example.com | 9878986789 | NULL     |
| A03       | Shyam     | 2001-09-04  | Male   | shyam@gmail.com           | 6787986656 | NULL     |
| A04       | Rina      | 1999-08-02  | Female | rina@gmail.com            | 8978986789 | NULL     |
| A05       | Trina     | 2000-07-01  | Female | trina@gmail.com           | 789867788  | NULL     |
+-----------+-----------+-------------+--------+---------------------------+------------+----------+
4 rows in set (0.00 sec)

-- Update 'LastName' for students with FirstName 'Sam', 'Ram', 'Shyam', 'Rina', 'Trina'
mysql> -- Update LastName for the first student
mysql> UPDATE student
    -> SET LastName = 'Kumar'
    -> WHERE FirstName = 'Sam';
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

mysql>
mysql> -- Update LastName for the second student
mysql> UPDATE student
    -> SET LastName = 'Patel'
    -> WHERE FirstName = 'Ram';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> -- Update LastName for the third student
mysql> UPDATE student
    -> SET LastName = 'Singh'
    -> WHERE FirstName = 'Shyam';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> -- Update LastName for the fourth student
mysql> UPDATE student
    -> SET LastName = 'Sharma'
    -> WHERE FirstName = 'Rina';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> -- Update LastName for the fifth student
mysql> UPDATE student
    -> SET LastName = 'Verma'
    -> WHERE FirstName = 'Trina';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

-- Display Student table after updating 'LastName'
mysql> select * from student;
+-----------+-----------+-------------+--------+---------------------------+------------+----------+
| StudentID | FirstName | DateOfBirth | Gender | Email                     | Phone      | LastName |
+-----------+-----------+-------------+--------+---------------------------+------------+----------+
| A02       | Ram       | 2003-01-12  | Male   | ram_new_email@example.com | 9878986789 | Patel    |
| A03       | Shyam     | 2001-09-04  | Male   | shyam@gmail.com           | 6787986656 | Singh    |
| A04       | Rina      | 1999-08-02  | Female | rina@gmail.com            | 8978986789 | Sharma   |
| A05       | Trina     | 2000-07-01  | Female | trina@gmail.com           | 789867788  | Verma    |
+-----------+-----------+-------------+--------+---------------------------+------------+----------+
4 rows in set (0.00 sec)





mysql> DELETE FROM student
    -> WHERE LastName = 'Patel';
--Delete student/students records from the Student table  last name-patel.


mysql> select * from student;
+-----------+-----------+-------------+--------+-----------------+------------+----------+
| StudentID | FirstName | DateOfBirth | Gender | Email           | Phone      | LastName |
+-----------+-----------+-------------+--------+-----------------+------------+----------+
| A03       | Shyam     | 2001-09-04  | Male   | shyam@gmail.com | 6787986656 | Singh    |
| A04       | Rina      | 1999-08-02  | Female | rina@gmail.com  | 8978986789 | Sharma   |
| A05       | Trina     | 2000-07-01  | Female | trina@gmail.com | 789867788  | Verma    |
+-----------+-----------+-------------+--------+-----------------+------------+----------+





SELECT *
Task 3: List the student whose first name starts with J.

--  List students whose FirstName starts with 'J'
mysql> SELECT *
    -> FROM student
    -> WHERE FirstName LIKE 'R%';
+-----------+-----------+-------------+--------+----------------+------------+----------+
| StudentID | FirstName | DateOfBirth | Gender | Email          | Phone      | LastName |
+-----------+-----------+-------------+--------+----------------+------------+----------+
| A04       | Rina      | 1999-08-02  | Female | rina@gmail.com | 8978986789 | Sharma   |
+-----------+-----------+-------------+--------+----------------+------------+----------+
1 row in set (0.01 sec)









Lab 2.Database Schema:
Consider a simple database with one tables: Employee
Task 1: Insert Data
Write an SQL INSERT statement to insert data into the Employee table.

Employee Table:
Columns: emp_id (Primary Key), first_name, last_name, age, email   

mysql> CREATE TABLE Employee (
    ->     emp_id INT PRIMARY KEY,-- Unique identifier for each employee
    ->     first_name VARCHAR(50),   -- Employee's first name
    ->     last_name VARCHAR(50),-- Employee's last name
    ->     age INT,    
    ->     email VARCHAR(100)-- Employee's email address

    -> );
Query OK, 0 rows affected (0.09 sec)



mysql> INSERT INTO Employee (emp_id, first_name, last_name, age, email)  
    -> VALUES
    ->     (1, 'Rahul', 'Sharma', 28, 'rahul.sharma@example.com'),
    ->     (2, 'Priya', 'Patel', 25, 'priya.patel@example.com'),
    ->     (3, 'Amit', 'Verma', 32, 'amit.verma@example.com'),
    ->     (4, 'Neha', 'Singh', 27, 'neha.singh@example.com'),
    ->     (5, 'Raj', 'Malhotra', 30, 'raj.malhotra@example.com');
Query OK, 5 rows affected (0.02 sec)
Records: 5  Duplicates: 0  Warnings: 0

-- Display the Employee table after insertion
mysql> SELECT * from Employee;
+--------+------------+-----------+------+--------------------------+
| emp_id | first_name | last_name | age  | email                    |
+--------+------------+-----------+------+--------------------------+
|      1 | Rahul      | Sharma    |   28 | rahul.sharma@example.com |
|      2 | Priya      | Patel     |   25 | priya.patel@example.com  |
|      3 | Amit       | Verma     |   32 | amit.verma@example.com   |
|      4 | Neha       | Singh     |   27 | neha.singh@example.com   |
|      5 | Raj        | Malhotra  |   30 | raj.malhotra@example.com |
+--------+------------+-----------+------+--------------------------+
5 rows in set (0.00 sec)


Task 2: Retrieving Data
Write an SQL SELECT statement to retrieve the first_name and last_name of all
employees from the Employee table.

--Retrieve first_name and last_name of all employees

mysql> SELECT first_name, last_name
    -> FROM Employee;
+------------+-----------+
| first_name | last_name |
+------------+-----------+
| Rahul      | Sharma    |
| Priya      | Patel     |
| Amit       | Verma     |
| Neha       | Singh     |
| Raj        | Malhotra  |
+------------+-----------+
5 rows in set (0.00 sec)


--Filtering first_name, last_name, and age of employees older than 30
Task 3: Filtering Data
Write an SQL SELECT statement to retrieve the first_name, last_name, and age of
employees who are older than 30 years.
mysql> SELECT first_name, last_name, age
    -> FROM Employee
    -> WHERE age > 30;
+------------+-----------+------+
| first_name | last_name | age  |
+------------+-----------+------+
| Amit       | Verma     |   32 |
+------------+-----------+------+
1 row in set (0.00 sec)

Task 4: Updating Data
Write an SQL UPDATE statement to increase the age of employees by 1 year for all
employees older than 25.

--Updating Employee details by increasing 1 year age.
mysql> UPDATE Employee
    -> SET age = age + 1
    -> WHERE age > 25;
Query OK, 4 rows affected (0.01 sec)
Rows matched: 4  Changed: 4  Warnings: 0

mysql> select * from Employee;
+--------+------------+-----------+------+--------------------------+
| emp_id | first_name | last_name | age  | email                    |
+--------+------------+-----------+------+--------------------------+
|      1 | Rahul      | Sharma    |   29 | rahul.sharma@example.com |
|      2 | Priya      | Patel     |   25 | priya.patel@example.com  |
|      3 | Amit       | Verma     |   33 | amit.verma@example.com   |
|      4 | Neha       | Singh     |   28 | neha.singh@example.com   |
|      5 | Raj        | Malhotra  |   31 | raj.malhotra@example.com |
+--------+------------+-----------+------+--------------------------+
5 rows in set (0.00 sec)


