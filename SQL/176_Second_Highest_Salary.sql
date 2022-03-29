
MYSQL
------------------------------------------------------
/*
Steps:
1. find the largest salary N
2. find all salaries that is smaller than N
3. order by salary and get the largest one (pay attention to the null case)

Output:
salary  
*/ 

SELECT IFNULL(MAX(salary), null) AS SecondHighestSalary
FROM Employee
WHERE salary < 
	(SELECT MAX(salary) AS largest_salary
	FROM Employee)


MSSQL
------------------------------------------------------

/*
Steps:
1. use rank() over() function to order the salary
2. find the rank = 2
*/

SELECT MAX(salary) AS SecondHighestSalary
FROM 
	(SELECT salary, RANK() OVER(ORDER BY salary DESC) AS rank_salary
	FROM Employee) salary_rank
WHERE rank_salary = 2



Learning Notes:
------------------------------------------------------
Using max() will return a NULL if the value doesn't exist in both MySQL and MSSQL
