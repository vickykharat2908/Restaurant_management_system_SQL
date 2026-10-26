CREATE DATABASE Restaurant_Management_System;

USE Restaurant_Management_System;

CREATE TABLE Customers(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    JoinDate DATE
);

CREATE TABLE Employees(
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    Role VARCHAR(50),
    Salary DECIMAL(10,2),
    HireDate DATE
);

CREATE TABLE Menu(
    MenuID INT PRIMARY KEY,
    ItemName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

CREATE TABLE Orders(
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    EmployeeID INT,
    MenuID INT,
    Quantity INT,
    OrderDate DATE,
    Status VARCHAR(30),
    TotalAmount DECIMAL(10,2),

    FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY(EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY(MenuID) REFERENCES Menu(MenuID)
);

CREATE TABLE Payments(
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    PaymentMethod VARCHAR(30),
    PaymentDate DATE,
    Amount DECIMAL(10,2),

    FOREIGN KEY(OrderID) REFERENCES Orders(OrderID)
);