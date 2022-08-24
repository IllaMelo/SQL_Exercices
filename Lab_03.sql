-- O departamento de RH precisa de seu auxílio para a criação de algumas consultas.
-- 1) Por questões de orçamento, o departamento de RH precisa de um relatório que exiba
-- o sobrenome e o salário dos funcionário que recebem mais de US$ 12.000.

SELECT last_name, salary 
FROM employees 
where salary>12000

-- 2)  Crie um relatório que exiba o sobrenome e o número
-- de departamento para o número de funcionário 176.

SELECT last_name, department_id
FROM employees 
where employee_id=176

-- 3) O departamento de RH precisa localizar funcionários com salários altos e baixos.
-- Modifique o arquivo lab_02_01.sql para exibir o sobrenome e o salário de
-- qualquer funcionário cujo salário esteja fora do intervalo de US$ 5.000 a US$ 12.000.
SELECT last_name, salary
FROM employees 
where salary>5000 and salary<12000

-- 4) Crie um relatório para exibir os sobrenomes, os IDs de cargo e a data de contratação
-- dos funcionários com os sobrenomes Matos e Taylor. Organize a consulta na ordem
-- crescente pela data de admissão. 

SELECT last_name, job_id, phone_number
FROM employees 
where last_name='Matos' or last_name='Taylor'
order by hire_date ASC

-- 5) Mostre os sobrenomes e os IDs de departamento de todos os funcionários dos
-- departamentos 20 ou 50 em ordem alfabética crescente por nome. 

SELECT last_name, department_id
FROM employees 
order by department_id, first_name ASC

-- 6) Modifique lab_02_03.sql para exibir o sobrenome e o salário dos funcionários
-- que ganham entre US$ 5.000 e US$ 12.000 e estão no departamento 20 ou 50.
-- Atribua às colunas os labels Employee e Monthly Salary, respectivamente. Salve

SELECT last_name as "Employees", salary as "Monthly Salary"
FROM employees 
where salary>5000 and salary<12000 and department_id=20 or department_id=50

-- 7) O departamento de RH precisa de um relatório mostrando os sobrenomes e a data de
-- contratação de todos os funcionários que foram contratados em 1994
select last_name, hire_date
from employees
where hire_date like '%94'
-- 8) Crie um relatório para exibir os sobrenomes e os cargos de todos os funcionários que
-- não têm um gerente.

SELECT last_name,job_id
FROM employees
where manager_id is null

-- 9) Crie um relatório para exibir o sobrenome, o salário e a comissão de todos os
-- funcionários que ganham comissão. Classifique os dados na ordem descendente de
-- salário e comissões.
-- Use a posição numérica da coluna na cláusula ORDER BY. salary

select last_name, salary, commission_pct
from employees
where commission_pct is not null
order by salary, commission_pct

-- 10) Os membros do departamento de RH desejam ter mais flexibilidade com as consultas
-- que você está criando. Eles gostariam de um relatório que exibisse o sobrenome e o
-- salário dos funcionários que recebem mais que um valor especificado pelo usuário
-- após uma solicitação. Salve essa consulta em um arquivo denominado
-- lab_02_10.sql. Se você informar 12000 quando a quantia for solicitada, o
-- relatório exibirá estes resultados: 
select last_name, salary
from employees
where salary> &Salary


-- 11) O departamento de RH quer executar relatórios com base em um gerente. Crie uma
-- consulta que solicite ao usuário um ID de gerente e gere o ID dos funcionários, os
-- sobrenomes, os salários e o departamento dos funcionários desse gerente. O
-- departamento de RH deseja classificar o relatório em uma coluna selecionada. Você
-- pode testar os dados com os seguintes valores:

-- manager_id = 103, classificado por last_name:

select employee_id, last_name, salary, department_id
from employees
where manager_id= &manager
order by last_name

-- manager_id = 201, classificado por salário:

select employee_id, last_name, salary, department_id
from employees
where manager_id= &manager
order by salary

-- manager_id = 124, classificado por employee_id

select employee_id, last_name, salary, department_id
from employees
where manager_id= &manager
order by employee_id

-- 12) Mostre todos os sobrenomes dos funcionários cuja terceira letra do nome é “a”. 
SELECT first_name
FROM employees 
where first_name like '__a%'
-- 13) Mostre os sobrenomes de todos os funcionários que têm as letras “a” e “e” no
-- sobrenome.

SELECT last_name
FROM employees 
where last_name like '%a%' and last_name like '%e%'