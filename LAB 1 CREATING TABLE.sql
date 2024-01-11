LAB 1: Create a Database & Table Using MySQL Command-Line Client.



● Create a database with the name StudentManagementSystem.
Create a table with named Student with attributes:
● StudentID (Primary Key)
● FirstName
● LastName
● DateOfBirth
● Gender
● Email
● Phone

/*Creating the DATABASE StudentMangementSystem*/
mysql> CREATE DATABASE StudentManagementSystem;
Query OK, 1 row affected (0.03 sec)

mysql> SHOW DATABASES;
+-------------------------+
| Database                |
+-------------------------+
| information_schema      |
| mysql                   |
| performance_schema      |
| sakila                  |
| studentmanagementsystem |
| sys                     |
| world                   |
+-------------------------+
7 rows in set (0.01 sec)

mysql> USE StudentManagementSystem;
Database changed

mysql> CREATE TABLE Student(
    -> StudentID varchar(10) PRIMARY KEY,   
-- Unique identifier for each student
    -> FirstName varchar(50) NOT NULL,  
 -- First name of the student, cannot be NULL
    -> DateOfBirth DATE,-- Date of birth of the student
    -> Gender varchar(10) NOT NULL,
 -- Gender of the student, cannot be NULL
    -> Email varchar(100) NOT NULL,
-- Email address of the student, cannot be NULL
    -> Phone varchar(15) NOT NULL  
 -- Phone number of the student, cannot be NULL
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> show tables;
+-----------------------------------+
| Tables_in_studentmanagementsystem |
+-----------------------------------+
| student                           |
+-----------------------------------+
1 row in set (0.01 sec)

mysql> DESCRIBE student;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| StudentID   | varchar(10)  | NO   | PRI | NULL    |       |
| FirstName   | varchar(50)  | NO   |     | NULL    |       |
| DateOfBirth | date         | YES  |     | NULL    |       |
| Gender      | varchar(10)  | NO   |     | NULL    |       |
| Email       | varchar(100) | NO   |     | NULL    |       |
| Phone       | varchar(15)  | NO   |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
6 rows in set (0.01 sec)



Create a table with name Course with attributes:
● CourseID (Primary Key)
● CourseTitle



mysql> CREATE TABLE Course(
    -> CourseID varchar(10) PRIMARY KEY,  
-- Unique identifier for each course
    -> CourseTitle varchar(20) NOT NULL,
-- Title of the course, cannot be NULL
    -> Credits varchar(20) NOT NULL 
-- Number of credits associated with the course, cannot be NULL
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> DESCRIBE Course;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| CourseID    | varchar(10) | NO   | PRI | NULL    |       |
| CourseTitle | varchar(20) | NO   |     | NULL    |       |
| Credits     | varchar(20) | NO   |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
3 rows in set (0.02 sec)




Create a table with named Instructor with attributes:
● InstructorID (Primary Key)
● FirstName
● LastName
● Email
/* Creating Instuctor Table*/
mysql> CREATE TABLE Instructor(
    -> InstructorID varchar(10) PRIMARY KEY,
- Unique identifier for each instructor
    -> FirstName varchar(10) NOT NULL,
-- First name of the instructor, cannot be NULL
    -> LastName varchar(10) NOT NULL,
 -- Last name of the instructor, cannot be NULL
    -> Email varchar(100) NOT NULL
- Email address of the instructor, cannot be NULL
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql>  DESCRIBE Instructor;
+--------------+--------------+------+-----+---------+-------+
| Field        | Type         | Null | Key | Default | Extra |
+--------------+--------------+------+-----+---------+-------+
| InstructorID | varchar(10)  | NO   | PRI | NULL    |       |
| FirstName    | varchar(10)  | NO   |     | NULL    |       |
| LastName     | varchar(10)  | NO   |     | NULL    |       |
| Email        | varchar(100) | NO   |     | NULL    |       |
+--------------+--------------+------+-----+---------+-------+
4 rows in set (0.00 sec)





Create a table with named Enrollment with attributes:
● EnrollmentID (Primary Key)
● EnrollmentDate
● StudentID(Foreign key)
● CourseID(Foreign Key)
● InstructorID(Foreign key)


mysql> CREATE TABLE Enrollment (
    ->     EnrollmentID VARCHAR(20) PRIMARY KEY, 
     -- Adjust the length as needed for EnrollmentID
    ->     EnrollmentDate DATE,
    ->     StudentID VARCHAR(20), 
    -- Adjust the length as needed for StudentID
    ->     CourseID VARCHAR(10),
    ->     InstructorID VARCHAR(20),
     -- Establish foreign key constraints
    ->     FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    ->     FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
    ->     FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID)
    ->      );
Query OK, 0 rows affected (0.04 sec)

mysql> DESCRIBE Enrollment;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| EnrollmentID   | varchar(20) | NO   | PRI | NULL    |       |
| EnrollmentDate | date        | YES  |     | NULL    |       |
| StudentID      | varchar(20) | YES  | MUL | NULL    |       |
| CourseID       | varchar(10) | YES  | MUL | NULL    |       |
| InstructorID   | varchar(20) | YES  | MUL | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
5 rows in set (0.01 sec)




Create a table with named Score with attributes:
● ScoreID (Primary Key)
● CourseID (Foreign key)
● StudentID (Foreign Key)
● DateOfExam
● CreditObtained
/*Creating Score Table */



mysql> CREATE TABLE Score (
    ->     -- Define ScoreID as the primary key
    ->     ScoreID VARCHAR(20) PRIMARY KEY,
    ->     -- Reference CourseID as a foreign key linked to the Course table
    ->     CourseID VARCHAR(10),
    ->     -- Reference StudentID as a foreign key linked to the Student table
    ->     StudentID VARCHAR(20),
    ->     -- Specify DateOfExam as a date column
    ->     DateOfExam DATE,
    ->     -- Specify CreditObtained as a column for storing obtained credits
    ->     CreditObtained VARCHAR(20),
    ->     -- Establish a foreign key constraint linking CourseID to the Course table
    ->     FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
    ->     -- Establish a foreign key constraint linking StudentID to the Student table
    ->     FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> DESCRIBE Score;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| ScoreID        | varchar(20) | NO   | PRI | NULL    |       |
| CourseID       | varchar(10) | YES  | MUL | NULL    |       |
| StudentID      | varchar(20) | YES  | MUL | NULL    |       |
| DateOfExam     | date        | YES  |     | NULL    |       |
| CreditObtained | varchar(20) | YES  |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)



Create a table with named Feedback with attributes:
● FeedbackID (Primary Key)
● StudentID (Foreign key)
● Date
● InstructorName
● Feedback

/*Creatinng Feedback table */
mysql> CREATE TABLE Feedback (
    ->     -- Define FeedbackID as the primary key
    ->     FeedbackID VARCHAR(20) PRIMARY KEY,
    ->     -- Reference StudentID as a foreign key linked to the Student table
    ->     StudentID VARCHAR(20),
    ->     -- Specify Date as a date column
    ->     Date DATE,
    ->     -- Specify InstructorName as a column for storing the instructor's name
    ->     InstructorName VARCHAR(20),
    ->     -- Specify Feedback as a column for storing feedback comments
    ->     Feedback VARCHAR(100),
    ->     -- Establish a foreign key constraint linking StudentID to the Student table
    ->     FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> DESCRIBE Feedback;
+----------------+--------------+------+-----+---------+-------+
| Field          | Type         | Null | Key | Default | Extra |
+----------------+--------------+------+-----+---------+-------+
| FeedbackID     | varchar(20)  | NO   | PRI | NULL    |       |
| StudentID      | varchar(20)  | YES  | MUL | NULL    |       |
| Date           | date         | YES  |     | NULL    |       |
| InstructorName | varchar(20)  | YES  |     | NULL    |       |
| Feedback       | varchar(100) | YES  |     | NULL    |       |
+----------------+--------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql>
