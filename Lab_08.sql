-- 1)O departamento de RH precisa de uma consulta que solicite ao usuário o sobrenome
-- de um funcionário. A consulta, então, exibe o sobrenome e a data de admissão de
-- qualquer funcionário no mesmo departamento que o funcionário cujo nome foi
-- fornecido (excluindo aquele funcionário). Por exemplo, se o usuário inserir Zlotkey,
-- localize todos os funcionários que trabalham com Zlotkey (excluindo Zlotkey).

SELECT last_name, hire_date
FROM employees
WHERE department_id = (SELECT department_id
 FROM employees
 WHERE last_name = '&Enter_name')
AND last_name <> '&Enter_name';

-- 2)Crie um relatório que exiba o número do funcionário, o sobrenome e o salário de
-- todos os funcionários que recebem mais do que a média salarial. Organize os
-- resultados por ordem crescente de salários.

select employee_id,  last_name, salary
from employees
where salary > (select avg(salary) 
                from employees)
                
order by salary

-- 3)Crie uma consulta exibindo o número do funcionário e o sobrenome de todos os
-- funcionários que trabalham em um departamento com quaisquer funcionários cujo
-- sobrenome contenha a letra “u”. Salve a instrução SQL como lab_07_03.sql.
-- Execute a consulta

select last_name, employee_id
from employees
where  department_id in (select department_id 
                        from employees
                        where last_name like '%u%')
                

-- 4)O departamento de RH precisa de um relatório que exiba o sobrenome, o número do
-- departamento e a ID de cargo de todos os funcionários cuja ID de local de
-- departamento seja 1700. Modifique a consulta para que o usuário seja solicitado a informar um ID de
-- localização. 

select last_name, department_id, job_id
from employees
where  department_id in (select department_id 
                        from departments
                        where location_id = '&location')
                        

-- 5)Crie um relatório para o departamento de RH exibindo os sobrenomes e os salários de
-- todos os funcionários subordinados a King

select last_name, salary
from employees
where  manager_id in (select employee_id
                        from employees
                        where last_name = 'King')

-- 6)Crie um relatório para o departamento deRH exibindo o número do departamento, os
-- sobrenomes e o ID de cargo de todos osfuncionários do departamento Executivo

select department_id, last_name, job_id
from employees
where  department_id in (select department_id
                        from departments
                        where department_name = 'Executive')

-- 7)Crie um relatório que exiba uma lista de todosos funcionários cujo salário seja maior
-- que o salário de qualquer funcionário do departamento 60.

select last_name
from employees
where  salary > any (select salary
                        from employees
                        where department_id = 60)
