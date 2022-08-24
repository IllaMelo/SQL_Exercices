-- --1) A seguinte instrução SELECT é executada com êxito:
-- SELECT last_name, job_id, salary AS Sal
-- FROM employees;
Verdadeiro

-- 2) A seguinte instrução SELECT é executada com êxito:
-- SELECT *
-- FROM job_grades;
Falso

-- 3) Há quatro erros de codificação na instrução a seguir. Você é capaz de identificá-los?
-- SELECT employee_id, last_name
--  sal x 12 ANNUAL SALARY
--  FROM employees; 



SELECT employee_id, last_name, 
salary*12 as ANNUAL_SALARY
FROM employees

-- Você foi contratado como programador SQL da Acme Corporation. Sua primeira tarefa é
-- criar alguns relatórios com base nos dados das tabelas de recursos humanos.
-- 4) Sua primeira tarefa é determinar a estrutura da tabela DEPARTMENTS e seu conteúdo.
describe departments

-- 5) Determine a estrutura da tabela EMPLOYEES. 
describe employees

-- O departamento de RH precisa de uma consulta para exibir os sobrenomes, os IDs de
-- cargo, a data de contratação e os IDs de todos os funcionários, com o ID de
-- funcionário sendo exibida primeiro. Forneça um apelido STARTDATE para a coluna
-- HIRE_DATE. Salve sua instrução SQL em um arquivo nomeado como
-- lab_01_05.sql, assim, você poderá enviá-lo para o departamento de RH.

select employee_id, job_id, last_name, hire_date as startdate
from employees

-- 7) O departamento de RH deseja que uma consulta exiba todos os IDs de cargo
-- exclusivos a partir da tabela EMPLOYEES. 
select distinct job_id
from employees

-- 8) O departamento de RH precisa de cabeçalhos de colunas mais descritivos para o
-- relatório sobre os funcionários. Copie a instrução do lab_01_05.sql para uma nova
-- planilha SQL. Nomeie os cabeçalhos de coluna Emp #, Employee, Job e Hire
-- Date, respectivamente. Execute a consulta novamente.

select employee_id as "Emp #", job_id as Job, last_name as Employee, hire_date as "Hire Date"
from employees

-- 9) O departamento de RH solicitou um relatório com todos os funcionários e seus IDs de
-- cargo. Exiba o sobrenome concatenado com o ID de cargo (separado por uma vírgula
-- e espaço) e nomeie a coluna como Employee e Title.

SELECT last_name ||', '||job_id as "Employees and Titles" 
FROM employees



