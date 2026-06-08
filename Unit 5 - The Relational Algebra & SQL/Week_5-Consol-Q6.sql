drop table Accounts;
DROP TABLE Customers;
 
CREATE TABLE Accounts
(acctNumber varchar (25),
 type varchar(255) NOT NULL,
balance int NOT NULL
);

CREATE table Customers
(firstName varchar (25),
 lastName varchar (25),
 cID varchar NOT NULL,
 account varchar NOT NULL
 );

INSERT INTO Accounts (acctNumber, type, balance) VALUES ('AC12345', 'Savings', 12000);
INSERT INTO Accounts (acctNumber, type, balance) VALUES ('AC23456', 'Checking', 1000);
INSERT INTO Accounts (acctNumber, type, balance) VALUES ('AC34567', 'Savings', 25);
INSERT INTO Customers (firstName, lastName, cID, account) VALUES ('Robert', 'Ayala', '901-222','AC12345');
INSERT INTO Customers (firstName, lastName, cID, account) VALUES ('Anna', 'Marini', '805-333', 'AC12345');
INSERT INTO Customers (firstName, lastName, cID, account) VALUES ('Anna', 'Marini', '805-333', 'AC34567');

-- Select * from Accounts;

-- Q6) Insert two or three records to each table in any order 
INSERT INTO Accounts (acctNumber, type, balance) VALUES ('AC45678', 'Savings', 100);
INSERT INTO Accounts (acctNumber, type, balance) VALUES ('AC56789', 'Checking', 5000);
INSERT INTO Accounts (acctNumber, type, balance) VALUES ('AC67891', 'Savings', 200);
INSERT INTO Customers (firstName, lastName, cID, account) VALUES ('James', 'Brown', '934-444', 'AC45678');
INSERT INTO Customers (firstName, lastName, cID, account) VALUES ('Norton', 'Grey', '768-111', 'AC56789');
INSERT INTO Customers (firstName, lastName, cID, account) VALUES ('Lilian', 'Matthews', '354-222', 'AC67891');

-- Q7) Delete one record in each table. 
delete from Accounts where acctnumber = 'AC45678';
DELETE from Customers WHERE cID = '768-111';

--Q8) Adding column age to accounts
ALTER TABLE Accounts add age int;

--Q9) Populating age column
update Accounts set age = 35 where acctNumber = 'AC34567';

-- Q10) Query accounts
SELECT * from Accounts where balance > 500;

--Q11) Query customers
SELECT lastName, account FROM Customers; 


-- Displaying the tables.
--SELECT * from Accounts;
--SELECT * from Customers