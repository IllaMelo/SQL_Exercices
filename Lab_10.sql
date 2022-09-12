-- 1) Execute a instrução no script lab_09_01.sql para criar a tabela MY_EMPLOYEE
-- usada neste exercício.

CREATE TABLE "HR"."MY_EMPLOYEE" 
   (	"EMPLOYEE_ID" NUMBER(4,0), 
   "LAST_NAME" VARCHAR2(25 BYTE),
	"FIRST_NAME" VARCHAR2(25 BYTE), 
    "USERID" VARCHAR2(8 BYTE),
	"SALARY" NUMBER(9,2) 
	 );


-- 2) Descreva a estrutura da tabela MY_EMPLOYEE para identificar os nomes das colunas. 

describe my_employee

-- 3) Crie uma instrução INSERT para adicionar a primeira linha de dados à tabela
-- MY_EMPLOYEE a partir do exemplo de dados a seguir. Não liste as colunas na cláusula 

insert into my_employee
values (1, 'Pastel','Ralph','rpatel', 895)

-- 4) Preencha a tabela MY_EMPLOYEE com a segunda linha do exemplo de dados a partir
-- da lista precedente. Agora, liste as colunas explicitamente na cláusula INSERT.

insert into my_employee (id, last_name. first_name, userid, salary)
values (2, 'Dancs','Betty','bdancs', 860)

-- 5) Confirme a adição à tabela.

select *
from my_employee

-- 6) Escreva uma instrução INSERT em um arquivo de script dinâmico reutilizável para
-- carregar as linhas remanescentes na tabela MY_EMPLOYEE. Este script deve apresentar
-- um prompt para todas as colunas (ID, LAST_NAME, FIRST_NAME, USERID e
-- SALARY). Salve esse script para um arquivo lab_09_06.sql.

set echo off
set verify off
insert into my_employee
values (&id, '&last_name', '&first_name','&userid',&salary);
set verify on
set echo on

-- 7) Preencha a tabela com as duas linhas de dados de amostra e seguida, listadas na etapa
-- 3, executando a instrução INSERT no script que você criou.

set echo off
set verify off
insert into my_employee
values (&id, '&last_name', '&first_name','&userid',&salary);
set verify on
set echo on

-- 8) Confirme as adições à tabela


select *
from my_employee

-- 9) Torne as adições de dados permanentes.

COMMIT

-- 10) Altere o sobrenome do funcionário 3 para Drexler.

update my_employee
set last_name = 'Drexler'
where id = 3

-- 11) Altere o salário de todos os funcionários com salário inferior a US$ 900 para US$
-- 1.000.

update my_employee
set salary = 1000
where salary < 900

-- 12) Verifique as alterações feitas na tabela

select *
from my_employee

-- 13) Exclua Betty Dancs da tabela MY_EMPLOYEE.

delete 
from my_employee
where last_name = 'Dancs'

-- 14) Confirme as alterações feitas na tabela

select *
from my_employee

-- 15) Confirme todas as alterações pendentes.

COMMIT

-- 16) Preencha a tabela com as últimas duas linhas de dados de amostra, listadas na etapa 3,
-- usando as instruções no script que você criou na etapa 6. Execute as instruções no
-- script.

set echo off
set verify off
insert into my_employee
values (&id, '&last_name', '&first_name','&userid',&salary);
set verify on
set echo on


-- 17) Confirme a inclusão feita na tabela


select *
from my_employee

-- 18) Marque um ponto intermediário no processamento da transação.

SAVEPOINT one

-- 19) Exclua todas as linhas da tabela MY_EMPLOYEE.

delete 
from my_employee

-- 20) Confirme que a tabela está vazia.

select *
from my_employee

-- 21) Descarte a operação DELETE mais recente sem descartar a operação INSERT anterior.

rollback one 

-- 22) Confirme se a nova linha ainda está intacta

select *
from my_employee

-- 23) Torne a adição de dados permanente. 

COMMIT

-- 24) Modifique o script lab_09_06.sql de modo que o USERID seja gerado
-- automaticamente pela concatenação da primeira letra do nome com os sete primeiros
-- caracteres do sobrenome. O USERID gerado deve ter caracteres minúsculos. Portanto,
-- o script não deve apresentar um prompt para o USERID. Salve esse script para um
-- arquivo denominado lab_09_24.sql.

set echo off
set verify off
insert into my_employee
values (&id, '&last_name', '&first_name',lower(substr('&first_name', 1, 1) ||
substr('&last_name', 1, 7)),&salary);
set verify on
set echo on

-- 25) Execute o script lab_09_24.sql para inserir o seguinte registro:
-- 26) Confirme que a nova linha foi adicionada com o USERID correto. 

select *
from my_employee