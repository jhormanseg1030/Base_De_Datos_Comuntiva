INSERT INTO descuento (descripcion, fech_des, valor)  
VALUES ('Oferta Verano', NOW(), 20000); 
select * from descuento;

INSERT INTO produc_desc (productos_id, descuentos_id)  
VALUES (1, LAST_INSERT_ID());  
CALL comp_produc(1, 1, 2, 50000);
Select * from produc_desc;
Select * from comp_produc;




/*Funcionamiento trigger*/
INSERT INTO calificaciones_produc (id_producto, id_usuario, estrellas) VALUES (1, 1, 5);
INSERT INTO calificaciones_produc (id_producto, id_usuario, estrellas) VALUES (1, 2, 4); 
INSERT INTO calificaciones_produc (id_producto, id_usuario, estrellas) VALUES (1, 2, 6);



