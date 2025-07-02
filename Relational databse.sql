--Problem Statement:
--How to convert a relational design into tables in SQL Server?
--Topics:
--In this project, you will work on converting a relational design that enlists various
--users, their roles, user accounts and their statuses into different tables in SQL
--Server and insert data into them. Having at least two rows in each of the tables,
--you have to ensure that you have created respective foreign keys.
--Tasks To Be Performed:
--? Define relations/attributes
--? Define primary keys
--? Create foreign keys
--1. Insert data into each of the above tables. With at least two rows in each of
--the tables. Make sure that you have created respective foreign keys.
--2. Delete all the data from each of the tables.


create database relational_database
use relational_database
-- Create Roles table

-- Create Roles table
CREATE TABLE Roles (
    role_id INT PRIMARY KEY,
    role_name VARCHAR(50)
);

-- Create Statuses table
CREATE TABLE Statuses (
    status_id INT PRIMARY KEY,
    status_name VARCHAR(50)
);

-- Create Users table
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(100),
    email VARCHAR(100)
);

-- Create Accounts table
CREATE TABLE Accounts (
    account_id INT PRIMARY KEY,
    user_id INT,
    status_id INT,
    account_name VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (status_id) REFERENCES Statuses(status_id)
);

-- Create UserRoles table
CREATE TABLE UserRoles (
    user_id INT,
    role_id INT,
    PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (role_id) REFERENCES Roles(role_id)
);

DELETE FROM UserRoles;
DELETE FROM Accounts;
DELETE FROM Users;
DELETE FROM Roles;
DELETE FROM Statuses;
