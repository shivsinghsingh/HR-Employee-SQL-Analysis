SELECT * FROM public.hr_employees
ORDER BY employee_id ASC 

select count(*) as total_employees
from hr_employees;

select department, count(*) as employee_count
from hr_employees
group by department;

select avg(salary) as average_salary
from hr_employees;

select max(salary) as highest_salary 
from hr_employees;

select min(salary) as lowest_salary 
from hr_employees;

select gender,count(*) as employees_count 
from hr_employees
group by gender;

select department,round(avg(salary),2) as average_salary
from hr_employees
group by department;

select employee_name , department,salary
from hr_employees
order by salary desc
limit 10;

select city,count(*) as employee_count
from hr_employees
group by city 
order by employee_count desc;

select emploment_status, count(*) as employee_count
from hr_employees
group by emploment_status;

select employee_name , department,salary 
from hr_employees
where salary > (
                 select avg(salary)
				 from hr_employees);

select max(salary) as secound_highest_salary
from hr_employees
where salary < (
select max(salary)
from hr_employees
);

select employee_name department,salary 
from (select employee_name,department,salary,
        dense_rank() over(
            partition by department
			order by salary desc) as salary_rank
			from hr_employees )
			as ranked_employees
			where salary_rank <=3;

select employee_name,department , salary
from (select employee_name,department,salary,
dense_rank() over (
                 partition by department
				 order by salary desc ) as salary_rank
				 from hr_employees)
				 as ranked_employees
				 where salary_rank = 1;

select * 
from hr_employees
where extract(year from joining_date) =2023;

select employee_name ,age, department 
from hr_employees
where age between 25 and 35;

select department, round(avg(salary),2)as average_salary
from hr_employees
group by department
order by average_salary desc
limit 1;

select performance_rating,count(*) as employee_count
from hr_employees
group by performance_rating
order by employee_count desc;

select employee_name ,count(*) name_count
from hr_employees
group by employee_name
having count(*) >1;
				 

  
