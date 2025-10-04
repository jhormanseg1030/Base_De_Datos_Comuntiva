INSERT INTO Rol (Nom_Rol) VALUES ("Cliente"),("Vendedor"),("Administrador");
INSERT INTO Tip_Doc (Tipo) VALUES ("Cedula de Cuidadania"),("Pasaporte"),("Tarjeta de Identidad"),("Cedula de Extranjeria");
INSERT INTO Vias (Tipos) VALUES ("Calle"),("Carrera"),("Avenida"),("Transversal");
INSERT INTO Unidad_Medida (Tip_Medida) VALUES ("Libra"),("Kilo"),("Bulto"),("Unidad"),("Litro"),("Gramo");
INSERT INTO Tipo_De_Pago (Tipos) VALUES ("Tarjeta de Credito"),("Tarjeta de Debito"),("PSE"),("Efectivo"),("PayPal"),("Nequi"),("Daviplata");
INSERT INTO Barr_Vere (Nombre) VALUES ("Barrio"),("Vereda"),("Sector");
INSERT INTO Estado (estado) VALUES ("En espera"),("En proceso"),("Enviado"),("Entregado"),("Cancelado"),("Cerrado"),("Devuelto");
INSERT INTO Obser (Obser) VALUES ("Delicado"),("Peligro"),("Fragil"),("Ligero"),("Pesado");
INSERT INTO pedi_produc (cant, valor, producto_id, pedidos_id) VALUES (1, 5000, 2, 2);
select * from pedi_produc;

/*Departamentos*/
INSERT INTO departamento (id_Dep,Nom_Dep) VALUES (11,"Bogotá, D.C.");
INSERT INTO departamento (id_Dep,Nom_Dep) VALUES (25,"Cundinamarca");

/*Municipios*/
INSERT INTO Muni (id_muni,nom,id_Dep)VALUES (25162,"CHIA",25);
INSERT INTO Muni (id_muni,nom,id_Dep)VALUES (25200,"COTA",25);
INSERT INTO Muni (id_muni,nom,id_Dep)VALUES (25758,"SOPÓ",25);
INSERT INTO Muni (id_muni,nom,id_Dep)VALUES (25808,"TENJO",25);
INSERT INTO Muni (id_muni,nom,id_Dep)VALUES (25390,"LA CALERA",25);
INSERT INTO Muni (id_muni,nom,id_Dep)VALUES (25151,"CAJICÁ",25);
INSERT INTO Muni (id_muni,nom,id_Dep)VALUES (25284,"FACATATIVÁ",25);
INSERT INTO Muni (id_muni,nom,id_Dep)VALUES (25425,"MADRID",25);
INSERT INTO Muni (id_muni,nom,id_Dep)VALUES (25479,"MOSQUERA",25);
INSERT INTO Muni (id_muni,nom,id_Dep)VALUES (25295,"FUNZA",25);
INSERT INTO Muni (id_muni,nom,id_Dep)VALUES (25897,"ZINPAQUIRA",25);
INSERT INTO Muni (id_muni,nom,id_Dep)VALUES (25785,"TABIO",25);
INSERT INTO Muni (id_muni,nom,id_Dep)VALUES (25791,"SUBACHOQUE",25);
INSERT INTO Muni (id_muni,nom,id_Dep)VALUES (25740,"SIBATÉ",25);
INSERT INTO Muni (id_muni,nom,id_Dep)VALUES (25756,"SOACHA",25);

/*Desencriptar contraseña*/
/*SELECT NomUsu, Password, CAST(AES_DECRYPT(Password, '1234') AS CHAR) AS Contraseña_Desencriptada
FROM Usuario;*/
