--  1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.

select employee_name, s.montly_salary
from employees 
join employee_salary on employees.id = employee_id
join salary s on salary_id = s.id;

-- 2. Вывести всех работников у которых ЗП меньше 2000.
select employee_name, employee_salary.salary_id, s.montly_salary
from employees 
join employee_salary on employees.id = employee_id
join salary s on salary_id = s.id
where montly_salary <2000;

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select employee_name, s.montly_salary
from employees 
right join employee_salary on employees.id = employee_id
join salary s on salary_id = s.id
where employee_name is null

-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select employee_name, s.montly_salary
from employees 
right join employee_salary on employees.id = employee_id
join salary s on salary_id = s.id
where employee_name is null and montly_salary <2000;

-- 5. Найти всех работников кому не начислена ЗП.
select employee_name, salary_id from employees e 
left outer join employee_salary es on employee_id = e.id 
where employee_id is null;

-- 6. Вывести всех работников с названиями их должности.
select employee_name, r.role_name 
from employees e 
join roles_employee re on employees_id = e.id
join roles r on r.id = roles_id;


-- 7. Вывести имена и должность только Java разработчиков.
select employee_name, role_name 
from employees e 
join roles_employee re on employees_id = e.id
join roles r on r.id = roles_id
where role_name like '%Java %';

-- 8. Вывести имена и должность только Python разработчиков.
select employee_name, role_name 
from employees e 
join roles_employee re on employees_id = e.id
join roles r on r.id = roles_id
where role_name like '%Python%';

-- 9. Вывести имена и должность всех QA инженеров.
select employee_name, role_name 
from employees e 
join roles_employee re on employees_id = e.id
join roles r on r.id = roles_id
where role_name like '%QA%';

-- 10. Вывести имена и должность ручных QA инженеров.
select employee_name, role_name 
from employees e 
join roles_employee re on employees_id = e.id
join roles r on r.id = roles_id
where role_name like '%Manual QA%';

-- 11. Вывести имена и должность автоматизаторов QA
select employee_name, role_name 
from employees e 
join roles_employee re on employees_id = e.id
join roles r on r.id = roles_id
where role_name like '%Automation QA%';

-- 12. Вывести имена и зарплаты Junior специалистов
select employee_name, s.montly_salary,role_name 
from employees e 
join employee_salary es on es.employee_id = e.id 
join salary s on salary_id = s.id 
join roles_employee re on employees_id = e.id
join roles r on r.id = roles_id
where role_name like '%Junior%';


-- 13. Вывести имена и зарплаты Middle специалистов
select employee_name, s.montly_salary,role_name 
from employees e 
join employee_salary es on es.employee_id = e.id 
join salary s on salary_id = s.id 
join roles_employee re on employees_id = e.id
join roles r on r.id = roles_id
where role_name like '%Middle%';


-- 14. Вывести имена и зарплаты Senior специалистов
select employee_name, s.montly_salary,role_name 
from employees e 
join employee_salary es on es.employee_id = e.id 
join salary s on salary_id = s.id 
join roles_employee re on employees_id = e.id
join roles r on r.id = roles_id
where role_name like '%Senior%';

-- 15. Вывести зарплаты Java разработчиков
select employee_name, s.montly_salary 
from employees e 
join employee_salary es on es.employee_id = e.id 
join salary s on salary_id = s.id 
join roles_employee re on employees_id = e.id
join roles r on r.id = roles_id
where role_name like '%Java%';

-- 16. Вывести зарплаты Python разработчиков
select employee_name, s.montly_salary 
from employees e 
join employee_salary es on es.employee_id = e.id 
join salary s on salary_id = s.id 
join roles_employee re on employees_id = e.id
join roles r on r.id = roles_id
where role_name like '%Python%';


-- 17. Вывести имена и зарплаты Junior Python разработчиков
select employee_name, s.montly_salary,role_name 
from employees e 
join employee_salary es on es.employee_id = e.id 
join salary s on salary_id = s.id 
join roles_employee re on employees_id = e.id
join roles r on r.id = roles_id
where role_name like '%Junior Python%';

-- у меня таких нет,никому не давал зп с такой должностью :)

-- 18. Вывести имена и зарплаты Middle JS разработчиков
select employee_name, role_name, s.montly_salary
from employees e 
join employee_salary es on employee_id = e.id
join salary s on salary_id = s.id 
join roles_employee re on re.employees_id = e.id 
join roles r on r.id = re.roles_id
where role_name like '%Middle JavaScript %';

-- у меня таких нет,никому не давал зп с такой должностью :)

-- 19. Вывести имена и зарплаты Senior Java разработчиков
select employee_name, role_name, s.montly_salary
from employees e 
join employee_salary es on employee_id = e.id
join salary s on salary_id = s.id 
join roles_employee re on re.employees_id = e.id 
join roles r on r.id = roles_id
where role_name like '%Senior Java %';

-- 20. Вывести зарплаты Junior QA инженеров
select employee_name, role_name, s.montly_salary
from employees e 
join employee_salary es on employee_id = e.id
join salary s on salary_id = s.id 
join roles_employee re on re.employees_id = e.id 
join roles r on r.id = roles_id
where role_name like '%Junior Manual QA%' or role_name like '%Junior Automation QA%';

-- 21. Вывести среднюю зарплату всех Junior специалистов
select avg(montly_salary)
from salary s
join employee_salary es on salary_id = s.id
join employees e on es.employee_id = e.id
join roles_employee re on re.employees_id = es.employee_id 
join roles r on r.id = roles_id
where role_name like '%Junior%';

-- 22. Вывести сумму зарплат JS разработчиков
select sum(s.montly_salary)
from salary s
join employee_salary es on salary_id = s.id
join employees e on es.employee_id = e.id
join roles_employee re on re.employees_id = e.id 
join roles r on r.id = roles_id
where role_name like '%JavaScript%'
--у меня таких нет,никому не давал зп с такой должностью :)

-- 23. Вывести минимальную ЗП QA инженеров
select min(montly_salary)
from salary s
full join employee_salary es on salary_id = s.id
full join employees e on es.employee_id = e.id
full join roles_employee re on re.employees_id = e.id 
full join roles r on r.id = roles_id
where role_name like '%QA%';

-- 24. Вывести максимальную ЗП QA инженеров
select max(montly_salary)
from salary s
full join employee_salary es on salary_id = s.id
full join employees e on es.employee_id = e.id
full join roles_employee re on re.employees_id = e.id 
full join roles r on r.id = roles_id
where role_name like '%QA%';

-- 25. Вывести количество QA инженеров
select count(employee_name) 
from employees e 
join roles_employee re on re.employees_id = e.id
join roles r on r.id = roles_id
where role_name like '%QA%';

-- 26. Вывести количество Middle специалистов.
select count(employee_name) 
from employees e 
join roles_employee re on re.employees_id = e.id
join roles r on r.id = roles_id
where role_name like '%Middle%';

-- 27. Вывести количество разработчиков
select count(employee_name) 
from employees e 
join roles_employee re on re.employees_id = e.id
join roles r on r.id = roles_id
where role_name like '%developer%';

-- 28. Вывести фонд (сумму) зарплаты разработчиков.
select sum(montly_salary)
from salary s
full join employee_salary es on salary_id = s.id
full join employees e on es.employee_id = e.id
full join roles_employee re on re.employees_id = e.id 
full join roles r on r.id = roles_id
where role_name like '%developer%';

-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select employee_name, role_name, s.montly_salary
from employees e 
join employee_salary es on e.id = es.employee_id 
join salary s on salary_id = s.id 
join roles_employee re on e.id = re.employees_id 
join roles r on re.roles_id = r.id 
order by montly_salary;

-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select employee_name, role_name, s.montly_salary
from employees e 
join employee_salary es on e.id = es.employee_id 
join salary s on salary_id = s.id 
join roles_employee re on e.id = re.employees_id 
join roles r on re.roles_id = r.id 
where montly_salary between 1700 and 2300
order by montly_salary;

-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select employee_name, role_name, s.montly_salary
from employees e 
join employee_salary es on e.id = es.employee_id 
join salary s on salary_id = s.id 
join roles_employee re on e.id = re.employees_id 
join roles r on re.roles_id = r.id 
where montly_salary<2300
order by montly_salary;

--  32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select employee_name, role_name, s.montly_salary
from employees e 
join employee_salary es on e.id = es.employee_id 
join salary s on salary_id = s.id 
join roles_employee re on e.id = re.employees_id 
join roles r on re.roles_id = r.id 
where montly_salary = 1100 or montly_salary = 1500 or montly_salary = 2000
order by montly_salary;