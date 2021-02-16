--List the following details of each employee: employee number, last name, first name, sex, and salary.
create view employee_info as
select employees.emp_no,
employees.last_name,
employees.first_name,
employees.sex,
salaries.salary
from employees
join salaries
on employees.emp_no=salaries.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.
--NOT CORRECT--
create view employees_1986 as
select employees.first_name,
employees.last_name,
employees.hire_date
from employees
where hire_date between '1986-01-01'and '1986-12-31';

--List the manager of each department with the following information: 
--department number, department name, 
--the manager's employee number, last name, first name.

create view employee_managers as
select employees.first_name, employees.last_name, employees.emp_no, departments.dept_name, dept_managers.dept_no
from employees
join dept_managers 
on employees.emp_no=dept_managers.emp_no
join departments 
on dept_managers.dept_no=departments.dept_no;

--List the department of each employee with the following information: employee number, 
--last name, first name, and department name.
create view employee_department as
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
join dept_emp
on dept_emp.emp_no=employees.emp_no
join departments
on departments.dept_no=dept_emp.dept_no;

--List first name, last name, and sex for employees whose 
--first name is "Hercules" and last names begin with "B."

create view employees_HerculesB as
select employees.first_name, employees.last_name, employees.sex
from employees
where employees.first_name='Hercules'
and employees.last_name like 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

select *
from employee_department
where dept_name='Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select *
from employee_department
where dept_name='Sales'
or dept_name='Developement';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(*) as "name_count"
from employees
group by last_name
order by name_count desc;



