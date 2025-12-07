create table emp(name text,salary int);
insert into emp(name,salary) values('aa',5000);
insert into emp(name,salary) values('bb',3000);
insert into emp(name,salary) values('cc',9000);
insert into emp(name,salary) values('dd',7000);
----------
select * from emp;

-- GET SECOND HIGHEST SALARY
-- SOL-1
select max(salary) from emp
where salary not in (select max(salary) from emp);

-- SOL-2
select max(salary) from emp
where salary < (select max(salary) from emp);

-- SOL-3
SELECT DISTINCT salary FROM emp
ORDER BY salary DESC LIMIT 1 OFFSET 1;

-- SOL-4
SELECT salary
FROM
(SELECT salary
FROM emp
ORDER BY salary DESC LIMIT 2)as temp --N-th highest
ORDER BY temp.salary ASC
LIMIT 1;

-- SOL-5
with cte as(
    select *, Dense_rank() over(order by salary desc) as ds
    from emp
)
select max(salary) as SecondHighestSalary from cte where ds=2

-----------------------------------
