-- =====================================================
-- SCRIPT MAESTRO - INSTALACIÓN COMPLETA
-- Base de Datos Comuctiva
-- =====================================================
-- Este script ejecuta en orden todos los pasos necesarios
-- para crear y configurar la base de datos desde cero
-- =====================================================

-- =====================================================
-- PASO 1: ELIMINAR Y RECREAR BASE DE DATOS
-- =====================================================
DROP DATABASE IF EXISTS Comuctiva;
CREATE DATABASE Comuctiva;
USE Comuctiva;

SELECT '✅ PASO 1 COMPLETADO: Base de datos creada' as Estado;

-- =====================================================
-- PASO 2: CREAR ESTRUCTURA (DDL)
-- =====================================================

-- TABLAS FUERTES
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

-- TABLAS DÉBILES
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
    ID_Pedido INT(10),
    ID_Usuario INT(10)
);

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

CREATE TABLE Comentarios(
    ID_Comentario INT(10) PRIMARY KEY AUTO_INCREMENT,
    ID_Comp_Produc INT(10) NOT NULL,
    ID_Usuario INT(10) NOT NULL,
    Comentario TEXT NOT NULL,
    Fecha_Comentario TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT '✅ PASO 2 COMPLETADO: Tablas creadas' as Estado;

-- =====================================================
-- PASO 3: CREAR RELACIONES (FOREIGN KEYS)
-- =====================================================

ALTER TABLE Usuario ADD CONSTRAINT FK_Tip_Doc FOREIGN KEY (ID_TipDocu) REFERENCES Tip_Doc(ID_TipDocu);
ALTER TABLE Pedidos ADD CONSTRAINT FK_Usuario FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario);
ALTER TABLE Pedidos ADD CONSTRAINT FK_Guia_de_Envio FOREIGN KEY (ID_Guia) REFERENCES Guia_de_Envio(ID_Guia);
ALTER TABLE Pedidos ADD CONSTRAINT FK_Estado FOREIGN KEY (ID_Estado) REFERENCES Estado(ID_Estado);
ALTER TABLE Guia_de_Envio ADD CONSTRAINT FK_Transportadora FOREIGN KEY (ID_Transpor) REFERENCES Transportadora(Id_Transpor);
ALTER TABLE Guia_de_Envio ADD CONSTRAINT FK_Obser FOREIGN KEY (ID_Obser) REFERENCES Obser(ID_Obser);
ALTER TABLE Rol_Usuario ADD CONSTRAINT FK_Usuarios FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario);
ALTER TABLE Rol_Usuario ADD CONSTRAINT FK_rol FOREIGN KEY (ID_Rol) REFERENCES Rol(Id_Rol);
ALTER TABLE Compra ADD CONSTRAINT FK_TiPago FOREIGN KEY (ID_TiPago) REFERENCES Tipo_De_Pago(Id_TiPago);
ALTER TABLE Compra ADD CONSTRAINT FK_Pedido FOREIGN KEY (ID_Pedido) REFERENCES Pedidos(ID_Pedido);
ALTER TABLE Comp_Produc ADD CONSTRAINT FK_Compra FOREIGN KEY (ID_Compra) REFERENCES Compra(ID_Compra);
ALTER TABLE Comp_Produc ADD CONSTRAINT FK_Producto FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto);
ALTER TABLE Producto ADD CONSTRAINT FK_Unidad_Medida FOREIGN KEY (ID_Medida) REFERENCES Unidad_Medida(Id_Medida);
ALTER TABLE Ingresos ADD CONSTRAINT FK_Usuar FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario);
ALTER TABLE Ingres_Produc ADD CONSTRAINT FK_Ingreso FOREIGN KEY (ID_Ingreso) REFERENCES Ingresos(ID_Ingreso);
ALTER TABLE Ingres_Produc ADD CONSTRAINT FK_Productos FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto);
ALTER TABLE Barrio ADD CONSTRAINT FK_Muni FOREIGN KEY (ID_Muni) REFERENCES Muni(ID_Muni);
ALTER TABLE Barrio ADD CONSTRAINT FK_Barr_Vere FOREIGN KEY (ID_Barr_Vere) REFERENCES Barr_Vere(ID_Barr_Vere);
ALTER TABLE Direcciones ADD CONSTRAINT FK_Vias FOREIGN KEY (ID_Vias) REFERENCES Vias(Id_Vias);
ALTER TABLE Direcciones ADD CONSTRAINT FK_Usu FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario);
ALTER TABLE Direcciones ADD CONSTRAINT FK_Barrio FOREIGN KEY (ID_Barrio) REFERENCES Barrio(ID_Barrio);
ALTER TABLE Produc_Desc ADD CONSTRAINT FK_Produc FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto);
ALTER TABLE Produc_Desc ADD CONSTRAINT FK_Descuent FOREIGN KEY (ID_Descu) REFERENCES Descuentos(ID_Descu);
ALTER TABLE Pedi_Produc ADD CONSTRAINT FK_Prod FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto);
ALTER TABLE Pedi_Produc ADD CONSTRAINT FK_Pedi FOREIGN KEY (ID_Pedido) REFERENCES Pedidos(ID_Pedido);
ALTER TABLE Muni ADD CONSTRAINT FK_Dep FOREIGN KEY (ID_Dep) REFERENCES Dep(ID_Dep);
ALTER TABLE Comentarios ADD CONSTRAINT fk_comentario_comp_produc FOREIGN KEY (ID_Comp_Produc) REFERENCES Comp_Produc(ID_Com_Produc);
ALTER TABLE Comentarios ADD CONSTRAINT fk_comentario_usuario FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario);
ALTER TABLE Carrito ADD CONSTRAINT FK_Carrito_Usuario FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario);
ALTER TABLE Carrito ADD CONSTRAINT FK_Carrito_Producto FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto);

SELECT '✅ PASO 3 COMPLETADO: Relaciones (Foreign Keys) creadas' as Estado;

-- =====================================================
-- PASO 4: INSERTAR DATOS INICIALES (DML)
-- =====================================================

-- Tipos de Documento
INSERT INTO Tip_Doc (ID_TipDocu, Tipo) VALUES
(1, 'Cedula de Ciudadania'),
(2, 'Pasaporte'),
(3, 'Tarjeta de Identidad'),
(4, 'Cedula de Extranjeria');

-- Roles
INSERT INTO Rol (Id_Rol, Nom_Rol) VALUES
(1, 'Administrador'),
(2, 'Cliente');

-- Usuarios (Contraseñas BCrypt - serán actualizadas por DataLoader)
INSERT INTO Usuario (ID_Usuario, NomUsu, apell1, apell2, tel1, tel2, ID_TipDocu, correo, NumDoc, Password) VALUES
(1, 'Admin', 'Sistema', 'Principal', 3001111111, 3009999999, 1, 'admin@comuctiva.com', 22222222, '$2a$10$DowJonesVSTRW0FVz15d9uKLCqH3JsZ.PWypayRII0f.YqK5E9WFG'),
(2, 'Ana', 'Rodríguez', 'Sánchez', 3004444444, 3006666666, 1, 'ana@cliente.com', 55555555, '$2a$10$DowJonesVSTRW0FVz15d9uKLCqH3JsZ.PWypayRII0f.YqK5E9WFG'),
(3, 'Pedro', 'López', 'González', 3005555555, 3005555555, 1, 'pedro@cliente.com', 66666666, '$2a$10$DowJonesVSTRW0FVz15d9uKLCqH3JsZ.PWypayRII0f.YqK5E9WFG');

-- Roles de Usuarios
INSERT INTO Rol_Usuario (ID_Rol, ID_Usuario, Estado) VALUES
(1, 1, 1),
(2, 2, 1),
(2, 3, 1);

-- Unidades de Medida
INSERT INTO Unidad_Medida (Id_Medida, Tip_Medida) VALUES
(1, 'Kilogramo'),
(2, 'Gramo'),
(3, 'Libra'),
(4, 'Unidad'),
(5, 'Litro'),
(6, 'Mililitro');

-- Tipos de Vías
INSERT INTO Vias (Id_Vias, Tipo) VALUES
(1, 'Calle'),
(2, 'Carrera'),
(3, 'Avenida'),
(4, 'Transversal'),
(5, 'Diagonal'),
(6, 'Circular');

-- Tipos de Pago
INSERT INTO Tipo_De_Pago (Id_TiPago, Tipos) VALUES
(1, 'Efectivo'),
(2, 'Tarjeta Débito'),
(3, 'Tarjeta Crédito'),
(4, 'Transferencia'),
(5, 'PSE');

-- Estados
INSERT INTO Estado (ID_Estado, estado) VALUES
(1, 'Pendiente'),
(2, 'En Proceso'),
(3, 'En Camino'),
(4, 'Entregado'),
(5, 'Cancelado');

-- Observaciones
INSERT INTO Obser (ID_Obser, Obser) VALUES
(1, 'Sin observaciones'),
(2, 'Entrega urgente'),
(3, 'Llamar antes de entregar'),
(4, 'Dejar con portería'),
(5, 'Cliente no responde');

-- Barrios/Veredas
INSERT INTO Barr_Vere (ID_Barr_Vere, Nombre) VALUES
(1, 'Barrio'),
(2, 'Vereda');

-- Departamentos
INSERT INTO Dep (ID_Dep, Nom) VALUES
(5, 'Antioquia'),
(8, 'Atlántico'),
(11, 'Bogotá D.C.'),
(13, 'Bolívar'),
(76, 'Valle del Cauca');

-- Municipios
INSERT INTO Muni (ID_Muni, Nom, ID_Dep) VALUES
(5001, 'Medellín', 5),
(5002, 'Envigado', 5),
(11001, 'Bogotá D.C.', 11),
(76001, 'Cali', 76);

-- Barrios
INSERT INTO Barrio (ID_Barrio, ID_Barr_Vere, Nom, ID_Muni) VALUES
(1, 1, 'El Poblado', 5001),
(2, 1, 'Laureles', 5001),
(3, 1, 'Chapinero', 11001);

-- Transportadoras
INSERT INTO Transportadora (Id_Transpor, NombreT, Logo, Telefono, Correo, Direcc, Sitio_Web) VALUES
(1, 'Servientrega', 'servientrega.png', '018000112345', 'info@servientrega.com', 'Calle 100 # 10-20', 'www.servientrega.com'),
(2, 'Coordinadora', 'coordinadora.png', '018000223456', 'info@coordinadora.com', 'Carrera 50 # 20-30', 'www.coordinadora.com');

SELECT '✅ PASO 4 COMPLETADO: Datos iniciales insertados' as Estado;

-- =====================================================
-- PASO 5: VERIFICACIÓN FINAL
-- =====================================================

SELECT '=== RESUMEN DE INSTALACIÓN ===' as Info;

SELECT 
    'Usuarios creados' as Tabla,
    COUNT(*) as Cantidad
FROM usuario
UNION ALL
SELECT 
    'Roles creados' as Tabla,
    COUNT(*) as Cantidad
FROM rol
UNION ALL
SELECT 
    'Tipos de documento' as Tabla,
    COUNT(*) as Cantidad
FROM tip_doc
UNION ALL
SELECT 
    'Unidades de medida' as Tabla,
    COUNT(*) as Cantidad
FROM unidad_medida;

-- Verificar constraint UNIQUE
SELECT 
    '✅ Constraint UNIQUE verificado' as Estado
FROM information_schema.TABLE_CONSTRAINTS
WHERE TABLE_SCHEMA = 'Comuctiva' 
    AND TABLE_NAME = 'usuario'
    AND CONSTRAINT_NAME = 'UK_Usuario_TipDoc_NumDoc';

SELECT '========================================' as Separador;
SELECT '✅ INSTALACIÓN COMPLETADA EXITOSAMENTE' as Estado;
SELECT '========================================' as Separador;
SELECT 'Usuarios de prueba:' as Info;
SELECT 'Admin - NumDoc: 22222222 - Password: admin123' as Credenciales
UNION ALL
SELECT 'Ana - NumDoc: 55555555 - Password: 1234' as Credenciales
UNION ALL
SELECT 'Pedro - NumDoc: 66666666 - Password: 1234' as Credenciales;
SELECT '========================================' as Separador;
SELECT 'Siguiente paso: Iniciar servidor Spring Boot' as Accion;
SELECT 'El DataLoader actualizará las contraseñas automáticamente' as Nota;
SELECT '========================================' as Separador;
