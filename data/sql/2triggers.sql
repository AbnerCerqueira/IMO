DELIMITER $$
-- filtrar o link do youtube das aulas
CREATE TRIGGER tr_link_aula_i
BEFORE INSERT ON aulas
FOR EACH ROW
BEGIN
    IF POSITION("&" IN NEW.link_aula) THEN 
        SET NEW.link_aula = SUBSTRING(NEW.link_aula ,1, POSITION("&" IN NEW.link_aula) - 1);
    END IF;
END$$


-- log de criação conta
CREATE TRIGGER tr_estudante_i
AFTER INSERT ON estudante
FOR EACH ROW
BEGIN
    INSERT INTO estudante_log (
        id_estudante_log, username_estudante_log, 
        email_estudante_log, password_estudante_log, data_alteracao, operacao)
    VALUES (
        NEW.id_estudante, NEW.username_estudante, 
        NEW.email_estudante, NEW.password_estudante, NOW(), 'Criação conta');
END$$

-- log de autalização dados conta
CREATE TRIGGER tr_estudante_u
AFTER UPDATE ON estudante
FOR EACH ROW
BEGIN
    INSERT INTO estudante_log (
        id_estudante_log, username_estudante_log, 
        email_estudante_log, password_estudante_log, status, data_alteracao, operacao)
    VALUES (
        NEW.id_estudante, NEW.username_estudante, 
        NEW.email_estudante, NEW.password_estudante, NEW.status, NOW(), 'Alteração dados');
END$$

DELIMITER;