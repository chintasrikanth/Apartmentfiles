Declare @ID int;
set @ID=7;

;with employeecte as
(
select Employeeid,employeename,managerid from employees where employeeid=@ID
union all
select employees.Employeeid,employees.employeename,employees.managerid from employees
join employeecte on employees.employeeid=employeecte.managerid
)

select e1.employeename
+
' Report To '+
isnull(e2.employeename,'no boss') as managername  from employeecte e1
left join employeecte e2 on 
e1.managerid=e2.employeeid
