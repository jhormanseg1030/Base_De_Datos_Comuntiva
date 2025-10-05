DELIMITER $$  
USE `comuctiva`$$  
CREATE TRIGGER `Descuento_Antes_De_la_Compra`  
BEFORE INSERT ON `comp_produc`  
FOR EACH ROW  
BEGIN  
    DECLARE v_PrecioOriginal DECIMAL(10,2);  
    
    -- Obtiene el precio original del producto  
    SELECT valor INTO v_PrecioOriginal  
    FROM producto  
    WHERE id_producto = NEW.id_producto;  
    
    -- Actualiza el valor en la compra con descuento  
    SET NEW.valor = CalcularDescuento(NEW.id_producto, v_PrecioOriginal);  
END$$  
DELIMITER ;  

/*Validacion de calificacion*/
DELIMITER $$

CREATE TRIGGER `validar_calificacion`
BEFORE INSERT ON calificaciones_produc
FOR EACH ROW
BEGIN
   
    DECLARE es_propietario BOOLEAN;
    

    IF NEW.Estrellas < 1 OR NEW.Estrellas >= 5 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: La calificación debe ser entre 1 y 5 estrellas';
    END IF;
    
    
    SELECT COUNT(*) > 0 INTO es_propietario
    FROM Producto p
    JOIN Comp_Produc cp ON p.ID_Producto = cp.ID_Producto
    JOIN Tienda t ON p.ID_Tienda = t.ID_Tienda
    WHERE cp.ID_Com_Produc = NEW.ID_Comp_Produc
    AND t.ID_Usuario = NEW.ID_Usuario;
    
    IF es_propietario THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: No puedes calificar tus propios productos';
    END IF;
END$$

DELIMITER ;