CALL Usuario ("Luisa","Fernanda","Ramoz","3156578900","3103746678",1,"Luisafernanda225@gmail.com","5207267708","1234");
CALL Usuario ("Juan","Camilo","Chon","3118905612","3128110025",4,"Juancamilo546@gmail.com","10124658905","678909");
CALL Usuario ("Brandon","Ramirez","Patiño","3108117232","3158990043",1,"Brandonramirez@gmail.com","10114567823","476589");
CALL Usuario ("Maria","Talero","Castelblanco","3136451239","3107348097",2,"Mariatalero@gmail.com","10114567823","67436798");
select *from Usuario;

CALL Transportadora('servientrega', 'fedex', '123456789', 'contacto@servientrega.com', 'Calle 123', 'www.servientrega.com');
CALL Transportadora('servientrega', 'fedex', '567891234', 'contacto@servientrega.com', 'Calle 220', 'www.servientrega.com');
CALL Transportadora('servientrega', 'fedex', '789456213', 'contacto@servientrega.com', 'Calle 127', 'www.servientrega.com');
CALL Transportadora('servientrega', 'fedex', '555444252', 'contacto@servientrega.com', 'Calle 100', 'www.servientrega.com');
CALL Transportadora('servientrega', 'fedex', '121212121', 'contacto@servientrega.com', 'Calle 150', 'www.servientrega.com');
CALL Transportadora('servientrega', 'fedex', '018005005', 'contacto@servientrega.com', 'Calle 215', 'www.servientrega.com');
SELECT * FROM Transportadora;

CALL Guia_de_Envio(1,1);
CALL Guia_de_Envio(2,2);
CALL Guia_de_Envio(1,3);
CALL Guia_de_Envio(1,4);
CALL Guia_de_Envio(1,5);
CALL Guia_de_Envio(1,2);
SELECT * FROM Guia_de_Envio;  

CALL Pedidos(1,2,3);
CALL Pedidos(2,1,1);
CALL Pedidos(3,4,5);
CALL Pedidos(4,3,4);
SELECT * FROM pedidos;  

CALL Compra (2,"50000","Confirmado",1);
CALL Compra (1,"400000","Confirmado",2);
CALL Compra (3,"250000","Confirmado",4);
CALL Compra (4,"150000","Confirmado",4);
SELECT * FROM Compra;  

CALL Barrio (3,"bohio",25817);
CALL Barrio (1,"Flandes",25335);
CALL Barrio (1,"Altos del Pedregal",25851);
CALL Barrio (2,"Chaleche",25736);
SELECT * FROM Barrio;

CALL Direcciones (3,'34','b sur','40°4246″N,74°021',2,2);
CALL Direcciones (1,'36','diagonal 38','40°4246″N,74°021',2,2);
SELECT * FROM direcciones;

CALL R_Social(1,'don alejo','912','Bogota',1);
CALL R_Social(2,'don sebastian','567','Bogota',2);
SELECT * FROM R_Social;

CALL Tienda(1,"Don juan","Arboles en la nieve",1,1);
CALL Tienda(2,"Don Sebastian","Frutas frescas",2,2);
SELECT * FROM Tienda;

CALL Producto(2,"Fresa",4500,3,1,"Fresas Frescas","Recien sacadas de la cosecha bien frescas y ricas");
CALL Producto(1,"Papa",3000,2,2, "Papa campesina", "Papa recien sacada y fresca apra llevar");
SELECT * FROM producto;

CALL Comp_Produc(1,1,2,4500);
CALL Comp_Produc(2,2,5,15000);
SELECT * FROM Comp_Produc;

CALL Reembolsos(4500,"El producto llego en mal estado",2,1);
CALL Reembolsos(3000,"El producto no ah llegado, pero la pagina dice que ya llego",2,2);
SELECT * FROM Comp_Produc;


CALL Calificar_Producto(1, 5, 4,'Buen producto'); /*Este lo que revisa es que el producto te pertenezca*/
CALL Calificar_Producto(1, 1, 5,'calidad'); 
SELECT * FROM calificaciones_produc;

CALL Obtener_Reseñas_Producto((SELECT ID_Producto FROM Comp_Produc WHERE ID_Com_Produc = 1), 3);