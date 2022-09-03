-- 1) O departamento de RH precisa de uma lista dos IDs de departamento dos
-- departamentos que não contêm o ID de cargo ST_CLERK. Use os operadores de
-- conjunto para criar o relatório. 

select department_id
from departments
minus
select department_id
from employees
where job_id = 'ST_CLERK'

-- 2) O departamento de RH precisa de uma lista dos países que não têm departamentos.
-- Exiba o ID do país e os nomes dos países. Use os operadores de conjunto para criar o
-- relatório. 

SELECT country_id,country_name
FROM countries
MINUS
SELECT l.country_id,c.country_name
FROM locations l, countries c
WHERE l.country_id = c.country_id;


-- 3) Gere uma lista de cargos dos departamentos 10, 50 e 20, nessa ordem. Exiba o ID do
-- cargo e o ID do departamento usando os operadores de conjunto.

SELECT job_id, department_id
FROM employees
WHERE department_id = 10
UNION
SELECT job_id, department_id
FROM employees
WHERE department_id = 50
UNION
SELECT job_id, department_id
FROM employees
WHERE department_id = 20

-- 4) Crie um relatório listando os IDs dos funcionários e os IDs de cargo dos funcionários
-- que atualmente ocupam um cargo igual ao que ocupavam quando foram contratados
-- pela empresa (ou seja, mudaram de cargo mas agora voltaram para seus cargos
-- originais). 

SELECT employee_id,job_id
FROM employees
INTERSECT
SELECT employee_id,job_id
FROM job_history

-- 5) O departamento de RH precisa de um relatório com as seguintes especificações:
-- • Sobrenome e ID de departamento de todos os funcionários da tabela EMPLOYEES,
-- independentemente de eles pertencerem ou não a um departamento
-- • O ID e o nome de todos os departamentos da tabela DEPARTMENTS,
-- independentemente de haver ou não funcionários trabalhando neles
-- Escreva uma consulta composta para realizar essa tarefa

SELECT last_name,department_id,TO_CHAR(null)
FROM employees
UNION
SELECT TO_CHAR(null),department_id,department_name
FROM departments

