create database project;
use project;
SELECT * from employee_dataset;

#1. Find the second-highest salary from the Employees table without using a subquery.

select FirstName, salary
from employee_dataset
order by salary desc
limit 1 offset 1;

#2. Display the top 5 highest-paid employees along with their names, departments, and salaries.

select FirstName, department, salary
from employee_dataset
order by salary desc
limit 5;

#3. Display employees from the 6th to the 10th position based on salary in descending order using LIMIT and OFFSET.

select firstName, salary
from employee_dataset
order by salary desc
limit 5 offset 5;

#4. Find the third-highest distinct salary without using a subquery.

select  distinct salary  as third_highest_salary, firstname
from employee_dataset
order by salary desc
limit 1 offset 3;

#5. Find the department-wise employee count and average salary, sorted by average salary in descending order.

select count(*) as employee_count, avg(salary) as avg_salary , department
from employee_dataset
group by department
order by avg_salary desc;

#6. Find the department-wise minimum salary, maximum salary, and total salary expenditure.

select min(salary) as min_salary, max(salary) as max_salary, sum(salary) as total_salary, department
from employee_dataset
group by department;

#7. Find the city-wise employee count and average salary, excluding employees whose city is NULL. 
  # Sort by employee count in descending order.
  
select count(employeeid) as employee_count, avg(salary) as average_salary, city
from employee_dataset
group by city
order by employee_count desc;

#8. Find the gender-wise employee count and maximum salary, sorted by maximum salary in descending order.

select count(*) as employee_count, max(salary) as maximum_salary, gender
from employee_dataset
group by gender
order by maximum_salary desc;

#9. Find the top 3 departments with the highest total salary expenditure. 
#Display the department name, employee count, and total salary.

select department, sum(salary) as highest_total_salary, count(*)
from employee_dataset
group by department
order by highest_total_salary desc
limit 3;

#10. Find departments where the average salary is greater than ₹40,000 and the employee count is greater than 5.
select avg(salary) as avg_salary , department, count(*) as emp_count
from employee_dataset
group by department
having avg_salary >= 40000 and emp_count >= 5;

#11. Find departments where more than 2 employees earn a salary greater than ₹40,000.

select department, count(*) as emp_count
from employee_dataset
where salary >= 40000
group by department 
having emp_count >=2;

#12. Find cities where the employee count is greater than 5 and the average salary is greater than ₹35,000. 
# Exclude NULL cities.
select count(*) as emp_count, city, avg(salary) as avg_salary
from employee_dataset
group by city
having emp_count >= 5 and avg_salary >= 35000;

#13. Find departments where the maximum salary is greater than ₹80,000 and the minimum salary is less than ₹30,000.

select department, max(salary) as maximum_salary, min(salary) as minimum_salary
from employee_dataset
group by department
having maximum_salary >= 80000 and minimum_salary <= 30000;

#14. Find departments having more than 10 employees, sorted by employee count in descending order. 
# Display only the top 3 departments.

select department, count(*) as employee_count
from employee_dataset
group by department
having employee_count >= 10
order by employee_count desc
limit 3;

#15. Find departments where the total salary expenditure is greater than ₹300,000 
# and the employee count is greater than 5.

select count(*) as emp_count, department, sum(salary) as total_salary
from employee_dataset
group by department
having total_salary >= 300000 and emp_count >= 5;

#16. Find the top 5 employees whose salary is greater than ₹40,000, sorted by salary in descending order,
# skipping the first 2 results. 

select firstname, salary
from employee_dataset
where salary >= 40000
order by salary desc
limit 5 offset 2;
 
#17. Find departments where the average salary is greater than ₹35,000. 
#Display the department name, employee count, average salary, and total salary expenditure.

select department, count(*) as emp_count, avg(salary) as avg_salary, sum(salary) as total_salary
from employee_dataset
group by department
having avg_salary >= 35000;

#18. Find the top 3 cities with the highest average salary, considering only cities with more than 3 employees.
# Exclude NULL cities.
 
select city, avg(salary) as avg_salary, count(*) as emp_count
from employee_dataset
where city is not null
group by city 
having emp_count > 3 
order by  avg_salary desc
limit 3;

#19. Find departments where the number of employees earning more than ₹50,000 is greater than 2.
# Sort by that employee count in descending order.

select department, salary, count(*) as emp_count
from employee_dataset
group by department, salary
having salary > 50000 and emp_count > 2
order by emp_count desc;

#20. Find departments where the minimum salary is greater than ₹25,000, the average salary is greater than ₹40,000,
# and the employee count is at least 5. Sort by average salary in descending order.

select department, min(salary) as min_salary, avg(salary) as avg_salary, count(*) as emp_count
from employee_dataset
group by department
having min_salary >= 25000 and avg_salary >= 40000 and emp_count >= 5
order by avg_salary desc;


