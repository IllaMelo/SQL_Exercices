-- 1) Crie uma consulta para o departamento de RH, obtendo os endereços de todos os
-- departamentos. Use as tabelas LOCATIONS e COUNTRIES. Mostre o ID do local, o
-- endereço, a cidade, o estado ou província e o país no resultado. Use um NATURAL
-- JOIN para produzir os resultados.

SELECT location_id, street_address, city, state_province, country_name
FROM locations
NATURAL JOIN countries


-- 2) O departamento de RH precisa de um relatório somente dos funcionários com
-- departamentos correspondentes. Crie uma consulta para exibir o sobrenome, o
-- número e o nome do departamento desses funcionários.

SELECT last_name, department_id, department_name
FROM employees
JOIN departments
USING (department_id)

-- 3) O departamento de RH precisa de um relatório dos funcionários de Toronto. Exiba o
-- sobrenome, o cargo, o número e o nome do departamento de todos os funcionários
-- que trabalham em Toronto.

SELECT employees.last_name, employees.job_id, employees.department_id, departments.department_name
FROM employees JOIN departments
ON (employees.department_id = departments.department_id)
JOIN locations
ON (departments.location_id = locations.location_id)
WHERE LOWER(locations.city) = 'toronto'

-- 4) Crie um relatório para exibir o sobrenome e o número dos funcionários, bem como o
-- sobrenome e o número dos respectivos gerentes. O label das colunas deverá ser
-- Employee, Emp#, Manager e Mgr#, respectivamente. 

SELECT w.last_name as Employee, w.employee_id as EMP#,
 m.last_name as Manager, m.employee_id as Mgr#
FROM employees w join employees m
ON (w.manager_id = m.employee_id)

-- 5) Modifique lab_06_04.sql para exibir todos os funcionários, incluindo King, que
-- não tem um gerente. Organize os resultados por número de funcionário. 

SELECT w.last_name as Employee, w.employee_id as EMP#,
 m.last_name as Manager, m.employee_id as Mgr#
FROM employees w
LEFT OUTER JOIN employees m
ON (w.manager_id = m.employee_id)

-- 6) Crie um relatório para o departamento de RH, mostrando os sobrenomes dos
-- funcionários, os números de departamento e todos os funcionários que trabalham no
-- mesmo departamento que um determinado funcionário. Dê um label apropriado a
-- cada coluna. 
 
SELECT e.department_id as Departmento, e.last_name as Empregado,
 c.last_name as Colega
FROM employees e JOIN employees c
ON (e.department_id = c.department_id)
WHERE e.employee_id <> c.employee_id
ORDER BY e.department_id, e.last_name, c.last_name

-- 7) O departamento de RH precisa de um relatório com os graus e salários dos cargos.
-- Para se familiarizar com a tabela JOB_GRADES, primeiro mostre a estrutura da tabela
-- JOB_GRADES. Em seguida, crie uma consulta para exibir os nomes, os cargos, o
-- nome do departamento, os salários e os graus de todos os funcionários

SELECT e.last_name, e.job_id, d.department_name,
 e.salary, j.grade_level
FROM employees e JOIN departments d
ON (e.department_id = d.department_id)
JOIN job_grades j
ON (e.salary BETWEEN j.lowest_sal AND j.highest_sal)

-- 8) O departamento de RH precisa determinar os nomes de todos os funcionários que
-- foram contratados depois de Davies. Crie uma consulta para exibir o nome e a data de
-- contratação de todos os funcionários que foram contratados após o funcionário
-- Davies.

SELECT e.last_name, e.hire_date
FROM employees e JOIN employees d
ON (d.last_name = 'Davies')
WHERE d.hire_date < e.hire_date

-- 9) O departamento de RH precisa obter os nomes e as datas de admissão de todos os
-- funcionários admitidos antes dos respectivos gerentes, além dos nomes e das datas de
-- admissão desses gerentes. 

SELECT w.last_name, w.hire_date, m.last_name, m.hire_date
FROM employees w JOIN employees m
ON (w.manager_id = m.employee_id)
WHERE w.hire_date < m.hire_date;