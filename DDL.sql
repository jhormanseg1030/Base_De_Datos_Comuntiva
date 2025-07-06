DROP DATABASE IF EXISTS Comuctiva;
CREATE DATABASE Comuctiva;
Use Comuctiva;

/*Tablas Fuertes*/

CREATE TABLE Tip_Doc(
	ID_TipDocu TINYINT (3) PRIMARY KEY AUTO_INCREMENT,
    Tipo VARCHAR (30) NOT NULL
);
CREATE TABLE Rol(
	Id_Rol INT (10) PRIMARY KEY AUTO_INCREMENT,
    Nom_Rol VARCHAR (30)
);
CREATE TABLE Vias(
	Id_Vias INT (10) PRIMARY KEY AUTO_INCREMENT,
    Tipo VARCHAR (20) NOT NULL
);
CREATE TABLE Dep(
	ID_Dep INT (10) PRIMARY KEY,
    Nom VARCHAR (100) NOT NULL
);
CREATE TABLE Transportadora(
	Id_Transpor INT (10) PRIMARY KEY AUTO_INCREMENT,
    NombreT VARCHAR (30) NOT NULL,
    Logo VARCHAR (30) NOT NULL,
    Telefono VARCHAR (20) NOT NULL,
    Correo VARCHAR (50) NOT NULL,
    Direcc VARCHAR (50) NOT NULL,
    Sitio_Web VARCHAR (50) NOT NULL
);
CREATE TABLE Unidad_Medida(
	Id_Medida INT (10) PRIMARY KEY AUTO_INCREMENT,
    Tip_Medida VARCHAR (20) NOT NULL
);
CREATE TABLE Descuentos(
	ID_Descu INT (10)PRIMARY KEY AUTO_INCREMENT,
	Descripcion VARCHAR (50) NOT NULL,
	Fec_Des DATETIME NOT NULL,
    Valor DECIMAL (10,2) NOT NULL
);
CREATE TABLE Tipo_De_Pago(
	Id_TiPago INT (10) PRIMARY KEY AUTO_INCREMENT,
    Tipos VARCHAR (20) NOT NULL
);
CREATE TABLE Barr_Vere(
	ID_Barr_Vere INT(10) PRIMARY KEY AUTO_INCREMENT,
	Nombre VARCHAR(20) NOT NULL
);
CREATE TABLE Estado(
ID_Estado INT PRIMARY KEY AUTO_INCREMENT,
estado VARCHAR(30)
);
CREATE TABLE Obser(
ID_Obser INT PRIMARY KEY AUTO_INCREMENT,
Obser VARCHAR(40)
);


/*Tablas debiles*/
CREATE TABLE Muni(
	ID_Muni INT (10) PRIMARY KEY,
    Nom VARCHAR (50) NOT NULL,
	ID_Dep INT (10)
);
CREATE TABLE Usuario(

ID_Usuario INT(10) PRIMARY KEY auto_increment,
NomUsu VARCHAR(50) NOT NULL,
apell1 VARCHAR (50) NOT NULL,
apell2 VARCHAR(50),
tel1 NUMERIC(20) NOT NULL,
tel2 NUMERIC(20),
ID_TipDocu TINYINT(3),
correo VARCHAR(50) NOT NULL,
NumDoc VARCHAR(20) NOT NULL,
Password VARBINARY(500) NOT NULL
);
CREATE TABLE Pedidos(
ID_Pedido INT(10) PRIMARY KEY auto_increment,
ID_Usuario INT(10),
FeHor_Ped TIMESTAMP NOT NULL,
ID_Estado INT(10),
ID_Guia INT(10)

);

CREATE TABLE Compra(
	ID_Compra INT(10) PRIMARY KEY auto_increment,
	ID_TiPago INT(10),
	total DECIMAL(10,2)NOT NULL,
	Ref_Pago VARCHAR(30)NOT NULL,
	Fec_com DATETIME NOT NULL,
	ID_Pedido INT(10)
);
CREATE TABLE Producto(
	ID_Producto INT(10) PRIMARY KEY auto_increment,
	ID_Medida INT(10),
	NomProd VARCHAR(50)NOT NULL,
	Valor DECIMAL(10,2) NOT NULL,
	Cant NUMERIC(19,0) NOT NULL,
	ID_Tienda INT(10),
	Imagen VARCHAR(100),
	Descrip VARCHAR(50)
);
CREATE TABLE Rol_Usuario(
	ID_Rol INT(10),
	ID_Usuario INT(10),
	Estado BINARY(1) NOT NULL
);
CREATE TABLE Reembolsos(
	ID_Reembolso INT(10) PRIMARY KEY auto_increment,
	Fec_Soli DATETIME NOT NULL,
	Valor NUMERIC(20,2) NOT NULL,
	Motivo VARCHAR(100),
	Fec_Resp DATETIME NOT NULL,
	Estado VARCHAR(20) NOT NULL,
	ID_Com_Produc INT(10)
);
CREATE TABLE Comp_Produc(
	ID_Com_Produc INT(10) PRIMARY KEY auto_increment,
	ID_Compra INT(10),
	ID_Producto INT(10),
	Cant NUMERIC(19,2) NOT NULL,
	Valor DECIMAL(10,2) NOT NULL
);
CREATE TABLE Guia_de_Envio (
ID_Guia INT (10) PRIMARY KEY auto_increment,
ID_Transpor INT (10),
Fec_Env TIMESTAMP NOT NULL,
ID_Obser INT
);
CREATE TABLE R_Social (
ID_R_Social INT (10) PRIMARY KEY auto_increment,
Nombre VARCHAR (50) NOT NULL,
NIT  VARCHAR(50)NOT NULL,
Sucur VARCHAR(50) NOT NULL,
ID_Usuario INT (10)
);
CREATE TABLE Direcciones (
	ID_Direcc INT(10)PRIMARY KEY auto_increment,
	ID_Vias INT(10),
	num VARCHAR(10)NOT NULL, 
	comple VARCHAR(50) NOT NULL,
	Ubi_Geo VARCHAR (20) NOT NULL,
	ID_Usuario INT(10),
	ID_Barrio INT(10)
);
CREATE TABLE Barrio(
	ID_Barrio INT(10)PRIMARY KEY auto_increment,
	ID_Barr_Vere INT(10),
	Nom VARCHAR(50)NOT NULL,
	ID_Muni INT(10)
	);
CREATE TABLE Produc_Desc(
	ID_Producto INT(10),
	ID_Descu INT(10)
);
CREATE TABLE Ingres_Produc(
	ID_Producto INT(10),
	ID_Ingreso INT(10),
	cant NUMERIC (20,2)
	);
CREATE TABLE Tienda(
	ID_Tienda INT(10)PRIMARY KEY auto_increment,
	ID_Direcc INT(10),
	NomT VARCHAR(50),
	Logo VARCHAR(50),
	ID_Usuario INT(10),
	ID_R_Social INT(10)
);

CREATE TABLE Pedi_Produc(
	ID_Producto INT(10),
	ID_Pedido INT(10),
	cant NUMERIC(30,0)NOT NULL,
	valor DECIMAL(10,3) NOT NULL
);

CREATE TABLE Ingresos(
	ID_Ingreso INT (10) PRIMARY KEY AUTO_INCREMENT,
    Fecha DATETIME,
    ID_Usuario INT (10),
    Obser VARCHAR(50)
);
CREATE TABLE Carrito(
	ID_Carrito INT (10) PRIMARY KEY AUTO_INCREMENT,
	ID_Usuario INT NOT NULL,
    ID_Producto INT NOT NULL,
    Cantidad INT NOT NULL DEFAULT 1,
    Fecha_Agre TIMESTAMP
);

/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*Foreign Keys*/

/*Usuario*/
ALTER TABLE Usuario
ADD CONSTRAINT FK_Tip_Doc
FOREIGN KEY (ID_TipDocu) REFERENCES Tip_Doc(ID_TipDocu);

/*Pedidos*/

ALTER TABLE Pedidos
ADD CONSTRAINT FK_Usuario
FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario);

ALTER TABLE Pedidos
ADD CONSTRAINT FK_Guia_de_Envio
FOREIGN KEY (ID_Guia) REFERENCES Guia_de_Envio(ID_Guia);

ALTER TABLE Pedidos
ADD CONSTRAINT FK_Estado
FOREIGN KEY (ID_Estado) REFERENCES Estado(ID_Estado);


/*Guia de envio*/

ALTER TABLE Guia_de_Envio
ADD CONSTRAINT FK_Transportadora
FOREIGN KEY (ID_Transpor) REFERENCES Transportadora(ID_Transpor);

ALTER TABLE Guia_de_Envio
ADD CONSTRAINT FK_Obser
FOREIGN KEY (ID_Obser) REFERENCES Obser(ID_Obser);

/*Rol_Usuario*/

ALTER TABLE Rol_Usuario
ADD CONSTRAINT FK_Usuarios
FOREIGN KEY (ID_Usuario) REFERENCES Usuario (ID_Usuario);

ALTER TABLE Rol_Usuario
ADD CONSTRAINT FK_rol
FOREIGN KEY (ID_Rol) REFERENCES Rol(ID_Rol);

/*Compra*/

ALTER TABLE Compra
ADD CONSTRAINT FK_TiPago
FOREIGN KEY (ID_TiPago) REFERENCES Tipo_De_Pago(ID_TiPago);

ALTER TABLE Compra
ADD CONSTRAINT FK_Pedido
FOREIGN KEY (ID_Pedido) REFERENCES Pedidos(ID_Pedido);

/*Com_Produc*/

ALTER TABLE Comp_Produc
ADD CONSTRAINT FK_Compra
FOREIGN KEY (ID_Compra) REFERENCES Compra(ID_Compra);

ALTER TABLE Comp_Produc
ADD CONSTRAINT FK_Producto
FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto);

/*Reembolso*/

ALTER TABLE Reembolsos
ADD CONSTRAINT FK_Comp_Produc
FOREIGN KEY (ID_Com_Produc) REFERENCES Comp_Produc(ID_Com_Produc);

/*Producto*/

ALTER TABLE Producto
ADD CONSTRAINT FK_Unidad_Medida
FOREIGN KEY (ID_Medida) REFERENCES Unidad_Medida(ID_Medida);

ALTER TABLE Producto
ADD CONSTRAINT FK_Unidad
FOREIGN KEY (ID_Medida) REFERENCES Unidad_Medida(ID_Medida);

ALTER TABLE Producto
ADD CONSTRAINT FK_Tienda
FOREIGN KEY (ID_Tienda) REFERENCES Tienda(ID_Tienda);

/*Ingresos*/

ALTER TABLE Ingresos
ADD CONSTRAINT FK_Usuar
FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario);

/*Ingres_Produc*/

ALTER TABLE Ingres_Produc
ADD CONSTRAINT FK_Ingreso
FOREIGN KEY (ID_Ingreso) REFERENCES Ingresos(ID_Ingreso);

ALTER TABLE Ingres_Produc
ADD CONSTRAINT FK_Productos
FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto);

/*R_Social*/

ALTER TABLE R_Social
ADD CONSTRAINT FK_Usr
FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario);

/*Barrio*/

ALTER TABLE Barrio
ADD CONSTRAINT FK_Muni
FOREIGN KEY (ID_Muni) REFERENCES Muni(ID_Muni);

ALTER TABLE Barrio
ADD CONSTRAINT FK_Barr_Vere 
FOREIGN KEY (ID_Barr_Vere) REFERENCES Barr_Vere(ID_Barr_Vere);

/*Direcciones*/

ALTER TABLE Direcciones
ADD CONSTRAINT FK_Vias
FOREIGN KEY (ID_Vias) REFERENCES Vias(ID_Vias);

ALTER TABLE Direcciones
ADD CONSTRAINT FK_Usu
FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario);

ALTER TABLE Direcciones
ADD CONSTRAINT FK_Barrio
FOREIGN KEY (ID_Barrio) REFERENCES Barrio(ID_Barrio);

/*Tienda*/

ALTER TABLE Tienda
ADD CONSTRAINT FK_Direcc
FOREIGN KEY (ID_Direcc) REFERENCES Direcciones(ID_Direcc);

ALTER TABLE Tienda
ADD CONSTRAINT FK_R_Social
FOREIGN KEY (ID_R_Social) REFERENCES R_Social(ID_R_Social);

ALTER TABLE Tienda
ADD CONSTRAINT FK_Usri
FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario);

/*Produc_Desc*/

ALTER TABLE Produc_Desc
ADD CONSTRAINT FK_Produc
FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto);

ALTER TABLE Produc_Desc
ADD CONSTRAINT FK_Descuent
FOREIGN KEY (ID_Descu) REFERENCES Descuentos(ID_Descu);

/*Pedi_Produc*/

ALTER TABLE Pedi_Produc
ADD CONSTRAINT FK_Prod
FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto);

ALTER TABLE Pedi_Produc
ADD CONSTRAINT FK_Pedi
FOREIGN KEY (ID_Pedido) REFERENCES Pedidos(ID_Pedido);

/*Municipos*/
 
 ALTER TABLE Muni
ADD CONSTRAINT FK_Dep
FOREIGN KEY (ID_Dep) REFERENCES Dep(ID_Dep);

UPDATE `comuctiva`.`Compra` SET `ID_Compra` = '3' WHERE (`ID_Compra` = '4');
UPDATE `comuctiva`.`Compra` SET `ID_Compra` = '4' WHERE (`ID_Compra` = '5');
