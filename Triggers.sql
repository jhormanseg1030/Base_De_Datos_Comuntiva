DELIMITER $$  
USE `comuctiva`$$  
CREATE TRIGGER `Descuento_Antes_De_la_Compra`  
BEFORE INSERT ON `Comp_Produc`  
FOR EACH ROW  
BEGIN  
    DECLARE v_PrecioOriginal DECIMAL(10,2);  
    
    -- Obtiene el precio original del producto  
    SELECT Valor INTO v_PrecioOriginal  
    FROM Producto  
    WHERE ID_Producto = NEW.ID_Producto;  
    
    -- Actualiza el valor en la compra con descuento  
    SET NEW.Valor = CalcularDescuento(NEW.ID_Producto, v_PrecioOriginal);  
END$$  
DELIMITER ;  