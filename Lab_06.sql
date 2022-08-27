-- Determine a validade das três afirmações a seguir. Envolva a opção Verdadeiro ou Falso.
-- 1) As funções de agrupamento agem em várias linhas para gerar um resultado por grupo.
Verdadeiro
-- 2) As funções de grupo incluem valores nulos nos cálculos.
Falso
-- 3) A cláusula WHERE restringe as linhas antes de sua inclusão em um cálculo de grupo .
Verdadeiro

-- O departamento de RH precisa dos seguintes relatórios:


-- 4) Encontre o maior e o menor salário bem como a soma e a média do salário de todos
-- os funcionários. Nomeie as colunas como Máximo, Mínimo, Soma e Média,
-- respectivamente. Arredonde os resultados para o número inteiro mais próximo. 

Select round(max(salary),0) as "Salario Maximo",
round(min(salary),0) as "Salario Minimo",
round(sum(salary),0) as "Soma dos Salarios",
round(avg(salary),0) as "Salario Medio"
From employees

-- 5) Modifique a consulta em lab_05_04.sql para exibir os salários mínimo e máximo,
-- bem como a soma e a média do salário, para cada tipo de cargo.

Select job_id, round(max(salary),0) as "Salario Maximo",
round(min(salary),0) as "Salario Minimo",
round(sum(salary),0) as "Soma dos Salarios",
round(avg(salary),0) as "Salario Medio"
From employees
Group by job_id

-- 6) Crie uma consulta para exibir o número de pessoas com o mesmo cargo. 
-- Generalize a consulta para que o usuário no departamento de RH seja solicitado a
-- informar um cargo. Informe IT_PROG, quando solicitado. 

Select job_id, count(*)
From employees
Where job_id = '&job'
Group by job_id

-- 7) Determine o número de gerentes sem listá-los. Nomeie a coluna como Number of
-- Managers.
-- Dica:Use a coluna MANAGER_ID para determinar o número de gerentes.

SELECT COUNT(DISTINCT manager_id) AS "Numero de Gerentes"
FROM employees;

-- 8) Encontre a diferença entre os salários mais altos e os mais baixos. Nomeie a coluna
-- como DIFFERENCE.

SELECT MAX(salary) - MIN(salary) as Diferença
FROM employees; 

-- 9) Crie um relatório para exibir o número do gerente e quanto ganha o funcionário com
-- o menor salário que trabalha para esse gerente. Exclua todos os funcionários cujo
-- gerente é desconhecido. Exclua quaisquer grupos onde o salário mínimo seja US$
-- 6.000 ou menos. Organize os resultados por ordem decrescente de salários. 

SELECT manager_id, MIN(salary)
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
HAVING MIN(salary) > 6000
ORDER BY MIN(salary) DESC; 
