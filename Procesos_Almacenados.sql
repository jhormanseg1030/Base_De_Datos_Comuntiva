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
IN nom_usu VARCHAR(50),
IN id_tipdocu TINYINT(3),
IN num_doc VARCHAR(20),
IN tel NUMERIC(20),
IN tel2 NUMERIC(20),
IN apell1 VARCHAR (50),
IN apell2 VARCHAR(50),
IN correo VARCHAR(50),
IN password VARCHAR(500)
)
BEGIN
	INSERT INTO Usuario (nom_usu,id_tipdocu,num_doc,tel,tel2,apell1,apell2,correo,Password)
	VALUES (nom_usu,id_tipdocu,num_doc,tel,tel2,apell1,apell2,correo,AES_ENCRYPT(password,'1234'));
END$$

DELIMITER ;

/*------------------------------------------------------------------------------------------------------------------------------------------*/
/*Pedidos*/
USE `comuctiva`;
DROP procedure IF EXISTS `Pedidos`;

DELIMITER $$
USE `comuctiva`$$
CREATE PROCEDURE `Pedidos` (
	IN id_usuario INT(10),
	IN id_estado VARCHAR(20),
	IN id_guia INT(10)
)
BEGIN
	INSERT INTO Pedidos (id_usuario,fehor_pedi,id_estado,id_guia)
	VALUES (id_usuario,NOW(),id_estado,id_guia);
END$$

DELIMITER ;
/*-------------------------------------------------------------------------------------------------------------------------------------------------*/
/*Compra*/
USE `comuctiva`;
DROP procedure IF EXISTS `Compra`;

DELIMITER $$
USE `comuctiva`$$
CREATE PROCEDURE `Compra` (
	IN id_ti_pago INT(10),
	IN total DOUBLE,
	IN ref_pago VARCHAR(30),
	IN id_pedido INT(10)
)
BEGIN
	INSERT INTO Compra(id_ti_pago,total,ref_pago,Fec_com,id_pedido)
	VALUES (id_ti_pago,total,ref_pago,NOW(),id_pedido);
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
	IN estado VARCHAR(20),
    IN motivo VARCHAR(100),
    IN valor NUMERIC(20,2),
	IN id_compra INT(10)
)
BEGIN
	INSERT INTO Reembolsos(estado,fec_resp,fec_soli,motivo,valor,id_compra)
	VALUES (estado,NOW(),NOW(),motivo,valor,id_compra);
END$$

DELIMITER ;
/*-------------------------------------------------------------------------------------------------------------------------------------------*/
/*Guia de envio*/
USE `comuctiva`;
DROP procedure IF EXISTS `Guia_Envio`;

DELIMITER $$
USE `comuctiva`$$
CREATE PROCEDURE `Guia_Envio` (	
	IN id_Transpor INT (10),
	IN Obser VARCHAR(50)
)
BEGIN
	INSERT INTO Guia_Envio(id_Transpor,Fec_Env,ID_Obser)
	VALUES (ID_Transpor,NOW(),Obser);
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
    IN id_usuario INT (10),
    IN id_barrio INT (10)
)
BEGIN
	INSERT INTO Direcciones (ID_Vias,num,comple,Ubi_Geo,id_usuario,id_barrio)
    VALUES (ID_Vias,num,comple,Ubi_Geo,id_usuario,id_barrio);
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
IN id_muni INT(10)
)
BEGIN
	INSERT INTO Barrio(ID_Barr_Vere,Nom,id_muni)
	VALUES (ID_Barr_Vere,Nom,id_muni);
END$$

DELIMITER ;
/*-------------------------------------------------------------------------------------------------------------------------------------------*/
/*Tienda*/
USE `comuctiva`;
DROP procedure IF EXISTS `Tienda`;

DELIMITER $$
USE `comuctiva`$$
CREATE PROCEDURE `Tienda` (
	IN id_direcc INT(10),
	IN nombret VARCHAR(50),
	IN log VARCHAR(50)
)
BEGIN
	INSERT INTO Tienda(id_direcc,nombret,log)
	VALUES (id_direcc,nombret,log);
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
	IN compra_id INT,
    IN producto_id INT,
    IN cant NUMERIC (19,2),
    IN valor DECIMAL (10,2)
)
BEGIN
	INSERT INTO Comp_Produc (compra_id,producto_id,cant,fecha_asignacion,valor)
    VALUES (compra_id,producto_id,cant,NOW(),valor);
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
/*-------------------------------------------------------------------------------------------------------------------------------------------*/
/*Calificacion producto*/

USE `comuctiva`;
DROP procedure IF EXISTS `Calificar_Producto`;

DELIMITER $$
USE `comuctiva`$$
CREATE PROCEDURE `Calificar_Producto` (
    IN p_id_producto INT(10),
    IN p_id_usuario INT(10),
    IN p_estrellas TINYINT(1),
    IN p_comentario VARCHAR(50)
)
BEGIN
   /*verificar si el producto fue entregado al usuario*/ 
    DECLARE v_pedido_entregado BOOLEAN DEFAULT FALSE;
    
    /*verifica si el producto pertenece a un pedido entregado y si el pedido corresponde al usuario que esta calificando*/
    SELECT COUNT(*) > 0 INTO v_pedido_entregado
    FROM pedi_produc pp
    JOIN pedidos p ON pp.pedidos_id = p.id_pedido
    WHERE pp.producto_id = p_id_producto
    AND p.id_usuario = p_id_usuario
    AND p.id_estado = 4;
    
    
    IF v_pedido_entregado THEN
       /*Si el pedido fue entregado, se ejecuta:*/
        INSERT INTO calificaciones_produc (id_producto, id_usuario, estrellas, comentario, fecha_calificacion)
        VALUES (p_id_producto, p_id_usuario, p_estrellas, p_comentario, CURRENT_TIMESTAMP)
        ON DUPLICATE KEY UPDATE 
            estrellas = p_estrellas,
            comentario = p_comentario,
            fecha_calificacion = CURRENT_TIMESTAMP;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Solo puedes calificar productos de pedidos entregados que te pertenezcan';
    END IF;
END$$

DELIMITER ;
/*-------------------------------------------------------------------------------------------------------------------------------------------*/
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