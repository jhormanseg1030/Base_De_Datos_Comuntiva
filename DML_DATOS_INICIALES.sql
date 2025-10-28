-- =====================================================
-- DATOS INICIALES PARA COMUCTIVA
-- Este archivo contiene los datos base necesarios 
-- para el funcionamiento del sistema
-- =====================================================

USE Comuctiva;

-- =====================================================
-- 1. TIPOS DE DOCUMENTO
-- =====================================================
INSERT INTO Tip_Doc (ID_TipDocu, Tipo) VALUES
(1, 'Cedula de Ciudadania'),
(2, 'Pasaporte'),
(3, 'Tarjeta de Identidad'),
(4, 'Cedula de Extranjeria');

-- =====================================================
-- 2. ROLES DEL SISTEMA
-- =====================================================
INSERT INTO Rol (Id_Rol, Nom_Rol) VALUES
(1, 'Administrador'),
(2, 'Cliente');

-- =====================================================
-- 3. USUARIOS DE PRUEBA
-- Contraseñas encriptadas con BCrypt:
-- - Admin: admin123
-- - Ana: 1234
-- - Pedro: 1234
-- =====================================================

-- Usuario Administrador
INSERT INTO Usuario (ID_Usuario, NomUsu, apell1, apell2, tel1, tel2, ID_TipDocu, correo, NumDoc, Password) VALUES
(1, 'Admin', 'Sistema', 'Principal', 3001111111, 3009999999, 1, 'admin@comuctiva.com', 22222222, '$2a$10$DowJonesVSTRW0FVz15d9uKLCqH3JsZ.PWypayRII0f.YqK5E9WFG');

-- Usuarios Cliente de Prueba
INSERT INTO Usuario (ID_Usuario, NomUsu, apell1, apell2, tel1, tel2, ID_TipDocu, correo, NumDoc, Password) VALUES
(2, 'Ana', 'Rodríguez', 'Sánchez', 3004444444, 3006666666, 1, 'ana@cliente.com', 55555555, '$2a$10$DowJonesVSTRW0FVz15d9uKLCqH3JsZ.PWypayRII0f.YqK5E9WFG'),
(3, 'Pedro', 'López', 'González', 3005555555, 3005555555, 1, 'pedro@cliente.com', 66666666, '$2a$10$DowJonesVSTRW0FVz15d9uKLCqH3JsZ.PWypayRII0f.YqK5E9WFG');

-- =====================================================
-- 4. ASIGNACIÓN DE ROLES A USUARIOS
-- =====================================================

-- Admin con rol Administrador
INSERT INTO Rol_Usuario (ID_Rol, ID_Usuario, Estado) VALUES
(1, 1, 1);

-- Ana con rol Cliente
INSERT INTO Rol_Usuario (ID_Rol, ID_Usuario, Estado) VALUES
(2, 2, 1);

-- Pedro con rol Cliente
INSERT INTO Rol_Usuario (ID_Rol, ID_Usuario, Estado) VALUES
(2, 3, 1);

-- =====================================================
-- 5. UNIDADES DE MEDIDA
-- =====================================================
INSERT INTO Unidad_Medida (Id_Medida, Tip_Medida) VALUES
(1, 'Kilogramo'),
(2, 'Gramo'),
(3, 'Libra'),
(4, 'Unidad'),
(5, 'Litro'),
(6, 'Mililitro');

-- =====================================================
-- 6. TIPOS DE VÍAS
-- =====================================================
INSERT INTO Vias (Id_Vias, Tipo) VALUES
(1, 'Calle'),
(2, 'Carrera'),
(3, 'Avenida'),
(4, 'Transversal'),
(5, 'Diagonal'),
(6, 'Circular');

-- =====================================================
-- 7. TIPOS DE PAGO
-- =====================================================
INSERT INTO Tipo_De_Pago (Id_TiPago, Tipos) VALUES
(1, 'Efectivo'),
(2, 'Tarjeta Débito'),
(3, 'Tarjeta Crédito'),
(4, 'Transferencia'),
(5, 'PSE');

-- =====================================================
-- 8. ESTADOS DE PEDIDOS
-- =====================================================
INSERT INTO Estado (ID_Estado, estado) VALUES
(1, 'Pendiente'),
(2, 'En Proceso'),
(3, 'En Camino'),
(4, 'Entregado'),
(5, 'Cancelado');

-- =====================================================
-- 9. OBSERVACIONES
-- =====================================================
INSERT INTO Obser (ID_Obser, Obser) VALUES
(1, 'Sin observaciones'),
(2, 'Entrega urgente'),
(3, 'Llamar antes de entregar'),
(4, 'Dejar con portería'),
(5, 'Cliente no responde');

-- =====================================================
-- 10. BARRIOS Y VEREDAS (Clasificación)
-- =====================================================
INSERT INTO Barr_Vere (ID_Barr_Vere, Nombre) VALUES
(1, 'Barrio'),
(2, 'Vereda');

-- =====================================================
-- 11. DEPARTAMENTOS (Algunos principales)
-- =====================================================
INSERT INTO Dep (ID_Dep, Nom) VALUES
(5, 'Antioquia'),
(8, 'Atlántico'),
(11, 'Bogotá D.C.'),
(13, 'Bolívar'),
(15, 'Boyacá'),
(17, 'Caldas'),
(19, 'Cauca'),
(23, 'Córdoba'),
(25, 'Cundinamarca'),
(27, 'Chocó'),
(41, 'Huila'),
(44, 'La Guajira'),
(47, 'Magdalena'),
(50, 'Meta'),
(52, 'Nariño'),
(54, 'Norte de Santander'),
(63, 'Quindío'),
(66, 'Risaralda'),
(68, 'Santander'),
(70, 'Sucre'),
(73, 'Tolima'),
(76, 'Valle del Cauca');

-- =====================================================
-- 12. MUNICIPIOS (Algunos principales)
-- =====================================================
INSERT INTO Muni (ID_Muni, Nom, ID_Dep) VALUES
(5001, 'Medellín', 5),
(5002, 'Envigado', 5),
(5308, 'Itagüí', 5),
(8001, 'Barranquilla', 8),
(11001, 'Bogotá D.C.', 11),
(13001, 'Cartagena', 13),
(76001, 'Cali', 76),
(76834, 'Tuluá', 76),
(68001, 'Bucaramanga', 68);

-- =====================================================
-- 13. BARRIOS EJEMPLO
-- =====================================================
INSERT INTO Barrio (ID_Barrio, ID_Barr_Vere, Nom, ID_Muni) VALUES
(1, 1, 'El Poblado', 5001),
(2, 1, 'Laureles', 5001),
(3, 1, 'Envigado Centro', 5002),
(4, 1, 'Chapinero', 11001),
(5, 1, 'Usaquén', 11001);

-- =====================================================
-- 14. TRANSPORTADORAS
-- =====================================================
INSERT INTO Transportadora (Id_Transpor, NombreT, Logo, Telefono, Correo, Direcc, Sitio_Web) VALUES
(1, 'Servientrega', 'servientrega.png', '018000112345', 'info@servientrega.com', 'Calle 100 # 10-20', 'www.servientrega.com'),
(2, 'Coordinadora', 'coordinadora.png', '018000223456', 'info@coordinadora.com', 'Carrera 50 # 20-30', 'www.coordinadora.com'),
(3, 'Deprisa', 'deprisa.png', 'deprisa@deprisa.com', '018000334567', 'Avenida 80 # 30-40', 'www.deprisa.com');

-- =====================================================
-- NOTAS IMPORTANTES:
-- =====================================================
-- 1. Las contraseñas están encriptadas con BCrypt
-- 2. El DataLoader de Spring Boot actualiza automáticamente
--    la contraseña del Admin si ya existe
-- 3. El constraint UNIQUE (ID_TipDocu, NumDoc) previene duplicados
-- 4. Los roles se crean si no existen en el DataLoader
-- 5. Estos datos son de PRUEBA y deben actualizarse en producción
-- =====================================================
