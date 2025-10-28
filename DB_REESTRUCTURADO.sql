-- =====================================================
-- BASE DE DATOS COMUCTIVA - REESTRUCTURADA
-- =====================================================
-- Versión: 3.0 (Sin Vendedores, Sin Tiendas, Con Comentarios)
-- Cambios:
-- - Eliminado rol de Vendedor (solo Admin y Cliente)
-- - Eliminada tabla Tienda y todas sus relaciones
-- - Cambiado Calificaciones por Comentarios (sin estrellas)
-- - Contraseñas encriptadas con BCrypt
-- Fecha: Octubre 2025
-- =====================================================

DROP DATABASE IF EXISTS Comuctiva;
CREATE DATABASE Comuctiva;
USE Comuctiva;

-- =====================================================
-- ESTRUCTURA DE TABLAS (DDL)
-- =====================================================

-- ============= TABLAS FUERTES =============

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

-- ============= TABLAS DÉBILES =============

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
    NumDoc VARCHAR(20) NOT NULL,
    Password VARCHAR(500) NOT NULL
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

-- Producto SIN referencia a Tienda
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

-- COMENTARIOS (reemplaza calificaciones_produc - SIN estrellas)
CREATE TABLE Comentarios(
    ID_Comentario INT(10) PRIMARY KEY AUTO_INCREMENT,
    ID_Comp_Produc INT(10) NOT NULL,
    ID_Usuario INT(10) NOT NULL,
    Comentario TEXT NOT NULL,
    Fecha_Comentario TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
-- FOREIGN KEYS
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

-- =====================================================
-- DATOS DE EJEMPLO (DML)
-- =====================================================

-- ============= CATÁLOGOS BÁSICOS =============

-- Roles (SOLO Admin y Cliente - SIN Vendedor)
INSERT INTO Rol (Nom_Rol) VALUES 
('Cliente'),
('Administrador');

-- Tipos de Documento
INSERT INTO Tip_Doc (Tipo) VALUES 
('Cedula de Ciudadania'),
('Pasaporte'),
('Tarjeta de Identidad'),
('Cedula de Extranjeria');

-- Vías
INSERT INTO Vias (Tipo) VALUES 
('Calle'),
('Carrera'),
('Avenida'),
('Transversal'),
('Diagonal');

-- Unidades de Medida
INSERT INTO Unidad_Medida (Tip_Medida) VALUES 
('Libra'),
('Kilo'),
('Bulto'),
('Unidad'),
('Litro'),
('Gramo');

-- Tipos de Pago
INSERT INTO Tipo_De_Pago (Tipos) VALUES 
('Tarjeta de Credito'),
('Tarjeta de Debito'),
('PSE'),
('Efectivo'),
('PayPal'),
('Nequi'),
('Daviplata');

-- Barrio/Vereda
INSERT INTO Barr_Vere (Nombre) VALUES 
('Barrio'),
('Vereda'),
('Sector');

-- Estados de Pedido
INSERT INTO Estado (estado) VALUES 
('En espera'),
('En proceso'),
('Enviado'),
('Entregado'),
('Cancelado'),
('Cerrado'),
('Devuelto');

-- Observaciones de Envío
INSERT INTO Obser (Obser) VALUES 
('Delicado'),
('Peligro'),
('Fragil'),
('Ligero'),
('Pesado');

-- ============= UBICACIONES =============

-- Departamentos
INSERT INTO Dep (ID_Dep, Nom) VALUES 
(11, 'Bogotá, D.C.'),
(25, 'Cundinamarca');

-- Municipios
INSERT INTO Muni (ID_Muni, Nom, ID_Dep) VALUES 
(25162, 'CHIA', 25),
(25200, 'COTA', 25),
(25758, 'SOPÓ', 25),
(25808, 'TENJO', 25),
(25390, 'LA CALERA', 25),
(25151, 'CAJICÁ', 25),
(25284, 'FACATATIVÁ', 25),
(25425, 'MADRID', 25),
(25479, 'MOSQUERA', 25),
(25295, 'FUNZA', 25),
(25897, 'ZIPAQUIRÁ', 25),
(25785, 'TABIO', 25),
(25791, 'SUBACHOQUE', 25),
(25740, 'SIBATÉ', 25),
(25756, 'SOACHA', 25);

-- Barrios
INSERT INTO Barrio (ID_Barr_Vere, Nom, ID_Muni) VALUES 
(1, 'Centro', 25162),
(1, 'La Balsa', 25162),
(1, 'Fonquetá', 25162),
(1, 'San Cayetano', 25151),
(1, 'Capellanía', 25151),
(2, 'Vereda La Caro', 25295),
(3, 'Sector Industrial', 25479);

-- ============= TRANSPORTADORAS =============

INSERT INTO Transportadora (NombreT, Logo, Telefono, Correo, Direcc, Sitio_Web) VALUES 
('Servientrega', 'servientrega.png', '6016000000', 'info@servientrega.com', 'Calle 100 #10-20', 'www.servientrega.com'),
('Coordinadora', 'coordinadora.png', '6017000000', 'info@coordinadora.com', 'Av. 68 #45-30', 'www.coordinadora.com'),
('Deprisa', 'deprisa.png', '6018000000', 'contacto@deprisa.com', 'Cra 50 #12-34', 'www.deprisa.com');

-- ============= USUARIOS =============
-- Solo Admin y Clientes (NO hay Vendedores)
-- Contraseñas encriptadas con BCrypt

INSERT INTO Usuario (NomUsu, apell1, apell2, tel1, tel2, ID_TipDocu, correo, NumDoc, Password) VALUES 
-- ADMINISTRADOR (Contraseña: admin123)
('Admin', 'Sistema', 'Principal', 3001111111, 3009999999, 1, 'admin@comuctiva.com', '22222222', '$2a$10$N9qo8uLOickgx2ZMRZoMye.IVI1lrPn9R6y4KW4ZP1ybYHYwXpGQa'),

-- CLIENTES (Contraseña: 1234)
('Ana', 'Rodríguez', 'Sánchez', 3004444444, 3006666666, 1, 'ana@cliente.com', '55555555', '$2a$10$rZvqmF5Y5kF6x2ZMRZoMyeIVI1lrPn9R6y4KW4ZP1ybYHYwXpGQa'),
('Pedro', 'López', 'González', 3005555555, 3005555555, 1, 'pedro@cliente.com', '66666666', '$2a$10$rZvqmF5Y5kF6x2ZMRZoMyeIVI1lrPn9R6y4KW4ZP1ybYHYwXpGQa'),
('Laura', 'Fernández', 'Torres', 3006666666, 3004444444, 1, 'laura@cliente.com', '77777777', '$2a$10$rZvqmF5Y5kF6x2ZMRZoMyeIVI1lrPn9R6y4KW4ZP1ybYHYwXpGQa'),
('Juan', 'Pérez', 'Gómez', 3007777777, 3003333333, 1, 'juan@cliente.com', '11111111', '$2a$10$rZvqmF5Y5kF6x2ZMRZoMyeIVI1lrPn9R6y4KW4ZP1ybYHYwXpGQa'),
('María', 'García', 'López', 3002222222, 3008888888, 1, 'maria@cliente.com', '33333333', '$2a$10$rZvqmF5Y5kF6x2ZMRZoMyeIVI1lrPn9R6y4KW4ZP1ybYHYwXpGQa'),
('Carlos', 'Martínez', 'Pérez', 3003333333, 3007777777, 1, 'carlos@cliente.com', '44444444', '$2a$10$rZvqmF5Y5kF6x2ZMRZoMyeIVI1lrPn9R6y4KW4ZP1ybYHYwXpGQa');

-- ============= ROLES DE USUARIOS =============

INSERT INTO Rol_Usuario (ID_Rol, ID_Usuario, Estado) VALUES 
-- Admin
(2, 1, 1),  -- Usuario 1 (Admin) tiene rol Administrador
-- Clientes
(1, 2, 1),  -- Usuario 2 (Ana) tiene rol Cliente
(1, 3, 1),  -- Usuario 3 (Pedro) tiene rol Cliente
(1, 4, 1),  -- Usuario 4 (Laura) tiene rol Cliente
(1, 5, 1),  -- Usuario 5 (Juan) tiene rol Cliente
(1, 6, 1),  -- Usuario 6 (María) tiene rol Cliente
(1, 7, 1);  -- Usuario 7 (Carlos) tiene rol Cliente

-- ============= DIRECCIONES =============

INSERT INTO Direcciones (ID_Vias, num, comple, Ubi_Geo, ID_Usuario, ID_Barrio) VALUES 
(2, '45', '23-15 Apto 501', '4.7110,-74.0721', 2, 1),  -- Ana
(1, '72', '10-34 Casa 3', '4.8580,-74.0375', 3, 2),    -- Pedro
(3, '127', '45-67 Local 2', '4.9250,-74.0315', 4, 3),  -- Laura
(2, '80', '12-45', '4.9180,-74.0307', 5, 4),           -- Juan
(1, '50', '23-10', '4.9190,-74.0350', 6, 5),           -- María
(2, '90', '15-20', '4.9200,-74.0360', 7, 6);           -- Carlos

-- ============= PRODUCTOS (SIN asociación a tiendas) =============

INSERT INTO Producto (ID_Medida, NomProd, Valor, Cant, Imagen, Descrip) VALUES 
-- Frutas y Verduras
(2, 'Tomate Chonto', 3500.00, 100, 'tomate.jpg', 'Tomate fresco de la región'),
(2, 'Cebolla Cabezona', 2500.00, 80, 'cebolla.jpg', 'Cebolla de primera calidad'),
(2, 'Papa Criolla', 4000.00, 150, 'papa.jpg', 'Papa criolla seleccionada'),
(4, 'Lechuga Crespa', 2000.00, 60, 'lechuga.jpg', 'Lechuga fresca'),
(2, 'Zanahoria', 2800.00, 90, 'zanahoria.jpg', 'Zanahoria fresca'),
(4, 'Aguacate Hass', 3000.00, 50, 'aguacate.jpg', 'Aguacate Hass grande'),

-- Granos
(2, 'Frijol Rojo', 7000.00, 200, 'frijol.jpg', 'Frijol rojo de primera'),
(2, 'Arroz Blanco', 4500.00, 300, 'arroz.jpg', 'Arroz de alta calidad'),
(2, 'Lenteja', 6500.00, 150, 'lenteja.jpg', 'Lenteja importada'),
(2, 'Garbanzo', 8000.00, 100, 'garbanzo.jpg', 'Garbanzo premium'),
(3, 'Arroz Bulto 50kg', 120000.00, 30, 'arroz_bulto.jpg', 'Bulto de arroz 50kg'),

-- Lácteos
(5, 'Leche Entera', 3200.00, 80, 'leche.jpg', 'Leche fresca entera'),
(4, 'Queso Campesino', 15000.00, 40, 'queso.jpg', 'Queso campesino artesanal'),
(4, 'Yogurt Natural', 4500.00, 60, 'yogurt.jpg', 'Yogurt natural sin azúcar');

-- ============= DESCUENTOS =============

INSERT INTO Descuentos (Descripcion, Fec_Des, Valor) VALUES 
('Descuento Inauguración', '2025-01-15 00:00:00', 10.00),
('Promoción San Valentín', '2025-02-14 00:00:00', 15.00),
('Black Friday', '2025-11-29 00:00:00', 25.00),
('Descuento Mayorista', '2025-12-31 23:59:59', 20.00);

-- ============= PRODUCTOS CON DESCUENTO =============

INSERT INTO Produc_Desc (ID_Producto, ID_Descu) VALUES 
(1, 1),  -- Tomate con descuento inauguración
(2, 1),  -- Cebolla con descuento inauguración
(7, 4),  -- Frijol con descuento mayorista
(8, 4);  -- Arroz con descuento mayorista

-- ============= GUÍAS DE ENVÍO =============

INSERT INTO Guia_de_Envio (ID_Transpor, Fec_Env, ID_Obser) VALUES 
(1, '2025-10-20 08:30:00', 3),  -- Servientrega, Frágil
(2, '2025-10-21 09:00:00', 5),  -- Coordinadora, Pesado
(1, '2025-10-22 10:15:00', 4);  -- Servientrega, Ligero

-- ============= PEDIDOS =============

INSERT INTO Pedidos (ID_Usuario, FeHor_Ped, ID_Estado, ID_Guia) VALUES 
(2, '2025-10-20 08:00:00', 4, 1),  -- Ana, Entregado
(3, '2025-10-21 08:30:00', 3, 2),  -- Pedro, Enviado
(4, '2025-10-22 09:00:00', 2, 3),  -- Laura, En proceso
(2, '2025-10-25 10:00:00', 1, NULL); -- Ana, En espera

-- ============= PRODUCTOS EN PEDIDOS =============

INSERT INTO Pedi_Produc (ID_Producto, ID_Pedido, cant, valor) VALUES 
-- Pedido 1 (Ana)
(1, 1, 5, 3500.000),   -- 5 kg de Tomate
(2, 1, 3, 2500.000),   -- 3 kg de Cebolla
(4, 1, 2, 2000.000),   -- 2 Lechugas

-- Pedido 2 (Pedro)
(7, 2, 10, 7000.000),  -- 10 kg de Frijol
(8, 2, 20, 4500.000),  -- 20 kg de Arroz

-- Pedido 3 (Laura)
(3, 3, 10, 4000.000),  -- 10 kg de Papa
(5, 3, 5, 2800.000),   -- 5 kg de Zanahoria
(6, 3, 4, 3000.000),   -- 4 Aguacates

-- Pedido 4 (Ana)
(9, 4, 5, 6500.000);   -- 5 kg de Lenteja

-- ============= COMPRAS =============

INSERT INTO Compra (ID_TiPago, total, Ref_Pago, Fec_com, ID_Pedido) VALUES 
(6, 28500.00, 'NEQ-20251020-001', '2025-10-20 08:05:00', 1),  -- Nequi
(3, 160000.00, 'PSE-20251021-002', '2025-10-21 08:35:00', 2), -- PSE
(1, 66000.00, 'TC-20251022-003', '2025-10-22 09:05:00', 3),   -- Tarjeta Crédito
(7, 32500.00, 'DAV-20251025-004', '2025-10-25 10:05:00', 4);  -- Daviplata

-- ============= COMPRA DE PRODUCTOS =============

INSERT INTO Comp_Produc (ID_Compra, ID_Producto, Cant, Valor) VALUES 
-- Compra 1
(1, 1, 5, 17500.00),   -- 5 kg Tomate
(1, 2, 3, 7500.00),    -- 3 kg Cebolla
(1, 4, 2, 4000.00),    -- 2 Lechugas

-- Compra 2
(2, 7, 10, 70000.00),  -- 10 kg Frijol
(2, 8, 20, 90000.00),  -- 20 kg Arroz

-- Compra 3
(3, 3, 10, 40000.00),  -- 10 kg Papa
(3, 5, 5, 14000.00),   -- 5 kg Zanahoria
(3, 6, 4, 12000.00),   -- 4 Aguacates

-- Compra 4
(4, 9, 5, 32500.00);   -- 5 kg Lenteja

-- ============= COMENTARIOS (SIN estrellas) =============

INSERT INTO Comentarios (ID_Comp_Produc, ID_Usuario, Comentario) VALUES 
(1, 2, 'Excelente calidad, tomates muy frescos. Los recomiendo totalmente.'),
(2, 2, 'La cebolla llegó en buen estado, aunque esperaba que fuera un poco más grande.'),
(3, 2, 'Las lechugas estaban perfectas, muy frescas y crujientes.'),
(4, 3, 'Frijol de muy buena calidad, bien limpio y sin piedras. Definitivamente volveré a comprar.'),
(5, 3, 'El arroz es de buena calidad, aunque el precio me pareció un poco elevado.'),
(6, 4, 'Las papas criollas están deliciosas, ideales para freír.'),
(7, 4, 'Zanahorias frescas y dulces, perfectas para ensaladas.');

-- ============= INGRESOS DE INVENTARIO =============

INSERT INTO Ingresos (Fecha, ID_Usuario, Obser) VALUES 
('2025-10-01 08:00:00', 1, 'Ingreso inicial de inventario'),
('2025-10-15 09:00:00', 1, 'Reposición de granos'),
('2025-10-20 10:00:00', 1, 'Ingreso de verduras frescas');

-- ============= PRODUCTOS EN INGRESOS =============

INSERT INTO Ingres_Produc (ID_Producto, ID_Ingreso, cant) VALUES 
-- Ingreso 1 (Admin - Inicial)
(1, 1, 100), (2, 1, 80), (3, 1, 150), (4, 1, 60), (5, 1, 90), (6, 1, 50),

-- Ingreso 2 (Admin - Granos)
(7, 2, 200), (8, 2, 300), (9, 2, 150), (10, 2, 100),

-- Ingreso 3 (Admin - Reposición)
(1, 3, 50), (4, 3, 30);

-- ============= CARRITOS DE COMPRAS ACTIVOS =============

INSERT INTO Carrito (ID_Usuario, ID_Producto, Cantidad, Fecha_Agre) VALUES 
-- Carrito de Laura
(4, 1, 3, '2025-10-26 15:30:00'),  -- 3 kg de Tomate
(4, 7, 5, '2025-10-26 15:32:00'),  -- 5 kg de Frijol

-- Carrito de Juan
(5, 8, 10, '2025-10-27 10:00:00'), -- 10 kg de Arroz
(5, 9, 2, '2025-10-27 10:05:00'),  -- 2 kg de Lenteja
(5, 3, 5, '2025-10-27 10:10:00');  -- 5 kg de Papa

-- =====================================================
-- CONSULTAS DE VERIFICACIÓN
-- =====================================================

-- Ver todos los usuarios con sus roles
SELECT 
    u.ID_Usuario,
    u.NomUsu,
    u.apell1,
    u.NumDoc,
    r.Nom_Rol,
    LEFT(u.Password, 10) as Hash_Prefix
FROM Usuario u
LEFT JOIN Rol_Usuario ru ON u.ID_Usuario = ru.ID_Usuario
LEFT JOIN Rol r ON ru.ID_Rol = r.Id_Rol
ORDER BY u.ID_Usuario;

-- Ver productos disponibles
SELECT 
    p.ID_Producto,
    p.NomProd as Producto,
    p.Valor as Precio,
    p.Cant as Stock,
    um.Tip_Medida as Unidad
FROM Producto p
JOIN Unidad_Medida um ON p.ID_Medida = um.Id_Medida
ORDER BY p.NomProd;

-- Ver pedidos con sus estados
SELECT 
    ped.ID_Pedido,
    u.NomUsu as Cliente,
    ped.FeHor_Ped as Fecha_Pedido,
    e.estado as Estado,
    c.total as Total
FROM Pedidos ped
JOIN Usuario u ON ped.ID_Usuario = u.ID_Usuario
JOIN Estado e ON ped.ID_Estado = e.ID_Estado
LEFT JOIN Compra c ON c.ID_Pedido = ped.ID_Pedido
ORDER BY ped.ID_Pedido;

-- Ver comentarios de productos
SELECT 
    p.NomProd as Producto,
    u.NomUsu as Cliente,
    com.Comentario,
    com.Fecha_Comentario
FROM Comentarios com
JOIN Comp_Produc cp ON com.ID_Comp_Produc = cp.ID_Com_Produc
JOIN Producto p ON cp.ID_Producto = p.ID_Producto
JOIN Usuario u ON com.ID_Usuario = u.ID_Usuario
ORDER BY com.Fecha_Comentario DESC;

-- =====================================================
-- INFORMACIÓN IMPORTANTE
-- =====================================================

/*
CAMBIOS EN ESTA VERSIÓN:

1. ELIMINADO ROL DE VENDEDOR
   - Solo existen 2 roles: Cliente y Administrador
   - Todos los usuarios antiguos "vendedores" ahora son clientes

2. ELIMINADA TABLA TIENDA
   - Los productos ya NO tienen asociación a tiendas
   - Productos son gestionados directamente por Admin
   - Campo ID_Tienda eliminado de la tabla Producto

3. CAMBIADO CALIFICACIONES POR COMENTARIOS
   - Tabla "calificaciones_produc" reemplazada por "Comentarios"
   - Eliminado campo "Estrellas" (sistema de rating)
   - Solo se permiten comentarios de texto
   - Mantiene relación con Comp_Produc y Usuario

CREDENCIALES DE PRUEBA:

ADMINISTRADOR:
- NumDoc: 22222222
- Password: admin123
- Gestiona productos e inventario

CLIENTES:
- Ana: 55555555 / 1234
- Pedro: 66666666 / 1234
- Laura: 77777777 / 1234
- Juan: 11111111 / 1234
- María: 33333333 / 1234
- Carlos: 44444444 / 1234

NOTAS:
- Todas las contraseñas están encriptadas con BCrypt
- Los comentarios NO tienen sistema de estrellas
- Los productos son comunes para todos los clientes
- La gestión de inventario la hace el Admin
*/

-- Fin del script
