DELIMITER $$
-- adicionar na tabela aulas_curso ja relacionando a aula com o curso de uma vez só
CREATE PROCEDURE pr_add_aula_curso (
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

DELIMITER ;