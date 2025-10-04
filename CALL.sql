Call Usuario("Maria",4,"10114567823","3136451239","3107348097","Talero","Castelblanco","Mariatalero@gmail.com","67436798");
Call Usuario("Daniel",1,"10318689523","3214567893","3107654932","Aguila","Garcia","garcidaniel@gmail.com","218236gg");
select *from Usuario;

CALL Transportadora('servientrega', 'fedex', '123456789', 'contacto@servientrega.com', 'Calle 123', 'www.servientrega.com');
CALL Transportadora('servientrega', 'fedex', '567891234', 'contacto@servientrega.com', 'Calle 220', 'www.servientrega.com');
CALL Transportadora('servientrega', 'fedex', '789456213', 'contacto@servientrega.com', 'Calle 127', 'www.servientrega.com');
CALL Transportadora('servientrega', 'fedex', '555444252', 'contacto@servientrega.com', 'Calle 100', 'www.servientrega.com');
SELECT * FROM Transportadora;

CALL Guia_Envio(1,1);
CALL Guia_Envio(2,2);
CALL Guia_Envio(1,2);
SELECT * FROM Guia_Envio;  

CALL Pedidos(1,4,1);
CALL Pedidos(2,4,2);
SELECT * FROM pedidos;  

CALL Compra (2,"50000","Confirmado",1);
CALL Compra (6,"80000","Confirmado",2);
SELECT * FROM Compra;  

CALL Barrio (1,"El Cerrito",25162);
CALL Barrio (2,"Cetime",25200);
CALL Barrio (2,"Fagua",25162);
SELECT * FROM Barrio;

CALL Direcciones (3,'34','b sur','40°4246″N,74°021',1,2);
CALL Direcciones (1,'36','diagonal 38','40°4246″N,74°021',2,2);
SELECT * FROM direcciones;

CALL Tienda(1,"Sucursal del Norte","COMUCTIVA");
CALL Tienda(2,"Sucursal del Centro","COMUCTIVA");
SELECT * FROM Tienda;

CALL Producto(2,"Fresa",4500,3,1,"Fresas Frescas","Recien sacadas de la cosecha bien frescas y ricas");
CALL Producto(1,"Papa",3000,2,2, "Papa campesina", "Papa recien sacada y fresca apra llevar");
SELECT * FROM producto;

CALL Comp_Produc(1,1,2,4500);
CALL Comp_Produc(2,2,5,15000);
SELECT * FROM Comp_Produc;

CALL Reembolsos("En proceso","El producto llego en mal estado",50000,1);
SELECT * FROM Reembolsos;


CALL Calificar_Producto(2, 2, 5,'Excelente producto');
SELECT * FROM calificaciones_produc;

CALL Obtener_Reseñas_Producto((SELECT ID_Producto FROM Comp_Produc WHERE ID_Com_Produc = 1), 3);