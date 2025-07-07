USE `comuctiva`;
DROP function IF EXISTS `CalcularDescuento`;

DELIMITER $$
USE `comuctiva`$$
CREATE FUNCTION `CalcularDescuento` (
    p_ID_Producto INT,  
    p_ValorOriginal DECIMAL(10,2)  
)
RETURNS DECIMAL(10,2) 
DETERMINISTIC  
BEGIN
	DECLARE v_Descuento DECIMAL(10,2) DEFAULT 0;  
	SELECT d.Valor INTO v_Descuento  
    FROM Produc_Desc pd  
    JOIN Descuentos d ON pd.ID_Descu = d.ID_Descu  
    WHERE pd.ID_Producto = p_ID_Producto  
    AND d.Fec_Des >= NOW();
RETURN p_ValorOriginal - (p_ValorOriginal * (v_Descuento / 100)); 
END$$

DELIMITER ;

/*Para calcular el promedio de calificaciones*/
USE `comuctiva`;
DROP function IF EXISTS `Calcular_Promedio_Calificaciones`;

DELIMITER $$
USE `comuctiva`$$
CREATE FUNCTION `Calcular_Promedio_Calificaciones`(
    p_ID_Producto INT(10)
) 
RETURNS DECIMAL(3,2) 
DETERMINISTIC
BEGIN
    DECLARE v_promedio DECIMAL(3,2);
    
   
    SELECT IFNULL(AVG(cp.Estrellas), 0) INTO v_promedio
    FROM calificaciones_produc cp
    JOIN Comp_Produc cpr ON cp.ID_Comp_Produc = cpr.ID_Com_Produc
    WHERE cpr.ID_Producto = p_ID_Producto;
    
    RETURN v_promedio;
END$$

DELIMITER ;

