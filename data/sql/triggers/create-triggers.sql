DELIMITER $$

-- insert
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

-- update
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
