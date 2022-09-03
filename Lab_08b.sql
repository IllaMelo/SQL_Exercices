-- 1. Crie uma consulta para exibir o sobrenome, o número de departamento e o salário de
-- qualquer funcionário cujo número de departamento e salário coincidam com o
-- número de departamento e salário de qualquer funcionário que receba comissão.

select last_name, department_id, salary
from employees
where (salary, department_id) in
                                (select salary, department_id
                                from employees
                                where commission_pct is not null)


-- 2. Exiba sobrenome, nome do departamento e salário de qualquer funcionário cujo
-- salário e comissão correspondam ao de qualquer funcionário localizado no ID de
-- local 1700.

select last_name, department_name, salary
from employees e, departments d
where e.department_id = d.department_id
and (salary, NVL(commission_pct,0)) in
                                        (select salary, NVL(commission_pct,0)
                                        from employees e, departments d
                                        where e.department_id = d.department_id
                                        and d.location_id = 1700)

-- 3. Crie uma consulta para exibir o sobrenome, a data de contratação e o salário de todos
-- os funcionários com o mesmo salário e comissão de Kochhar.
-- Observação:Não exiba Kochhar no conjunto de resultados.

select last_name, hire_date, salary
from employees
where (salary, nvl(commission_pct,0)) in
(select salary, nvl(commission_pct,0)
from employees
where last_name = 'Kochhar')
and last_name != 'Kochhar'


-- 4. Crie uma consulta para exibir os funcionários que ganham um salário maior que o
-- salário de qualquer gerentes de vendas (JOB_ID = 'SA_MAN'). Classifique os
-- resultados desde o maior até o menor.

select last_name, job_id, salary
from employees
where salary > all
                (select salary
                from employees
                where job_id = 'SA_MAN')
                order by salary desc


-- 5. Exiba detalhes como o ID do funcionário, o sobrenome e o ID do departamento dos
-- funcionários que moram em cidades com nomes que começam com a letra T.

select employee_id, last_name, department_id
from employees
where department_id in
                    (select department_id
                    from departments
                        where location_id in
                                            (select location_id
                                            from locations
                                            where city like 'T%'))

-- 6. Crie uma consulta para localizar todos os funcionários que ganham acima do salário
-- médio em seus departamentos. Exiba sobrenome, salário, ID do departamento e
-- salário médio do departamento. Classifique por salário médio e arredonde para duas
-- casas decimais. Use apelidos para as colunas obtidas pela consulta, como mostrado na
-- saída de amostra.

SELECT e.last_name, e.salary,
e.department_id, ROUND(AVG(a.salary),0) 
FROM employees e, employees a
WHERE e.department_id = a.department_id
AND e.salary > (SELECT AVG(salary)
FROM employees
WHERE department_id = e.department_id )
GROUP BY e.last_name, e.salary, e.department_id
ORDER BY AVG(a.salary)

-- 7. Localize todos os funcionários que não são supervisores.
-- a. Primeiramente, faça isto usando o operador NOT EXISTS.

select e.last_name 
from employees e
where not exists (select 'x'
                           from employees i
                           where i.manager_id = e.employee_id)

-- b. Isso pode ser feito com o operador NOT IN? Como ou por que não?

select e.last_name 
from employees e
where e.employee_id not in (select i.manager_id
                           from employees i)

Não. A querry acima não retorna valores
-- 8. Crie uma consulta para exibir o sobrenome dos funcionários quem ganham menos
-- que o salário médio em seus respectivos departamentos.

select e.last_name 
from employees e
where e.salary <  (select avg(i.salary)
                           from employees i
                           where i.department_id = e.department_id)

-- 9. Crie uma consulta para exibir os sobrenomes dos funcionários que têm um ou mais
-- colegas de trabalho nos respectivos departamentos com datas de admissão
-- posteriores, mas com salários mais altos.

select e.last_name 
from employees e
where exists  (select 'X' 
                           from employees i
                           where i.department_id = e.department_id
                           and i.hire_date > e.hire_date
                           and i.salary > e.salary)

-- 10. Crie uma consulta para exibir o ID, os sobrenomes e os nomes de departamento de
-- todos os funcionários.
-- Observação: Use uma subconsulta escalar para recuperar o nome do departamento
-- na instrução SELECT.

SELECT employee_id, last_name,
(SELECT department_name
FROM departments d
WHERE e.department_id =
d.department_id ) department
FROM employees e
ORDER BY department

-- 11. Crie uma consulta para exibir o nome dos departamentos cujos totais de salários
-- sejam superiores a 1/8 do total de salários de toda a empresa. Use a cláusula WITH
-- para criar essa consulta. Nomeie a consulta como SUMMARY.

WITH
summary AS (
SELECT department_name, SUM(salary) as salarios
FROM employees e, departments d
WHERE e.department_id =
d.department_id
GROUP BY department_name)
SELECT department_name, salarios
FROM summary
WHERE salarios > (
SELECT SUM(salarios) * 1/8
FROM summary)
ORDER BY salarios DESC