
MYSQL
------------------------------------------------------
/*
1. use LIMIT N OFFSET N to find the nth salary
2. Here, even if you don't select from the current code (compared to 176), it's also fine. 
This is because we have a function and use RETURN, which gives Null when whats inside is an empty table
However in 176, we don't have it.
 
*/ 

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  SET N = N-1;
  RETURN (
      # Write your MySQL query statement below.
	 SELECT DISTINCT salary 
	 FROM Employee
	 ORDER BY salary DESC
	 LIMIT 1 OFFSET N
  );
END


MSSQL
------------------------------------------------------

/*
Steps: the idea is the same as 176
1. use the rank() over() to rank the salary
2. find the nth highest salary by using rank = N
3. use MAX() to deal with the null result
*/

CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    RETURN (
        /* Write your T-SQL query statement below. */
        SELECT MAX(salary) 
		FROM 
			(SELECT salary, DENSE_RANK() OVER(ORDER BY salary DESC) AS rank_salary
			FROM Employee) rank_salary
		WHERE rank_salary = @N
    );
END


Learning Notes:
------------------------------------------------------
# 1. LIMIT 1 OFFSET 1 means limit 1 record, starting from the second row 

# 2. DENSE_RANK vs. RANK 
	# list: [1,2,2,3,8]
	# RANK: 1,2,2,4,5
	# DENSE_RANK: 1,2,2,3,4

# 3. DISTINCT () for null value: 
	# DISTINCT () does not ignore null value
	# The DISTINCT operator treats NULL duplicate. It means that the two NULLs are the same. Therefore, if the SELECT statement returns NULLs, the DISTINCT returns only one NULL.
	# if the table does not have the matching value, it will return empty string. In order to return null, we have to use select () again.