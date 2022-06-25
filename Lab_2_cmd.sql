Select department_id, count(employee_id)
From HR_DB.dbo.employees
Where department_id like 'IT_%'
Group by department_id;

Select department_id, count(employee_id)
From HR_DB.dbo.employees
Group by department_id
Having department_id like 'IT_%';

Select department_id, count(employee_id)
From HR_DB.dbo.employees
Where salary > 5000000
Group by department_id;

Select department_id, count(employee_id)
From HR_DB.dbo.employees
Group by department_id
Having min(salary) > 5000000;