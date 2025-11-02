-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-10-2025 a las 22:50:06
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `comuctiva`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barrio`
--

CREATE TABLE `barrio` (
  `ID_Barrio` int(10) NOT NULL,
  `ID_Barr_Vere` int(10) DEFAULT NULL,
  `Nom` varchar(50) NOT NULL,
  `ID_Muni` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `barrio`
--

INSERT INTO `barrio` (`ID_Barrio`, `ID_Barr_Vere`, `Nom`, `ID_Muni`) VALUES
(1, 1, 'Centro', 25162),
(2, 1, 'La Balsa', 25162),
(3, 1, 'Fonquet??', 25162),
(4, 1, 'San Cayetano', 25151),
(5, 1, 'Capellan??a', 25151),
(6, 2, 'Vereda La Caro', 25295),
(7, 3, 'Sector Industrial', 25479);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barr_vere`
--

CREATE TABLE `barr_vere` (
  `ID_Barr_Vere` int(10) NOT NULL,
  `Nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `barr_vere`
--

INSERT INTO `barr_vere` (`ID_Barr_Vere`, `Nombre`) VALUES
(1, 'Barrio'),
(2, 'Vereda'),
(3, 'Sector');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `ID_Carrito` int(10) NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  `cantidad` varchar(10) DEFAULT NULL,
  `Fecha_Agre` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`ID_Carrito`, `ID_Usuario`, `cantidad`, `Fecha_Agre`) VALUES
(1, 8, '3', '2025-10-26 20:30:00'),
(2, 8, '5', '2025-10-26 20:32:00'),
(3, 9, '10', '2025-10-27 15:00:00'),
(4, 9, '2', '2025-10-27 15:05:00'),
(5, 10, '5', '2025-10-27 15:10:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `ID_Comentario` int(10) NOT NULL,
  `ID_Comp_Produc` int(10) NOT NULL,
  `ID_Usuario` int(10) NOT NULL,
  `Comentario` text NOT NULL,
  `Fecha_Comentario` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_compra` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`ID_Comentario`, `ID_Comp_Produc`, `ID_Usuario`, `Comentario`, `Fecha_Comentario`, `id_compra`, `id_producto`) VALUES
(1, 1, 8, 'Excelente calidad, tomates muy frescos. Los recomiendo totalmente.', '2025-10-28 20:40:52', 0, 0),
(2, 2, 8, 'La cebolla lleg?? en buen estado, aunque esperaba que fuera un poco m??s grande.', '2025-10-28 20:40:52', 0, 0),
(3, 3, 8, 'Las lechugas estaban perfectas, muy frescas y crujientes.', '2025-10-28 20:40:52', 0, 0),
(4, 4, 9, 'Frijol de muy buena calidad, bien limpio y sin piedras. Definitivamente volver?? a comprar.', '2025-10-28 20:40:52', 0, 0),
(5, 5, 9, 'El arroz es de buena calidad, aunque el precio me pareci?? un poco elevado.', '2025-10-28 20:40:52', 0, 0),
(6, 6, 10, 'Las papas criollas est??n deliciosas, ideales para fre??r.', '2025-10-28 20:40:52', 0, 0),
(7, 7, 10, 'Zanahorias frescas y dulces, perfectas para ensaladas.', '2025-10-28 20:40:52', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `Id_Compra` int(10) NOT NULL,
  `ID_TiPago` int(10) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `Ref_Pago` varchar(30) NOT NULL,
  `Fec_com` datetime NOT NULL,
  `ID_Pedido` int(10) DEFAULT NULL,
  `id_ti_pago` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`Id_Compra`, `ID_TiPago`, `total`, `Ref_Pago`, `Fec_com`, `ID_Pedido`, `id_ti_pago`) VALUES
(1, 6, 28500, 'NEQ-20251020-001', '2025-10-20 08:05:00', 1, 0),
(2, 3, 160000, 'PSE-20251021-002', '2025-10-21 08:35:00', 2, 0),
(3, 1, 66000, 'TC-20251022-003', '2025-10-22 09:05:00', 3, 0),
(4, 7, 32500, 'DAV-20251025-004', '2025-10-25 10:05:00', 4, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comp_produc`
--

CREATE TABLE `comp_produc` (
  `ID_Com_Produc` int(10) NOT NULL,
  `ID_Compra` int(10) DEFAULT NULL,
  `ID_Producto` int(10) DEFAULT NULL,
  `cant` smallint(6) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `compra_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `fecha_asignacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comp_produc`
--

INSERT INTO `comp_produc` (`ID_Com_Produc`, `ID_Compra`, `ID_Producto`, `cant`, `valor`, `compra_id`, `producto_id`, `fecha_asignacion`) VALUES
(1, 1, 1, 5, 17500, 0, 0, NULL),
(2, 1, 2, 3, 7500, 0, 0, NULL),
(3, 1, 4, 2, 4000, 0, 0, NULL),
(4, 2, 7, 10, 70000, 0, 0, NULL),
(5, 2, 8, 20, 90000, 0, 0, NULL),
(6, 3, 3, 10, 40000, 0, 0, NULL),
(7, 3, 5, 5, 14000, 0, 0, NULL),
(8, 3, 6, 4, 12000, 0, 0, NULL),
(9, 4, 9, 5, 32500, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dep`
--

CREATE TABLE `dep` (
  `ID_Dep` int(10) NOT NULL,
  `Nom` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `dep`
--

INSERT INTO `dep` (`ID_Dep`, `Nom`) VALUES
(11, 'Bogot??, D.C.'),
(25, 'Cundinamarca');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `id_dep` int(11) NOT NULL,
  `nom_dep` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descuento`
--

CREATE TABLE `descuento` (
  `id_descu` int(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `fech_des` datetime(6) DEFAULT NULL,
  `valor` decimal(38,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descuentos`
--

CREATE TABLE `descuentos` (
  `ID_Descu` int(10) NOT NULL,
  `Descripcion` varchar(50) NOT NULL,
  `Fec_Des` datetime NOT NULL,
  `Valor` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `descuentos`
--

INSERT INTO `descuentos` (`ID_Descu`, `Descripcion`, `Fec_Des`, `Valor`) VALUES
(1, 'Descuento Inauguraci??n', '2025-01-15 00:00:00', 10.00),
(2, 'Promoci??n San Valent??n', '2025-02-14 00:00:00', 15.00),
(3, 'Black Friday', '2025-11-29 00:00:00', 25.00),
(4, 'Descuento Mayorista', '2025-12-31 23:59:59', 20.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direcciones`
--

CREATE TABLE `direcciones` (
  `ID_Direcc` int(10) NOT NULL,
  `ID_Vias` int(10) DEFAULT NULL,
  `num` varchar(10) NOT NULL,
  `comple` varchar(50) NOT NULL,
  `Ubi_Geo` varchar(20) NOT NULL,
  `ID_Usuario` int(10) DEFAULT NULL,
  `ID_Barrio` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `direcciones`
--

INSERT INTO `direcciones` (`ID_Direcc`, `ID_Vias`, `num`, `comple`, `Ubi_Geo`, `ID_Usuario`, `ID_Barrio`) VALUES
(1, 2, '45', '23-15 Apto 501', '4.7110,-74.0721', 8, 1),
(2, 1, '72', '10-34 Casa 3', '4.8580,-74.0375', 9, 2),
(3, 3, '127', '45-67 Local 2', '4.9250,-74.0315', 10, 3),
(4, 2, '80', '12-45', '4.9180,-74.0307',11, 4),
(5, 1, '50', '23-10', '4.9190,-74.0350',12, 5),
(6, 2, '90', '15-20', '4.9200,-74.0360',13, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `ID_Estado` int(11) NOT NULL,
  `estado` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`ID_Estado`, `estado`) VALUES
(1, 'En espera'),
(2, 'En proceso'),
(3, 'Enviado'),
(4, 'Entregado'),
(5, 'Cancelado'),
(6, 'Cerrado'),
(7, 'Devuelto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guia_de_envio`
--

CREATE TABLE `guia_de_envio` (
  `ID_Guia` int(10) NOT NULL,
  `ID_Transpor` int(10) DEFAULT NULL,
  `Fec_Env` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ID_Obser` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `guia_de_envio`
--

INSERT INTO `guia_de_envio` (`ID_Guia`, `ID_Transpor`, `Fec_Env`, `ID_Obser`) VALUES
(1, 1, '2025-10-20 13:30:00', 3),
(2, 2, '2025-10-21 14:00:00', 5),
(3, 1, '2025-10-22 15:15:00', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guia_envio`
--

CREATE TABLE `guia_envio` (
  `id_guia` int(11) NOT NULL,
  `fec_env` varchar(50) DEFAULT NULL,
  `id_obser` int(11) NOT NULL,
  `id_transpor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos`
--

CREATE TABLE `ingresos` (
  `ID_Ingreso` int(10) NOT NULL,
  `Fecha` datetime DEFAULT NULL,
  `ID_Usuario` int(10) DEFAULT NULL,
  `Obser` varchar(50) DEFAULT NULL,
  `orbser` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingres_produc`
--

CREATE TABLE `ingres_produc` (
  `ID_Producto` int(10) NOT NULL,
  `ID_Ingreso` int(10) NOT NULL,
  `cant` smallint(6) DEFAULT NULL,
  `ingreso_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ingres_produc`
--

INSERT INTO `ingres_produc` (`ID_Producto`, `ID_Ingreso`, `cant`, `ingreso_id`, `producto_id`) VALUES
(1, 1, 100, 0, 0),
(1, 3, 50, 0, 0),
(2, 1, 80, 0, 0),
(3, 1, 150, 0, 0),
(4, 1, 60, 0, 0),
(4, 3, 30, 0, 0),
(5, 1, 90, 0, 0),
(6, 1, 50, 0, 0),
(7, 2, 200, 0, 0),
(8, 2, 300, 0, 0),
(9, 2, 150, 0, 0),
(10, 2, 100, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `muni`
--

CREATE TABLE `muni` (
  `ID_Muni` int(10) NOT NULL,
  `nom` varchar(30) DEFAULT NULL,
  `ID_Dep` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `muni`
--

INSERT INTO `muni` (`ID_Muni`, `nom`, `ID_Dep`) VALUES
(25151, 'CAJIC??', 25),
(25162, 'CHIA', 25),
(25200, 'COTA', 25),
(25284, 'FACATATIV??', 25),
(25295, 'FUNZA', 25),
(25390, 'LA CALERA', 25),
(25425, 'MADRID', 25),
(25479, 'MOSQUERA', 25),
(25740, 'SIBAT??', 25),
(25756, 'SOACHA', 25),
(25758, 'SOP??', 25),
(25785, 'TABIO', 25),
(25791, 'SUBACHOQUE', 25),
(25808, 'TENJO', 25),
(25897, 'ZIPAQUIR??', 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `obser`
--

CREATE TABLE `obser` (
  `ID_Obser` int(11) NOT NULL,
  `Obser` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `obser`
--

INSERT INTO `obser` (`ID_Obser`, `Obser`) VALUES
(1, 'Delicado'),
(2, 'Peligro'),
(3, 'Fragil'),
(4, 'Ligero'),
(5, 'Pesado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `ID_Pedido` int(10) NOT NULL,
  `ID_Usuario` int(10) DEFAULT NULL,
  `FeHor_Ped` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ID_Estado` int(10) DEFAULT NULL,
  `ID_Guia` int(10) DEFAULT NULL,
  `fehor_pedi` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`ID_Pedido`, `ID_Usuario`, `FeHor_Ped`, `ID_Estado`, `ID_Guia`, `fehor_pedi`) VALUES
(1, 8, '2025-10-20 13:00:00', 4, 1, NULL),
(2, 9, '2025-10-21 13:30:00', 3, 2, NULL),
(3, 10, '2025-10-22 14:00:00', 2, 3, NULL),
(4, 11, '2025-10-25 15:00:00', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedi_produc`
--

CREATE TABLE `pedi_produc` (
  `ID_Producto` int(10) NOT NULL,
  `ID_Pedido` int(10) NOT NULL,
  `cant` smallint(6) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `pedidos_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedi_produc`
--

INSERT INTO `pedi_produc` (`ID_Producto`, `ID_Pedido`, `cant`, `valor`, `pedidos_id`, `producto_id`) VALUES
(1, 1, 5, 3500, 0, 0),
(2, 1, 3, 2500, 0, 0),
(3, 3, 10, 4000, 0, 0),
(4, 1, 2, 2000, 0, 0),
(5, 3, 5, 2800, 0, 0),
(6, 3, 4, 3000, 0, 0),
(7, 2, 10, 7000, 0, 0),
(8, 2, 20, 4500, 0, 0),
(9, 4, 5, 6500, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `ID_Producto` int(10) NOT NULL,
  `ID_Medida` int(10) DEFAULT NULL,
  `nomprod` varchar(255) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `cant` smallint(6) DEFAULT NULL,
  `imagen` varchar(50) NOT NULL,
  `Descrip` varchar(50) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`ID_Producto`, `ID_Medida`, `nomprod`, `valor`, `cant`, `imagen`, `Descrip`, `categoria`) VALUES
(1, 2, 'Tomate Chonto', 3500, 100, 'tomate.jpg', 'Tomate fresco de la regi??n', NULL),
(2, 2, 'Cebolla Cabezona', 2500, 80, 'cebolla.jpg', 'Cebolla de primera calidad', NULL),
(3, 2, 'Papa Criolla', 4000, 150, 'papa.jpg', 'Papa criolla seleccionada', NULL),
(4, 4, 'Lechuga Crespa', 2000, 60, 'lechuga.jpg', 'Lechuga fresca', NULL),
(5, 2, 'Zanahoria', 2800, 90, 'zanahoria.jpg', 'Zanahoria fresca', NULL),
(6, 4, 'Aguacate Hass', 3000, 50, 'aguacate.jpg', 'Aguacate Hass grande', NULL),
(7, 2, 'Frijol Rojo', 7000, 200, 'frijol.jpg', 'Frijol rojo de primera', NULL),
(8, 2, 'Arroz Blanco', 4500, 300, 'arroz.jpg', 'Arroz de alta calidad', NULL),
(9, 2, 'Lenteja', 6500, 150, 'lenteja.jpg', 'Lenteja importada', NULL),
(10, 2, 'Garbanzo', 8000, 100, 'garbanzo.jpg', 'Garbanzo premium', NULL),
(11, 3, 'Arroz Bulto 50kg', 120000, 30, 'arroz_bulto.jpg', 'Bulto de arroz 50kg', NULL),
(12, 5, 'Leche Entera', 3200, 80, 'leche.jpg', 'Leche fresca entera', NULL),
(13, 4, 'Queso Campesino', 15000, 40, 'queso.jpg', 'Queso campesino artesanal', NULL),
(14, 4, 'Yogurt Natural', 4500, 60, 'yogurt.jpg', 'Yogurt natural sin az??car', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `produc_carri`
--

CREATE TABLE `produc_carri` (
  `nomprod` varchar(255) DEFAULT NULL,
  `carrito_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `produc_desc`
--

CREATE TABLE `produc_desc` (
  `ID_Producto` int(10) NOT NULL,
  `ID_Descu` int(10) NOT NULL,
  `descuentos_id` int(11) NOT NULL,
  `productos_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `produc_desc`
--

INSERT INTO `produc_desc` (`ID_Producto`, `ID_Descu`, `descuentos_id`, `productos_id`) VALUES
(1, 1, 0, 0),
(2, 1, 0, 0),
(7, 4, 0, 0),
(8, 4, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `Id_Rol` int(10) NOT NULL,
  `Nom_Rol` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`Id_Rol`, `Nom_Rol`) VALUES
(1, 'Cliente'),
(2, 'Administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_usuario`
--

CREATE TABLE `rol_usuario` (
  `ID_Rol` int(10) NOT NULL,
  `ID_Usuario` int(10) NOT NULL,
  `estado` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol_usuario`
--

INSERT INTO `rol_usuario` (`ID_Rol`, `ID_Usuario`, `estado`) VALUES
(1, 8, b'1'),
(1, 9, b'1'),
(1, 10, b'1'),
(1, 11, b'1'),
(1, 12, b'1'),
(1, 13, b'1'),
(2, 1, b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_de_pago`
--

CREATE TABLE `tipo_de_pago` (
  `Id_TiPago` int(10) NOT NULL,
  `Tipos` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_de_pago`
--

INSERT INTO `tipo_de_pago` (`Id_TiPago`, `Tipos`) VALUES
(1, 'Tarjeta de Credito'),
(2, 'Tarjeta de Debito'),
(3, 'PSE'),
(4, 'Efectivo'),
(5, 'PayPal'),
(6, 'Nequi'),
(7, 'Daviplata');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tip_doc`
--

CREATE TABLE `tip_doc` (
  `ID_TipDocu` tinyint(3) NOT NULL,
  `Tipo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tip_doc`
--

INSERT INTO `tip_doc` (`ID_TipDocu`, `Tipo`) VALUES
(1, 'Cedula de Ciudadania'),
(2, 'Pasaporte'),
(3, 'Tarjeta de Identidad'),
(4, 'Cedula de Extranjeria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transportadora`
--

CREATE TABLE `transportadora` (
  `Id_Transpor` int(10) NOT NULL,
  `NombreT` varchar(30) NOT NULL,
  `Logo` varchar(30) NOT NULL,
  `telefono` bigint(20) NOT NULL,
  `Correo` varchar(50) NOT NULL,
  `Direcc` varchar(50) NOT NULL,
  `Sitio_Web` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `transportadora`
--

INSERT INTO `transportadora` (`Id_Transpor`, `NombreT`, `Logo`, `telefono`, `Correo`, `Direcc`, `Sitio_Web`) VALUES
(1, 'Servientrega', 'servientrega.png', 6016000000, 'info@servientrega.com', 'Calle 100 #10-20', 'www.servientrega.com'),
(2, 'Coordinadora', 'coordinadora.png', 6017000000, 'info@coordinadora.com', 'Av. 68 #45-30', 'www.coordinadora.com'),
(3, 'Deprisa', 'deprisa.png', 6018000000, 'contacto@deprisa.com', 'Cra 50 #12-34', 'www.deprisa.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad_medida`
--

CREATE TABLE `unidad_medida` (
  `Id_Medida` int(10) NOT NULL,
  `Tip_Medida` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `unidad_medida`
--

INSERT INTO `unidad_medida` (`Id_Medida`, `Tip_Medida`) VALUES
(1, 'Libra'),
(2, 'Kilo'),
(3, 'Bulto'),
(4, 'Unidad'),
(5, 'Litro'),
(6, 'Gramo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ID_Usuario` int(10) NOT NULL,
  `NomUsu` varchar(50) NOT NULL,
  `apell1` varchar(50) NOT NULL,
  `apell2` varchar(50) DEFAULT NULL,
  `tel1` decimal(20,0) NOT NULL,
  `tel2` bigint(20) NOT NULL,
  `ID_TipDocu` tinyint(3) DEFAULT NULL,
  `correo` varchar(50) NOT NULL,
  `NumDoc` varchar(20) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `nom_usu` varchar(50) DEFAULT NULL,
  `num_doc` bigint(20) DEFAULT NULL,
  `tel` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`ID_Usuario`, `NomUsu`, `apell1`, `apell2`, `tel1`, `tel2`, `ID_TipDocu`, `correo`, `NumDoc`, `password`, `nom_usu`, `num_doc`, `tel`) VALUES
(1, 'Admin', 'Sistema', 'Principal', 3001111111, 3009999999, 1, 'admin@comuctiva.com', '22222222', '$2a$10$6SQFDsaGWz0MVH9D56E8T.5kOIEJ4P6giVBdQO9wAagae/GhY5QpG', NULL, NULL, NULL),
(2, 'Ana', 'Rodr??guez', 'S??nchez', 3004444444, 3006666666, 1, 'ana@cliente.com', '55555555', '$2a$10$HvAot2lgMQVYzTCySPBk2OeXlHXGWsZIgIlYd1PO2PcXYX3u1OmGm', NULL, NULL, NULL),
(3, 'Pedro', 'L??pez', 'Gonz??lez', 3005555555, 3005555555, 1, 'pedro@cliente.com', '66666666', '$2a$10$rZvqmF5Y5kF6x2ZMRZoMyeIVI1lrPn9R6y4KW4ZP1ybYHYwXpGQa', NULL, NULL, NULL),
(4, 'Laura', 'Fern??ndez', 'Torres', 3006666666, 3004444444, 1, 'laura@cliente.com', '77777777', '$2a$10$rZvqmF5Y5kF6x2ZMRZoMyeIVI1lrPn9R6y4KW4ZP1ybYHYwXpGQa', NULL, NULL, NULL),
(5, 'Juan', 'P??rez', 'G??mez', 3007777777, 3003333333, 1, 'juan@cliente.com', '11111111', '$2a$10$rZvqmF5Y5kF6x2ZMRZoMyeIVI1lrPn9R6y4KW4ZP1ybYHYwXpGQa', NULL, NULL, NULL),
(6, 'Mar??a', 'Garc??a', 'L??pez', 3002222222, 3008888888, 1, 'maria@cliente.com', '33333333', '$2a$10$rZvqmF5Y5kF6x2ZMRZoMyeIVI1lrPn9R6y4KW4ZP1ybYHYwXpGQa', NULL, NULL, NULL),
(7, 'Carlos', 'Mart??nez', 'P??rez', 3003333333, 3007777777, 1, 'carlos@cliente.com', '44444444', '$2a$10$rZvqmF5Y5kF6x2ZMRZoMyeIVI1lrPn9R6y4KW4ZP1ybYHYwXpGQa', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vias`
--

CREATE TABLE `vias` (
  `Id_Vias` int(10) NOT NULL,
  `Tipo` varchar(20) NOT NULL,
  `tipos` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vias`
--

INSERT INTO `vias` (`Id_Vias`, `Tipo`, `tipos`) VALUES
(1, 'Calle', NULL),
(2, 'Carrera', NULL),
(3, 'Avenida', NULL),
(4, 'Transversal', NULL),
(5, 'Diagonal', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `barrio`
--
ALTER TABLE `barrio`
  ADD PRIMARY KEY (`ID_Barrio`),
  ADD KEY `FK_Muni` (`ID_Muni`),
  ADD KEY `FK_Barr_Vere` (`ID_Barr_Vere`);

--
-- Indices de la tabla `barr_vere`
--
ALTER TABLE `barr_vere`
  ADD PRIMARY KEY (`ID_Barr_Vere`);

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`ID_Carrito`),
  ADD KEY `FK_Carrito_Usuario` (`ID_Usuario`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`ID_Comentario`),
  ADD KEY `fk_comentario_comp_produc` (`ID_Comp_Produc`),
  ADD KEY `fk_comentario_usuario` (`ID_Usuario`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`ID_Compra`),
  ADD KEY `FK_TiPago` (`ID_TiPago`),
  ADD KEY `FK_Pedido` (`ID_Pedido`);

--
-- Indices de la tabla `comp_produc`
--
ALTER TABLE `comp_produc`
  ADD PRIMARY KEY (`ID_Com_Produc`),
  ADD KEY `FK_Compra` (`ID_Compra`),
  ADD KEY `FK_Producto` (`ID_Producto`);

--
-- Indices de la tabla `dep`
--
ALTER TABLE `dep`
  ADD PRIMARY KEY (`ID_Dep`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id_dep`);

--
-- Indices de la tabla `descuento`
--
ALTER TABLE `descuento`
  ADD PRIMARY KEY (`id_descu`);

--
-- Indices de la tabla `descuentos`
--
ALTER TABLE `descuentos`
  ADD PRIMARY KEY (`ID_Descu`);

--
-- Indices de la tabla `direcciones`
--
ALTER TABLE `direcciones`
  ADD PRIMARY KEY (`ID_Direcc`),
  ADD KEY `FK_Vias` (`ID_Vias`),
  ADD KEY `FK_Usu` (`ID_Usuario`),
  ADD KEY `FK_Barrio` (`ID_Barrio`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`ID_Estado`);

--
-- Indices de la tabla `guia_de_envio`
--
ALTER TABLE `guia_de_envio`
  ADD PRIMARY KEY (`ID_Guia`),
  ADD KEY `FK_Transportadora` (`ID_Transpor`),
  ADD KEY `FK_Obser` (`ID_Obser`);

--
-- Indices de la tabla `guia_envio`
--
ALTER TABLE `guia_envio`
  ADD PRIMARY KEY (`id_guia`),
  ADD KEY `FK_Transpor` (`id_transpor`);

--
-- Indices de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD PRIMARY KEY (`ID_Ingreso`),
  ADD KEY `FK_Usuar` (`ID_Usuario`);

--
-- Indices de la tabla `ingres_produc`
--
ALTER TABLE `ingres_produc`
  ADD PRIMARY KEY (`ID_Producto`,`ID_Ingreso`),
  ADD KEY `FK_Ingreso` (`ID_Ingreso`);

--
-- Indices de la tabla `muni`
--
ALTER TABLE `muni`
  ADD PRIMARY KEY (`ID_Muni`),
  ADD KEY `FK_Dep` (`ID_Dep`);

--
-- Indices de la tabla `obser`
--
ALTER TABLE `obser`
  ADD PRIMARY KEY (`ID_Obser`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`ID_Pedido`),
  ADD KEY `FK_Usuario` (`ID_Usuario`),
  ADD KEY `FK_Guia_de_Envio` (`ID_Guia`),
  ADD KEY `FK_Estado` (`ID_Estado`);

--
-- Indices de la tabla `pedi_produc`
--
ALTER TABLE `pedi_produc`
  ADD PRIMARY KEY (`ID_Producto`,`ID_Pedido`),
  ADD KEY `FK_Pedi` (`ID_Pedido`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`ID_Producto`),
  ADD KEY `FK_Unidad_Medida` (`ID_Medida`);

--
-- Indices de la tabla `produc_carri`
--
ALTER TABLE `produc_carri`
  ADD PRIMARY KEY (`carrito_id`,`producto_id`),
  ADD KEY `FK_producto_carrito` (`producto_id`);

--
-- Indices de la tabla `produc_desc`
--
ALTER TABLE `produc_desc`
  ADD PRIMARY KEY (`ID_Producto`,`ID_Descu`),
  ADD KEY `FK_Descuent` (`ID_Descu`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`Id_Rol`);

--
-- Indices de la tabla `rol_usuario`
--
ALTER TABLE `rol_usuario`
  ADD PRIMARY KEY (`ID_Rol`,`ID_Usuario`),
  ADD KEY `FK_Usuarios` (`ID_Usuario`);

--
-- Indices de la tabla `tipo_de_pago`
--
ALTER TABLE `tipo_de_pago`
  ADD PRIMARY KEY (`Id_TiPago`);

--
-- Indices de la tabla `tip_doc`
--
ALTER TABLE `tip_doc`
  ADD PRIMARY KEY (`ID_TipDocu`);

--
-- Indices de la tabla `transportadora`
--
ALTER TABLE `transportadora`
  ADD PRIMARY KEY (`Id_Transpor`);

--
-- Indices de la tabla `unidad_medida`
--
ALTER TABLE `unidad_medida`
  ADD PRIMARY KEY (`Id_Medida`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID_Usuario`),
  ADD UNIQUE KEY `UK_Usuario_TipDoc_NumDoc` (`ID_TipDocu`,`NumDoc`);

--
-- Indices de la tabla `vias`
--
ALTER TABLE `vias`
  ADD PRIMARY KEY (`Id_Vias`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `barrio`
--
ALTER TABLE `barrio`
  MODIFY `ID_Barrio` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `barr_vere`
--
ALTER TABLE `barr_vere`
  MODIFY `ID_Barr_Vere` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `ID_Carrito` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `ID_Comentario` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `ID_Compra` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `comp_produc`
--
ALTER TABLE `comp_produc`
  MODIFY `ID_Com_Produc` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id_dep` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `descuento`
--
ALTER TABLE `descuento`
  MODIFY `id_descu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `descuentos`
--
ALTER TABLE `descuentos`
  MODIFY `ID_Descu` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `direcciones`
--
ALTER TABLE `direcciones`
  MODIFY `ID_Direcc` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `ID_Estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `guia_de_envio`
--
ALTER TABLE `guia_de_envio`
  MODIFY `ID_Guia` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `guia_envio`
--
ALTER TABLE `guia_envio`
  MODIFY `id_guia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  MODIFY `ID_Ingreso` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `obser`
--
ALTER TABLE `obser`
  MODIFY `ID_Obser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `ID_Pedido` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `ID_Producto` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `Id_Rol` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `tipo_de_pago`
--
ALTER TABLE `tipo_de_pago`
  MODIFY `Id_TiPago` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tip_doc`
--
ALTER TABLE `tip_doc`
  MODIFY `ID_TipDocu` tinyint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `transportadora`
--
ALTER TABLE `transportadora`
  MODIFY `Id_Transpor` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `unidad_medida`
--
ALTER TABLE `unidad_medida`
  MODIFY `Id_Medida` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID_Usuario` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `vias`
--
ALTER TABLE `vias`
  MODIFY `Id_Vias` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `barrio`
--
ALTER TABLE `barrio`
  ADD CONSTRAINT `FK_Barr_Vere` FOREIGN KEY (`ID_Barr_Vere`) REFERENCES `barr_vere` (`ID_Barr_Vere`),
  ADD CONSTRAINT `FK_Muni` FOREIGN KEY (`ID_Muni`) REFERENCES `muni` (`ID_Muni`);

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `FK_Carrito_Usuario` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`);

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `fk_comentario_comp_produc` FOREIGN KEY (`ID_Comp_Produc`) REFERENCES `comp_produc` (`ID_Com_Produc`),
  ADD CONSTRAINT `fk_comentario_usuario` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`);

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `FK_Pedido` FOREIGN KEY (`ID_Pedido`) REFERENCES `pedidos` (`ID_Pedido`),
  ADD CONSTRAINT `FK_TiPago` FOREIGN KEY (`ID_TiPago`) REFERENCES `tipo_de_pago` (`Id_TiPago`);

--
-- Filtros para la tabla `comp_produc`
--
ALTER TABLE `comp_produc`
  ADD CONSTRAINT `FK_Compra` FOREIGN KEY (`ID_Compra`) REFERENCES `compra` (`ID_Compra`),
  ADD CONSTRAINT `FK_Producto` FOREIGN KEY (`ID_Producto`) REFERENCES `producto` (`ID_Producto`);

--
-- Filtros para la tabla `direcciones`
--
ALTER TABLE `direcciones`
  ADD CONSTRAINT `FK_Barrio` FOREIGN KEY (`ID_Barrio`) REFERENCES `barrio` (`ID_Barrio`),
  ADD CONSTRAINT `FK_Usu` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`),
  ADD CONSTRAINT `FK_Vias` FOREIGN KEY (`ID_Vias`) REFERENCES `vias` (`Id_Vias`);

--
-- Filtros para la tabla `guia_de_envio`
--
ALTER TABLE `guia_de_envio`
  ADD CONSTRAINT `FK_Obser` FOREIGN KEY (`ID_Obser`) REFERENCES `obser` (`ID_Obser`),
  ADD CONSTRAINT `FK_Transportadora` FOREIGN KEY (`ID_Transpor`) REFERENCES `transportadora` (`Id_Transpor`);

--
-- Filtros para la tabla `guia_envio`
--
ALTER TABLE `guia_envio`
  ADD CONSTRAINT `FK_Transpor` FOREIGN KEY (`id_transpor`) REFERENCES `transportadora` (`Id_Transpor`);

--
-- Filtros para la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD CONSTRAINT `FK_Usuar` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`);

--
-- Filtros para la tabla `muni`
--
ALTER TABLE `muni`
  ADD CONSTRAINT `FK_Dep` FOREIGN KEY (`ID_Dep`) REFERENCES `dep` (`ID_Dep`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
