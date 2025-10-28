DROP DATABASE IF EXISTS Comuctiva;
CREATE DATABASE Comuctiva;
USE Comuctiva;

-- =====================================================
-- TABLAS FUERTES
-- =====================================================

CREATE TABLE Tip_Doc(
    ID_TipDocu TINYINT(3) PRIMARY KEY AUTO_INCREMENT,
    Tipo VARCHAR(30) NOT NULL
);

CREATE TABLE Rol(
    Id_Rol INT(10) PRIMARY KEY AUTO_INCREMENT,
    Nom_Rol VARCHAR(30)
);

CREATE TABLE Vias(
    Id_Vias INT(10) PRIMARY KEY AUTO_INCREMENT,
    Tipo VARCHAR(20) NOT NULL
);

CREATE TABLE Dep(
    ID_Dep INT(10) PRIMARY KEY,
    Nom VARCHAR(100) NOT NULL
);

CREATE TABLE Transportadora(
    Id_Transpor INT(10) PRIMARY KEY AUTO_INCREMENT,
    NombreT VARCHAR(30) NOT NULL,
    Logo VARCHAR(30) NOT NULL,
    Telefono VARCHAR(20) NOT NULL,
    Correo VARCHAR(50) NOT NULL,
    Direcc VARCHAR(50) NOT NULL,
    Sitio_Web VARCHAR(50) NOT NULL
);

CREATE TABLE Unidad_Medida(
    Id_Medida INT(10) PRIMARY KEY AUTO_INCREMENT,
    Tip_Medida VARCHAR(20) NOT NULL
);

CREATE TABLE Descuentos(
    ID_Descu INT(10) PRIMARY KEY AUTO_INCREMENT,
    Descripcion VARCHAR(50) NOT NULL,
    Fec_Des DATETIME NOT NULL,
    Valor DECIMAL(10,2) NOT NULL
);

CREATE TABLE Tipo_De_Pago(
    Id_TiPago INT(10) PRIMARY KEY AUTO_INCREMENT,
    Tipos VARCHAR(20) NOT NULL
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

-- =====================================================
-- TABLAS DÉBILES
-- =====================================================

CREATE TABLE Muni(
    ID_Muni INT(10) PRIMARY KEY,
    Nom VARCHAR(50) NOT NULL,
    ID_Dep INT(10)
);

CREATE TABLE Usuario(
    ID_Usuario INT(10) PRIMARY KEY AUTO_INCREMENT,
    NomUsu VARCHAR(50) NOT NULL,
    apell1 VARCHAR(50) NOT NULL,
    apell2 VARCHAR(50),
    tel1 NUMERIC(20) NOT NULL,
    tel2 NUMERIC(20),
    ID_TipDocu TINYINT(3),
    correo VARCHAR(50) NOT NULL,
    NumDoc NUMERIC(20) NOT NULL,
    Password VARCHAR(500) NOT NULL,
    CONSTRAINT UK_Usuario_TipDoc_NumDoc UNIQUE (ID_TipDocu, NumDoc)
);

CREATE TABLE Pedidos(
    ID_Pedido INT(10) PRIMARY KEY AUTO_INCREMENT,
    ID_Usuario INT(10),
    FeHor_Ped TIMESTAMP NOT NULL,
    ID_Estado INT(10),
    ID_Guia INT(10)
);

CREATE TABLE Compra(
    ID_Compra INT(10) PRIMARY KEY AUTO_INCREMENT,
    ID_TiPago INT(10),
    total DECIMAL(10,2) NOT NULL,
    Ref_Pago VARCHAR(30) NOT NULL,
    Fec_com DATETIME NOT NULL,
    ID_Pedido INT(10)
);

-- Tabla Producto SIN ID_Tienda (eliminado)
CREATE TABLE Producto(
    ID_Producto INT(10) PRIMARY KEY AUTO_INCREMENT,
    ID_Medida INT(10),
    NomProd VARCHAR(50) NOT NULL,
    Valor DECIMAL(10,2) NOT NULL,
    Cant NUMERIC(19,0) NOT NULL,
    Imagen VARCHAR(100),
    Descrip VARCHAR(50)
);

CREATE TABLE Rol_Usuario(
    ID_Rol INT(10),
    ID_Usuario INT(10),
    Estado BINARY(1) NOT NULL,
    PRIMARY KEY (ID_Rol, ID_Usuario)
);

CREATE TABLE Comp_Produc(
    ID_Com_Produc INT(10) PRIMARY KEY AUTO_INCREMENT,
    ID_Compra INT(10),
    ID_Producto INT(10),
    Cant NUMERIC(19,2) NOT NULL,
    Valor DECIMAL(10,2) NOT NULL
);

CREATE TABLE Guia_de_Envio(
    ID_Guia INT(10) PRIMARY KEY AUTO_INCREMENT,
    ID_Transpor INT(10),
    Fec_Env TIMESTAMP NOT NULL,
    ID_Obser INT
);

CREATE TABLE Direcciones(
    ID_Direcc INT(10) PRIMARY KEY AUTO_INCREMENT,
    ID_Vias INT(10),
    num VARCHAR(10) NOT NULL,
    comple VARCHAR(50) NOT NULL,
    Ubi_Geo VARCHAR(20) NOT NULL,
    ID_Usuario INT(10),
    ID_Barrio INT(10)
);

CREATE TABLE Barrio(
    ID_Barrio INT(10) PRIMARY KEY AUTO_INCREMENT,
    ID_Barr_Vere INT(10),
    Nom VARCHAR(50) NOT NULL,
    ID_Muni INT(10)
);

CREATE TABLE Produc_Desc(
    ID_Producto INT(10),
    ID_Descu INT(10),
    PRIMARY KEY (ID_Producto, ID_Descu)
);

CREATE TABLE Ingres_Produc(
    ID_Producto INT(10),
    ID_Ingreso INT(10),
    cant NUMERIC(20,2),
    PRIMARY KEY (ID_Producto, ID_Ingreso)
);

-- TABLA TIENDA ELIMINADA (Ya no existe)

CREATE TABLE Pedi_Produc(
    ID_Producto INT(10),
    ID_Pedido INT(10),
    cant NUMERIC(30,0) NOT NULL,
    valor DECIMAL(10,3) NOT NULL,
    PRIMARY KEY (ID_Producto, ID_Pedido)
);

CREATE TABLE Ingresos(
    ID_Ingreso INT(10) PRIMARY KEY AUTO_INCREMENT,
    Fecha DATETIME,
    ID_Usuario INT(10),
    Obser VARCHAR(50)
);

CREATE TABLE Carrito(
    ID_Carrito INT(10) PRIMARY KEY AUTO_INCREMENT,
    ID_Usuario INT NOT NULL,
    ID_Producto INT NOT NULL,
    Cantidad INT NOT NULL DEFAULT 1,
    Fecha_Agre TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla COMENTARIOS (reemplaza calificaciones_produc)
CREATE TABLE Comentarios(
    ID_Comentario INT(10) PRIMARY KEY AUTO_INCREMENT,
    ID_Comp_Produc INT(10) NOT NULL,
    ID_Usuario INT(10) NOT NULL,
    Comentario TEXT NOT NULL,
    Fecha_Comentario TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
-- FOREIGN KEYS (RELACIONES)
-- =====================================================

-- Usuario
ALTER TABLE Usuario ADD CONSTRAINT FK_Tip_Doc FOREIGN KEY (ID_TipDocu) REFERENCES Tip_Doc(ID_TipDocu);

-- Pedidos
ALTER TABLE Pedidos ADD CONSTRAINT FK_Usuario FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario);
ALTER TABLE Pedidos ADD CONSTRAINT FK_Guia_de_Envio FOREIGN KEY (ID_Guia) REFERENCES Guia_de_Envio(ID_Guia);
ALTER TABLE Pedidos ADD CONSTRAINT FK_Estado FOREIGN KEY (ID_Estado) REFERENCES Estado(ID_Estado);

-- Guia de envio
ALTER TABLE Guia_de_Envio ADD CONSTRAINT FK_Transportadora FOREIGN KEY (ID_Transpor) REFERENCES Transportadora(Id_Transpor);
ALTER TABLE Guia_de_Envio ADD CONSTRAINT FK_Obser FOREIGN KEY (ID_Obser) REFERENCES Obser(ID_Obser);

-- Rol_Usuario
ALTER TABLE Rol_Usuario ADD CONSTRAINT FK_Usuarios FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario);
ALTER TABLE Rol_Usuario ADD CONSTRAINT FK_rol FOREIGN KEY (ID_Rol) REFERENCES Rol(Id_Rol);

-- Compra
ALTER TABLE Compra ADD CONSTRAINT FK_TiPago FOREIGN KEY (ID_TiPago) REFERENCES Tipo_De_Pago(Id_TiPago);
ALTER TABLE Compra ADD CONSTRAINT FK_Pedido FOREIGN KEY (ID_Pedido) REFERENCES Pedidos(ID_Pedido);

-- Comp_Produc
ALTER TABLE Comp_Produc ADD CONSTRAINT FK_Compra FOREIGN KEY (ID_Compra) REFERENCES Compra(ID_Compra);
ALTER TABLE Comp_Produc ADD CONSTRAINT FK_Producto FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto);

-- Producto (SIN FK a Tienda)
ALTER TABLE Producto ADD CONSTRAINT FK_Unidad_Medida FOREIGN KEY (ID_Medida) REFERENCES Unidad_Medida(Id_Medida);

-- Ingresos
ALTER TABLE Ingresos ADD CONSTRAINT FK_Usuar FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario);

-- Ingres_Produc
ALTER TABLE Ingres_Produc ADD CONSTRAINT FK_Ingreso FOREIGN KEY (ID_Ingreso) REFERENCES Ingresos(ID_Ingreso);
ALTER TABLE Ingres_Produc ADD CONSTRAINT FK_Productos FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto);

-- Barrio
ALTER TABLE Barrio ADD CONSTRAINT FK_Muni FOREIGN KEY (ID_Muni) REFERENCES Muni(ID_Muni);
ALTER TABLE Barrio ADD CONSTRAINT FK_Barr_Vere FOREIGN KEY (ID_Barr_Vere) REFERENCES Barr_Vere(ID_Barr_Vere);

-- Direcciones
ALTER TABLE Direcciones ADD CONSTRAINT FK_Vias FOREIGN KEY (ID_Vias) REFERENCES Vias(Id_Vias);
ALTER TABLE Direcciones ADD CONSTRAINT FK_Usu FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario);
ALTER TABLE Direcciones ADD CONSTRAINT FK_Barrio FOREIGN KEY (ID_Barrio) REFERENCES Barrio(ID_Barrio);

-- Produc_Desc
ALTER TABLE Produc_Desc ADD CONSTRAINT FK_Produc FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto);
ALTER TABLE Produc_Desc ADD CONSTRAINT FK_Descuent FOREIGN KEY (ID_Descu) REFERENCES Descuentos(ID_Descu);

-- Pedi_Produc
ALTER TABLE Pedi_Produc ADD CONSTRAINT FK_Prod FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto);
ALTER TABLE Pedi_Produc ADD CONSTRAINT FK_Pedi FOREIGN KEY (ID_Pedido) REFERENCES Pedidos(ID_Pedido);

-- Municipios
ALTER TABLE Muni ADD CONSTRAINT FK_Dep FOREIGN KEY (ID_Dep) REFERENCES Dep(ID_Dep);

-- Comentarios (reemplaza calificaciones)
ALTER TABLE Comentarios ADD CONSTRAINT fk_comentario_comp_produc FOREIGN KEY (ID_Comp_Produc) REFERENCES Comp_Produc(ID_Com_Produc);
ALTER TABLE Comentarios ADD CONSTRAINT fk_comentario_usuario FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario);

-- Carrito
ALTER TABLE Carrito ADD CONSTRAINT FK_Carrito_Usuario FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario);
ALTER TABLE Carrito ADD CONSTRAINT FK_Carrito_Producto FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto);
