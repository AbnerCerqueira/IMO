SELECT a.nome_aula, c.nome_curso FROM aulas a
INNER JOIN aulas_curso ac ON (a.id_aula = ac.id_aula)
INNER JOIN curso c ON (ac.id_curso = c.id_curso)
WHERE a.status = 1 AND c.status = 1;