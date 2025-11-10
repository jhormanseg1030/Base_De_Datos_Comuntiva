-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-11-2025 a las 18:55:17
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
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`ID_Carrito`, `ID_Usuario`, `fecha_creacion`) VALUES
(1, 2, '2025-11-04 00:32:22'),
(2, 2, '2025-11-04 00:32:22'),
(3, 3, '2025-11-04 00:32:22'),
(4, 4, '2025-11-04 00:32:22'),
(5, 5, '2025-11-04 00:32:22'),
(6, 6, '2025-11-04 02:45:47');

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
(1, 1, 2, 'Excelente calidad, tomates muy frescos. Los recomiendo totalmente.', '2025-10-28 20:40:52', 0, 0),
(2, 2, 2, 'La cebolla lleg?? en buen estado, aunque esperaba que fuera un poco m??s grande.', '2025-10-28 20:40:52', 0, 0),
(3, 3, 2, 'Las lechugas estaban perfectas, muy frescas y crujientes.', '2025-10-28 20:40:52', 0, 0),
(4, 4, 3, 'Frijol de muy buena calidad, bien limpio y sin piedras. Definitivamente volver?? a comprar.', '2025-10-28 20:40:52', 0, 0),
(5, 5, 3, 'El arroz es de buena calidad, aunque el precio me pareci?? un poco elevado.', '2025-10-28 20:40:52', 0, 0),
(6, 6, 4, 'Las papas criollas est??n deliciosas, ideales para fre??r.', '2025-10-28 20:40:52', 0, 0),
(7, 7, 5, 'Zanahorias frescas y dulces, perfectas para ensaladas.', '2025-10-28 20:40:52', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `ID_Compra` int(10) NOT NULL,
  `ID_TiPago` int(10) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `Ref_Pago` varchar(30) NOT NULL,
  `Fec_com` datetime NOT NULL,
  `ID_Pedido` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`ID_Compra`, `ID_TiPago`, `total`, `Ref_Pago`, `Fec_com`, `ID_Pedido`) VALUES
(1, 6, 28500, 'NEQ-20251020-001', '2025-10-20 08:05:00', 1),
(2, 3, 160000, 'PSE-20251021-002', '2025-10-21 08:35:00', 2),
(3, 1, 66000, 'TC-20251022-003', '2025-10-22 09:05:00', 3),
(4, 7, 32500, 'DAV-20251025-004', '2025-10-25 10:05:00', 4),
(7, NULL, 326.5, 'REF-20251106-001', '2025-11-06 09:25:13', 1),
(8, 1, 326.5, 'REF-20251106-001', '2025-11-06 09:27:21', 1),
(9, 1, 326.5, 'REF-20251106-001', '2025-11-06 09:31:01', 1),
(10, 1, 326.5, 'REF-20251106-001', '2025-11-06 09:33:37', 1),
(11, 1, 326.5, 'REF-20251106-001', '2025-11-06 09:35:34', 1);

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
  `fecha_asignacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comp_produc`
--

INSERT INTO `comp_produc` (`ID_Com_Produc`, `ID_Compra`, `ID_Producto`, `cant`, `valor`, `fecha_asignacion`) VALUES
(1, 1, 1, 5, 17500, NULL),
(2, 1, 2, 3, 7500, NULL),
(3, 1, 4, 2, 4000, NULL),
(4, 2, 7, 10, 70000, NULL),
(5, 2, 8, 20, 90000, NULL),
(6, 3, 3, 10, 40000, NULL),
(7, 3, 5, 5, 14000, NULL),
(8, 3, 6, 4, 12000, NULL),
(9, 4, 9, 5, 32500, NULL),
(10, 9, 1, 2, 50, NULL),
(11, 9, 2, 3, 75.5, NULL),
(12, 10, 1, 2, 50, NULL),
(13, 10, 2, 3, 75.5, NULL),
(14, 11, 1, 2, 50, NULL),
(15, 11, 2, 3, 75.5, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `config_fletes`
--

CREATE TABLE `config_fletes` (
  `id_config` int(11) NOT NULL,
  `tipo_vehiculo` enum('FURGON','VAN') NOT NULL,
  `tarifa_base` decimal(12,2) NOT NULL,
  `costo_km` decimal(12,4) NOT NULL,
  `max_distancia_km` int(11) NOT NULL,
  `capacidad_kg` int(11) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `seguro_pct` decimal(5,2) NOT NULL DEFAULT 0.00,
  `iva_pct` decimal(5,2) NOT NULL DEFAULT 19.00,
  `peaje_km` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `config_fletes`
--

INSERT INTO `config_fletes` (`id_config`, `tipo_vehiculo`, `tarifa_base`, `costo_km`, `max_distancia_km`, `capacidad_kg`, `descripcion`, `seguro_pct`, `iva_pct`, `peaje_km`) VALUES
(1, 'FURGON', 50000.00, 1500.0000, 500, 3000, 'Furgón estándar', 2.00, 19.00, 200.00),
(2, 'VAN', 35000.00, 1100.0000, 400, 1500, 'Van urbana', 2.00, 19.00, 150.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacion`
--

CREATE TABLE `cotizacion` (
  `id_cotizacion` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `producto` varchar(150) NOT NULL,
  `peso_kg` decimal(10,2) NOT NULL,
  `tipo_vehiculo` enum('FURGON','VAN') NOT NULL,
  `origen` varchar(150) NOT NULL,
  `destino` varchar(150) NOT NULL,
  `distancia_km` decimal(10,2) NOT NULL,
  `estado` enum('PENDIENTE','EN_PROCESO','COMPLETADO','RECHAZADO') NOT NULL DEFAULT 'PENDIENTE',
  `detalles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`detalles`)),
  `total` decimal(12,2) NOT NULL,
  `motivo_rechazo` varchar(255) DEFAULT NULL,
  `id_transpor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cotizacion`
--

INSERT INTO `cotizacion` (`id_cotizacion`, `fecha`, `producto`, `peso_kg`, `tipo_vehiculo`, `origen`, `destino`, `distancia_km`, `estado`, `detalles`, `total`, `motivo_rechazo`, `id_transpor`) VALUES
(1, '2025-11-08 20:59:30', 'Papa Criolla - 50 bultos', 2500.00, 'FURGON', 'Zipaquirá', 'Corabastos Bogotá', 45.00, 'COMPLETADO', '{\"tarifaBase\": 50000, \"costoKm\": 67500, \"seguro\": 2350, \"iva\": 22791, \"peaje\": 9000, \"subtotal\": 151641, \"total\": 151641}', 151641.00, NULL, 1),
(2, '2025-11-08 20:59:30', 'Tomate Chonto - 80 canastillas', 1200.00, 'FURGON', 'Girardot', 'Corabastos Bogotá', 134.00, 'COMPLETADO', '{\"tarifaBase\": 50000, \"costoKm\": 201000, \"seguro\": 5020, \"iva\": 48603, \"peaje\": 26800, \"subtotal\": 331423, \"total\": 331423}', 331423.00, NULL, 1),
(3, '2025-11-08 20:59:30', 'Plátano Hartón - 120 racimos', 1800.00, 'FURGON', 'Armero', 'Central Mayorista Medellín', 198.00, 'EN_PROCESO', '{\"tarifaBase\": 50000, \"costoKm\": 297000, \"seguro\": 6940, \"iva\": 67208, \"peaje\": 39600, \"subtotal\": 460748, \"total\": 460748}', 460748.00, NULL, 1),
(4, '2025-11-08 20:59:30', 'Aguacate Hass - 30 canastillas', 450.00, 'VAN', 'La Mesa', 'Paloquemao Bogotá', 62.00, 'COMPLETADO', '{\"tarifaBase\": 35000, \"costoKm\": 68200, \"seguro\": 2064, \"iva\": 19990, \"peaje\": 12400, \"subtotal\": 137654, \"total\": 137654}', 137654.00, NULL, 1),
(5, '2025-11-08 20:59:30', 'Cebolla Cabezona - 100 bultos', 3000.00, 'FURGON', 'Aquitania', 'Corabastos Bogotá', 186.00, 'PENDIENTE', '{\"tarifaBase\": 50000, \"costoKm\": 279000, \"seguro\": 6580, \"iva\": 63760, \"peaje\": 37200, \"subtotal\": 436540, \"total\": 436540}', 436540.00, NULL, 1),
(6, '2025-11-08 20:59:30', 'Yuca - 60 bultos', 1500.00, 'VAN', 'Puerto López', 'Abastos Villavicencio', 28.00, 'COMPLETADO', '{\"tarifaBase\": 35000, \"costoKm\": 30800, \"seguro\": 1316, \"iva\": 12750, \"peaje\": 5600, \"subtotal\": 85466, \"total\": 85466}', 85466.00, NULL, 1),
(7, '2025-11-08 20:59:30', 'Cilantro y Hierbas Aromáticas - 40 atados', 80.00, 'VAN', 'Chía', 'Paloquemao Bogotá', 35.00, 'EN_PROCESO', '{\"tarifaBase\": 35000, \"costoKm\": 38500, \"seguro\": 1470, \"iva\": 14244, \"peaje\": 7000, \"subtotal\": 96214, \"total\": 96214}', 96214.00, NULL, 1),
(8, '2025-11-08 20:59:30', 'Limón Tahití - 50 canastillas', 750.00, 'VAN', 'Espinal', 'Corabastos Bogotá', 142.00, 'PENDIENTE', '{\"tarifaBase\": 35000, \"costoKm\": 156200, \"seguro\": 3824, \"iva\": 37054, \"peaje\": 28400, \"subtotal\": 260478, \"total\": 260478}', 260478.00, NULL, 1),
(9, '2025-11-08 20:59:30', 'Zanahoria - 70 bultos', 1750.00, 'FURGON', 'Ventaquemada', 'Corabastos Bogotá', 168.00, 'COMPLETADO', '{\"tarifaBase\": 50000, \"costoKm\": 252000, \"seguro\": 6040, \"iva\": 58527, \"peaje\": 33600, \"subtotal\": 400167, \"total\": 400167}', 400167.00, NULL, 1),
(10, '2025-11-08 20:59:30', 'Mango Tommy - 40 canastillas', 600.00, 'VAN', 'Mariquita', 'Corabastos Bogotá', 154.00, 'RECHAZADO', '{\"tarifaBase\": 35000, \"costoKm\": 169400, \"seguro\": 4088, \"iva\": 39602, \"peaje\": 30800, \"subtotal\": 278890, \"total\": 278890}', 278890.00, NULL, 1);

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
(1, 2, '45', '23-15 Apto 501', '4.7110,-74.0721', 2, 1),
(2, 1, '72', '10-34 Casa 3', '4.8580,-74.0375', 3, 2),
(3, 3, '127', '45-67 Local 2', '4.9250,-74.0315', 4, 3),
(4, 2, '80', '12-45', '4.9180,-74.0307', 5, 4),
(5, 1, '50', '23-10', '4.9190,-74.0350', 6, 5),
(6, 2, '90', '15-20', '4.9200,-74.0360', 7, 6);

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
  `Fec_Env` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ID_Obser` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `guia_de_envio`
--

INSERT INTO `guia_de_envio` (`ID_Guia`, `Fec_Env`, `ID_Obser`) VALUES
(1, '2025-10-20 13:30:00', 3),
(2, '2025-10-21 14:00:00', 5),
(3, '2025-10-22 15:15:00', 4);

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
(1, 2, '2025-11-02 19:58:08', 4, 1, NULL),
(2, 3, '2025-11-02 19:58:10', 3, 2, NULL),
(3, 4, '2025-11-02 19:58:12', 2, 3, NULL),
(4, 5, '2025-11-02 19:58:15', 1, NULL, NULL);

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
  `categoria` varchar(50) DEFAULT NULL,
  `ID_Usuario` int(11) NOT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `estado` varchar(50) NOT NULL DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`ID_Producto`, `ID_Medida`, `nomprod`, `valor`, `cant`, `imagen`, `Descrip`, `categoria`, `ID_Usuario`, `activo`, `estado`) VALUES
(1, 2, 'Tomate Chonto', 3500, 100, '2e2c0f0a-6a15-4497-b2c2-c579eec39446_A.jpg', 'Tomate fresco de la region', NULL, 1, 1, 'activo'),
(2, 2, 'Cebolla Cabezona', 2500, 80, '21e7ec14-69d9-46c9-bb2c-19f0c2557111_AIP (1).webp', 'Cebolla de primera calidad', NULL, 1, 1, 'activo'),
(3, 2, 'Papa Criolla', 4500, 150, 'fd39f18d-1f8d-45d6-8a44-d4ab9cbf0833_X.jpg', 'Papa criolla seleccionada', NULL, 1, 1, 'activo'),
(4, 2, 'Lechuga Crespa', 2000, 60, '5e038122-3ebc-452c-99de-ff087c733a4a_L.jpg', 'Lechuga fresca', NULL, 1, 1, 'activo'),
(5, 2, 'Zanahoria', 2800, 90, 'zanahoria.jpg', 'Zanahoria fresca', NULL, 1, 1, 'activo'),
(6, 4, 'Aguacate Hass', 3000, 50, 'aguacate.jpg', 'Aguacate Hass grande', NULL, 1, 1, 'activo'),
(7, 2, 'Frijol Rojo', 7000, 200, 'frijol.jpg', 'Frijol rojo de primera', NULL, 1, 1, 'activo'),
(8, 2, 'Arroz Blanco', 4500, 300, 'arroz.jpg', 'Arroz de alta calidad', NULL, 1, 1, 'activo'),
(9, 2, 'Lenteja', 6500, 150, 'lenteja.jpg', 'Lenteja importada', NULL, 1, 1, 'activo'),
(10, 2, 'Garbanzo', 8000, 100, 'garbanzo.jpg', 'Garbanzo premium', NULL, 1, 1, 'activo'),
(11, 3, 'Arroz Bulto 50kg', 120000, 30, 'arroz_bulto.jpg', 'Bulto de arroz 50kg', NULL, 1, 1, 'activo'),
(12, 5, 'Leche Entera', 3200, 80, 'leche.jpg', 'Leche fresca entera', NULL, 1, 1, 'activo'),
(13, 4, 'Queso Campesino', 15000, 40, 'queso.jpg', 'Queso campesino artesanal', NULL, 1, 1, 'activo'),
(14, 4, 'Yogurt Natural', 4500, 60, '5e3039f6-8aaf-4711-b9bb-88a33df84c40_M.jpg', 'Yogurt natural sin azucar', NULL, 1, 1, 'activo'),
(15, 3, 'bananos', 250000, 50, 'bananos.jpg', 'bananos ricos :3', NULL, 1, 1, 'activo'),
(16, 1, 'Bananos', 1500, 4, 'banano.jpg', 'asdawdqd', 'verduras', 1, 1, 'activo'),
(17, 4, 'e32424', 13123, 14234, 'banano.jpg', 'asdafqf', 'frutas', 1, 1, 'activo'),
(18, 2, 'moras', 20000, 30, 'morajas.jpg', 'deliciosas moras, saludables ', NULL, 1, 1, 'activo'),
(19, 2, 'moras', 20000, 30, 'morajas.jpg', 'deliciosas moras, saludables ', NULL, 6, 1, 'activo'),
(20, 1, 'manzanas verdes', 10000, 10, 'manzanas_verdes.jpg', 'manzanas verdes ricas y saludables :3', NULL, 1, 1, 'activo'),
(21, 2, 'moras', 20000, 30, 'morajas.jpg', 'deliciosas moras, saludables ', NULL, 6, 1, 'activo'),
(22, 2, 'moras', 20000, 30, 'morajas.jpg', 'deliciosas moras, saludables ', NULL, 6, 1, 'activo'),
(23, 2, 'moras', 20000, 30, 'morajas.jpg', 'deliciosas moras, saludables ', NULL, 6, 1, 'activo'),
(24, 3, 'moras', 20000, 30, 'morajas.jpg', 'deliciosas moras, xd ', 'frutas', 3, 1, 'activo'),
(26, 2, 'moras', 20000, 30, 'morajas.jpg', 'deliciosas moras, saludables ', NULL, 3, 1, 'pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `produc_carri`
--

CREATE TABLE `produc_carri` (
  `nomprod` varchar(255) DEFAULT NULL,
  `carrito_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT 1,
  `fecha_agre` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `produc_carri`
--

INSERT INTO `produc_carri` (`nomprod`, `carrito_id`, `producto_id`, `cantidad`, `fecha_agre`) VALUES
('manzanas verdes', 3, 20, 8, '2025-11-06 02:52:02');

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
(1, 2, b'1'),
(1, 3, b'1'),
(1, 4, b'1'),
(1, 5, b'1'),
(1, 6, b'1'),
(1, 7, b'1'),
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
  `id_transpor` int(11) NOT NULL,
  `nombret` varchar(120) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `correo` varchar(150) DEFAULT NULL,
  `direcc` varchar(180) DEFAULT NULL,
  `sitio_web` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `transportadora`
--

INSERT INTO `transportadora` (`id_transpor`, `nombret`, `logo`, `telefono`, `correo`, `direcc`, `sitio_web`) VALUES
(1, 'Comuctiva Transporte Agrícola', 'comuctiva_logo.png', '3201234567', 'contacto@comuctiva.com', 'Km 5 Vía Principal - Zona Rural', 'www.comuctiva.com');

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
(1, 'Admin', 'Sistema', 'Principal', 3001111111, 3009999999, 1, 'admin@comuctiva.com', '22222222', '$2a$10$VQI8s1GJHV5mmYIrbTdgr.YdyFKvg8aDRa6OzjY6sGJch5vPZhBHy', NULL, NULL, NULL),
(2, 'Ana', 'Rodr??guez', 'S??nchez', 3004444444, 3006666666, 1, 'ana@cliente.com', '55555555', '$2a$10$VmMawJTRsP439qolyse0J.fLis1WTV2zQBxszc4kopu9HtEfzaAqa', NULL, NULL, NULL),
(3, 'Pedro', 'L??pez', 'Gonz??lez', 3005555555, 3005555555, 1, 'pedro@cliente.com', '66666666', '$2a$10$6faiysJgSF55hZdgqDLFzOS9zWZi5GdrKzFWYhG7jyP4abhmHbGfC', NULL, NULL, NULL),
(4, 'Laura', 'Fern??ndez', 'Torres', 3006666666, 3004444444, 1, 'laura@cliente.com', '77777777', '$2a$10$lZ1q70p/AjS49xgmrKOiU.DDobKTn4UWux4s/CnMIzD15DU7hAX92', NULL, NULL, NULL),
(5, 'Juan', 'P??rez', 'G??mez', 3007777777, 3003333333, 1, 'juan@cliente.com', '11111111', '$2a$10$pGQXR0T07iE2A84B0jLZfevum/3gJgXb7ek2f5ORRDiZFXAlBQm/i', NULL, NULL, NULL),
(6, 'Mar??a', 'Garc??a', 'L??pez', 3002222222, 3008888888, 1, 'maria@cliente.com', '33333333', '$2a$10$zmHj/n9nNjAKTpo9T7Ntl.ZjkT92.5bcYB9c2PPerlwck2z3r9QrO', NULL, NULL, NULL),
(7, 'Carlos', 'Mart??nez', 'P??rez', 3003333333, 3007777777, 1, 'carlos@cliente.com', '44444444', '$2a$10$QZ8nwN4Ox9q9ko2GozyQc.0K3IAtL5/I437xvfx0n7b6o8ELoqKfi', NULL, NULL, NULL),
(26, 'adso_2', 'adso_wo', 'wo', 5464848, 54687867, 2, 'adso_cli@gmail.com', '333333', '$2a$10$zqrh3ljZsQualPYl/1SFkuDErn4T2DFgfObrZKoer615GduwBbX66', NULL, NULL, NULL),
(27, 'jhorman', 'fabian', 'mendez', 3114457308, 3114457308, 1, 'jhormansegura2012@gmail.com', '1030544484', '$2a$10$/nYRK2QhtQv4WS7Ox7KTvuj1iFFx.CI2SCNTKBzuoqYkrNEkXoQUO', NULL, NULL, NULL),
(28, 'jhorman', 'fiquioequ', '22222222', 3114457308, 3234234, 3, 'jhormansegura2013@gmail.com', '1030', '$2a$10$ScSWoztsgF5IlcXAlgj5yOAhjJvzVwvpOwV43pkkUoaToBb0PFqd2', NULL, NULL, NULL),
(29, 'ClienteA', 'Prueba', 'Prueba2', 3001111111, 3002222222, 1, 'clientea@example.com', '90000000', '$2a$10$eoot9DiunuzlvHRWnWFkhOZzG2ffBOVe6zOKU0MyRYJpqAKpI2Sv.', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `id_vehiculo` int(11) NOT NULL,
  `id_transpor` int(11) NOT NULL,
  `tipo_vehiculo` enum('FURGON','VAN') NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `placa` varchar(15) NOT NULL,
  `conductor` varchar(120) DEFAULT NULL,
  `capacidad_kg` int(11) NOT NULL,
  `estado` enum('DISPONIBLE','EN_RUTA','MANTENIMIENTO') NOT NULL DEFAULT 'DISPONIBLE',
  `mantenimiento` tinyint(1) NOT NULL DEFAULT 0,
  `ubicacion` varchar(150) DEFAULT NULL,
  `viajes_mes` int(11) NOT NULL DEFAULT 0,
  `ingresos_mes` decimal(12,2) NOT NULL DEFAULT 0.00,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vehiculo`
--

INSERT INTO `vehiculo` (`id_vehiculo`, `id_transpor`, `tipo_vehiculo`, `nombre`, `placa`, `conductor`, `capacidad_kg`, `estado`, `mantenimiento`, `ubicacion`, `viajes_mes`, `ingresos_mes`, `fecha_creacion`) VALUES
(1, 1, 'FURGON', 'Furgón Refrigerado 1', 'AGR001', 'Juan Martínez', 3500, 'MANTENIMIENTO', 0, 'Centro de Acopio Principal', 42, 15800000.00, '2025-11-08 20:58:11'),
(2, 1, 'FURGON', 'Furgón Refrigerado 2', 'AGR002', 'Pedro Ramírez', 3500, 'EN_RUTA', 0, 'Ruta La Mesa - Bogotá', 38, 14200000.00, '2025-11-08 20:58:11'),
(3, 1, 'VAN', 'Van Carga Seca 1', 'AGR003', 'María González', 1800, 'DISPONIBLE', 0, 'Centro de Acopio Principal', 35, 8900000.00, '2025-11-08 20:58:11'),
(4, 1, 'VAN', 'Van Carga Seca 2', 'AGR004', 'Carlos Díaz', 1800, 'MANTENIMIENTO', 1, 'Taller Mecánico', 28, 7100000.00, '2025-11-08 20:58:11'),
(5, 1, 'FURGON', 'Van Express Modificada', 'AGR005', 'Luis Hernández', 3000, 'DISPONIBLE', 0, 'Bogotá - Norte', 40, 10200000.00, '2025-11-08 20:58:11'),
(6, 1, 'VAN', 'Van Express Modificada', 'AGR006', 'Luis Hernández', 1500, 'DISPONIBLE', 0, 'Bogotá - Norte', 40, 10200000.00, '2025-11-08 20:58:11');

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
-- Indices de la tabla `config_fletes`
--
ALTER TABLE `config_fletes`
  ADD PRIMARY KEY (`id_config`),
  ADD UNIQUE KEY `uk_config_tipo` (`tipo_vehiculo`);

--
-- Indices de la tabla `cotizacion`
--
ALTER TABLE `cotizacion`
  ADD PRIMARY KEY (`id_cotizacion`),
  ADD KEY `idx_cotizacion_estado` (`estado`),
  ADD KEY `idx_cotizacion_transpor` (`id_transpor`);

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
  ADD KEY `FK_Obser` (`ID_Obser`);

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
  ADD KEY `FK_Unidad_Medida` (`ID_Medida`),
  ADD KEY `fk_producto_usuario` (`ID_Usuario`);

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
  ADD PRIMARY KEY (`id_transpor`),
  ADD UNIQUE KEY `idx_transportadora_correo` (`correo`);

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
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`id_vehiculo`),
  ADD UNIQUE KEY `uk_vehiculo_placa` (`placa`),
  ADD KEY `idx_vehiculo_estado` (`estado`),
  ADD KEY `idx_vehiculo_transpor` (`id_transpor`);

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
  MODIFY `ID_Carrito` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `ID_Comentario` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `ID_Compra` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `comp_produc`
--
ALTER TABLE `comp_produc`
  MODIFY `ID_Com_Produc` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `config_fletes`
--
ALTER TABLE `config_fletes`
  MODIFY `id_config` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cotizacion`
--
ALTER TABLE `cotizacion`
  MODIFY `id_cotizacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  MODIFY `ID_Pedido` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `ID_Producto` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

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
  MODIFY `id_transpor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `unidad_medida`
--
ALTER TABLE `unidad_medida`
  MODIFY `Id_Medida` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID_Usuario` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  MODIFY `id_vehiculo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
-- Filtros para la tabla `cotizacion`
--
ALTER TABLE `cotizacion`
  ADD CONSTRAINT `fk_cotizacion_transportadora` FOREIGN KEY (`id_transpor`) REFERENCES `transportadora` (`id_transpor`);

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
  ADD CONSTRAINT `FK_Obser` FOREIGN KEY (`ID_Obser`) REFERENCES `obser` (`ID_Obser`);

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

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_usuario` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`);

--
-- Filtros para la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD CONSTRAINT `fk_vehiculo_transportadora` FOREIGN KEY (`id_transpor`) REFERENCES `transportadora` (`id_transpor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
