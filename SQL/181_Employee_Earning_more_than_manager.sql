
MYSQL
------------------------------------------------------
/*
1. self-join to get the manager's salary
2. compare the salary
3. use where to find the targets

Output: Employee_name
 
*/ 


SELECT e1.name AS Employee
FROM Employee e1
JOIN Employee e2 
ON e1.managerID = e2.id
WHERE e1.salary > e2.salary


MSSQL
------------------------------------------------------

# logic is the same as MYSQL





Learning Notes:
------------------------------------------------------
# 1. self join
# 2. be careful about the null value - employees without manager id 

