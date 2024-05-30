DELIMITER $$
-- adicionar na tabela aulas_curso ja relacionando a aula com o curso de uma vez só
CREATE PROCEDURE pr_add_aulas_curso (
    IN p_nome_curso VARCHAR(100), 
    IN p_nome_aula VARCHAR(100), 
    IN p_link_aula VARCHAR(400)
    )
BEGIN
    DECLARE p_id_curso, p_id_aula INT;

    INSERT INTO aulas(nome_aula, data_aula, link_aula) VALUES (p_nome_aula, NOW(), p_link_aula);

    SELECT id_curso INTO p_id_curso FROM curso WHERE nome_curso = p_nome_curso;
    SELECT id_aula INTO p_id_aula FROM aulas WHERE id_aula = LAST_INSERT_ID();

    INSERT INTO aulas_curso(id_curso, id_aula) VALUES (p_id_curso, p_id_aula);
END$$

-- te retorna as aulas que pertemcem ao cursos q voce passar como argumento
CREATE PROCEDURE pr_return_aulas_curso(IN p_nome_curso VARCHAR(100))
BEGIN

    SELECT a.id_aula, a.nome_aula, a.link_aula, a.descricao_aula, c.categoria_curso, c.nome_curso FROM aulas a
    INNER JOIN aulas_curso ac ON (a.id_aula = ac.id_aula)
    INNER JOIN curso c ON (ac.id_curso = c.id_curso)
    WHERE a.status = 1 AND c.status = 1 AND c.nome_curso = p_nome_curso;

END$$

-- te retornar os cursos que o aluno está matriculado
CREATE PROCEDURE pr_return_estudante_cursos(IN p_id_estudante VARCHAR(100))
BEGIN
    SELECT e.username_estudante, c.categoria_curso, c.nome_curso FROM curso c
    INNER JOIN estudante_curso ec ON (c.id_curso = ec.id_curso)
    INNER JOIN estudante e ON (ec.id_estudante = e.id_estudante)
    WHERE e.status = 1 AND c.status = 1 AND e.id_estudante = p_id_estudante;
END$$

DELIMITER ;