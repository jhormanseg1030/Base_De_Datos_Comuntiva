INSERT INTO Descuentos (Descripcion, Fec_Des, Valor)  
VALUES ('Oferta Verano', NOW(), 20); 

INSERT INTO Produc_Desc (ID_Producto, ID_Descu)  
VALUES (1, LAST_INSERT_ID());  
-- Insertar compra (el trigger aplicará el descuento automáticamente)  
CALL Comp_Produc(1, 1, 2, 50000); -- Precio original: 4500 → Guardará 3600  
Select * from Produc_Desc;



