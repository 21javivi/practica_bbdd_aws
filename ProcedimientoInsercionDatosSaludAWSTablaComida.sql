CREATE DEFINER=`admin`@`%` PROCEDURE `insercionComida`(IN dniPersona VARCHAR(9), IN nombrePlato VARCHAR(15),IN fechaDeComida DATE, IN hora TIME, IN caloriasComida INT(5), OUT respuesta VARCHAR(30))
BEGIN
    DECLARE momento VARCHAR(30);
    CASE 
        WHEN TIME_FORMAT(hora, '%H:%i') BETWEEN '06:00' AND '11:35' THEN
            SET momento = 'Desayuno';
        WHEN TIME_FORMAT(hora, '%H:%i') BETWEEN '11:36' AND '13:30' THEN
            SET momento = 'Brunch';
        WHEN TIME_FORMAT(hora, '%H:%i') BETWEEN '13:31' AND '16:30' THEN
            SET momento = 'Comida';
        WHEN TIME_FORMAT(hora, '%H:%i') BETWEEN '16:31' AND '19:30' THEN
            SET momento = 'Merienda';
        WHEN TIME_FORMAT(hora, '%H:%i') BETWEEN '19:31' AND '23:59' THEN
            SET momento = 'Cena';
        ELSE
            SET momento = 'No definido';
    END CASE;

    IF momento <> 'No definido' THEN
        INSERT INTO comida (dni, plato, fechaComida, tipo, calorias)
        VALUES (dniPersona, nombrePlato, fechaDeComida, momento, caloriasComida);
    ELSE
        SET respuesta = 'No deberías comer a esas horas';
    END IF;
END