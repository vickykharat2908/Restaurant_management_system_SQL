USE Restaurant_Management_System;

-- Q1.Display the all tables
select * from customers;
select * from employees;
select * from menu;
select * from orders;
select * from payments;

-- Q2.Display customers from pune
select CustomerName,City from customers
where City = "Pune";

-- Q3.Display Menu Items Price is greater than 200.
select ItemName, Price from Menu
where Price > 200;

-- Q4.Sort Menu By Price (Top Highest Price )
Select * from Menu 
order by Price DESC;

-- Q5.Count Total Registered Customers
Select Count(*) as Total_Customers from customers;

-- Q6.Average Salary of employees
select avg(Salary) as Avg_Salary from employees;

-- Q7.Highest Salary of the Employee
select max(Salary) as Highest_Salary from employees;

-- Q8.Lowest menu Price
select min(Price) from Menu;

-- Q9.Total Sales (Calculate Total Restaurants Revenue)
select sum(Amount) as Total_Sales from payments;

-- Q10.How Many Total Orders are Pending , Cancelled and Completed?
SELECT Status,
COUNT(*) AS Total_Orders
FROM Orders
Group By Status;

-- Q11.Employee salary is greater than 40000 
select EmployeeName, Salary from Employees
where Salary > 40000;

-- Q12.Displays complete order details using multiple tables
select orders.OrderID, customers.CustomerName, employees.EmployeeName, menu.ItemName, orders.TotalAmount from Orders 
Inner Join Customers
on orders.CustomerId = customers.CustomerId
Inner join Employees
on orders.EmployeeId = employees.EmployeeId
Inner join Menu 
on orders.MenuId = menu.MenuId;

-- Q13.Shows all customers, even if they have not placed an order.
select customers.customerName,orders.OrderID from customers
Left Join Orders
on customers.CustomerID = orders.CustomerID;

-- Q14.Displays orders from a specific period.
select * from orders
where OrderDate between "2024-07-19" and "2024-09-21";  

-- Q15.Searches customer names starting with "Customer1".
select CustomerName from customers 
where CustomerName 
like "Customer1%";

-- Q16.Shows revenue by payment method.(Payment method wise Total sales)
select PaymentMethod, sum(Amount) as Total_Amount from payments
group by PaymentMethod;

-- Q17.Displays the 10 most expensive dishes. (Top 10 Expensive Menu Items)
Select * from Menu
order by Price desc
limit 10; 

-- Q18.Finds the highest spending customer.
select CustomerID , sum(TotalAmount) as Total_Spent from orders
group by CustomerID
order by Total_Spent desc
limit 1;

-- Q19.Identifies the employee who handled the most orders.
select EmployeeID , count(*) as Total_Orders from orders
group by EmployeeID
order by Total_Orders desc
limit 1;

-- Q20.Displays month/MonthName-wise Total sales performance.
select monthname(PaymentDate) as Month, sum(Amount) as Total_Sales from payments
group by month
order by Total_Sales desc;