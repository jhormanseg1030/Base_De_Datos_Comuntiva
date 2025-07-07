/*Transportadora*/
USE `comuctiva`;
DROP procedure IF EXISTS `Transportadora`;

DELIMITER $$
USE `comuctiva`$$
CREATE PROCEDURE `Transportadora` (
    IN NombreT VARCHAR (30),
    IN Logo VARCHAR (30),
    IN Telefono VARCHAR (20),
    IN Correo VARCHAR (50),
    IN Direcc VARCHAR (50),
    IN Sitio_Web VARCHAR (50)
)
BEGIN
	INSERT INTO Transportadora (NombreT,Logo,Telefono,Correo,Direcc,Sitio_Web)
    VALUES(NombreT,Logo,Telefono,Correo,Direcc,Sitio_Web);
END$$

DELIMITER ;
/*-------------------------------------------------------------------------------------------------------------------------------------------------*/

/*Usuario*/
USE `comuctiva`;
DROP procedure IF EXISTS `Usuario`;

DELIMITER $$
USE `comuctiva`$$
CREATE PROCEDURE `Usuario` (
IN NomUsu VARCHAR(50),
IN apell1 VARCHAR (50),
IN apell2 VARCHAR(50),
IN tel1 NUMERIC(20),
IN tel2 NUMERIC(20),
IN ID_TipDocu TINYINT(3),
IN correo VARCHAR(50),
IN NumDoc VARCHAR(20),
IN pas VARCHAR(500)
)
BEGIN
	INSERT INTO Usuario (NomUsu,apell1,apell2,tel1,tel2,ID_TipDocu,correo,NumDoc,Password)
	VALUES (NomUsu,apell1,apell2,tel1,tel2,ID_TipDocu,correo,NumDoc,AES_ENCRYPT(pas,'1234'));
END$$

DELIMITER ;

/*------------------------------------------------------------------------------------------------------------------------------------------*/
/*Pedidos*/
USE `comuctiva`;
DROP procedure IF EXISTS `Pedidos`;

DELIMITER $$
USE `comuctiva`$$
CREATE PROCEDURE `Pedidos` (
	IN ID_Usuario INT(10),
	IN Estado VARCHAR(20),
	IN ID_Guia INT(10)
)
BEGIN
	INSERT INTO Pedidos (ID_Usuario,FeHor_Ped,ID_Estado,ID_Guia)
	VALUES (ID_Usuario,NOW(),Estado,ID_Guia);
END$$

DELIMITER ;
/*-------------------------------------------------------------------------------------------------------------------------------------------------*/
/*Compra*/
USE `comuctiva`;
DROP procedure IF EXISTS `Compra`;

DELIMITER $$
USE `comuctiva`$$
CREATE PROCEDURE `Compra` (
	IN ID_TiPago INT(10),
	IN total DECIMAL(10,2),
	IN Ref_Pago VARCHAR(30),
	IN ID_Pedido INT(10)
)
BEGIN
	INSERT INTO Compra(ID_TiPago,total,Ref_Pago,Fec_com,ID_Pedido)
	VALUES (ID_TiPago,total,Ref_Pago,NOW(),ID_Pedido);
END$$

DELIMITER ;
/*-------------------------------------------------------------------------------------------------------------------------------------------*/
/*Producto*/
USE `comuctiva`;
DROP procedure IF EXISTS `Producto`;

DELIMITER $$
USE `comuctiva`$$
CREATE PROCEDURE `Producto` (
	IN ID_Medida INT(10),
	IN NomProd VARCHAR(50),
	IN Valor DECIMAL(10,2),
	IN Cant NUMERIC(19,0),
	IN ID_Tienda INT(10),
	IN Imagen VARCHAR(100),
	IN Descrip VARCHAR(50)
)
BEGIN
	INSERT INTO Producto(ID_Medida,NomProd,Valor,Cant,ID_Tienda,Imagen,Descrip)
	VALUES (ID_Medida,NomProd,Valor,Cant,ID_Tienda,Imagen,Descrip);
END$$

DELIMITER ;
/*-------------------------------------------------------------------------------------------------------------------------------------------*/
/*Reembolsos*/
USE `comuctiva`;
DROP procedure IF EXISTS `Reembolsos`;

DELIMITER $$
USE `comuctiva`$$
CREATE PROCEDURE `Reembolsos` (
	IN Valor NUMERIC(20,2),
	IN Motivo VARCHAR(100),
	IN Estado VARCHAR(20),
	IN ID_Com_Produc INT(10)
)
BEGIN
	INSERT INTO Reembolsos(Fec_Soli,Valor,Motivo,Fec_Resp,Estado,ID_Com_Produc)
	VALUES (NOW(),Valor,Motivo,NOW(),Estado,ID_Com_Produc);
END$$

DELIMITER ;
/*-------------------------------------------------------------------------------------------------------------------------------------------*/
/*Guia de envio*/
USE `comuctiva`;
DROP procedure IF EXISTS `Guia_de_Envio`;

DELIMITER $$
USE `comuctiva`$$
CREATE PROCEDURE `Guia_de_Envio` (	
	IN ID_Transpor INT (10),
	IN Obser VARCHAR(50)
)
BEGIN
	INSERT INTO Guia_de_Envio(ID_Transpor,Fec_Env,ID_Obser)
	VALUES (ID_Transpor,NOW(),Obser);
END$$

DELIMITER ;
/*-------------------------------------------------------------------------------------------------------------------------------------------*/
/*R_Social*/
USE `comuctiva`;
DROP procedure IF EXISTS `R_Social`;

DELIMITER $$
USE `comuctiva`$$
CREATE PROCEDURE `R_Social` (
    IN param_ID_R_Social INT(10),  
    IN param_Nombre VARCHAR(50),
    IN param_NIT VARCHAR(20),
    IN param_Sucur VARCHAR(50),
    IN param_ID_Usuario INT(10)

)
BEGIN
    UPDATE R_Social 
    SET Nombre = param_Nombre,
        NIT = param_NIT,
        Sucur = param_Sucur,
        ID_Usuario = param_ID_Usuario
    WHERE ID_R_Social = param_ID_R_Social;
    
  
    IF ROW_COUNT() = 0 THEN
        INSERT INTO R_Social(ID_R_Social, Nombre, NIT, Sucur, ID_Usuario)
        VALUES (param_ID_R_Social, param_Nombre, param_NIT, param_Sucur, param_ID_Usuario);
	END IF;
END$$

DELIMITER ;

/*-------------------------------------------------------------------------------------------------------------------------------------------*/
/*Direcciones*/
USE `comuctiva`;
DROP procedure IF EXISTS `Direcciones`;

DELIMITER $$
USE `comuctiva`$$
CREATE PROCEDURE `Direcciones` (
	IN ID_Vias INT (10),
    IN num VARCHAR (10),
    IN comple VARCHAR (50),
    IN Ubi_Geo VARCHAR (20),
    IN ID_Usuario INT (10),
    IN ID_Barrio INT (10)
)
BEGIN
	INSERT INTO Direcciones (ID_Vias,num,comple,Ubi_Geo,ID_Usuario,ID_Barrio)
    VALUES (ID_Vias,num,comple,Ubi_Geo,ID_Usuario,ID_Barrio);
END$$

DELIMITER ;
/*-------------------------------------------------------------------------------------------------------------------------------------------*/
/*Barrio*/
USE `comuctiva`;
DROP procedure IF EXISTS `Barrio`;

DELIMITER $$
USE `comuctiva`$$
CREATE PROCEDURE `Barrio` (
IN ID_Barr_Vere INT(10),
IN Nom VARCHAR(50),
IN ID_Muni INT(10)
)
BEGIN
	INSERT INTO Barrio(ID_Barr_Vere,Nom,ID_Muni)
	VALUES (ID_Barr_Vere,Nom,ID_Muni);
END$$

DELIMITER ;
/*-------------------------------------------------------------------------------------------------------------------------------------------*/
/*Tienda*/
USE `comuctiva`;
DROP procedure IF EXISTS `Tienda`;

DELIMITER $$
USE `comuctiva`$$
CREATE PROCEDURE `Tienda` (
	IN ID_Direcc INT(10),
	IN NomT VARCHAR(50),
	IN Logo VARCHAR(50),
	IN ID_Usuario INT(10),
	IN ID_R_Social INT(10)
)
BEGIN
	INSERT INTO Tienda(ID_Direcc,NomT,Logo,ID_Usuario,ID_R_Social)
	VALUES (ID_Direcc,NomT,Logo,ID_Usuario,ID_R_Social);
END$$

DELIMITER ;
/*-------------------------------------------------------------------------------------------------------------------------------------------*/
/*Ingres_Produc*/
USE `comuctiva`;
DROP procedure IF EXISTS `Ingres_Produc`;

DELIMITER $$
USE `comuctiva`$$
CREATE PROCEDURE `Ingres_Produc` (
	IN ID_Producto INT(10),
	IN ID_Ingreso INT(10),
	IN cant NUMERIC (20,2)
)
BEGIN
	INSERT INTO Ingres_Produc(ID_Producto,ID_Ingreso,cant)
	VALUES (ID_Producto,ID_Ingreso,cant);
END$$

DELIMITER ;
/*-------------------------------------------------------------------------------------------------------------------------------------------*/
/*Pedi_Produc*/
USE `comuctiva`;
DROP procedure IF EXISTS `Pedi_Produc`;

DELIMITER $$
USE `comuctiva`$$
CREATE PROCEDURE `Pedi_Produc` (
	IN ID_Producto INT(10),
	IN ID_Pedido INT(10),
	IN cant NUMERIC(30,0),
	IN valor DECIMAL(10,3)
)
BEGIN
	INSERT INTO Pedi_Produc (ID_Producto,ID_Pedido,cant,valor)
    VALUES (ID_Producto,ID_Pedido,cant,valor);
END$$

DELIMITER ;
/*-------------------------------------------------------------------------------------------------------------------------------------------*/
/*Comp_Produc*/
USE `comuctiva`;
DROP procedure IF EXISTS `Comp_Produc`;

DELIMITER $$
USE `comuctiva`$$
CREATE PROCEDURE `Comp_Produc` (
	IN ID_Compra INT,
    IN ID_Producto INT,
    IN Cant NUMERIC (19,2),
    IN Valor DECIMAL (10,2)
)
BEGIN
	INSERT INTO Comp_Produc (ID_Compra,ID_Producto,Cant,Valor)
    VALUES (ID_Compra,ID_Producto,Cant,Valor);
END$$

DELIMITER ;
/*-------------------------------------------------------------------------------------------------------------------------------------------*/
/*Ingresos*/
USE `comuctiva`;
DROP procedure IF EXISTS `Ingresos`;

DELIMITER $$
USE `comuctiva`$$
CREATE PROCEDURE `Ingresos` (
	IN ID_Usuario INT (10),
    IN Obser VARCHAR (50)
)
BEGIN
	INSERT INTO Ingresos (Fecha,ID_Usuario,Obser)
    VALUES (NOW(),ID_Usuario,Obser);
END$$

DELIMITER ;
/*-------------------------------------------------------------------------------------------------------------------------------------------*/
/*Carrito*/
USE `comuctiva`;
DROP procedure IF EXISTS `Carrito`;

DELIMITER $$
USE `comuctiva`$$
CREATE PROCEDURE `Carrito` (
	IN ID_Usuario INT (10),
	IN ID_Producto INT (10),
    IN Cantidad INT (10)
)
BEGIN
	INSERT INTO Carrito (ID_Usuario,ID_Producto,Cantidad,Fecha_Agre)
    VALUES (ID_Usuario,ID_Producto,Cantidad,NOW());
END$$

DELIMITER ;
/*-------------------------------------------------------------------------------------------------------------------------------------------*/
/*Descuentos*/
USE `comuctiva`;
DROP procedure IF EXISTS `Descuentos`;

DELIMITER $$
USE `comuctiva`$$
CREATE PROCEDURE `Descuentos` (
	Descripcion VARCHAR (50),
    Valor DECIMAL (10,2)
)
BEGIN
	INSERT INTO Descuentos(Descripcion,Fec_Des,Valor)
    VALUES (Descripcion,NOW(),Valor);
END$$

DELIMITER ;


/*Calificacion producto*/

USE `comuctiva`;
DROP procedure IF EXISTS `Calificar_Producto`;

DELIMITER $$
USE `comuctiva`$$
CREATE PROCEDURE `Calificar_Producto` (
    IN p_ID_Comp_Produc INT(10),
    IN p_ID_Usuario INT(10),
    IN p_Estrellas TINYINT(1),
    IN p_Comentario TEXT
)
BEGIN
    DECLARE v_pedido_entregado BOOLEAN DEFAULT FALSE;
    
    
    SELECT COUNT(*) > 0 INTO v_pedido_entregado
    FROM Comp_Produc cp
    JOIN Compra c ON cp.ID_Compra = c.ID_Compra
    JOIN Pedidos p ON c.ID_Pedido = p.ID_Pedido
    WHERE cp.ID_Com_Produc = p_ID_Comp_Produc
    AND p.ID_Usuario = p_ID_Usuario
    AND p.ID_Estado = 4;
    
    IF v_pedido_entregado THEN
       
        INSERT INTO calificaciones_produc (ID_Comp_Produc, ID_Usuario, Estrellas, Comentario)
        VALUES (p_ID_Comp_Produc, p_ID_Usuario, p_Estrellas, p_Comentario)
        ON DUPLICATE KEY UPDATE 
            Estrellas = p_Estrellas,
            Comentario = p_Comentario,
            Fecha_Calificacion = CURRENT_TIMESTAMP;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Solo puedes calificar productos de pedidos entregados que te pertenezcan';
    END IF;
END$$

DELIMITER ;


/*Obtener reseña*/

USE `comuctiva`;
DROP procedure IF EXISTS `Obtener_Reseñas_Producto`;

DELIMITER $$
USE `comuctiva`$$
CREATE PROCEDURE `Obtener_Reseñas_Producto`(
    IN p_ID_Producto INT(10),
    IN p_Limite INT(10)
)
BEGIN
    SELECT 
        u.NomUsu AS Nombre_Usuario,
        cp.Estrellas,
        cp.Comentario,
        DATE_FORMAT(cp.Fecha_Calificacion, '%d/%m/%Y %H:%i') AS Fecha_Formateada
    FROM calificaciones_produc cp
    JOIN Comp_Produc cpr ON cp.ID_Comp_Produc = cpr.ID_Com_Produc
    JOIN Usuario u ON cp.ID_Usuario = u.ID_Usuario
    WHERE cpr.ID_Producto = p_ID_Producto
    ORDER BY cp.Fecha_Calificacion DESC
    LIMIT p_Limite;
END$$

DELIMITER ;

/*-------------------------------------------------------------------------------------------------------------------------------------------*/