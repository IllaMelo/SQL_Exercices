-- 1) Crie uma consulta para exibir a data do sistema. A coluna deve ter o nome Date.
-- Observação:Se o banco de dados estiver localizado remotamente em outro fuso
-- horário, o resultado será a data do sistema operacional onde o banco de dados reside.

select sysdate from dual

-- 2) O departamento de RH precisa de um relatório mostrando o número dos funcionários,
-- o sobrenome, o salário e o salário acrescido de 15,5% (expresso como um número
-- inteiro) de cada funcionário. Rotule a coluna como New Salary. 

select employee_id, last_name, salary, salary+(salary*0.155) as "New Salary"
from employees

-- 3) Execute sua consulta no arquivo lab_03_02.sql. 

-- 4) Modifique sua consulta lab_03_02.sql para adicionar uma coluna que subtraia o
-- antigo salário do novo salário. Nomeie a coluna Increase. 

select employee_id, last_name, salary, salary+(salary*15.5/100)as "New Salary",
(salary+(salary*15.5/100))-salary as "Increses"
from employees;

-- 5) Crie uma consulta que mostre os sobrenomes (com a primeira letra em maiúscula e
-- todas as demais em minúscula) e o comprimento dos sobrenomes de todos os
-- funcionários que tenham nomes que começam com as letras “J”, “A” ou “M”.Dê um
-- nome apropriado a cada coluna. Classifique os resultados pelos sobrenomes dos
-- funcionários. 

select initcap(last_name) as "Name", length(last_name) as "Length of Name"
from employees
where last_name like 'J%' or
last_name like 'A%' or
last_name like 'M%'
order by last_name


-- Crie novamente a consulta de forma que o usuário seja solicitado a inserir a letra que
-- o sobrenome começa. Por exemplo, se o usuário digitar "H" (em letra maiúscula)
-- quando for solicitado a digitar uma letra, o resultado deverá mostrar todos os
-- funcionários que têm sobrenomes que começam com a letra “H”.

select initcap(last_name) as "Name", length(last_name) as "Length of Name"
from employees
where last_name like '&name%' 
order by last_name

-- Modifique a consulta para que o resultado não seja afetado pela diferenciação de
-- maiúsculas e minúsculas. A letra inserida deve ser colocada em maiúsculo antes de
-- ser processada pela consulta SELECT. 

-- 6) O departamento de RH quer saber o tempo de serviço de cada funcionário. Para cada
-- funcionário, exiba o sobrenome e calcule o número de meses entre hoje e a data em
-- que o funcionário foi admitido. Nomeie a coluna como MONTHS_WORKED. Ordene os
-- resultados pelo número de meses empregado. Arredonde o número de meses para o
-- número inteiro mais próximo

select last_name,
round(months_between(sysdate, hire_date),0) as Months_worked
from employees
order by Months_worked

-- 7) Crie uma consulta para exibir os sobrenomes e os salários de todos os funcionários.
-- Formate o salário para ter 15 caracteres, preenchido à esquerda com o símbolo US$.
-- Nomeie a coluna como SALARY

select last_name, lpad(salary,15,'US$') as Salary
from employees

-- 8) Crie uma consulta mostrando os primeiro oito caracteres dos sobrenomes dos
-- funcionários e indicando o valor dos seus respectivos salários com asteriscos. Cada
-- asterisco significa mil dólares. Classifique os dados na ordem descendente do salário.
-- A coluna deve receber o nome EMPLOYEES_AND_THEIR_SALARIES

Select rpad(first_name, 8),
rpad(' ', (salary/1000)+1,'*') as EMPLOYEES_AND_THEIR_SALARIES, salary
from employees
order by salary DESC


-- 9) Crie uma consulta para exibir os sobrenomes e o número de semanas de serviço de
-- todos os funcionários do departamento 90. A coluna com o número de semanas deve
-- receber o nome TENURE. Trunque o valor do número de semanas para 0 casas
-- decimais. Mostre os registros de tempo de serviço dos funcionários em ordem
-- decrescente. 

SELECT last_name, 
trunc((SYSDATE-hire_date)/7) AS TENURE 
FROM employees 
WHERE department_id = 90
ORDER BY TENURE DESC