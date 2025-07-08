INSERT INTO Descuentos (Descripcion, Fec_Des, Valor)  
VALUES ('Oferta Verano', NOW(), 20000); 
select * from Descuentos;

INSERT INTO Produc_Desc (ID_Producto, ID_Descu)  
VALUES (1, LAST_INSERT_ID());  
CALL Comp_Produc(1, 1, 2, 50000);
Select * from Produc_Desc;
Select * from Comp_Produc;




/*Funcionamiento trigger*/
INSERT INTO calificaciones_produc (ID_Comp_Produc, ID_Usuario, Estrellas) VALUES (1, 1, 5);
INSERT INTO calificaciones_produc (ID_Comp_Produc, ID_Usuario, Estrellas) VALUES (1, 2, 4); 
INSERT INTO calificaciones_produc (ID_Comp_Produc, ID_Usuario, Estrellas) VALUES (1, 2, 6);



