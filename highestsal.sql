select * from Employee order by salary desc
go

select MAX(Salary) as secondhighest  from Employee where Salary < (select MAX(Salary) from Employee)

go

select top 1 salary from
(select top 2 salary from Employee order by Salary desc)  result
order by Salary

go

;with result as
(
select salary, DENSE_RANK() over (order by salary desc) as nthsalary  from employee
)
select top 1 salary from result
where result.nthsalary=2

go

SELECT Id, Salary FROM Employee e 
WHERE 2=(SELECT COUNT(DISTINCT Salary) FROM Employee p WHERE e.Salary<=p.Salary)

