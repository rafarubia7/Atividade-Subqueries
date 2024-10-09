select * from funcionario;
select * from departamento;
select * from projeto;

-- 1. 
SELECT nome_funcionario
FROM funcionario
WHERE sigla_depto in (SELECT sigla_depto FROM departamento
WHERE nome_depto LIKE 'Recursos Humanos');

-- 2. 
SELECT nome_funcionario
FROM funcionario
WHERE codfuncionario in (SELECT codfuncionario FROM projeto
WHERE sigla_depto like '%MKT%' or sigla_depto like '%hr%');

-- 3.
SELECT departamento.nome_depto, SUM(funcionario.salario)
FROM departamento, funcionario
WHERE departamento.sigla_depto = funcionario.sigla_depto
GROUP BY departamento.nome_depto;

-- 4.
SELECT nome_funcionario
FROM funcionario 
WHERE sigla_depto in (select sigla_depto from projeto 
where sigla_depto = 'it'
and funcionario.salario > (SELECT AVG(salario) FROM funcionario));

-- 5.
SELECT departamento.nome_depto, COUNT(funcionario.nome_funcionario)
FROM departamento, funcionario
WHERE departamento.sigla_depto = funcionario.sigla_depto
GROUP BY departamento.nome_depto;

-- 6. 
SELECT nome_funcionario
FROM funcionario 
WHERE sigla_depto in (select sigla_depto from projeto 
where sigla_depto = 'hr'
and funcionario.salario > (SELECT AVG(salario) 
FROM funcionario WHERE sigla_depto = 'hr'));

-- 7.
SELECT departamento.nome_depto, GROUP_CONCAT(funcionario.nome_funcionario)
FROM departamento, funcionario
WHERE departamento.sigla_depto = funcionario.sigla_depto
GROUP BY departamento.nome_depto;
