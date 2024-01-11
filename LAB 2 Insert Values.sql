LAB 2:Use the Database and table from Day 1 lab. Insert 5 records in each table
and retrieve data from all tables and display.



-- Switch to the 'studentmanagementsystem' database
USE studentmanagementsystem;

-- Display the structure of the 'student' table
DESC student;

-- Insert records into the 'student' table
INSERT INTO Student (StudentID, FirstName, DateOfBirth, Gender, Email, Phone)
VALUES
    ('A01', 'Sam', '2002-01-21', 'Male', 'sam@gmail.com','8909876789'), -- Sam's data
    ('A02', 'Ram', '2003-01-12', 'Male', 'ram@gmail.com', '9878986789'),-- Ram's data
    ('A03', 'Shyam', '2001-09-04', 'Male', 'shyam@gmail.com','6787986656'), -- Shyam's data
    ('A04', 'Rina', '1999-08-02', 'Female', 'rina@gmail.com','8978986789'),-- Rina's data
    ('A05', 'Trina', '2000-07-01', 'Female', 'trina@gmail.com','789867788'); -- Trina's data

-- Displaying all tables in the 'studentmanagementsystem' database
mysql> SHOW tables;
+-----------------------------------+
| Tables_in_studentmanagementsystem |
+-----------------------------------+
| course                            |
| enrollment                        |
| feedback                          |
| instructor                        |
| score                             |
| student                           |
+-----------------------------------+
6 rows in set (0.02 sec)
-- Displaying the structure of the 'course' table

mysql> DESC course;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| CourseID    | varchar(10) | NO   | PRI | NULL    |       |
| CourseTitle | varchar(20) | NO   |     | NULL    |       |
| Credits     | varchar(20) | NO   |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
3 rows in set (0.04 sec)



-- Inserting data into the 'Course' table

mysql> INSERT INTO Course (CourseID, CourseTitle, Credits)
    -> VALUES
    ->     ('C001', 'Intro Chem', 3),  -- Sam's Chemistry exam
    ->     ('C002', 'DB Management', 4), -- Ram's Database Management exam
    ->     ('C003', 'Web Dev', 3), -- Shyam's Web Development exam
    ->     ('C004', 'Data Structures', 4),-- Rina's Data Structures exam
    ->     ('C005', 'Software Eng', 3); -- Trina's Software Engineering exam
Query OK, 5 rows affected (0.00 sec)
Records: 5  Duplicates: 0  Warnings: 0

- Displaying all records in the 'Course' table
mysql> SELECT * FROM Course;
+----------+-----------------+---------+
| CourseID | CourseTitle     | Credits |
+----------+-----------------+---------+
| C001     | Intro Chem      | 3       |
| C002     | DB Management   | 4       |
| C003     | Web Dev         | 3       |
| C004     | Data Structures | 4       |
| C005     | Software Eng    | 3       |
+----------+-----------------+---------+
5 rows in set (0.00 sec)

-- Inserting data into the 'Instructor' table

mysql> INSERT INTO Instructor (InstructorID, FirstName , LastName , Email)
    -> VALUES
    ->      ('I001', 'John', 'Doe', 'john.doe@email.com'),    -- John Doe 
    ->      ('I002', 'Jane', 'Smith', 'jane.smith@email.com'), -- Jane Smith
    ->      ('I003', 'Michael', 'Johnson', 'michael.johnson@email.com'), -- Michael Johnson
    ->      ('I004', 'Emily', 'Williams', 'emily.williams@email.com'),  -- Emily Williams
    ->      ('I005', 'Daniel', 'Brown', 'daniel.brown@email.com'); -- Daniel Brown

Query OK, 5 rows affected (0.02 sec)
Records: 5  Duplicates: 0  Warnings: 0

-


mysql> SELECT * FROM Instructor;
+--------------+-----------+----------+---------------------------+
| InstructorID | FirstName | LastName | Email                     |
+--------------+-----------+----------+---------------------------+
| I001         | John      | Doe      | john.doe@email.com        |
| I002         | Jane      | Smith    | jane.smith@email.com      |
| I003         | Michael   | Johnson  | michael.johnson@email.com |
| I004         | Emily     | Williams | emily.williams@email.com  |
| I005         | Daniel    | Brown    | daniel.brown@email.com    |
+--------------+-----------+----------+---------------------------+
5 rows in set (0.00 sec)


-- Inserting data into the 'Score' table
mysql> INSERT INTO Score (ScoreID, CourseID, StudentID, DateOfExam, CreditObtained)
    -> VALUES
    ->     ('S001', 'C001', 'A01', '2024-01-10', 85), -- Sam's Chemistry exam
    ->     ('S002', 'C002', 'A02', '2024-01-12', 92), -- Ram's Database Management exam
    ->     ('S003', 'C003', 'A03', '2024-01-15', 78), -- Shyam's Web Development exam
    ->     ('S004', 'C004', 'A04', '2024-01-18', 95),  -- Rina's Data Structures exam
    ->     ('S005', 'C005', 'A05', '2024-01-20', 88); -- Rina's Data Structures exam

Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

--Display the table Score--
mysql> SELECT * FROM Score;
+---------+----------+-----------+------------+----------------+
| ScoreID | CourseID | StudentID | DateOfExam | CreditObtained |
+---------+----------+-----------+------------+----------------+
| S001    | C001     | A01       | 2024-01-10 | 85             |
| S002    | C002     | A02       | 2024-01-12 | 92             |
| S003    | C003     | A03       | 2024-01-15 | 78             |
| S004    | C004     | A04       | 2024-01-18 | 95             |
| S005    | C005     | A05       | 2024-01-20 | 88             |
+---------+----------+-----------+------------+----------------+
5 rows in set (0.00 sec)

-- Inserting data into the 'Enrollment' table

mysql> DESC enrollment;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| EnrollmentID   | varchar(20) | NO   | PRI | NULL    |       |
| EnrollmentDate | date        | YES  |     | NULL    |       |
| StudentID      | varchar(20) | YES  | MUL | NULL    |       |
| CourseID       | varchar(10) | YES  | MUL | NULL    |       |
| InstructorID   | varchar(20) | YES  | MUL | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> INSERT INTO Enrollment (EnrollmentID , EnrollmentDate ,StudentID, CourseID, InstructorID)
    -> VALUES
    -> ('E001', '2024-01-25', 'A01', 'C001', 'I001'),  -- Sam enrolls in Chemistry with John Doe
    ->     ('E002', '2024-01-26', 'A02', 'C002', 'I002'), -- Ram enrolls in Database Management with Jane Smith
    ->     ('E003', '2024-01-27', 'A03', 'C003', 'I003'),  -- Shyam enrolls in Web Development with Michael Johnson
    ->     ('E004', '2024-01-28', 'A04', 'C004', 'I004'),  -- Rina enrolls in Data Structures with Emily Williams
    ->     ('E005', '2024-01-29', 'A05', 'C005', 'I005');  -- Trina enrolls in Software Engineering with Daniel Brown
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

--Display the enrollment table--
mysql> SELECT * FROM Enrollment;
+--------------+----------------+-----------+----------+--------------+
| EnrollmentID | EnrollmentDate | StudentID | CourseID | InstructorID |
+--------------+----------------+-----------+----------+--------------+
| E001         | 2024-01-25     | A01       | C001     | I001         |
| E002         | 2024-01-26     | A02       | C002     | I002         |
| E003         | 2024-01-27     | A03       | C003     | I003         |
| E004         | 2024-01-28     | A04       | C004     | I004         |
| E005         | 2024-01-29     | A05       | C005     | I005         |
+--------------+----------------+-----------+----------+--------------+
5 rows in set (0.00 sec)

--Display the feedback table--
mysql> desc Feedback;
+----------------+--------------+------+-----+---------+-------+
| Field          | Type         | Null | Key | Default | Extra |
+----------------+--------------+------+-----+---------+-------+
| FeedbackID     | varchar(20)  | NO   | PRI | NULL    |       |
| StudentID      | varchar(20)  | YES  | MUL | NULL    |       |
| Date           | date         | YES  |     | NULL    |       |
| InstructorName | varchar(20)  | YES  |     | NULL    |       |
| Feedback       | varchar(100) | YES  |     | NULL    |       |
+----------------+--------------+------+-----+---------+-------+
5 rows in set (0.01 sec)

mysql> INSERT INTO Feedback (FeedbackID, StudentID , Date , InstructorName , Feedback )
    -> VALUES
    ->     ('F001', 'A01', '2024-02-01', 'John Doe', 'Great instructor, very helpful.'),  -- Sam's feedback
    ->     ('F002', 'A02', '2024-02-02', 'Jane Smith', 'Enjoyed the class, learned a lot.'),-- Ram's feedback
    ->     ('F003', 'A03', '2024-02-03', 'Michael Johnson', 'Clear explanations, engaging lectures.'),-- Shyam's feedback
    ->     ('F004', 'A04', '2024-02-04', 'Emily Williams', 'Fantastic teaching style.'), -- Rina's feedback
    ->     ('F005', 'A05', '2024-02-05', 'Daniel Brown', 'Extremely knowledgeable instructor.'); -- Trina's feedback
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

--Display the feedback table--

mysql> SELECT * FROM Feedback;
+------------+-----------+------------+-----------------+----------------------------------------+
| FeedbackID | StudentID | Date       | InstructorName  | Feedback                               |
+------------+-----------+------------+-----------------+----------------------------------------+
| F001       | A01       | 2024-02-01 | John Doe        | Great instructor, very helpful.        |
| F002       | A02       | 2024-02-02 | Jane Smith      | Enjoyed the class, learned a lot.      |
| F003       | A03       | 2024-02-03 | Michael Johnson | Clear explanations, engaging lectures. |
| F004       | A04       | 2024-02-04 | Emily Williams  | Fantastic teaching style.              |
| F005       | A05       | 2024-02-05 | Daniel Brown    | Extremely knowledgeable instructor.    |
+------------+-----------+------------+-----------------+----------------------------------------+
5 rows in set (0.00 sec)



