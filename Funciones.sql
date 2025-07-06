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

