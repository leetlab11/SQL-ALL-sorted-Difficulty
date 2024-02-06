-- my code starts with 'with cte...'
-- ranked salary desc, got salary with rnk = n

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      with cte as(select distinct salary, dense_rank() over(order by salary desc) as rnk
      from Employee)

      select distinct salary
      from cte
      where rnk = n

  );
END

------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SET N = N-1 after BEGIN
-- offset n
-- offset means skip that many rows from top, eg: if 3rd highest salary is needed, skip 2 rows, so 3-1 = 2 rows
-- offset n-1 throws error

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
SET N = N-1;
  RETURN (

      select distinct salary
      from Employee
      order by salary desc
      limit 1 offset n

  );
END
