Lab 1: Database Schema:
Consider a simple database with one tables: BankAccount
BankAccount Table:
Columns: account_id (Primary Key), account_holder_name,
account_balance


-- Switch to the BankAccount database
mysql> USE BankAccount
Database changed
mysql> show tables;
+-----------------------+
| Tables_in_bankaccount |
+-----------------------+
| bankaccount           |
+-----------------------+
1 row in set (0.09 sec)


-- Creating the BankAccount table
CREATE TABLE BankAccount (
    account_id INT PRIMARY KEY,
    account_holder_name VARCHAR(100) NOT NULL,
    account_balance DECIMAL(10, 2)
);



mysql> desc bankaccount;
+---------------------+---------------+------+-----+---------+-------+
| Field               | Type          | Null | Key | Default | Extra |
+---------------------+---------------+------+-----+---------+-------+
| account_id          | varchar(10)   | NO   | PRI | NULL    |       |
| account_holder_name | varchar(100)  | NO   |     | NULL    |       |
| account_balance     | decimal(10,2) | YES  |     | NULL    |       |
+---------------------+---------------+------+-----+---------+-------+
3 rows in set (0.01 sec)



- Inserting five records into the BankAccount table
Task 1: Insert Data
Write an SQL INSERT statement to insert data into the BankAccount table.
mysql> -- Inserting five records into the BankAccount table starting with account_id as 101
mysql> INSERT INTO BankAccount (account_id, account_holder_name, account_balance)
    -> VALUES
    ->     (101, 'Sara Khan', 7500.25),
    ->     (102, 'Vikram Mehta', 22000.50),
    ->     (103, 'Ayesha Gupta', 18000.75),
    ->     (104, 'Rajiv Verma', 42000.00),
    ->     (105, 'Pooja Sharma', 1200.50);
Query OK, 5 rows affected (0.00 sec)
Records: 5  Duplicates: 0  Warnings: 0


-- Retrieving account_holder_name and account_balance from the BankAccount table
Task 2: Retrieving Data
Write an SQL SELECT statement to retrieve the account_holder_name and
account_balance of all account holders from the BankAccount table.
mysql> SELECT * FROM BankAccount;
mysql> SELECT account_holder_name, account_balance
    -> FROM BankAccount;
+---------------------+-----------------+
| account_holder_name | account_balance |
+---------------------+-----------------+
| Sara Khan           |         7500.25 |
| Vikram Mehta        |        22000.50 |
| Ayesha Gupta        |        18000.75 |
| Rajiv Verma         |        42000.00 |
| Pooja Sharma        |         6000.00 |
+---------------------+-----------------+
5 rows in set (0.00 sec)

-- Filtering data where account_balance is more than 30,000
Task 3: Filtering Data
Write an SQL SELECT statement to retrieve the account_holder_name and
account_balance where the account_balance is more than 30,000.

mysql> -- Filtering data where account_balance is more than 30,000
mysql> SELECT *
    -> FROM BankAccount
    -> WHERE account_balance > 30000;
+------------+---------------------+-----------------+
| account_id | account_holder_name | account_balance |
+------------+---------------------+-----------------+
| 104        | Rajiv Verma         |        42000.00 |
+------------+---------------------+-----------------+
1 row in set (0.00 sec)



-- Attempt to update the account_balance 
Task 4: Updating Data
Write an SQL UPDATE statement to change the account_balance of the account
holder whose ID is 101.
mysql> -- Updating the account_balance for the account holder with ID 1
mysql> UPDATE BankAccount
    -> SET account_balance = 5000.00
    -> WHERE account_id = 1;
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

-- Updating account_balance for records where account_balance is <= 5000
mysql> -- Updating account_balance for records where account_balance is <= 5000
mysql> UPDATE BankAccount
    -> SET account_balance = 6000.00  -- Set the desired new balance
    -> WHERE account_balance <= 5000;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0


-- Display all records in the BankAccount table after the update
mysql> select * from bankaccount;
+------------+---------------------+-----------------+
| account_id | account_holder_name | account_balance |
+------------+---------------------+-----------------+
| 101        | Sara Khan           |         7500.25 |
| 102        | Vikram Mehta        |        22000.50 |
| 103        | Ayesha Gupta        |        18000.75 |
| 104        | Rajiv Verma         |        42000.00 |
| 105        | Pooja Sharma        |         6000.00 |
+------------+---------------------+-----------------+
5 rows in set (0.00 sec)