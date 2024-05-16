CREATE DEFINER=`admin`@`%` PROCEDURE `caloriasTotales`(IN dniPersona VARCHAR(9),IN fechaDeComida DATE)
BEGIN
	DECLARE caloriaMediaH INT DEFAULT 2500;
    DECLARE caloriaMediaM INT DEFAULT 2000;
    DECLARE totalCalorias INT;
    DECLARE respuesta VARCHAR(40);
    DECLARE generoUsuario CHAR(1);
    
	SELECT genero INTO generoUsuario
    FROM usuario
    WHERE dni = dniPersona;
    
    SELECT SUM(calorias) INTO totalCalorias
    FROM comida
    WHERE dni = dniPersona AND fechaComida = fechaDeComida
    GROUP BY dni, fechaComida;
    
    IF generoUsuario='M' THEN
		IF totalCalorias>caloriaMediaM THEN
			SET respuesta = 'Calorias por encima de la media';
			INSERT INTO total(dni,fechaComida,caloriasTotales,mensaje) VALUES (dniPersona,fechaDeComida,totalCalorias,respuesta);
        ELSE IF totalCalorias<caloriaMediaM THEN
			SET respuesta = 'Calorias por debajo de la media';
            INSERT INTO total(dni,fechaComida,caloriasTotales,mensaje) VALUES (dniPersona,fechaDeComida,totalCalorias,respuesta);
		ELSE
			SET respuesta='Calorias en la media';
            INSERT INTO total(dni,fechaComida,caloriasTotales,mensaje) VALUES (dniPersona,fechaDeComida,totalCalorias,respuesta);
        END IF;
        END IF;
	ELSE
		IF totalCalorias>caloriaMediaH THEN
			SET respuesta = 'Calorias por encima de la media';
			INSERT INTO total(dni,fechaComida,caloriasTotales,mensaje) VALUES (dniPersona,fechaDeComida,totalCalorias,respuesta);
        ELSE IF totalCalorias<caloriaMediaH THEN
			SET respuesta = 'Calorias por debajo de la media';
            INSERT INTO total(dni,fechaComida,caloriasTotales,mensaje) VALUES (dniPersona,fechaDeComida,totalCalorias,respuesta);
		ELSE
			SET respuesta='Calorias en la media';
            INSERT INTO total(dni,fechaComida,caloriasTotales,mensaje) VALUES (dniPersona,fechaDeComida,totalCalorias,respuesta);
        END IF;
	END IF;
    END IF;
END