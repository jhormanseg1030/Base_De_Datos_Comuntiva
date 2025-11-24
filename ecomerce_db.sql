-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-11-2025 a las 21:29:46
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
-- Base de datos: `ecomerce_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id` bigint(20) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha_agregado` datetime(6) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `producto_id` bigint(20) NOT NULL,
  `usuario_documento` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`id`, `cantidad`, `fecha_agregado`, `precio_unitario`, `producto_id`, `usuario_documento`) VALUES
(3, 5, '2025-11-23 19:05:12.000000', 2500.00, 1, '22222222'),
(4, 2, '2025-11-23 19:05:12.000000', 4500.00, 10, '22222222'),
(5, 4, '2025-11-23 19:05:12.000000', 3000.00, 7, '33333333'),
(6, 2, '2025-11-24 04:48:09.000000', 2500.00, 1, 'admin'),
(7, 3, '2025-11-24 11:14:47.000000', 1800.00, 2, 'admin'),
(8, 3, '2025-11-24 20:00:56.000000', 10000.00, 16, '11111111'),
(9, 3, '2025-11-24 20:00:58.000000', 2500.00, 1, '11111111');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` bigint(20) NOT NULL,
  `activo` bit(1) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `activo`, `descripcion`, `nombre`) VALUES
(1, b'1', 'Frutas frescas y org??nicas de la regi??n', 'Frutas'),
(2, b'1', 'Verduras y hortalizas cultivadas localmente', 'Verduras'),
(3, b'1', 'Productos l??cteos frescos y derivados', 'L??cteos'),
(4, b'1', 'Granos, cereales y legumbres', 'Granos'),
(5, b'1', 'Carnes frescas y procesadas', 'Carnes'),
(6, b'0', 'Jugos naturales y bebidas', 'Bebidas'),
(7, b'1', 'Productos artesanales locales', 'Artesanías'),
(8, b'1', 'Pan y productos de panaderia', 'Panaderia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id` bigint(20) NOT NULL,
  `activo` bit(1) NOT NULL,
  `calificacion` int(11) NOT NULL,
  `contenido` varchar(1000) NOT NULL,
  `fecha_comentario` datetime(6) NOT NULL,
  `producto_id` bigint(20) NOT NULL,
  `usuario_documento` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id`, `activo`, `calificacion`, `contenido`, `fecha_comentario`, `producto_id`, `usuario_documento`) VALUES
(1, b'1', 5, 'Excelentes naranjas, muy jugosas y dulces!', '2024-11-21 15:30:00.000000', 1, '11111111'),
(2, b'1', 4, 'Buena calidad, llegaron frescas', '2024-11-22 10:15:00.000000', 1, '33333333'),
(3, b'1', 5, 'Lechuga muy fresca, perfecta para ensaladas', '2024-11-21 16:00:00.000000', 5, '11111111'),
(4, b'1', 3, 'Tomates buenos pero un poco verdes', '2024-11-21 16:05:00.000000', 6, '11111111'),
(5, b'1', 5, 'Papas de excelente calidad, recomendadas', '2024-11-22 11:30:00.000000', 7, '22222222'),
(6, b'1', 5, 'Fresas deliciosas y grandes', '2024-11-21 16:10:00.000000', 10, '11111111'),
(7, b'1', 5, 'Mangos muy sabrosos y en su punto', '2024-11-22 12:00:00.000000', 4, '22222222'),
(8, b'1', 4, 'Manzanas crujientes, me encantaron', '2024-11-23 09:00:00.000000', 12, '33333333');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id` bigint(20) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `fecha_compra` datetime(6) NOT NULL,
  `precio_total` decimal(10,2) NOT NULL,
  `comprador_documento` varchar(255) NOT NULL,
  `pedido_id` bigint(20) DEFAULT NULL,
  `producto_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id`, `cantidad`, `estado`, `fecha_compra`, `precio_total`, `comprador_documento`, `pedido_id`, `producto_id`) VALUES
(1, 3, 'COMPLETADA', '2024-11-20 10:30:00.000000', 6000.00, '11111111', 1, 5),
(2, 4, 'COMPLETADA', '2024-11-20 10:30:00.000000', 11200.00, '11111111', 1, 6),
(3, 5, 'COMPLETADA', '2024-11-20 10:30:00.000000', 12500.00, '11111111', 1, 1),
(4, 2, 'COMPLETADA', '2024-11-20 10:30:00.000000', 9000.00, '11111111', 1, 10),
(5, 3, 'COMPLETADA', '2024-11-21 14:15:00.000000', 9000.00, '22222222', 2, 7),
(6, 4, 'COMPLETADA', '2024-11-21 14:15:00.000000', 14000.00, '22222222', 2, 4),
(7, 1, 'COMPLETADA', '2024-11-21 14:15:00.000000', 5000.00, '22222222', 2, 11),
(8, 8, 'COMPLETADA', '2024-11-22 09:45:00.000000', 20000.00, '33333333', 3, 1),
(9, 4, 'COMPLETADA', '2024-11-22 09:45:00.000000', 16800.00, '33333333', 3, 12),
(10, 3, 'COMPLETADA', '2024-11-22 09:45:00.000000', 7500.00, '33333333', 3, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id` bigint(20) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `pedido_id` bigint(20) NOT NULL,
  `producto_id` bigint(20) NOT NULL,
  `vendedor_documento` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`id`, `cantidad`, `precio_unitario`, `subtotal`, `pedido_id`, `producto_id`, `vendedor_documento`) VALUES
(1, 3, 2000.00, 6000.00, 1, 5, '22222222'),
(2, 4, 2800.00, 11200.00, 1, 6, '22222222'),
(3, 5, 2500.00, 12500.00, 1, 1, '11111111'),
(4, 2, 4500.00, 9000.00, 1, 10, '33333333'),
(5, 3, 3000.00, 9000.00, 2, 7, '22222222'),
(6, 4, 3500.00, 14000.00, 2, 4, '11111111'),
(7, 1, 5000.00, 5000.00, 2, 11, '33333333'),
(8, 8, 2500.00, 20000.00, 3, 1, '11111111'),
(9, 4, 4200.00, 16800.00, 3, 12, '33333333'),
(10, 3, 2500.00, 7500.00, 3, 9, '22222222'),
(11, 5, 1800.00, 9000.00, 4, 2, '11111111'),
(12, 4, 1500.00, 6000.00, 4, 8, '22222222');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` bigint(20) NOT NULL,
  `con_flete` bit(1) NOT NULL,
  `costo_flete` decimal(10,2) DEFAULT NULL,
  `direccion_entrega` varchar(255) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `fecha_pedido` datetime(6) NOT NULL,
  `metodo_pago` varchar(255) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `comprador_documento` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `con_flete`, `costo_flete`, `direccion_entrega`, `estado`, `fecha_pedido`, `metodo_pago`, `total`, `comprador_documento`) VALUES
(1, b'1', 5000.00, 'Carrera 10 #20-30', 'ENTREGADO', '2024-11-20 10:30:00.000000', 'Efectivo', 35400.00, '11111111'),
(2, b'0', 0.00, 'Calle 50 #15-25 (Recoger en tienda)', 'EN_CAMINO', '2024-11-21 14:15:00.000000', 'Tarjeta', 28500.00, '22222222'),
(3, b'1', 8000.00, 'Avenida 80 #45-60', 'CONFIRMADO', '2024-11-22 09:45:00.000000', 'Transferencia', 52000.00, '33333333'),
(4, b'1', 4000.00, 'Carrera 10 #20-30', 'PENDIENTE', '2024-11-23 11:20:00.000000', 'Efectivo', 19200.00, '11111111');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` bigint(20) NOT NULL,
  `activo` bit(1) NOT NULL,
  `descripcion` varchar(1000) DEFAULT NULL,
  `fecha_cosecha` date DEFAULT NULL,
  `fecha_publicacion` datetime(6) NOT NULL,
  `imagen_url` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `categoria_id` bigint(20) NOT NULL,
  `subcategoria_id` bigint(20) NOT NULL,
  `usuario_documento` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `activo`, `descripcion`, `fecha_cosecha`, `fecha_publicacion`, `imagen_url`, `nombre`, `precio`, `stock`, `categoria_id`, `subcategoria_id`, `usuario_documento`) VALUES
(1, b'1', 'Naranjas dulces y jugosas, perfectas para jugo. 1kg', '2024-11-15', '2025-11-23 19:05:12.000000', NULL, 'Naranjas Valencia', 2500.00, 100, 1, 1, '11111111'),
(2, b'1', 'Limones frescos y ??cidos, ideales para cocinar. 500g', '2024-11-10', '2025-11-23 19:05:12.000000', NULL, 'Limones Tahit??', 1800.00, 80, 1, 1, '11111111'),
(3, b'1', 'Mandarinas peque??as y dulces, sin semillas. 1kg', '2024-11-18', '2025-11-23 19:05:12.000000', NULL, 'Mandarinas Baby', 3200.00, 60, 1, 1, '11111111'),
(4, b'1', 'Mangos maduros, dulces y arom??ticos. Unidad', '2024-11-12', '2025-11-23 19:05:12.000000', NULL, 'Mangos Tommy', 3500.00, 45, 1, 2, '11111111'),
(5, b'1', 'Lechuga fresca hidrop??nica. Unidad', '2024-11-20', '2025-11-23 19:05:12.000000', NULL, 'Lechuga Crespa', 2000.00, 50, 2, 5, '22222222'),
(6, b'1', 'Tomates maduros para ensaladas. 1kg', '2024-11-19', '2025-11-23 19:05:12.000000', NULL, 'Tomates Chonto', 2800.00, 70, 2, 8, '22222222'),
(7, b'1', 'Papas criollas amarillas. 1kg', '2024-11-05', '2025-11-23 19:05:12.000000', NULL, 'Papas Criolla', 3000.00, 120, 2, 6, '22222222'),
(8, b'1', 'Zanahorias frescas y crujientes. 500g', '2024-11-17', '2025-11-23 19:05:12.000000', NULL, 'Zanahorias', 1500.00, 90, 2, 6, '22222222'),
(9, b'1', 'Br??coli fresco y verde. Unidad', '2024-11-21', '2025-11-23 19:05:12.000000', NULL, 'Br??coli', 2500.00, 40, 2, 7, '22222222'),
(10, b'1', 'Fresas grandes y dulces. 250g', '2024-11-22', '2025-11-23 19:05:12.000000', NULL, 'Fresas Premium', 4500.00, 30, 1, 3, '33333333'),
(11, b'1', 'Moras frescas de los Andes. 250g', '2024-11-22', '2025-11-23 19:05:12.000000', NULL, 'Moras Andinas', 5000.00, 25, 1, 3, '33333333'),
(12, b'1', 'Manzanas rojas importadas. 1kg', '2024-10-28', '2025-11-23 19:05:12.000000', NULL, 'Manzanas Red', 4200.00, 55, 1, 4, '33333333'),
(13, b'1', 'Pi??as dulces y jugosas. Unidad', '2024-11-08', '2025-11-23 19:05:12.000000', NULL, 'Pi??as Gold', 6000.00, 20, 1, 2, '33333333'),
(14, b'0', 'Aguacates maduros. Unidad', '2024-10-15', '2025-11-23 19:05:12.000000', NULL, 'Aguacates Hass', 2500.00, 0, 1, 2, '11111111'),
(15, b'0', 'Piment??n rojo dulce. 500g', '2024-11-16', '2025-11-23 19:05:12.000000', NULL, 'Piment??n Rojo', 3500.00, 15, 2, 8, '22222222'),
(16, b'1', 'sss', '2025-11-11', '2025-11-24 11:49:02.000000', 'http://localhost:8080/api/files/productos/f7ebadb3-f0bd-4b34-b18e-a42e2456fbb9.jpg', 'portatil', 10000.00, 20, 2, 6, '11111111');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promociones`
--

CREATE TABLE `promociones` (
  `id` bigint(20) NOT NULL,
  `activo` bit(1) NOT NULL,
  `fecha_creacion` datetime(6) NOT NULL,
  `fecha_inicio` datetime(6) NOT NULL,
  `fecha_vencimiento` datetime(6) NOT NULL,
  `porcentaje_descuento` decimal(5,2) NOT NULL,
  `precio_promocion` decimal(10,2) NOT NULL,
  `creador_documento` varchar(255) NOT NULL,
  `producto_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `promociones`
--

INSERT INTO `promociones` (`id`, `activo`, `fecha_creacion`, `fecha_inicio`, `fecha_vencimiento`, `porcentaje_descuento`, `precio_promocion`, `creador_documento`, `producto_id`) VALUES
(1, b'1', '2025-11-23 19:05:12.000000', '2024-11-20 00:00:00.000000', '2024-11-30 00:00:00.000000', 20.00, 2000.00, '11111111', 1),
(2, b'1', '2025-11-23 19:05:12.000000', '2024-11-22 00:00:00.000000', '2024-11-25 00:00:00.000000', 15.00, 2975.00, '11111111', 4),
(3, b'1', '2025-11-23 19:05:12.000000', '2024-11-23 00:00:00.000000', '2024-11-26 00:00:00.000000', 25.00, 3375.00, '33333333', 10),
(4, b'0', '2025-11-23 19:05:12.000000', '2024-11-15 00:00:00.000000', '2024-11-22 00:00:00.000000', 10.00, 2520.00, '22222222', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategorias`
--

CREATE TABLE `subcategorias` (
  `id` bigint(20) NOT NULL,
  `activo` bit(1) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `categoria_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `subcategorias`
--

INSERT INTO `subcategorias` (`id`, `activo`, `descripcion`, `nombre`, `categoria_id`) VALUES
(1, b'1', 'Naranjas, limones, mandarinas, toronjas', 'C??tricos', 1),
(2, b'1', 'Mango, papaya, pi??a, maracuy??', 'Tropicales', 1),
(3, b'1', 'Fresas, moras, ar??ndanos', 'Berries', 1),
(4, b'1', 'Diferentes variedades de manzanas', 'Manzanas', 1),
(5, b'1', 'Lechuga, espinaca, acelga', 'Hortalizas de Hoja', 2),
(6, b'1', 'Papa, yuca, zanahoria, remolacha', 'Tub??rculos', 2),
(7, b'1', 'Br??coli, coliflor, repollo', 'Cruc??feras', 2),
(8, b'1', 'Tomate, piment??n, berenjena', 'Solan??ceas', 2),
(9, b'1', 'Leche entera, descremada, deslactosada', 'Leches', 3),
(10, b'1', 'Quesos frescos y madurados', 'Quesos', 3),
(11, b'1', 'Yogur natural, griego, con sabores', 'Yogures', 3),
(12, b'1', 'Frijol, lenteja, garbanzo', 'Legumbres', 4),
(13, b'1', 'Arroz, avena, quinua', 'Cereales', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `numero_documento` varchar(255) NOT NULL,
  `activo` bit(1) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `fecha_registro` datetime(6) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `tipo_documento` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`numero_documento`, `activo`, `apellido`, `correo`, `direccion`, `fecha_registro`, `nombre`, `password`, `rol`, `telefono`, `tipo_documento`) VALUES
('11111111', b'1', 'P??rez', 'juan@gmail.com', 'Carrera 10 #20-30', '2025-11-23 19:05:12.000000', 'Juan', '$2a$10$MKmQRNNOrXjra.KYhsu7JO9FVjsBlesYG0zQJnzni3nfHw2SXTVzK', 'USER', '3002222222', 'CC'),
('22222222', b'1', 'Garc??a', 'maria@gmail.com', 'Calle 50 #15-25', '2025-11-23 19:05:12.000000', 'Mar??a', '$2a$10$MKmQRNNOrXjra.KYhsu7JO9FVjsBlesYG0zQJnzni3nfHw2SXTVzK', 'USER', '3003333333', 'CC'),
('33333333', b'1', 'L??pez', 'carlos@gmail.com', 'Avenida 80 #45-60', '2025-11-23 19:05:12.000000', 'Carlos', '$2a$10$MKmQRNNOrXjra.KYhsu7JO9FVjsBlesYG0zQJnzni3nfHw2SXTVzK', 'USER', '3004444444', 'CE'),
('44444444', b'0', 'Mart??nez', 'ana@gmail.com', 'Transversal 30 #12-18', '2025-11-23 19:05:12.000000', 'Ana', '$2a$10$MKmQRNNOrXjra.KYhsu7JO9FVjsBlesYG0zQJnzni3nfHw2SXTVzK', 'USER', '3005555555', 'CC'),
('99999999', b'1', 'Usuario', 'test999@test.com', 'Calle Test', '2025-11-24 03:13:02.000000', 'Test', '$2a$10$MKmQRNNOrXjra.KYhsu7JO9FVjsBlesYG0zQJnzni3nfHw2SXTVzK', 'USER', '3001234567', 'CC'),
('admin', b'1', 'Sistema', 'admin@ecomerce.com', 'Calle Admin 100', '2025-11-23 19:05:12.000000', 'Administrador', '$2a$10$MKmQRNNOrXjra.KYhsu7JO9FVjsBlesYG0zQJnzni3nfHw2SXTVzK', 'ADMIN', '3001111111', 'CC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` bigint(20) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha_venta` datetime(6) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `comprador_documento` varchar(255) NOT NULL,
  `pedido_id` bigint(20) DEFAULT NULL,
  `producto_id` bigint(20) NOT NULL,
  `vendedor_documento` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `cantidad`, `fecha_venta`, `precio_unitario`, `total`, `comprador_documento`, `pedido_id`, `producto_id`, `vendedor_documento`) VALUES
(1, 3, '2024-11-20 10:30:00.000000', 2000.00, 6000.00, '11111111', 1, 5, '22222222'),
(2, 4, '2024-11-20 10:30:00.000000', 2800.00, 11200.00, '11111111', 1, 6, '22222222'),
(3, 5, '2024-11-20 10:30:00.000000', 2500.00, 12500.00, '11111111', 1, 1, '11111111'),
(4, 2, '2024-11-20 10:30:00.000000', 4500.00, 9000.00, '11111111', 1, 10, '33333333'),
(5, 3, '2024-11-21 14:15:00.000000', 3000.00, 9000.00, '22222222', 2, 7, '22222222'),
(6, 4, '2024-11-21 14:15:00.000000', 3500.00, 14000.00, '22222222', 2, 4, '11111111'),
(7, 1, '2024-11-21 14:15:00.000000', 5000.00, 5000.00, '22222222', 2, 11, '33333333'),
(8, 8, '2024-11-22 09:45:00.000000', 2500.00, 20000.00, '33333333', 3, 1, '11111111'),
(9, 4, '2024-11-22 09:45:00.000000', 4200.00, 16800.00, '33333333', 3, 12, '33333333'),
(10, 3, '2024-11-22 09:45:00.000000', 2500.00, 7500.00, '33333333', 3, 9, '22222222');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKa66gl3j7wnlwyc1i7rj5cm163` (`producto_id`),
  ADD KEY `FKcciw7kggns7m52uo8ynjup2eg` (`usuario_documento`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_qcog8b7hps1hioi9onqwjdt6y` (`nombre`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK6vkhmonbxnjd9obsfwtkm9ehi` (`producto_id`),
  ADD KEY `FKmlqljo0glqlpy17a7oxqwg2x5` (`usuario_documento`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKqitxkm0mdbjourca0lsmcscv4` (`comprador_documento`),
  ADD KEY `FKklkqhk5ke4j3utp8hh2pmsata` (`pedido_id`),
  ADD KEY `FKaa4hxtxd515jk59ete30aa3at` (`producto_id`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKg9h17fjynh9lgf1kbn0v9p4kf` (`pedido_id`),
  ADD KEY `FKdfdl21316mnac14d7f4oi4m84` (`producto_id`),
  ADD KEY `FKl1f8o222pwafyfhinebxqnvy6` (`vendedor_documento`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKc25tq65v3hvwbuvmifnvmvqhr` (`comprador_documento`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK2fwq10nwymfv7fumctxt9vpgb` (`categoria_id`),
  ADD KEY `FKlutwcid3o8b6ueh8a3u04vyjr` (`subcategoria_id`),
  ADD KEY `FK7l9tqc5j9pwth6aq7nd97vd5y` (`usuario_documento`);

--
-- Indices de la tabla `promociones`
--
ALTER TABLE `promociones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK9evrg8bx0i556e6850vde5qbq` (`creador_documento`),
  ADD KEY `FKk5l1pwk8vl4f89ll9mc761dw6` (`producto_id`);

--
-- Indices de la tabla `subcategorias`
--
ALTER TABLE `subcategorias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKiucm5ipf0wvec50s8j67r33rk` (`categoria_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`numero_documento`),
  ADD UNIQUE KEY `UK_cdmw5hxlfj78uf4997i3qyyw5` (`correo`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKdtwepfgvhya2ff4rrxd0t54l` (`comprador_documento`),
  ADD KEY `FK6nyoh6wipbfvku01s87nyrbdc` (`pedido_id`),
  ADD KEY `FKm2vj8hr3u07dh7lf45hq7tman` (`producto_id`),
  ADD KEY `FK5443sx5xfk1bgcwnoy761hjit` (`vendedor_documento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `promociones`
--
ALTER TABLE `promociones`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `subcategorias`
--
ALTER TABLE `subcategorias`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `FKa66gl3j7wnlwyc1i7rj5cm163` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `FKcciw7kggns7m52uo8ynjup2eg` FOREIGN KEY (`usuario_documento`) REFERENCES `usuarios` (`numero_documento`);

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `FK6vkhmonbxnjd9obsfwtkm9ehi` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `FKmlqljo0glqlpy17a7oxqwg2x5` FOREIGN KEY (`usuario_documento`) REFERENCES `usuarios` (`numero_documento`);

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `FKaa4hxtxd515jk59ete30aa3at` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `FKklkqhk5ke4j3utp8hh2pmsata` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`),
  ADD CONSTRAINT `FKqitxkm0mdbjourca0lsmcscv4` FOREIGN KEY (`comprador_documento`) REFERENCES `usuarios` (`numero_documento`);

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `FKdfdl21316mnac14d7f4oi4m84` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `FKg9h17fjynh9lgf1kbn0v9p4kf` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`),
  ADD CONSTRAINT `FKl1f8o222pwafyfhinebxqnvy6` FOREIGN KEY (`vendedor_documento`) REFERENCES `usuarios` (`numero_documento`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `FKc25tq65v3hvwbuvmifnvmvqhr` FOREIGN KEY (`comprador_documento`) REFERENCES `usuarios` (`numero_documento`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `FK2fwq10nwymfv7fumctxt9vpgb` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`),
  ADD CONSTRAINT `FK7l9tqc5j9pwth6aq7nd97vd5y` FOREIGN KEY (`usuario_documento`) REFERENCES `usuarios` (`numero_documento`),
  ADD CONSTRAINT `FKlutwcid3o8b6ueh8a3u04vyjr` FOREIGN KEY (`subcategoria_id`) REFERENCES `subcategorias` (`id`);

--
-- Filtros para la tabla `promociones`
--
ALTER TABLE `promociones`
  ADD CONSTRAINT `FK9evrg8bx0i556e6850vde5qbq` FOREIGN KEY (`creador_documento`) REFERENCES `usuarios` (`numero_documento`),
  ADD CONSTRAINT `FKk5l1pwk8vl4f89ll9mc761dw6` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `subcategorias`
--
ALTER TABLE `subcategorias`
  ADD CONSTRAINT `FKiucm5ipf0wvec50s8j67r33rk` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `FK5443sx5xfk1bgcwnoy761hjit` FOREIGN KEY (`vendedor_documento`) REFERENCES `usuarios` (`numero_documento`),
  ADD CONSTRAINT `FK6nyoh6wipbfvku01s87nyrbdc` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`),
  ADD CONSTRAINT `FKdtwepfgvhya2ff4rrxd0t54l` FOREIGN KEY (`comprador_documento`) REFERENCES `usuarios` (`numero_documento`),
  ADD CONSTRAINT `FKm2vj8hr3u07dh7lf45hq7tman` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
