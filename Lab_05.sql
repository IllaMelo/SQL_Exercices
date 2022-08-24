-- 1) Crie um relatório que produza o seguinte para cada funcionário:
-- <employee last name> ganha <salary> monthly but wants <3 times
-- salary.>. Nomeie a coluna Dream Salaries. 

SELECT last_name || ' ganha '
 || TO_CHAR(salary, 'fm$99,999.00')
 || ' mensalmente, mas quer '
 || TO_CHAR(salary * 3, 'fm$99,999.00')
 || '.' "Dream Salaries"
FROM employees

-- 2) Mostre o sobrenome, a data de contratação e a data de revisão do salário de cada
-- funcionário, que é a primeira segunda-feira após 6 meses de serviço. Nomeie a coluna
-- REVIEW. Formate as datas para serem exibidas no formato semelhante a “Segundafeira, trinta e um de julho, 2000”

SELECT last_name, hire_date,
TO_CHAR(NEXT_DAY(ADD_MONTHS(hire_date, 6),2),
'fmDay, "dia" Dd "de" Month, YYYY') as REVIEW 
FROM employees

-- 3) Mostre o sobrenome, a data de contratação e o dia da semana em que o funcionário
-- começou a trabalhar. Nomeie a coluna DAY. Organize os resultados por dia da
-- semana, começando por segunda-feira

SELECT last_name, hire_date,
TO_CHAR(hire_date, 'DAY')as DAY
FROM employees
ORDER BY TO_CHAR(hire_date - 1, 'd')

-- 4) Crie uma consulta para exibir os sobrenomes e as comissões de todos os funcionários.
-- Caso um funcionário não ganhe comissão, mostre “Nenhuma comissão”. Nomeie a
-- coluna como COMM

SELECT last_name,
NVL(TO_CHAR(commission_pct), 'Nenhuma Commissão') as COMM
FROM employees

-- 5) Com a função DECODE, crie uma consulta que exiba o nível de todos os funcionários
-- com base no valor da coluna JOB_ID. Use estes dados:

SELECT job_id, 
decode(job_id,
'ST_CLERK','E',
'SA_REP','D',
'IT_PROG','C',
'ST_MAN','B',
'AD_PRES','A',
'0') as GRADE
FROM employees

-- 6) Recrie a instrução no exercício anterior usando a sintaxe CASE.

SELECT job_id, 
case job_id when 'ST_CLERK' then 'E'
when 'SA_REP' then 'D'
when 'IT_PROG' then 'C'
when 'ST_MAN' then 'B'
when 'AD_PRES' then 'A'
else '0' end as GRADE
FROM employees