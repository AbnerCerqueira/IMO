DELIMITER $$

-- insert
CREATE TRIGGER tr_estudante_i
AFTER INSERT ON estudante
FOR EACH ROW
BEGIN
    INSERT INTO estudante_log (
        id_estudante_log, username_estudante_log, 
        email_estudante_log, password_estudante_log, operacao)
    VALUES (
        NEW.id_estudante, NEW.username_estudante, 
        NEW.username_estudante, NEW.password_estudante, 'Criação conta');
END$$

-- update
CREATE TRIGGER tr_estudante_u
AFTER update ON estudante
FOR EACH ROW
BEGIN
    INSERT INTO estudante_log (
        id_estudante_log, username_estudante_log, 
        email_estudante_log, password_estudante_log, operacao)
    VALUES (
        NEW.id_estudante, NEW.username_estudante, 
        NEW.username_estudante, NEW.password_estudante, 'Alteração dados');
END$$

DELIMITER;