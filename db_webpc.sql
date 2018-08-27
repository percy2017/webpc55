-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 27-08-2018 a las 01:37:52
-- Versión del servidor: 5.6.38
-- Versión de PHP: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de datos: `db_webpc`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descrcipcion` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `descrcipcion`, `created_at`, `updated_at`) VALUES
(1, 'Combustibles', 'Todo tipo de combustible', '2018-07-31 02:50:45', '2018-08-08 00:42:17'),
(2, 'Respuestos', 'Respuestos para todos tipo de maquinarias', '2018-08-02 00:19:50', '2018-08-08 00:41:26'),
(3, 'Pagos Sueldos', 'para los pagos de sueldos', '2018-08-08 00:43:00', '2018-08-08 00:43:00'),
(4, 'Solicitud de Compra', 'Solicitudes de compras general', '2018-08-08 00:44:02', '2018-08-08 00:44:02'),
(5, 'Comision', 'detalle de la comision', '2018-08-15 03:10:39', '2018-08-15 03:10:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `choferes`
--

CREATE TABLE `choferes` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre_completo` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `licencia` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `categoria` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `carnet` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `imagen` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `choferes`
--

INSERT INTO `choferes` (`id`, `nombre_completo`, `licencia`, `created_at`, `updated_at`, `categoria`, `carnet`, `imagen`) VALUES
(1, 'JAVIER ANTONIO RIVERA SUAREZ', '345345556', '2018-08-06 03:11:06', '2018-08-08 01:24:06', 'A', '3453455 BN', NULL),
(2, 'ARTURO ORTIZ LANGUIDEY', '34534555', '2018-08-06 03:11:07', '2018-08-08 01:18:52', 'C', '345345 BN', NULL),
(3, 'SAUL CHANATO', '225225', '2018-08-08 01:16:30', '2018-08-08 01:16:30', 'C', '25555', NULL),
(4, 'LUIS FERNANDO CLARO ESPINDOLA', '7635088-1F', '2018-08-08 01:21:41', '2018-08-08 01:21:41', 'M', '7635088-1F', NULL),
(5, 'DICKSON MELGAR YEPEZ', NULL, '2018-08-08 01:25:01', '2018-08-08 01:25:01', NULL, NULL, NULL),
(6, 'JOSE LUIZ SANCHEZ', NULL, '2018-08-08 01:25:30', '2018-08-08 01:25:30', NULL, NULL, NULL),
(7, 'CARMELO ROCHA', NULL, '2018-08-08 01:25:48', '2018-08-08 01:25:48', NULL, NULL, NULL),
(8, 'LORENZO LIGUE MONTAÑO', NULL, '2018-08-08 01:26:04', '2018-08-08 01:26:04', NULL, NULL, NULL),
(9, 'SIN CHOFER', NULL, '2018-08-08 01:34:10', '2018-08-08 01:34:10', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clasificaciones`
--

CREATE TABLE `clasificaciones` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descrcipcion` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `clasificaciones`
--

INSERT INTO `clasificaciones` (`id`, `nombre`, `descrcipcion`, `created_at`, `updated_at`) VALUES
(1, 'Hormigón Ciclópeo', 'Descripción de la clasificación 1', '2018-08-06 01:54:44', '2018-08-10 04:10:51'),
(2, 'Hormigón en Masa', 'Este se vierte directamente en moldes previamente preparados y dan macizos sometidos a esfuerzos de compresión', '2018-08-06 01:55:16', '2018-08-10 04:10:25'),
(3, 'Hormigón Ligero', 'descripcion de este tipo de hormigon', '2018-08-10 04:11:17', '2018-08-10 04:11:17'),
(4, 'Hormigón Armado', 'description', '2018-08-10 04:11:47', '2018-08-10 04:11:47'),
(5, 'Hormigón Pretensado', 'description', '2018-08-10 04:12:07', '2018-08-10 04:12:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre_completo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nit` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `direccion` text COLLATE utf8_unicode_ci,
  `telefono_movil` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono_fijo` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `imagen` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre_completo`, `nit`, `direccion`, `telefono_movil`, `telefono_fijo`, `created_at`, `updated_at`, `imagen`) VALUES
(1, 'Carlos mendez sosa', '35345', 'calle meliton #65', '7190999', '3454656', '2018-08-06 01:45:41', '2018-08-06 02:20:13', NULL),
(2, 'Jose miguel', '123343', 'zona san juan', NULL, NULL, '2018-08-10 03:54:35', '2018-08-10 03:54:35', NULL),
(3, 'marcelo alarcon', NULL, NULL, NULL, NULL, '2018-08-11 23:00:22', '2018-08-11 23:00:22', NULL),
(4, 'Marcelo Calle Pacheco', '5594144', 'Calle Mamore Final', '68969212', NULL, '2018-08-15 02:54:47', '2018-08-15 02:54:47', 'clientes/August2018/gHJ60keKlrFjUC1M2gS2.jpeg'),
(5, 'Juan Perez', '54545353', 'C/ Manuel limpias', '43534554', '4687887', '2018-08-15 03:04:19', '2018-08-15 03:04:19', 'clientes/August2018/taHD6kOBzFWgzQgtiyjI.jpg'),
(6, 'Fernenado Carrillo', '3453465', NULL, '23423434', NULL, NULL, NULL, NULL),
(7, 'Liciano pereyra', '3454', NULL, '345345', NULL, '2018-08-26 20:12:28', '2018-08-26 20:12:28', NULL),
(8, 'Mario Barbery', '3453454', NULL, '43545', NULL, '2018-08-27 01:25:55', '2018-08-27 01:25:55', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 1, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(12, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(13, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1),
(14, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '', 2),
(15, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '', 3),
(16, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '', 4),
(17, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1),
(18, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '', 2),
(19, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '', 3),
(20, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '', 4),
(21, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, '', 5),
(22, 1, 'role_id', 'text', 'Role', 0, 1, 1, 1, 1, 1, NULL, 9),
(23, 4, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(24, 4, 'key', 'text', 'Key', 1, 1, 1, 1, 1, 1, NULL, 2),
(25, 4, 'table_name', 'text', 'Table Name', 0, 1, 1, 1, 1, 1, NULL, 3),
(26, 4, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 4),
(27, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(28, 5, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(29, 5, 'nombre', 'text', 'Nombre', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 2),
(30, 5, 'descripcion', 'text_area', 'Descripcion', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 6),
(31, 5, 'presupuesto', 'number', 'Presupuesto', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 4),
(32, 5, 'estado', 'checkbox', 'Habilitado', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 7),
(33, 5, 'fecha_inicio', 'date', 'Fecha Inicio', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 3),
(34, 5, 'fecha_final', 'date', 'Fecha Final', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 5),
(35, 5, 'user_id', 'text', 'User Id', 0, 0, 0, 0, 0, 0, NULL, 8),
(36, 5, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 9),
(37, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 10),
(38, 6, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(39, 6, 'firma', 'image', 'Firma', 0, 0, 1, 0, 0, 0, NULL, 10),
(40, 6, 'referencia', 'text_area', 'Referencia', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 8),
(42, 6, 'total', 'number', 'Total', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 11),
(43, 6, 'observacion', 'text_area', 'Observacion', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 9),
(44, 6, 'user_id', 'text', 'User Id', 0, 0, 0, 0, 0, 0, NULL, 13),
(45, 6, 'proveedor_id', 'text', 'Proveedor Id', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 14),
(46, 6, 'proyecto_id', 'text', 'Proyecto Id', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 15),
(47, 6, 'cheque_id', 'text', 'Cheque Id', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 16),
(48, 6, 'tipo_id', 'text', 'Tipo Id', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 17),
(49, 6, 'pago_id', 'text', 'Pago Id', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 18),
(50, 6, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 19),
(51, 6, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 20),
(52, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(53, 7, 'nombre', 'text', 'Nombre', 0, 1, 1, 1, 1, 1, NULL, 2),
(54, 7, 'descripcion', 'text_area', 'Descripcion', 0, 1, 1, 1, 1, 1, NULL, 3),
(55, 7, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 4),
(56, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(57, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(58, 8, 'nombre', 'text', 'Nombre', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 2),
(59, 8, 'direccion', 'text', 'Direccion', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\",\"rows\":\"3\"}}', 6),
(60, 8, 'telefono', 'text', 'Telefono', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 4),
(61, 8, 'celular', 'text', 'Celular', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 5),
(62, 8, 'correo', 'text', 'Correo', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 3),
(63, 8, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 9),
(64, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 10),
(65, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(66, 9, 'nombre', 'text', 'Nombre', 0, 1, 1, 1, 1, 1, NULL, 2),
(67, 9, 'descripcion', 'text_area', 'Descripcion', 0, 1, 1, 1, 1, 1, NULL, 3),
(68, 9, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 4),
(69, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(78, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 3),
(79, 11, 'nombre', 'text', 'Nombre', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 4),
(80, 11, 'descripcion', 'text_area', 'Descripcion', 0, 1, 1, 1, 1, 1, NULL, 10),
(81, 11, 'categoria_id', 'text', 'Categoria Id', 0, 0, 1, 1, 1, 1, NULL, 5),
(82, 11, 'unidad_id', 'text', 'Unidad Id', 0, 0, 1, 1, 1, 1, NULL, 6),
(83, 11, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 7),
(84, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 8),
(85, 12, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(86, 12, 'nombre', 'text', 'Nombre', 0, 1, 1, 1, 1, 1, NULL, 3),
(87, 12, 'descripcion', 'text_area', 'Descripcion', 0, 1, 1, 1, 1, 1, NULL, 4),
(88, 12, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 5),
(89, 12, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 6),
(90, 13, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(91, 13, 'nombre', 'text', 'Nombre', 0, 1, 1, 1, 1, 1, NULL, 2),
(92, 13, 'descrcipcion', 'text_area', 'Descrcipcion', 0, 1, 1, 1, 1, 1, NULL, 3),
(93, 13, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 4),
(94, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(95, 14, 'id', 'text', 'Id', 1, 1, 0, 0, 0, 0, NULL, 1),
(96, 14, 'codigo', 'text', 'Codigo', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 5),
(98, 14, 'placa', 'text', 'Placa', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 7),
(99, 14, 'marca', 'text', 'Marca', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 8),
(100, 14, 'modelo', 'text', 'Modelo', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 9),
(101, 14, 'chasis', 'text', 'Chasis', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 10),
(102, 14, 'lugar_id', 'text', 'Lugar Id', 0, 0, 1, 1, 1, 1, NULL, 11),
(103, 14, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 12),
(104, 14, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(105, 15, 'id', 'text', 'Id', 1, 1, 0, 0, 0, 0, NULL, 1),
(109, 15, 'localidad', 'text_area', 'Localidad', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 5),
(110, 15, 'referencia', 'text_area', 'Referencia', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 6),
(111, 15, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 7),
(112, 15, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 8),
(113, 16, 'id', 'text', 'Id', 1, 1, 0, 0, 0, 0, NULL, 1),
(117, 16, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 5),
(118, 16, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 6),
(119, 6, 'pedido_belongsto_proveedore_relationship', 'relationship', 'proveedor', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Proveedore\",\"table\":\"proveedores\",\"type\":\"belongsTo\",\"column\":\"proveedor_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"categorias\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4),
(120, 6, 'pedido_belongsto_pago_relationship', 'relationship', 'Tipo de Pago', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Pago\",\"table\":\"pagos\",\"type\":\"belongsTo\",\"column\":\"pago_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"categorias\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(121, 6, 'pedido_belongsto_tipo_relationship', 'relationship', 'tipos', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Tipo\",\"table\":\"tipos\",\"type\":\"belongsTo\",\"column\":\"tipo_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"categorias\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6),
(122, 6, 'pedido_belongsto_proyecto_relationship', 'relationship', 'proyecto', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Proyecto\",\"table\":\"proyectos\",\"type\":\"belongsTo\",\"column\":\"proyecto_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"categorias\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(124, 8, 'imagen', 'image', 'Imagen', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 8),
(134, 18, 'id', 'text', 'Id', 1, 1, 0, 0, 0, 0, NULL, 1),
(135, 18, 'nombre', 'text', 'Nombre', 0, 1, 1, 1, 1, 1, NULL, 2),
(136, 18, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(137, 18, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(138, 6, 'pedido_belongsto_estado_relationship', 'relationship', 'estados', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Estado\",\"table\":\"estados\",\"type\":\"belongsTo\",\"column\":\"estado_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"categorias\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(139, 6, 'estado_id', 'text', 'Estado Id', 0, 1, 1, 1, 1, 1, NULL, 21),
(140, 6, 'literal', 'text', 'Literal', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 12),
(141, 11, 'item_belongsto_categoria_relationship', 'relationship', 'categorias', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Categoria\",\"table\":\"categorias\",\"type\":\"belongsTo\",\"column\":\"categoria_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"categorias\",\"pivot\":\"0\",\"taggable\":\"0\"}', 1),
(142, 11, 'item_belongsto_unidade_relationship', 'relationship', 'unidades', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Unidade\",\"table\":\"unidades\",\"type\":\"belongsTo\",\"column\":\"unidad_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"categorias\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(143, 11, 'imagen', 'image', 'Imagen', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 9),
(145, 6, 'pedido_belongstomany_item_relationship', 'relationship', 'items', 0, 0, 1, 1, 1, 1, '{\"model\":\"App\\\\Item\",\"table\":\"items\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"detalle_pedidos\",\"pivot\":\"1\",\"taggable\":\"0\"}', 22),
(146, 11, 'cantidad', 'text', 'Cantidad', 0, 0, 0, 0, 0, 0, NULL, 9),
(147, 11, 'precio', 'number', 'Precio', 0, 0, 0, 0, 0, 0, NULL, 10),
(148, 18, 'descripcion', 'text_area', 'Descripcion', 0, 1, 1, 1, 1, 1, NULL, 5),
(149, 8, 'estado', 'checkbox', 'Estado', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 7),
(150, 18, 'color', 'text', 'Color', 0, 1, 1, 1, 1, 1, NULL, 6),
(151, 19, 'id', 'text', 'Id', 1, 1, 0, 0, 0, 0, NULL, 1),
(152, 19, 'nombre', 'text', 'Nombre', 0, 1, 1, 1, 1, 1, NULL, 2),
(153, 19, 'descrcipcion', 'text_area', 'Descrcipcion', 0, 1, 1, 1, 1, 1, NULL, 3),
(154, 19, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 4),
(155, 19, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(156, 20, 'id', 'text', 'Id', 1, 1, 0, 0, 0, 0, NULL, 1),
(159, 20, 'nit', 'text', 'Nit', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 4),
(160, 20, 'direccion', 'text', 'Direccion', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 5),
(161, 20, 'telefono_movil', 'text', 'Telefono Movil', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 6),
(162, 20, 'telefono_fijo', 'text', 'Telefono Fijo', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 7),
(163, 20, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 8),
(164, 20, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 9),
(165, 21, 'id', 'text', 'Id', 1, 1, 0, 0, 0, 0, NULL, 1),
(166, 21, 'nombre', 'text', 'Nombre', 0, 1, 1, 1, 1, 1, NULL, 2),
(167, 21, 'representante', 'text', 'Representante', 0, 1, 1, 1, 1, 1, NULL, 3),
(168, 21, 'direccion', 'text_area', 'Direccion', 0, 0, 1, 1, 1, 1, NULL, 4),
(169, 21, 'telefono_movil', 'text', 'Telefono Movil', 0, 1, 1, 1, 1, 1, NULL, 5),
(170, 21, 'telefono_fijo', 'text', 'Telefono Fijo', 0, 0, 1, 1, 1, 1, NULL, 6),
(171, 21, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 7),
(172, 21, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 8),
(173, 22, 'id', 'text', 'Id', 1, 1, 0, 0, 0, 0, NULL, 1),
(174, 22, 'solicitud_id', 'text', 'Solicitud Id', 0, 0, 1, 1, 1, 1, NULL, 3),
(175, 22, 'observacion', 'text_area', 'Observacion', 0, 0, 1, 1, 1, 1, NULL, 4),
(176, 22, 'users_id', 'text', 'Users Id', 0, 0, 0, 0, 0, 0, NULL, 5),
(177, 22, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 6),
(178, 22, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(179, 23, 'id', 'text', 'Id', 1, 1, 0, 0, 0, 0, NULL, 1),
(180, 23, 'cliente_id', 'text', 'Cliente Id', 0, 0, 1, 1, 1, 1, NULL, 3),
(181, 23, 'total', 'text', 'Total', 0, 1, 1, 1, 1, 1, NULL, 6),
(182, 23, 'fecha_entrega', 'date', 'Fecha Entrega', 0, 1, 1, 1, 1, 1, NULL, 4),
(183, 23, 'direccion_entrega', 'text_area', 'Direccion Entrega', 0, 0, 1, 1, 1, 1, NULL, 5),
(184, 23, 'latitud', 'text', 'Latitud', 0, 0, 0, 0, 0, 0, NULL, 7),
(185, 23, 'longitud', 'text', 'Longitud', 0, 0, 0, 0, 0, 0, NULL, 8),
(186, 23, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 9),
(187, 23, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 10),
(188, 24, 'id', 'text', 'Id', 1, 1, 0, 0, 0, 0, NULL, 1),
(189, 24, 'monto', 'number', 'Monto', 0, 1, 1, 1, 1, 1, NULL, 4),
(190, 24, 'proyecto_id', 'text', 'Proyecto Id', 0, 0, 1, 1, 1, 1, NULL, 5),
(191, 24, 'empresa_id', 'text', 'Empresa Id', 0, 0, 1, 1, 1, 1, NULL, 6),
(192, 24, 'user_id', 'text', 'User Id', 0, 0, 0, 0, 0, 0, NULL, 7),
(193, 24, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 8),
(194, 24, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 9),
(195, 24, 'detalle', 'text_area', 'Detalle', 0, 0, 1, 1, 1, 1, NULL, 10),
(196, 25, 'id', 'text', 'Id', 1, 1, 0, 0, 0, 0, NULL, 1),
(197, 25, 'nombre', 'text', 'Nombre', 0, 1, 1, 1, 1, 1, NULL, 2),
(198, 25, 'descripcion', 'text_area', 'Descripcion', 0, 1, 1, 1, 1, 1, NULL, 3),
(199, 25, 'clasificacion_id', 'text', 'Clasificacion Id', 0, 0, 1, 1, 1, 1, NULL, 4),
(200, 25, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 5),
(201, 25, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 6),
(202, 24, 'ingreso_belongsto_empresa_relationship', 'relationship', 'empresas', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Empresa\",\"table\":\"empresas\",\"type\":\"belongsTo\",\"column\":\"empresa_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"categorias\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(203, 24, 'ingreso_belongsto_proyecto_relationship', 'relationship', 'proyectos', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Proyecto\",\"table\":\"proyectos\",\"type\":\"belongsTo\",\"column\":\"proyecto_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"categorias\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(204, 20, 'imagen', 'image', 'Imagen', 0, 0, 1, 1, 1, 1, NULL, 10),
(205, 23, 'solicitude_belongsto_cliente_relationship', 'relationship', 'cliente', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Cliente\",\"table\":\"clientes\",\"type\":\"belongsTo\",\"column\":\"cliente_id\",\"key\":\"id\",\"label\":\"nombre_completo\",\"pivot_table\":\"categorias\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(206, 25, 'mateiale_belongsto_clasificacione_relationship', 'relationship', 'clasificaciones', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Clasificacione\",\"table\":\"clasificaciones\",\"type\":\"belongsTo\",\"column\":\"clasificacion_id\",\"key\":\"nombre\",\"label\":\"id\",\"pivot_table\":\"categorias\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(207, 27, 'id', 'text', 'Id', 1, 1, 0, 0, 0, 0, NULL, 1),
(208, 27, 'nombre', 'text', 'Nombre', 0, 1, 1, 1, 1, 1, NULL, 3),
(209, 27, 'descripcion', 'text_area', 'Descripcion', 0, 1, 1, 1, 1, 1, NULL, 4),
(210, 27, 'clasificacion_id', 'text', 'Clasificacion Id', 0, 0, 1, 1, 1, 1, NULL, 5),
(211, 27, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 6),
(212, 27, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(213, 27, 'imagen', 'image', 'Imagen', 0, 0, 1, 1, 1, 1, NULL, 8),
(214, 27, 'materiale_belongsto_clasificacione_relationship', 'relationship', 'clasificaciones', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Clasificacione\",\"table\":\"clasificaciones\",\"type\":\"belongsTo\",\"column\":\"clasificacion_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"categorias\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(215, 20, 'nombre_completo', 'text', 'Nombre Completo', 0, 1, 1, 1, 1, 1, NULL, 2),
(217, 23, 'solicitude_belongstomany_materiale_relationship', 'relationship', 'materiales', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Materiale\",\"table\":\"materiales\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"detalle_materiales\",\"pivot\":\"1\",\"taggable\":null}', 11),
(218, 22, 'venta_belongsto_solicitude_relationship', 'relationship', 'solicitudes', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Solicitude\",\"table\":\"solicitudes\",\"type\":\"belongsTo\",\"column\":\"solicitud_id\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"categorias\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(219, 16, 'nombre_completo', 'text', 'Nombre Completo', 0, 1, 1, 1, 1, 1, NULL, 2),
(220, 16, 'licencia', 'text', 'Licencia', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 3),
(221, 16, 'categoria', 'text', 'Categoria', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 6),
(222, 16, 'carnet', 'text', 'Carnet', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 7),
(223, 16, 'imagen', 'image', 'Imagen', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 8),
(224, 14, 'chofer_id', 'text', 'Chofer Id', 0, 0, 1, 1, 1, 1, NULL, 6),
(225, 14, 'maquinaria_belongsto_chofere_relationship', 'relationship', 'choferes', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Chofere\",\"table\":\"choferes\",\"type\":\"belongsTo\",\"column\":\"chofer_id\",\"key\":\"id\",\"label\":\"nombre_completo\",\"pivot_table\":\"categorias\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(226, 14, 'imagen', 'image', 'Imagen', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 14),
(227, 14, 'maquinaria_belongsto_lugare_relationship', 'relationship', 'lugares', 0, 0, 1, 1, 1, 1, '{\"model\":\"App\\\\Lugare\",\"table\":\"lugares\",\"type\":\"belongsTo\",\"column\":\"lugar_id\",\"key\":\"id\",\"label\":\"localidad\",\"pivot_table\":\"categorias\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4),
(228, 12, 'abrev', 'text', 'Abreviacion', 0, 1, 1, 1, 1, 1, NULL, 2),
(229, 14, 'nombre', 'text', 'Nombre', 0, 1, 1, 1, 1, 1, NULL, 2),
(230, 11, 'maquinaria_id', 'text', 'Maquinaria Id', 0, 0, 0, 0, 0, 0, NULL, 11),
(231, 11, 'aux_id', 'text', 'Aux Id', 0, 0, 0, 0, 0, 0, NULL, 12),
(232, 27, 'precio', 'number', 'Precio', 0, 1, 1, 1, 1, 1, NULL, 8),
(233, 27, 'cantidad', 'text', 'Cantidad', 1, 0, 0, 0, 0, 0, NULL, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null}', '2018-07-21 10:11:12', '2018-08-14 02:46:24'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2018-07-21 10:11:12', '2018-07-21 10:11:12'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2018-07-21 10:11:12', '2018-07-21 10:11:12'),
(4, 'permissions', 'permissions', 'Permission', 'Permissions', NULL, 'App\\Permission', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null}', '2018-07-29 21:13:17', '2018-07-29 21:13:17'),
(5, 'proyectos', 'proyectos', 'Proyecto', 'Proyectos', 'voyager-paperclip', 'App\\Proyecto', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null}', '2018-07-29 21:26:03', '2018-07-31 01:20:46'),
(6, 'pedidos', 'pedidos', 'Pedido', 'Pedidos', 'voyager-basket', 'App\\Pedido', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null}', '2018-07-29 21:31:17', '2018-07-31 01:36:05'),
(7, 'tipos', 'tipos', 'Tipo', 'Tipos', NULL, 'App\\Tipo', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-07-29 21:34:59', '2018-07-29 21:34:59'),
(8, 'proveedores', 'proveedores', 'Proveedore', 'Proveedores', 'voyager-boat', 'App\\Proveedore', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null}', '2018-07-29 21:37:03', '2018-07-31 02:12:01'),
(9, 'pagos', 'pagos', 'Pago', 'Pagos', NULL, 'App\\Pago', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null}', '2018-07-29 21:38:00', '2018-07-29 21:38:00'),
(11, 'items', 'items', 'Item', 'Items', 'voyager-harddrive', 'App\\Item', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null}', '2018-07-29 21:51:09', '2018-07-31 02:51:40'),
(12, 'unidades', 'unidades', 'Unidade', 'Unidades', NULL, 'App\\Unidade', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-07-29 21:56:44', '2018-07-29 21:56:44'),
(13, 'categorias', 'categorias', 'Categoria', 'Categorias', NULL, 'App\\Categoria', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-07-29 21:58:10', '2018-07-29 21:58:10'),
(14, 'maquinarias', 'maquinarias', 'Maquinaria', 'Maquinarias', 'voyager-rocket', 'App\\Maquinaria', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null}', '2018-07-29 22:11:23', '2018-08-06 03:25:34'),
(15, 'lugares', 'lugares', 'Lugare', 'Lugares', 'voyager-compass', 'App\\Lugare', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null}', '2018-07-29 22:13:34', '2018-08-06 03:35:12'),
(16, 'choferes', 'choferes', 'Chofere', 'Choferes', 'voyager-github', 'App\\Chofere', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null}', '2018-07-29 22:15:52', '2018-08-06 03:09:01'),
(18, 'estados', 'estados', 'Estado', 'Estados', 'voyager-settings', 'App\\Estado', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-07-31 02:36:54', '2018-08-03 03:33:16'),
(19, 'clasificaciones', 'clasificaciones', 'Clasificacione', 'Clasificaciones', NULL, 'App\\Clasificacione', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-08-04 20:09:56', '2018-08-04 20:09:56'),
(20, 'clientes', 'clientes', 'Cliente', 'Clientes', 'voyager-group', 'App\\Cliente', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null}', '2018-08-04 20:18:19', '2018-08-06 01:39:35'),
(21, 'empresas', 'empresas', 'Empresa', 'Empresas', NULL, 'App\\Empresa', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-08-04 20:19:18', '2018-08-04 20:19:18'),
(22, 'ventas', 'ventas', 'Venta', 'Ventas', 'voyager-shop', 'App\\Venta', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null}', '2018-08-04 20:20:22', '2018-08-06 02:41:55'),
(23, 'solicitudes', 'solicitudes', 'Solicitude', 'Solicitudes', 'voyager-basket', 'App\\Solicitude', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null}', '2018-08-04 20:21:54', '2018-08-06 02:05:57'),
(24, 'ingresos', 'ingresos', 'Ingreso', 'Ingresos', 'voyager-dollar', 'App\\Ingreso', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null}', '2018-08-04 20:26:13', '2018-08-06 01:19:31'),
(25, 'mateiales', 'mateiales', 'Mateial', 'Mateiales', NULL, 'App\\Mateiale', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null}', '2018-08-04 20:29:41', '2018-08-06 01:54:09'),
(27, 'materiales', 'materiales', 'Materiales', 'Materiales', 'voyager-list-add', 'App\\Materiale', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null}', '2018-08-06 02:00:24', '2018-08-06 02:11:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_materiales`
--

CREATE TABLE `detalle_materiales` (
  `id` int(10) UNSIGNED NOT NULL,
  `solicitude_id` int(11) NOT NULL,
  `materiale_id` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `bombeado` tinyint(1) NOT NULL DEFAULT '85'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `detalle_materiales`
--

INSERT INTO `detalle_materiales` (`id`, `solicitude_id`, `materiale_id`, `cantidad`, `created_at`, `updated_at`, `precio`, `bombeado`) VALUES
(1, 1, 1, NULL, NULL, NULL, NULL, 0),
(2, 1, 2, NULL, NULL, NULL, NULL, 0),
(3, 3, 4, 5, '2018-08-10 02:08:57', '2018-08-10 02:08:57', '25.00', 0),
(4, 3, 2, 5, '2018-08-10 02:08:57', '2018-08-10 02:08:57', '95.20', 0),
(5, 4, 4, 8, '2018-08-10 04:20:01', '2018-08-10 04:20:01', '25.00', 0),
(6, 4, 2, 9, '2018-08-10 04:20:01', '2018-08-10 04:20:01', '95.20', 0),
(7, 5, 3, 20, '2018-08-11 15:24:46', '2018-08-11 15:24:46', '45.00', 0),
(8, 5, 2, 2, '2018-08-11 15:24:47', '2018-08-11 15:24:47', '95.20', 0),
(9, 5, 1, 4, '2018-08-11 15:24:47', '2018-08-11 15:24:47', '55.45', 0),
(10, 6, 4, 12, '2018-08-11 20:07:04', '2018-08-11 20:07:04', '25.00', 0),
(11, 6, 2, 70, '2018-08-11 20:07:04', '2018-08-11 20:07:04', '95.20', 0),
(12, 6, 3, 10, '2018-08-11 20:07:04', '2018-08-11 20:07:04', '45.00', 0),
(13, 7, 4, 10, '2018-08-11 22:46:18', '2018-08-11 22:46:18', '25.00', 0),
(14, 15, 4, 2, '2018-08-15 03:02:08', '2018-08-15 03:02:08', '25.00', 85),
(15, 15, 2, 4, '2018-08-15 03:02:08', '2018-08-15 03:02:08', '95.20', 85),
(16, 16, 3, 5, '2018-08-15 03:02:09', '2018-08-15 03:02:09', '45.00', 85),
(17, 17, 1, 3, '2018-08-15 03:03:14', '2018-08-15 03:03:14', '55.45', 85),
(18, 18, 4, 10, '2018-08-15 03:05:00', '2018-08-15 03:05:00', '25.00', 85),
(19, 19, 4, 5, '2018-08-26 20:56:19', '2018-08-26 20:56:19', '25.00', 85),
(20, 19, 1, 10, '2018-08-26 20:56:19', '2018-08-26 20:56:19', '55.45', 85),
(21, 20, 3, 19, '2018-08-27 01:26:40', '2018-08-27 01:26:40', '45.00', 85),
(22, 20, 2, 10, '2018-08-27 01:26:40', '2018-08-27 01:26:40', '95.20', 85);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedidos`
--

CREATE TABLE `detalle_pedidos` (
  `id` int(10) UNSIGNED NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT '0',
  `precio` decimal(10,2) DEFAULT '0.00',
  `subtotal` double DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `maquinaria_id` int(11) DEFAULT NULL,
  `aux_id` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `detalle_pedidos`
--

INSERT INTO `detalle_pedidos` (`id`, `pedido_id`, `item_id`, `cantidad`, `precio`, `subtotal`, `created_at`, `updated_at`, `maquinaria_id`, `aux_id`) VALUES
(5, 10, 8, 20, '6.00', 110, '2018-08-03 20:55:33', '2018-08-03 20:55:33', NULL, NULL),
(6, 10, 6, 10, '4.00', 44, '2018-08-03 20:55:33', '2018-08-03 20:55:33', NULL, NULL),
(7, 11, 8, 40, '3.00', 120, '2018-08-03 21:31:20', '2018-08-03 21:31:20', NULL, NULL),
(8, 11, 2, 30, '4.00', 120, '2018-08-03 21:31:20', '2018-08-03 21:31:20', NULL, NULL),
(16, 12, 10, 10, '2.00', 20, '2018-08-05 23:43:03', '2018-08-05 23:43:03', NULL, NULL),
(17, 12, 8, 20, '4.00', 80, '2018-08-05 23:43:03', '2018-08-05 23:43:03', NULL, NULL),
(18, 12, 7, 40, '5.00', 200, '2018-08-05 23:43:03', '2018-08-05 23:43:03', NULL, NULL),
(22, 15, 1, 60, '10.00', 600, '2018-08-06 00:15:56', '2018-08-06 00:15:56', NULL, NULL),
(23, 15, 5, 30, '7.00', 207, '2018-08-06 00:15:56', '2018-08-06 00:15:56', NULL, NULL),
(24, 15, 6, 20, '2.00', 36, '2018-08-06 00:15:56', '2018-08-06 00:15:56', NULL, NULL),
(27, 9, 5, 30, '5.00', 141, '2018-08-06 00:29:57', '2018-08-06 00:29:57', NULL, NULL),
(28, 9, 6, 20, '6.00', 124, '2018-08-06 00:29:57', '2018-08-06 00:29:57', NULL, NULL),
(29, 14, 2, 50, '5.00', 260, '2018-08-06 00:42:55', '2018-08-06 00:42:55', NULL, NULL),
(30, 14, 3, 40, '4.00', 172, '2018-08-06 00:42:55', '2018-08-06 00:42:55', NULL, NULL),
(31, 14, 4, 35, '3.00', 115.5, '2018-08-06 00:42:55', '2018-08-06 00:42:55', NULL, NULL),
(37, 16, 10, 40, '3.00', 100, '2018-08-06 22:41:18', '2018-08-06 22:41:18', NULL, NULL),
(39, 17, 11, 10, '11.00', 105, '2018-08-06 22:53:18', '2018-08-06 22:53:18', NULL, NULL),
(40, 18, 10, 40, '3.00', 120, '2018-08-06 23:48:55', '2018-08-06 23:48:55', NULL, NULL),
(41, 18, 9, 30, '5.00', 150, '2018-08-06 23:48:55', '2018-08-06 23:48:55', NULL, NULL),
(42, 19, 4, 35, '3.00', 105, '2018-08-06 23:54:48', '2018-08-06 23:54:48', NULL, NULL),
(43, 19, 1, 60, '10.00', 600, '2018-08-06 23:54:48', '2018-08-06 23:54:48', NULL, NULL),
(44, 20, 9, 30, '5.00', 150, '2018-08-07 02:19:03', '2018-08-07 02:19:03', NULL, NULL),
(48, 22, 13, 246, '5.00', 1264.4399999999998, '2018-08-08 02:55:54', '2018-08-08 02:55:54', 3, NULL),
(54, 23, 11, 10, '11.00', 110, '2018-08-08 03:04:12', '2018-08-08 03:04:12', 3, NULL),
(55, 23, 10, 40, '3.00', 120, '2018-08-08 03:04:12', '2018-08-08 03:04:12', 3, NULL),
(56, 21, 13, 246, '4.00', 915.12, '2018-08-08 03:08:27', '2018-08-08 03:08:27', 2, NULL),
(60, 24, 13, 246, '3.72', 915.12, '2018-08-09 00:23:27', '2018-08-09 00:23:27', 2, 'wEevFPgGHn'),
(61, 24, 13, 246, '3.72', 915.12, '2018-08-09 00:23:27', '2018-08-09 00:23:27', 3, 'L0aIcHSY9R'),
(62, 24, 13, 246, '3.72', 915.12, '2018-08-09 00:23:27', '2018-08-09 00:23:27', 4, 'fwNEu1UIc9'),
(66, 25, 13, 246, '3.72', 915.12, '2018-08-09 00:32:17', '2018-08-09 00:32:17', 4, 'm7sY1cQPXa'),
(67, 25, 13, 246, '3.72', 915.12, '2018-08-09 00:32:17', '2018-08-09 00:32:17', 2, 'GkAmfgEVWt'),
(68, 25, 13, 246, '3.72', 915.12, '2018-08-09 00:32:17', '2018-08-09 00:32:17', 4, 'GM1FcyqktO'),
(69, 26, 10, 40, '3.00', 120, '2018-08-09 00:38:55', '2018-08-09 00:38:55', 3, 'o3rwyBdvbC'),
(70, 27, 11, 7, '11.01', 77.07, '2018-08-11 15:41:07', '2018-08-11 15:41:07', 1, 'WE6ihyADuT'),
(71, 27, 10, 41, '5.04', 206.64000000000001, '2018-08-11 15:41:07', '2018-08-11 15:41:07', 1, 'EVYWQIBpby'),
(72, 27, 13, 33, '3.72', 122.76, '2018-08-11 15:41:07', '2018-08-11 15:41:07', 1, 'y1x8dwjqf6'),
(73, 28, 9, 90, '5.04', 453.6, '2018-08-13 00:36:21', '2018-08-13 00:36:21', 4, 'GqodIUhu4r'),
(74, 28, 1, 40, '10.50', 420, '2018-08-13 00:36:21', '2018-08-13 00:36:21', 6, 'OECm2In8c3'),
(75, 13, 13, 33, '3.72', 122.76, '2018-08-13 01:20:15', '2018-08-13 01:20:15', 1, 'MDHXEh10sP'),
(76, 13, 11, 7, '11.01', 77.07, '2018-08-13 01:20:15', '2018-08-13 01:20:15', 1, 'BRfvcoIJNz'),
(77, 13, 10, 41, '5.04', 206.64000000000001, '2018-08-13 01:20:15', '2018-08-13 01:20:15', 1, 'ilPxKthMbT'),
(78, 13, 9, 90, '5.04', 453.6, '2018-08-13 01:20:15', '2018-08-13 01:20:15', 4, 'ZhJRfo391j'),
(79, 29, 13, 31, '3.80', 117.8, '2018-08-14 02:14:48', '2018-08-14 02:14:48', 5, 'ixWBplebgm'),
(80, 29, 14, 10, '65.50', 655, '2018-08-14 02:14:48', '2018-08-14 02:14:48', 1, 'EzgoPnYTcw'),
(89, 32, 15, 10, '0.00', 0, '2018-08-15 02:16:22', '2018-08-15 02:16:22', 1, 'TEZkhB1rYN'),
(90, 32, 13, 34, '3.80', 129.2, '2018-08-15 02:16:22', '2018-08-15 02:16:22', 4, 's8Eo3TINnc'),
(91, 32, 15, 9, '12.00', 108, '2018-08-15 02:16:22', '2018-08-15 02:16:22', 1, 'Dl5hb16G9C'),
(93, 30, 10, 41, '5.04', 206.64000000000001, '2018-08-15 02:20:42', '2018-08-15 02:20:42', 1, '7d3a5poBG2'),
(94, 31, 13, 31, '3.80', 117.8, '2018-08-15 02:23:27', '2018-08-15 02:23:27', 5, 'AUJVs528gw'),
(95, 33, 15, 1, '12.00', 12, '2018-08-15 02:24:13', '2018-08-15 02:24:13', 1, 'lgpXvkbLiu'),
(96, 34, 15, 1, '12.00', 12, '2018-08-15 02:40:26', '2018-08-15 02:40:26', 1, 'W81pMmUCzP'),
(97, 34, 1, 40, '10.50', 420, '2018-08-15 02:40:26', '2018-08-15 02:40:26', 6, 'lkJdD3XxFe'),
(98, 35, 9, 90, '5.04', 453.6, '2018-08-15 02:46:06', '2018-08-15 02:46:06', 4, 'sQv1KTeqzW'),
(99, 35, 6, 20, '6.00', 120, '2018-08-15 02:46:06', '2018-08-15 02:46:06', 1, 'Zr53tM0n9I'),
(100, 36, 4, 35, '3.00', 105, '2018-08-15 03:13:09', '2018-08-15 03:13:09', 1, 'VrWP3BMiZt'),
(101, 36, 9, 90, '5.04', 453.6, '2018-08-15 03:13:09', '2018-08-15 03:13:09', 4, 'cs8CM4rE0t');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `representante` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono_movil` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono_fijo` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`id`, `nombre`, `representante`, `direccion`, `telefono_movil`, `telefono_fijo`, `created_at`, `updated_at`) VALUES
(1, 'UAB-JB', 'Luis flores', 'Calle', '2344234', '234234', '2018-08-07 01:29:22', '2018-08-09 00:55:30'),
(2, 'Alcaldia Municipal', 'Juan david', 'zona san julian', '25555', '55555', '2018-08-09 00:56:06', '2018-08-09 00:56:06'),
(3, 'Gobierno Autonomo del Beni', 'Alex Ferrier', 'Zona villa marin', '25552', '22452', '2018-08-09 00:57:00', '2018-08-09 00:57:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envios`
--

CREATE TABLE `envios` (
  `id` int(10) UNSIGNED NOT NULL,
  `detalle` text COLLATE utf8_unicode_ci,
  `solicitud_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `envios`
--

INSERT INTO `envios` (`id`, `detalle`, `solicitud_id`, `created_at`, `updated_at`) VALUES
(1, 'primer envio', 19, '2018-08-27 00:43:51', '2018-08-27 00:43:51'),
(8, NULL, NULL, '2018-08-27 00:51:43', '2018-08-27 00:51:43'),
(9, 'segundo envio', 19, '2018-08-27 00:53:13', '2018-08-27 00:53:13'),
(10, 'tercer envio', 19, '2018-08-27 01:18:35', '2018-08-27 01:18:35'),
(11, 'Item # : H8, H17\r\nCantidad : 10, 5\r\nPrimer envio del 50%', 20, '2018-08-27 01:36:40', '2018-08-27 01:36:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `descripcion` text COLLATE utf8_unicode_ci,
  `color` char(20) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`id`, `nombre`, `created_at`, `updated_at`, `descripcion`, `color`) VALUES
(1, 'en borrador', '2018-07-31 02:39:00', '2018-08-03 21:40:28', 'estado del pedido en borrador o elaboración', 'label label-success'),
(2, 'para aprobación', '2018-08-03 03:31:58', '2018-08-14 01:48:03', 'pedido en estado de revisión y aprobación del jefe', 'label label-info'),
(3, 'rechazado', '2018-08-03 03:32:17', '2018-08-14 01:48:55', 'estado del pedido rechazado.', 'label label-danger'),
(4, 'elaboración', '2018-08-03 03:34:48', '2018-08-14 01:47:16', 'estado para elaboracion del pago. previo a contabilizar', 'label label-warning'),
(5, 'finalizado', '2018-08-03 03:34:58', '2018-08-14 01:46:22', 'pedido finalizado.', 'label label-default'),
(6, 'contabilizar', '2018-08-14 01:45:02', '2018-08-14 01:48:27', 'estado para registrar en contabilidad.', 'label label-success');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados_cambios`
--

CREATE TABLE `estados_cambios` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `estado_id` int(11) DEFAULT NULL,
  `pedido_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `estados_cambios`
--

INSERT INTO `estados_cambios` (`id`, `user_id`, `estado_id`, `pedido_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 20, '2018-08-07 02:19:03', '2018-08-07 02:19:03'),
(2, 6, 2, 21, '2018-08-08 02:18:52', '2018-08-08 02:18:52'),
(3, 3, 3, 21, '2018-08-08 02:22:09', '2018-08-08 02:22:09'),
(4, 6, 2, 21, '2018-08-08 02:48:06', '2018-08-08 02:48:06'),
(5, 3, 3, 21, '2018-08-08 02:48:46', '2018-08-08 02:48:46'),
(6, 6, 2, 21, '2018-08-08 02:55:07', '2018-08-08 02:55:07'),
(7, 3, 3, 21, '2018-08-08 02:56:18', '2018-08-08 02:56:18'),
(8, 6, 2, 21, '2018-08-08 02:56:37', '2018-08-08 02:56:37'),
(9, 6, 2, 23, '2018-08-08 03:00:15', '2018-08-08 03:00:15'),
(10, 3, 3, 23, '2018-08-08 03:01:17', '2018-08-08 03:01:17'),
(11, 6, 2, 23, '2018-08-08 03:01:44', '2018-08-08 03:01:44'),
(12, 3, 3, 23, '2018-08-08 03:02:50', '2018-08-08 03:02:50'),
(13, 6, 2, 23, '2018-08-08 03:04:12', '2018-08-08 03:04:12'),
(14, 3, 4, 23, '2018-08-08 03:05:36', '2018-08-08 03:05:36'),
(15, 3, 3, 21, '2018-08-08 03:06:18', '2018-08-08 03:06:18'),
(16, 6, 2, 21, '2018-08-08 03:08:27', '2018-08-08 03:08:27'),
(17, 6, 2, 24, '2018-08-09 00:23:27', '2018-08-09 00:23:27'),
(18, 6, 2, 25, '2018-08-09 00:30:47', '2018-08-09 00:30:47'),
(19, 3, 3, 25, '2018-08-09 00:31:49', '2018-08-09 00:31:49'),
(20, 6, 2, 25, '2018-08-09 00:32:17', '2018-08-09 00:32:17'),
(21, 3, 4, 25, '2018-08-09 00:33:04', '2018-08-09 00:33:04'),
(22, 3, 2, 13, '2018-08-13 01:20:15', '2018-08-13 01:20:15'),
(23, 8, 2, 29, '2018-08-14 02:14:48', '2018-08-14 02:14:48'),
(24, 3, 4, 29, '2018-08-14 02:23:45', '2018-08-14 02:23:45'),
(25, 1, 5, 29, '2018-08-14 04:41:44', '2018-08-14 04:41:44'),
(26, 1, 5, 29, '2018-08-14 04:42:19', '2018-08-14 04:42:19'),
(27, 9, 2, 33, '2018-08-15 02:16:20', '2018-08-15 02:16:20'),
(28, 10, 2, 32, '2018-08-15 02:16:22', '2018-08-15 02:16:22'),
(29, 11, 2, 31, '2018-08-15 02:20:28', '2018-08-15 02:20:28'),
(30, 11, 2, 30, '2018-08-15 02:20:42', '2018-08-15 02:20:42'),
(31, 3, 3, 31, '2018-08-15 02:21:57', '2018-08-15 02:21:57'),
(32, 3, 3, 33, '2018-08-15 02:22:17', '2018-08-15 02:22:17'),
(33, 11, 2, 31, '2018-08-15 02:23:28', '2018-08-15 02:23:28'),
(34, 9, 2, 33, '2018-08-15 02:24:13', '2018-08-15 02:24:13'),
(35, 3, 4, 32, '2018-08-15 02:25:27', '2018-08-15 02:25:27'),
(36, 3, 4, 31, '2018-08-15 02:25:39', '2018-08-15 02:25:39'),
(37, 3, 4, 33, '2018-08-15 02:25:46', '2018-08-15 02:25:46'),
(38, 3, 4, 30, '2018-08-15 02:25:53', '2018-08-15 02:25:53'),
(39, 3, 4, 24, '2018-08-15 02:26:32', '2018-08-15 02:26:32'),
(40, 3, 4, 21, '2018-08-15 02:26:42', '2018-08-15 02:26:42'),
(41, 3, 4, 20, '2018-08-15 02:27:30', '2018-08-15 02:27:30'),
(42, 5, 6, 31, '2018-08-15 02:29:19', '2018-08-15 02:29:19'),
(43, 9, 5, 31, '2018-08-15 02:36:53', '2018-08-15 02:36:53'),
(44, 9, 2, 34, '2018-08-15 02:40:26', '2018-08-15 02:40:26'),
(45, 9, 2, 35, '2018-08-15 02:46:06', '2018-08-15 02:46:06'),
(46, 9, 2, 36, '2018-08-15 03:13:09', '2018-08-15 03:13:09'),
(47, 3, 4, 36, '2018-08-15 03:19:12', '2018-08-15 03:19:12'),
(48, 3, 4, 35, '2018-08-15 03:19:20', '2018-08-15 03:19:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos`
--

CREATE TABLE `ingresos` (
  `id` int(10) UNSIGNED NOT NULL,
  `monto` decimal(10,0) DEFAULT NULL,
  `proyecto_id` int(11) DEFAULT NULL,
  `empresa_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `detalle` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ingresos`
--

INSERT INTO `ingresos` (`id`, `monto`, `proyecto_id`, `empresa_id`, `user_id`, `created_at`, `updated_at`, `detalle`) VALUES
(1, '20000', 4, 1, NULL, '2018-08-08 03:17:54', '2018-08-08 03:17:54', 'primer pago'),
(2, '230000', 2, 3, NULL, '2018-08-09 00:50:58', '2018-08-09 00:57:21', 'pagos de 10%'),
(3, '120000', 3, 2, NULL, '2018-08-09 00:51:58', '2018-08-09 00:57:36', 'primera mensualidad'),
(4, '32000', 4, 1, NULL, '2018-08-09 00:59:07', '2018-08-09 00:59:07', 'segundo pago'),
(5, '6000', 1, 3, NULL, '2018-08-09 04:21:07', '2018-08-09 04:21:07', 'Pago de la prima');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `items`
--

CREATE TABLE `items` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8_unicode_ci,
  `categoria_id` int(11) DEFAULT NULL,
  `unidad_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `imagen` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `maquinaria_id` int(11) DEFAULT '1',
  `aux_id` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `items`
--

INSERT INTO `items` (`id`, `nombre`, `descripcion`, `categoria_id`, `unidad_id`, `created_at`, `updated_at`, `imagen`, `cantidad`, `precio`, `maquinaria_id`, `aux_id`) VALUES
(1, 'Item 1', 'Descripcion del item 1', 1, 1, '2018-07-31 02:54:25', '2018-07-31 02:54:25', NULL, 40, '10.50', 6, 'lkJdD3XxFe'),
(2, 'Item 2', 'Descripcion del item 2', 1, 1, '2018-07-31 02:55:33', '2018-07-31 03:25:06', NULL, 50, '5.00', 1, '6yr9FnhqET'),
(3, 'Item 3', 'Descripcion del item 3', 1, 1, '2018-07-31 03:24:56', '2018-07-31 03:24:56', NULL, 40, '4.00', 1, NULL),
(4, 'Item 4', 'Descripcion del Item 4', 1, 1, '2018-07-31 03:25:30', '2018-07-31 03:25:30', NULL, 35, '3.00', 1, 'VrWP3BMiZt'),
(5, 'Items 5', 'Descripcion del Items 5', 1, 1, '2018-08-02 00:36:00', '2018-08-02 00:36:00', NULL, 30, '5.00', 1, 'cuGRBVYidh'),
(6, 'Items 6', 'Descrcipcion items 6', 2, 1, '2018-08-02 03:01:43', '2018-08-02 03:01:43', NULL, 20, '6.00', 1, 'Zr53tM0n9I'),
(7, 'items 7', 'sin descripción', 2, 1, '2018-08-03 02:52:45', '2018-08-03 02:52:45', NULL, 40, '5.00', 1, NULL),
(8, 'items 8', 'sin descripción', 2, 1, '2018-08-03 20:40:12', '2018-08-03 20:40:12', NULL, 20, '4.00', 1, NULL),
(9, 'item 9', 'sin descripción', 1, 1, '2018-08-04 01:38:02', '2018-08-04 01:38:02', NULL, 90, '5.04', 4, 'cs8CM4rE0t'),
(10, 'Kit de Herramientas', 'sin descripción', 1, 1, '2018-08-04 01:44:49', '2018-08-04 20:47:45', NULL, 41, '5.04', 1, 'GBD9upyC52'),
(11, 'aceite', 'sin descripción', 1, 1, '2018-08-06 22:31:21', '2018-08-06 22:31:21', NULL, 7, '11.01', 1, 'QhkHrny8Ko'),
(13, 'Diesel', 'sin descripción', 1, 2, '2018-08-08 02:03:24', '2018-08-08 02:03:24', NULL, 31, '3.80', 5, 'iMP7q5Lwyv'),
(14, 'llave de mano', 'sin descripción', 2, 5, '2018-08-14 02:13:54', '2018-08-14 02:13:54', NULL, 10, '65.50', 1, 'hlUWLVZru9'),
(15, 'recivos', 'sin descripción', 3, 6, '2018-08-15 02:11:42', '2018-08-15 02:11:42', NULL, 1, '12.00', 1, 'W81pMmUCzP');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lugares`
--

CREATE TABLE `lugares` (
  `id` int(10) UNSIGNED NOT NULL,
  `localidad` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `referencia` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `lugares`
--

INSERT INTO `lugares` (`id`, `localidad`, `referencia`, `created_at`, `updated_at`) VALUES
(1, 'Itenes - san romon', 'en la casa de miguel', '2018-08-06 03:42:52', '2018-08-06 03:42:52'),
(2, 'TURIMIX', NULL, '2018-08-08 01:30:59', '2018-08-08 01:30:59'),
(3, 'TUR-GUARAYO', NULL, '2018-08-08 01:31:23', '2018-08-08 01:31:23'),
(4, 'SAN RAMON', NULL, '2018-08-08 01:31:43', '2018-08-08 01:31:43'),
(5, 'GUAYARAMERIN', NULL, '2018-08-08 01:31:59', '2018-08-08 01:31:59'),
(6, 'ELEVO-TRINIDAD', NULL, '2018-08-08 01:32:19', '2018-08-08 01:32:19'),
(7, 'PLANTA H TDD', NULL, '2018-08-08 01:32:40', '2018-08-08 01:32:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maquinarias`
--

CREATE TABLE `maquinarias` (
  `id` int(10) UNSIGNED NOT NULL,
  `codigo` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chofer_id` int(11) DEFAULT NULL,
  `placa` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `marca` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modelo` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chasis` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lugar_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `imagen` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `maquinarias`
--

INSERT INTO `maquinarias` (`id`, `codigo`, `chofer_id`, `placa`, `marca`, `modelo`, `chasis`, `lugar_id`, `created_at`, `updated_at`, `imagen`, `nombre`) VALUES
(1, 'sin maquinaria', NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-08 00:47:02', '2018-08-08 00:48:17', NULL, NULL),
(2, 'VOL-VW-01', 3, '1358-GIT', 'VOLKSVAGEN', '23-210', 'LN280502EX9565', 4, '2018-08-08 01:37:55', '2018-08-08 01:41:10', NULL, 'VOLQUETA'),
(3, 'VOL-VV-02', 9, '1252-ULX', 'VOLVO', 'F-12', 'YV2H2FCC8DA026495', 4, '2018-08-08 01:43:01', '2018-08-08 01:43:01', NULL, 'VOLQUETA'),
(4, 'VOL-VV-03', 2, '732-FFE', 'VOLVO', 'N-12', 'YV2N2B4C7JA314861', 2, '2018-08-08 01:44:34', '2018-08-08 01:45:08', NULL, 'VOLQUETA'),
(5, 'VOL-VM-04', 9, '3165-NIH', 'VOLVO VM-310', 'VM-6X4R', '93KP0F0D9DE138879', 5, '2018-08-08 01:47:13', '2018-08-08 01:47:13', NULL, 'VOLQUETA'),
(6, 'VOL-VM-06', 9, '3615-DYI', 'VOLVO VM-310', 'VM-6X4R', '93KP0F0D5DE146340', 7, '2018-08-08 01:48:47', '2018-08-08 01:48:47', NULL, 'VOLQUETA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materiales`
--

CREATE TABLE `materiales` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8_unicode_ci,
  `clasificacion_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `imagen` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `bombeado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `materiales`
--

INSERT INTO `materiales` (`id`, `nombre`, `descripcion`, `clasificacion_id`, `created_at`, `updated_at`, `imagen`, `precio`, `cantidad`, `bombeado`) VALUES
(1, 'H21', 'Descripción del h 21', 1, '2018-08-06 02:17:18', '2018-08-10 04:16:40', NULL, '55.45', 0, 0),
(2, 'H17', 'Descripción del h17', 2, '2018-08-06 02:17:41', '2018-08-10 04:16:07', NULL, '95.20', 0, 0),
(3, 'H8', 'Descripcion hormigon3', 2, '2018-08-09 04:00:00', '2018-08-10 04:15:20', NULL, '45.00', 0, 0),
(4, 'H13', 'descripcion del material 4', 1, '2018-08-09 04:00:00', '2018-08-10 04:15:36', NULL, '25.00', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2018-07-21 10:11:12', '2018-07-21 10:11:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, 5, 1, '2018-07-21 10:11:12', '2018-07-21 06:24:11', 'voyager.media.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 4, '2018-07-21 10:11:12', '2018-08-08 01:27:20', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 2, '2018-07-21 10:11:12', '2018-07-21 06:24:11', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 3, '2018-07-21 10:11:12', '2018-07-21 06:24:11', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 4, '2018-07-21 10:11:12', '2018-07-21 06:24:11', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 5, '2018-07-21 10:11:12', '2018-07-21 06:24:11', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, 5, 7, '2018-07-21 10:11:12', '2018-07-21 06:24:11', 'voyager.settings.index', NULL),
(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 6, '2018-07-21 10:11:14', '2018-07-21 06:24:11', 'voyager.hooks', NULL),
(15, 1, 'Seguridad', '', '_self', 'voyager-lock', '#000000', NULL, 3, '2018-07-21 06:26:03', '2018-08-08 01:27:20', NULL, ''),
(16, 1, 'Gestiòn de Proyectos', '', '_self', 'voyager-data', '#000000', NULL, 1, '2018-07-21 06:27:02', '2018-08-08 01:27:20', NULL, ''),
(17, 1, 'Ventas de Hormigon', '', '_self', 'voyager-shop', '#000000', NULL, 2, '2018-07-21 06:27:41', '2018-08-08 01:27:20', NULL, ''),
(18, 1, 'Usuarios', '', '_self', NULL, '#000000', 15, 1, '2018-07-29 21:11:29', '2018-07-29 21:11:39', 'voyager.users.index', NULL),
(19, 1, 'Roles', '', '_self', NULL, '#000000', 15, 2, '2018-07-29 21:12:03', '2018-07-29 21:12:09', 'voyager.roles.index', NULL),
(21, 1, 'Permisos', '', '_self', NULL, '#000000', 15, 3, '2018-07-29 21:13:51', '2018-07-29 21:14:00', 'voyager.permissions.index', NULL),
(22, 1, 'Proyectos', '', '_self', NULL, NULL, 16, 3, '2018-07-29 21:26:03', '2018-08-03 04:20:13', 'voyager.proyectos.index', NULL),
(23, 1, 'Pedidos', '', '_self', NULL, NULL, 16, 4, '2018-07-29 21:31:18', '2018-08-03 04:20:14', 'voyager.pedidos.index', NULL),
(24, 1, 'Tipos', '', '_self', NULL, NULL, 16, 9, '2018-07-29 21:34:59', '2018-08-14 02:42:54', 'voyager.tipos.index', NULL),
(25, 1, 'Proveedores', '', '_self', NULL, NULL, 16, 10, '2018-07-29 21:37:03', '2018-08-14 02:42:54', 'voyager.proveedores.index', NULL),
(26, 1, 'Pagos', '', '_self', NULL, NULL, 16, 14, '2018-07-29 21:38:00', '2018-08-14 02:34:01', 'voyager.pagos.index', NULL),
(28, 1, 'Items', '', '_self', NULL, NULL, 16, 8, '2018-07-29 21:51:09', '2018-08-14 02:42:54', 'voyager.items.index', NULL),
(29, 1, 'Unidades', '', '_self', NULL, NULL, 16, 16, '2018-07-29 21:56:44', '2018-08-14 02:34:01', 'voyager.unidades.index', NULL),
(30, 1, 'Categorias', '', '_self', NULL, NULL, 16, 17, '2018-07-29 21:58:10', '2018-08-14 02:34:01', 'voyager.categorias.index', NULL),
(31, 1, 'Maquinarias', '', '_self', NULL, NULL, 16, 12, '2018-07-29 22:11:23', '2018-08-14 02:34:06', 'voyager.maquinarias.index', NULL),
(32, 1, 'Lugares', '', '_self', NULL, NULL, 16, 13, '2018-07-29 22:13:34', '2018-08-14 02:34:06', 'voyager.lugares.index', NULL),
(33, 1, 'Choferes', '', '_self', NULL, NULL, 16, 15, '2018-07-29 22:15:52', '2018-08-14 02:34:01', 'voyager.choferes.index', NULL),
(34, 1, 'Mis Pedidos', '', '_self', NULL, '#000000', 16, 1, '2018-07-30 01:04:47', '2018-07-30 02:09:04', 'pedidos.index', 'null'),
(36, 1, 'Estados', '', '_self', NULL, NULL, 15, 4, '2018-07-31 02:36:54', '2018-07-31 02:37:18', 'voyager.estados.index', NULL),
(37, 1, 'Pedidos en Cola', '', '_self', NULL, '#000000', 16, 2, '2018-08-03 04:19:29', '2018-08-03 04:20:13', 'pedidos.cola', NULL),
(38, 1, 'Clasificaciones', '', '_self', NULL, NULL, 17, 7, '2018-08-04 20:09:56', '2018-08-10 02:47:35', 'voyager.clasificaciones.index', NULL),
(39, 1, 'Clientes', '', '_self', NULL, NULL, 17, 5, '2018-08-04 20:18:19', '2018-08-10 02:47:35', 'voyager.clientes.index', NULL),
(40, 1, 'Empresas', '', '_self', NULL, NULL, 16, 11, '2018-08-04 20:19:19', '2018-08-14 02:42:54', 'voyager.empresas.index', NULL),
(41, 1, 'Ventas', '', '_self', NULL, NULL, 17, 3, '2018-08-04 20:20:22', '2018-08-08 01:27:20', 'voyager.ventas.index', NULL),
(42, 1, 'Solicitudes', '', '_self', NULL, NULL, 17, 2, '2018-08-04 20:21:54', '2018-08-08 01:27:20', 'voyager.solicitudes.index', NULL),
(43, 1, 'Ingresos', '', '_self', NULL, NULL, 16, 6, '2018-08-04 20:26:13', '2018-08-14 02:42:54', 'voyager.ingresos.index', NULL),
(45, 1, 'Materiales', '', '_self', NULL, NULL, 17, 6, '2018-08-06 02:00:24', '2018-08-10 02:47:35', 'voyager.materiales.index', NULL),
(46, 1, 'Consultas', '', '_self', NULL, '#000000', 16, 7, '2018-08-07 00:34:14', '2018-08-14 02:42:54', 'project.report', 'null'),
(47, 1, 'mis solicitudes', '', '_self', NULL, '#000000', 17, 1, '2018-08-08 01:27:08', '2018-08-08 01:27:20', 'solicitud.index', NULL),
(48, 1, 'Consultas', '', '_self', NULL, '#000000', 17, 4, '2018-08-10 02:47:20', '2018-08-10 02:47:35', 'sales.report', NULL),
(49, 1, 'Contabilizar', '', '_self', NULL, '#000000', 16, 5, '2018-08-14 02:33:50', '2018-08-14 02:43:05', 'pedidos.conta', 'null');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2016_01_01_000000_create_pages_table', 2),
(24, '2016_01_01_000000_create_posts_table', 2),
(25, '2016_02_15_204651_create_categories_table', 2),
(26, '2017_04_11_000000_alter_post_nullable_fields_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'Efectivo', 'Pago en Efectivo', '2018-07-31 02:21:38', '2018-08-04 04:34:22'),
(2, 'Transferencia de Bancaria', 'Pago por bancos', '2018-08-04 04:34:45', '2018-08-04 04:46:03'),
(3, 'Cheque', 'pago por cheque', '2018-08-04 04:35:15', '2018-08-04 04:45:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(10) UNSIGNED NOT NULL,
  `firma` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `referencia` text COLLATE utf8_unicode_ci,
  `estado_id` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `observacion` text COLLATE utf8_unicode_ci,
  `user_id` int(11) DEFAULT '1',
  `proveedor_id` int(11) DEFAULT NULL,
  `proyecto_id` int(11) DEFAULT NULL,
  `tipo_id` int(11) DEFAULT NULL,
  `pago_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `literal` text COLLATE utf8_unicode_ci,
  `datos` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `firma`, `referencia`, `estado_id`, `total`, `observacion`, `user_id`, `proveedor_id`, `proyecto_id`, `tipo_id`, `pago_id`, `created_at`, `updated_at`, `literal`, `datos`) VALUES
(9, 'settings/August2018/HwLzmUSVBAPX5XOy2ZMz.png', 'rrr', 3, 265, 'ooo', 1, 1, 1, 1, 1, '2018-08-03 02:31:02', '2018-08-06 00:29:57', '265,00 (Doscientos sesenta y cinco  00/100 Bolivianos)', NULL),
(10, 'settings/August2018/HwLzmUSVBAPX5XOy2ZMz.png', 'sin referencia.', 5, 154, 'sin observación.', 1, 1, 1, 1, 3, '2018-08-03 20:55:33', '2018-08-03 20:55:33', '154,00 (Ciento cincuenta y cuatro  00/100 Bolivianos)', 'Nombre Cheque : Juan Carlos paniagua\r\nBanco                   : Banco Union\r\nNª de Cheque .    : 2342345235'),
(11, 'settings/August2018/HwLzmUSVBAPX5XOy2ZMz.png', 'sin referencia.', 3, 240, 'sin observación.', 1, 2, 2, 2, NULL, '2018-08-03 21:31:20', '2018-08-03 21:31:20', '240,00 (Doscientos cuarenta  00/100 Bolivianos)', NULL),
(12, 'settings/August2018/HwLzmUSVBAPX5XOy2ZMz.png', 'sin referencia. update', 3, 300, 'sin observación. update', 1, 2, 2, 2, NULL, '2018-08-04 01:49:15', '2018-08-04 01:49:15', '300,00 (Trescientos  00/100 Bolivianos)', NULL),
(13, 'settings/August2018/HwLzmUSVBAPX5XOy2ZMz.png', 'sin referencia.', 2, 860.07, 'sin observación.', 3, 1, 2, 1, NULL, '2018-08-04 21:00:57', '2018-08-13 01:20:14', '860,07 (Ochocientos sesenta  07/100 Bolivianos)', NULL),
(14, 'settings/August2018/HwLzmUSVBAPX5XOy2ZMz.png', 'sin referencia.', 5, 547.5, 'sin observación.', 1, 2, 3, 2, 3, '2018-08-06 00:05:08', '2018-08-06 00:42:55', '547,50 (Quinientos cuarenta y siete  00/100 Bolivianos)', 'Nombre Cheque : jun Martin\r\nBanco                    :union\r\nNª de Cheque .    :43345345345'),
(15, 'settings/August2018/HwLzmUSVBAPX5XOy2ZMz.png', 'sin referencia.', 5, 843, 'sin observación.', 1, 1, 1, 1, 3, '2018-08-06 00:15:56', '2018-08-06 00:15:56', '843,00 (Ochocientos cuarenta y tres  00/100 Bolivianos)', 'Nombre Cheque : Juanito perez\r\nBanco                   : Union\r\nNª de Cheque .    :345345234'),
(16, 'settings/August2018/HwLzmUSVBAPX5XOy2ZMz.png', 'sin referencia.', 5, 100, 'sin observación.', 1, 2, 2, 2, 3, '2018-08-06 22:32:11', '2018-08-06 22:41:18', '100,00 (Cien  00/100 Bolivianos)', 'Nombre Cheque :\r\nBanco                   :\r\nNª de Cheque .    :'),
(17, 'settings/August2018/HwLzmUSVBAPX5XOy2ZMz.png', 'sin referencia.', 5, 105, 'sin observación.', 1, 1, 1, 1, 3, '2018-08-06 22:53:11', '2018-08-06 22:53:18', '105,00 (Ciento cinco  00/100 Bolivianos)', 'Nombre Cheque :\r\nBanco                   :\r\nNª de Cheque .    :'),
(18, 'settings/August2018/HwLzmUSVBAPX5XOy2ZMz.png', 'sin referencia.', 5, 270, 'sin observación.', 6, 2, 3, 1, 3, '2018-08-06 23:48:55', '2018-08-06 23:48:55', '270,00 (Doscientos setenta  00/100 Bolivianos)', 'Nombre Cheque :\r\nBanco                   :\r\nNª de Cheque .    :'),
(19, 'settings/August2018/HwLzmUSVBAPX5XOy2ZMz.png', 'sin referencia.', 5, 705, 'sin observación.', 6, 2, 2, 1, 3, '2018-08-06 23:54:48', '2018-08-06 23:54:48', '705,00 (Setecientos cinco  00/100 Bolivianos)', 'Nombre Cheque :\r\nBanco                   :\r\nNª de Cheque .    :'),
(20, 'settings/August2018/HwLzmUSVBAPX5XOy2ZMz.png', 'sin referencia.', 4, 150, 'sin observación.', 1, 2, 3, 2, NULL, '2018-08-07 02:19:03', '2018-08-07 02:19:03', '150,00 (Ciento cincuenta  00/100 Bolivianos)', NULL),
(21, 'settings/August2018/HwLzmUSVBAPX5XOy2ZMz.png', 'sin referencia.', 4, 915.12, 'sin observación.', 6, 2, 4, 2, NULL, '2018-08-08 02:18:51', '2018-08-08 03:08:26', '915,12 (Novecientos quince  12/100 Bolivianos)', NULL),
(22, 'settings/August2018/HwLzmUSVBAPX5XOy2ZMz.png', 'sin referencia.', 1, 1264.4399999999998, 'sin observación.', 1, 1, 1, 1, NULL, '2018-08-08 02:55:54', '2018-08-08 02:55:54', '1.264,44 (Mil doscientos sesenta y cuatro  44/100 Bolivianos)', NULL),
(23, 'settings/August2018/HwLzmUSVBAPX5XOy2ZMz.png', 'sin referencia.', 5, 230, 'sin observación.', 6, 2, 2, 2, 3, '2018-08-08 03:00:15', '2018-08-08 03:04:12', '230,00 (Doscientos treinta  00/100 Bolivianos)', 'Nombre Cheque : Julano de tal\r\nBanco                   : union\r\nNª de Cheque .    :3453453454'),
(24, 'settings/August2018/HwLzmUSVBAPX5XOy2ZMz.png', 'sin referencia.', 4, 2745.36, 'sin observación.', 6, 2, 4, 2, NULL, '2018-08-09 00:22:54', '2018-08-09 00:23:27', '2.745,36 (Dos mil setecientos cuarenta y cinco  36/100 Bolivianos)', NULL),
(25, 'settings/August2018/HwLzmUSVBAPX5XOy2ZMz.png', 'sin referencia.', 4, 2745.36, 'sin observación. completo', 6, 2, 4, 2, NULL, '2018-08-09 00:30:47', '2018-08-09 00:32:17', '2.745,36 (Dos mil setecientos cuarenta y cinco  36/100 Bolivianos)', NULL),
(26, 'settings/August2018/HwLzmUSVBAPX5XOy2ZMz.png', 'sin referencia.', 1, 120, 'sin observación.', 6, 2, 2, 1, NULL, '2018-08-09 00:38:55', '2018-08-09 00:38:55', '120,00 (Ciento veinte  00/100 Bolivianos)', NULL),
(27, 'settings/August2018/HwLzmUSVBAPX5XOy2ZMz.png', 'sin referencia.', 1, 406.47, 'sin observación.', 1, 1, 1, 1, NULL, '2018-08-11 15:41:06', '2018-08-11 15:41:06', '406,47 (Cuatrocientos seis  47/100 Bolivianos)', NULL),
(28, NULL, 'sin referencia.', 1, 873.6, 'sin observación.', 1, 1, 1, 1, NULL, '2018-08-13 00:36:21', '2018-08-13 00:36:21', '873,60 (Ochocientos setenta y tres  00/100 Bolivianos)', NULL),
(29, NULL, 'sin referencia.', 5, 772.8, 'sin observación.', 8, 1, 1, 1, 3, '2018-08-14 02:14:48', '2018-08-14 02:14:48', '772,80 (Setecientos setenta y dos  00/100 Bolivianos)', 'Nombre Cheque :\r\nBanco                   :\r\nNª de Cheque .    :'),
(30, NULL, 'sin referencia.', 4, 206.64000000000001, 'sin observación.', 11, 2, 1, 2, NULL, '2018-08-15 02:12:38', '2018-08-15 02:20:42', '206,64 (Doscientos seis  64/100 Bolivianos)', NULL),
(31, NULL, 'sin referencia.', 5, 117.8, 'sin observación.', 11, 1, 1, 1, 2, '2018-08-15 02:14:36', '2018-08-15 02:23:27', '117,80 (Ciento diecisiete  00/100 Bolivianos)', 'Nombre Cheque :\r\nBanco                   :\r\nNª de Cheque .    :'),
(32, NULL, 'sin referencia.', 4, 237.2, 'sin observación.', 10, 5, 5, 1, NULL, '2018-08-15 02:14:47', '2018-08-15 02:16:22', '237,20 (Doscientos treinta y siete  00/100 Bolivianos)', NULL),
(33, NULL, 'sin referencia.', 4, 12, 'sin observación.', 9, 5, 1, 1, NULL, '2018-08-15 02:16:05', '2018-08-15 02:24:13', '12,00 (Doce  00/100 Bolivianos)', NULL),
(34, NULL, 'sin referencia.', 2, 432, 'Pago de planilla del mes de agosto', 9, 2, 2, 2, NULL, '2018-08-15 02:40:26', '2018-08-15 02:40:26', '432,00 (Cuatrocientos treinta y dos  00/100 Bolivianos)', NULL),
(35, NULL, 'sin referencia.', 4, 573.6, 'sin observación.', 9, 3, 3, 2, NULL, '2018-08-15 02:46:06', '2018-08-15 02:46:06', '573,60 (Quinientos setenta y tres  00/100 Bolivianos)', NULL),
(36, NULL, 'sin referencia.', 4, 558.6, 'sin observación.', 9, 6, 5, 1, NULL, '2018-08-15 03:13:09', '2018-08-15 03:13:09', '558,60 (Quinientos cincuenta y ocho  00/100 Bolivianos)', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2018-07-21 10:11:12', '2018-07-21 10:11:12'),
(2, 'browse_bread', NULL, '2018-07-21 10:11:12', '2018-07-21 10:11:12'),
(3, 'browse_database', NULL, '2018-07-21 10:11:12', '2018-07-21 10:11:12'),
(4, 'browse_media', NULL, '2018-07-21 10:11:12', '2018-07-21 10:11:12'),
(5, 'browse_compass', NULL, '2018-07-21 10:11:12', '2018-07-21 10:11:12'),
(6, 'browse_menus', 'menus', '2018-07-21 10:11:12', '2018-07-21 10:11:12'),
(7, 'read_menus', 'menus', '2018-07-21 10:11:12', '2018-07-21 10:11:12'),
(8, 'edit_menus', 'menus', '2018-07-21 10:11:12', '2018-07-21 10:11:12'),
(9, 'add_menus', 'menus', '2018-07-21 10:11:12', '2018-07-21 10:11:12'),
(10, 'delete_menus', 'menus', '2018-07-21 10:11:12', '2018-07-21 10:11:12'),
(11, 'browse_roles', 'roles', '2018-07-21 10:11:12', '2018-07-21 10:11:12'),
(12, 'read_roles', 'roles', '2018-07-21 10:11:12', '2018-07-21 10:11:12'),
(13, 'edit_roles', 'roles', '2018-07-21 10:11:12', '2018-07-21 10:11:12'),
(14, 'add_roles', 'roles', '2018-07-21 10:11:12', '2018-07-21 10:11:12'),
(15, 'delete_roles', 'roles', '2018-07-21 10:11:12', '2018-07-21 10:11:12'),
(16, 'browse_users', 'users', '2018-07-21 10:11:12', '2018-07-21 10:11:12'),
(17, 'read_users', 'users', '2018-07-21 10:11:12', '2018-07-21 10:11:12'),
(18, 'edit_users', 'users', '2018-07-21 10:11:12', '2018-07-21 10:11:12'),
(19, 'add_users', 'users', '2018-07-21 10:11:12', '2018-07-21 10:11:12'),
(20, 'delete_users', 'users', '2018-07-21 10:11:12', '2018-07-21 10:11:12'),
(21, 'browse_settings', 'settings', '2018-07-21 10:11:12', '2018-07-21 10:11:12'),
(22, 'read_settings', 'settings', '2018-07-21 10:11:12', '2018-07-21 10:11:12'),
(23, 'edit_settings', 'settings', '2018-07-21 10:11:12', '2018-07-21 10:11:12'),
(24, 'add_settings', 'settings', '2018-07-21 10:11:12', '2018-07-21 10:11:12'),
(25, 'delete_settings', 'settings', '2018-07-21 10:11:12', '2018-07-21 10:11:12'),
(41, 'browse_hooks', NULL, '2018-07-21 10:11:14', '2018-07-21 10:11:14'),
(42, 'browse_permissions', 'permissions', '2018-07-29 21:13:17', '2018-07-29 21:13:17'),
(43, 'read_permissions', 'permissions', '2018-07-29 21:13:17', '2018-07-29 21:13:17'),
(44, 'edit_permissions', 'permissions', '2018-07-29 21:13:17', '2018-07-29 21:13:17'),
(45, 'add_permissions', 'permissions', '2018-07-29 21:13:17', '2018-07-29 21:13:17'),
(46, 'delete_permissions', 'permissions', '2018-07-29 21:13:17', '2018-07-29 21:13:17'),
(47, 'browse_proyectos', 'proyectos', '2018-07-29 21:26:03', '2018-07-29 21:26:03'),
(48, 'read_proyectos', 'proyectos', '2018-07-29 21:26:03', '2018-07-29 21:26:03'),
(49, 'edit_proyectos', 'proyectos', '2018-07-29 21:26:03', '2018-07-29 21:26:03'),
(50, 'add_proyectos', 'proyectos', '2018-07-29 21:26:03', '2018-07-29 21:26:03'),
(51, 'delete_proyectos', 'proyectos', '2018-07-29 21:26:03', '2018-07-29 21:26:03'),
(52, 'browse_pedidos', 'pedidos', '2018-07-29 21:31:17', '2018-07-29 21:31:17'),
(53, 'read_pedidos', 'pedidos', '2018-07-29 21:31:17', '2018-07-29 21:31:17'),
(54, 'edit_pedidos', 'pedidos', '2018-07-29 21:31:17', '2018-07-29 21:31:17'),
(55, 'add_pedidos', 'pedidos', '2018-07-29 21:31:17', '2018-07-29 21:31:17'),
(56, 'delete_pedidos', 'pedidos', '2018-07-29 21:31:17', '2018-07-29 21:31:17'),
(57, 'browse_tipos', 'tipos', '2018-07-29 21:34:59', '2018-07-29 21:34:59'),
(58, 'read_tipos', 'tipos', '2018-07-29 21:34:59', '2018-07-29 21:34:59'),
(59, 'edit_tipos', 'tipos', '2018-07-29 21:34:59', '2018-07-29 21:34:59'),
(60, 'add_tipos', 'tipos', '2018-07-29 21:34:59', '2018-07-29 21:34:59'),
(61, 'delete_tipos', 'tipos', '2018-07-29 21:34:59', '2018-07-29 21:34:59'),
(62, 'browse_proveedores', 'proveedores', '2018-07-29 21:37:03', '2018-07-29 21:37:03'),
(63, 'read_proveedores', 'proveedores', '2018-07-29 21:37:03', '2018-07-29 21:37:03'),
(64, 'edit_proveedores', 'proveedores', '2018-07-29 21:37:03', '2018-07-29 21:37:03'),
(65, 'add_proveedores', 'proveedores', '2018-07-29 21:37:03', '2018-07-29 21:37:03'),
(66, 'delete_proveedores', 'proveedores', '2018-07-29 21:37:03', '2018-07-29 21:37:03'),
(67, 'browse_pagos', 'pagos', '2018-07-29 21:38:00', '2018-07-29 21:38:00'),
(68, 'read_pagos', 'pagos', '2018-07-29 21:38:00', '2018-07-29 21:38:00'),
(69, 'edit_pagos', 'pagos', '2018-07-29 21:38:00', '2018-07-29 21:38:00'),
(70, 'add_pagos', 'pagos', '2018-07-29 21:38:00', '2018-07-29 21:38:00'),
(71, 'delete_pagos', 'pagos', '2018-07-29 21:38:00', '2018-07-29 21:38:00'),
(77, 'browse_items', 'items', '2018-07-29 21:51:09', '2018-07-29 21:51:09'),
(78, 'read_items', 'items', '2018-07-29 21:51:09', '2018-07-29 21:51:09'),
(79, 'edit_items', 'items', '2018-07-29 21:51:09', '2018-07-29 21:51:09'),
(80, 'add_items', 'items', '2018-07-29 21:51:09', '2018-07-29 21:51:09'),
(81, 'delete_items', 'items', '2018-07-29 21:51:09', '2018-07-29 21:51:09'),
(82, 'browse_unidades', 'unidades', '2018-07-29 21:56:44', '2018-07-29 21:56:44'),
(83, 'read_unidades', 'unidades', '2018-07-29 21:56:44', '2018-07-29 21:56:44'),
(84, 'edit_unidades', 'unidades', '2018-07-29 21:56:44', '2018-07-29 21:56:44'),
(85, 'add_unidades', 'unidades', '2018-07-29 21:56:44', '2018-07-29 21:56:44'),
(86, 'delete_unidades', 'unidades', '2018-07-29 21:56:44', '2018-07-29 21:56:44'),
(87, 'browse_categorias', 'categorias', '2018-07-29 21:58:10', '2018-07-29 21:58:10'),
(88, 'read_categorias', 'categorias', '2018-07-29 21:58:10', '2018-07-29 21:58:10'),
(89, 'edit_categorias', 'categorias', '2018-07-29 21:58:10', '2018-07-29 21:58:10'),
(90, 'add_categorias', 'categorias', '2018-07-29 21:58:10', '2018-07-29 21:58:10'),
(91, 'delete_categorias', 'categorias', '2018-07-29 21:58:10', '2018-07-29 21:58:10'),
(92, 'browse_maquinarias', 'maquinarias', '2018-07-29 22:11:23', '2018-07-29 22:11:23'),
(93, 'read_maquinarias', 'maquinarias', '2018-07-29 22:11:23', '2018-07-29 22:11:23'),
(94, 'edit_maquinarias', 'maquinarias', '2018-07-29 22:11:23', '2018-07-29 22:11:23'),
(95, 'add_maquinarias', 'maquinarias', '2018-07-29 22:11:23', '2018-07-29 22:11:23'),
(96, 'delete_maquinarias', 'maquinarias', '2018-07-29 22:11:23', '2018-07-29 22:11:23'),
(97, 'browse_lugares', 'lugares', '2018-07-29 22:13:34', '2018-07-29 22:13:34'),
(98, 'read_lugares', 'lugares', '2018-07-29 22:13:34', '2018-07-29 22:13:34'),
(99, 'edit_lugares', 'lugares', '2018-07-29 22:13:34', '2018-07-29 22:13:34'),
(100, 'add_lugares', 'lugares', '2018-07-29 22:13:34', '2018-07-29 22:13:34'),
(101, 'delete_lugares', 'lugares', '2018-07-29 22:13:34', '2018-07-29 22:13:34'),
(102, 'browse_choferes', 'choferes', '2018-07-29 22:15:52', '2018-07-29 22:15:52'),
(103, 'read_choferes', 'choferes', '2018-07-29 22:15:52', '2018-07-29 22:15:52'),
(104, 'edit_choferes', 'choferes', '2018-07-29 22:15:52', '2018-07-29 22:15:52'),
(105, 'add_choferes', 'choferes', '2018-07-29 22:15:52', '2018-07-29 22:15:52'),
(106, 'delete_choferes', 'choferes', '2018-07-29 22:15:52', '2018-07-29 22:15:52'),
(112, 'browse_estados', 'estados', '2018-07-31 02:36:54', '2018-07-31 02:36:54'),
(113, 'read_estados', 'estados', '2018-07-31 02:36:54', '2018-07-31 02:36:54'),
(114, 'edit_estados', 'estados', '2018-07-31 02:36:54', '2018-07-31 02:36:54'),
(115, 'add_estados', 'estados', '2018-07-31 02:36:54', '2018-07-31 02:36:54'),
(116, 'delete_estados', 'estados', '2018-07-31 02:36:54', '2018-07-31 02:36:54'),
(117, 'browse_clasificaciones', 'clasificaciones', '2018-08-04 20:09:56', '2018-08-04 20:09:56'),
(118, 'read_clasificaciones', 'clasificaciones', '2018-08-04 20:09:56', '2018-08-04 20:09:56'),
(119, 'edit_clasificaciones', 'clasificaciones', '2018-08-04 20:09:56', '2018-08-04 20:09:56'),
(120, 'add_clasificaciones', 'clasificaciones', '2018-08-04 20:09:56', '2018-08-04 20:09:56'),
(121, 'delete_clasificaciones', 'clasificaciones', '2018-08-04 20:09:56', '2018-08-04 20:09:56'),
(122, 'browse_clientes', 'clientes', '2018-08-04 20:18:19', '2018-08-04 20:18:19'),
(123, 'read_clientes', 'clientes', '2018-08-04 20:18:19', '2018-08-04 20:18:19'),
(124, 'edit_clientes', 'clientes', '2018-08-04 20:18:19', '2018-08-04 20:18:19'),
(125, 'add_clientes', 'clientes', '2018-08-04 20:18:19', '2018-08-04 20:18:19'),
(126, 'delete_clientes', 'clientes', '2018-08-04 20:18:19', '2018-08-04 20:18:19'),
(127, 'browse_empresas', 'empresas', '2018-08-04 20:19:19', '2018-08-04 20:19:19'),
(128, 'read_empresas', 'empresas', '2018-08-04 20:19:19', '2018-08-04 20:19:19'),
(129, 'edit_empresas', 'empresas', '2018-08-04 20:19:19', '2018-08-04 20:19:19'),
(130, 'add_empresas', 'empresas', '2018-08-04 20:19:19', '2018-08-04 20:19:19'),
(131, 'delete_empresas', 'empresas', '2018-08-04 20:19:19', '2018-08-04 20:19:19'),
(132, 'browse_ventas', 'ventas', '2018-08-04 20:20:22', '2018-08-04 20:20:22'),
(133, 'read_ventas', 'ventas', '2018-08-04 20:20:22', '2018-08-04 20:20:22'),
(134, 'edit_ventas', 'ventas', '2018-08-04 20:20:22', '2018-08-04 20:20:22'),
(135, 'add_ventas', 'ventas', '2018-08-04 20:20:22', '2018-08-04 20:20:22'),
(136, 'delete_ventas', 'ventas', '2018-08-04 20:20:22', '2018-08-04 20:20:22'),
(137, 'browse_solicitudes', 'solicitudes', '2018-08-04 20:21:54', '2018-08-04 20:21:54'),
(138, 'read_solicitudes', 'solicitudes', '2018-08-04 20:21:54', '2018-08-04 20:21:54'),
(139, 'edit_solicitudes', 'solicitudes', '2018-08-04 20:21:54', '2018-08-04 20:21:54'),
(140, 'add_solicitudes', 'solicitudes', '2018-08-04 20:21:54', '2018-08-04 20:21:54'),
(141, 'delete_solicitudes', 'solicitudes', '2018-08-04 20:21:54', '2018-08-04 20:21:54'),
(142, 'browse_ingresos', 'ingresos', '2018-08-04 20:26:13', '2018-08-04 20:26:13'),
(143, 'read_ingresos', 'ingresos', '2018-08-04 20:26:13', '2018-08-04 20:26:13'),
(144, 'edit_ingresos', 'ingresos', '2018-08-04 20:26:13', '2018-08-04 20:26:13'),
(145, 'add_ingresos', 'ingresos', '2018-08-04 20:26:13', '2018-08-04 20:26:13'),
(146, 'delete_ingresos', 'ingresos', '2018-08-04 20:26:13', '2018-08-04 20:26:13'),
(147, 'browse_mateiales', 'mateiales', '2018-08-04 20:29:41', '2018-08-04 20:29:41'),
(148, 'read_mateiales', 'mateiales', '2018-08-04 20:29:41', '2018-08-04 20:29:41'),
(149, 'edit_mateiales', 'mateiales', '2018-08-04 20:29:41', '2018-08-04 20:29:41'),
(150, 'add_mateiales', 'mateiales', '2018-08-04 20:29:41', '2018-08-04 20:29:41'),
(151, 'delete_mateiales', 'mateiales', '2018-08-04 20:29:41', '2018-08-04 20:29:41'),
(152, 'browse_materiales', 'materiales', '2018-08-06 02:00:24', '2018-08-06 02:00:24'),
(153, 'read_materiales', 'materiales', '2018-08-06 02:00:24', '2018-08-06 02:00:24'),
(154, 'edit_materiales', 'materiales', '2018-08-06 02:00:24', '2018-08-06 02:00:24'),
(155, 'add_materiales', 'materiales', '2018-08-06 02:00:24', '2018-08-06 02:00:24'),
(156, 'delete_materiales', 'materiales', '2018-08-06 02:00:24', '2018-08-06 02:00:24'),
(157, 'report_project', 'project', '2018-08-07 00:49:00', '2018-08-07 01:10:32'),
(158, 'mis_pedidos_project', 'project', '2018-08-07 01:18:00', '2018-08-07 01:18:57'),
(159, 'pedidos_cola_project', 'project', '2018-08-07 01:22:41', '2018-08-07 01:22:41'),
(160, 'mis_pedidos_sales', 'sales', '2018-08-08 04:48:00', '2018-08-08 04:49:57'),
(161, 'report_sales', 'sales', '2018-08-10 02:52:36', '2018-08-10 02:52:36'),
(162, 'contabilidad_project', 'project', '2018-08-14 02:35:10', '2018-08-14 02:35:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(2, 1),
(2, 7),
(3, 1),
(3, 7),
(4, 1),
(4, 7),
(5, 1),
(5, 7),
(6, 1),
(6, 7),
(7, 1),
(7, 7),
(8, 1),
(8, 7),
(9, 1),
(9, 7),
(10, 1),
(10, 7),
(11, 1),
(11, 7),
(12, 1),
(12, 7),
(13, 1),
(13, 7),
(14, 1),
(14, 7),
(15, 1),
(15, 7),
(16, 1),
(16, 7),
(17, 1),
(17, 7),
(18, 1),
(18, 7),
(19, 1),
(19, 7),
(20, 1),
(20, 7),
(21, 1),
(21, 7),
(22, 1),
(22, 7),
(23, 1),
(23, 7),
(24, 1),
(24, 7),
(25, 1),
(25, 7),
(41, 7),
(42, 1),
(42, 7),
(43, 1),
(43, 7),
(44, 1),
(44, 7),
(45, 1),
(45, 7),
(46, 1),
(46, 7),
(47, 1),
(47, 3),
(47, 7),
(48, 1),
(48, 3),
(48, 7),
(49, 1),
(49, 3),
(49, 7),
(50, 1),
(50, 3),
(50, 7),
(51, 1),
(51, 7),
(52, 1),
(52, 7),
(53, 1),
(53, 7),
(54, 1),
(54, 7),
(55, 1),
(55, 7),
(56, 1),
(56, 7),
(57, 1),
(57, 7),
(58, 1),
(58, 7),
(59, 1),
(59, 7),
(60, 1),
(60, 7),
(61, 1),
(61, 7),
(62, 1),
(62, 2),
(62, 3),
(62, 7),
(63, 1),
(63, 2),
(63, 3),
(63, 7),
(64, 1),
(64, 2),
(64, 3),
(64, 7),
(65, 1),
(65, 2),
(65, 3),
(65, 7),
(66, 1),
(66, 7),
(67, 1),
(67, 7),
(68, 1),
(68, 7),
(69, 1),
(69, 7),
(70, 1),
(70, 7),
(71, 1),
(71, 7),
(77, 1),
(77, 7),
(78, 1),
(78, 7),
(79, 1),
(79, 7),
(80, 1),
(80, 7),
(81, 1),
(81, 7),
(82, 1),
(82, 2),
(82, 7),
(83, 1),
(83, 2),
(83, 7),
(84, 1),
(84, 2),
(84, 7),
(85, 1),
(85, 2),
(85, 7),
(86, 1),
(86, 7),
(87, 1),
(87, 2),
(87, 7),
(88, 1),
(88, 2),
(88, 7),
(89, 1),
(89, 2),
(89, 7),
(90, 1),
(90, 2),
(90, 7),
(91, 1),
(91, 7),
(92, 1),
(92, 7),
(93, 1),
(93, 7),
(94, 1),
(94, 7),
(95, 1),
(95, 7),
(96, 1),
(96, 7),
(97, 1),
(97, 7),
(98, 1),
(98, 7),
(99, 1),
(99, 7),
(100, 1),
(100, 7),
(101, 1),
(101, 7),
(102, 1),
(102, 7),
(103, 1),
(103, 7),
(104, 1),
(104, 7),
(105, 1),
(105, 7),
(106, 1),
(106, 7),
(112, 1),
(112, 7),
(113, 1),
(113, 7),
(114, 1),
(114, 7),
(115, 1),
(115, 7),
(116, 1),
(116, 7),
(117, 1),
(117, 5),
(117, 7),
(118, 1),
(118, 5),
(118, 7),
(119, 1),
(119, 5),
(119, 7),
(120, 1),
(120, 5),
(120, 7),
(121, 1),
(121, 5),
(121, 7),
(122, 1),
(122, 5),
(122, 7),
(123, 1),
(123, 5),
(123, 7),
(124, 1),
(124, 5),
(124, 7),
(125, 1),
(125, 5),
(125, 7),
(126, 1),
(126, 5),
(126, 7),
(127, 1),
(127, 3),
(127, 7),
(128, 1),
(128, 3),
(128, 7),
(129, 1),
(129, 3),
(129, 7),
(130, 1),
(130, 3),
(130, 7),
(131, 1),
(131, 7),
(132, 1),
(132, 5),
(132, 7),
(133, 1),
(133, 5),
(133, 7),
(134, 1),
(134, 5),
(134, 7),
(135, 1),
(135, 5),
(135, 7),
(136, 1),
(136, 7),
(137, 1),
(137, 5),
(137, 7),
(138, 1),
(138, 5),
(138, 7),
(139, 1),
(139, 5),
(139, 7),
(140, 1),
(140, 5),
(140, 7),
(141, 1),
(141, 7),
(142, 1),
(142, 3),
(142, 7),
(143, 1),
(143, 3),
(143, 7),
(144, 1),
(144, 3),
(144, 7),
(145, 1),
(145, 3),
(145, 7),
(146, 1),
(146, 7),
(147, 1),
(147, 7),
(148, 1),
(148, 7),
(149, 1),
(149, 7),
(150, 1),
(150, 7),
(151, 1),
(151, 7),
(152, 1),
(152, 5),
(152, 7),
(153, 1),
(153, 5),
(153, 7),
(154, 1),
(154, 5),
(154, 7),
(155, 1),
(155, 5),
(155, 7),
(156, 1),
(156, 5),
(156, 7),
(157, 1),
(157, 7),
(158, 1),
(158, 2),
(158, 3),
(158, 4),
(158, 5),
(158, 7),
(159, 1),
(159, 3),
(159, 4),
(159, 7),
(160, 1),
(160, 5),
(160, 7),
(161, 1),
(161, 5),
(161, 7),
(162, 1),
(162, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `direccion` text COLLATE utf8_unicode_ci,
  `telefono` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `celular` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `correo` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `imagen` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado` tinyint(4) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id`, `nombre`, `direccion`, `telefono`, `celular`, `correo`, `created_at`, `updated_at`, `imagen`, `estado`) VALUES
(1, 'Proveedor 1', 'Calle', '33434324', '7111212', 'proveedor1@admin.com', '2018-07-31 02:18:25', '2018-07-31 02:18:25', 'proveedores/July2018/11j6vA2BxZqUVYw5CMsH.png', 1),
(2, 'RETENES VIAL BOLIVIA', 'Calle', '7223323', '676767689', 'proveedor2@admin.com', '2018-08-03 21:11:56', '2018-08-08 01:58:35', NULL, 1),
(3, 'Jesus Rios', 'Zona san julian', '522545', '2555225', 'jesus@gmail.com', '2018-08-08 01:05:11', '2018-08-08 01:05:11', 'proveedores/August2018/V3CUFogqs2dvOfxf9Stc.jpg', 1),
(4, 'proveedor 33', NULL, NULL, NULL, NULL, '2018-08-11 23:03:59', '2018-08-11 23:03:59', NULL, 1),
(5, 'imprenta 1', NULL, NULL, NULL, NULL, '2018-08-15 02:10:02', '2018-08-15 02:10:02', NULL, 1),
(6, 'Concretec', 'C/ 18 de nov', '3463232', '634344354', 'concretec@gmail.com', '2018-08-15 02:50:13', '2018-08-15 02:50:13', NULL, 1),
(7, 'proveedor 4', 'Calle 4', '7883435', '234235432', NULL, NULL, NULL, NULL, 1),
(8, 'Proveedor 5', 'Calle 5', '345345', '34534', NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos`
--

CREATE TABLE `proyectos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8_unicode_ci,
  `presupuesto` decimal(10,0) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_final` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `proyectos`
--

INSERT INTO `proyectos` (`id`, `nombre`, `descripcion`, `presupuesto`, `estado`, `fecha_inicio`, `fecha_final`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'SUELDOS', 'Descripción del proyecto 1', '5000', 1, '2018-08-15 00:00:00', NULL, NULL, '2018-07-31 01:23:04', '2018-08-09 04:03:52'),
(2, 'ADM', 'Descripción del proyecto 2', '30000', 1, '2018-08-06 00:00:00', NULL, NULL, '2018-08-03 21:03:40', '2018-08-09 04:03:41'),
(3, 'AMD-TDD', 'Descripcion del proyecto 3', '90000', 1, '2018-08-06 00:00:00', NULL, NULL, '2018-08-04 20:43:02', '2018-08-09 04:03:32'),
(4, 'TURIMIX', 'Proyecto de construccion de edificio', '60000', 0, '2017-02-15 00:00:00', NULL, NULL, '2018-08-08 01:51:07', '2018-08-11 23:05:16'),
(5, 'CPSP', 'Construcccion del puente a san pablo', '500000', 1, '2018-08-14 00:00:00', NULL, NULL, '2018-08-15 02:08:44', '2018-08-15 02:08:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rechazos`
--

CREATE TABLE `rechazos` (
  `id` int(10) UNSIGNED NOT NULL,
  `pedido_id` int(11) DEFAULT NULL,
  `motivo` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `rechazos`
--

INSERT INTO `rechazos` (`id`, `pedido_id`, `motivo`, `created_at`, `updated_at`) VALUES
(3, 9, 'primer rechazo', '2018-08-05 04:00:00', '2018-08-05 04:00:00'),
(4, 9, 'Segundo rechazo', '2018-08-06 00:33:14', '2018-08-06 00:33:14'),
(5, 11, 'primer rechazo', '2018-08-06 00:33:29', '2018-08-06 00:33:29'),
(6, 12, 'primer rechazo', '2018-08-06 00:33:44', '2018-08-06 00:33:44'),
(7, 16, 'por pendejo', '2018-08-06 22:39:37', '2018-08-06 22:39:37'),
(8, 21, 'rechazado', '2018-08-08 02:22:09', '2018-08-08 02:22:09'),
(9, 21, NULL, '2018-08-08 02:48:46', '2018-08-08 02:48:46'),
(10, 21, NULL, '2018-08-08 02:56:18', '2018-08-08 02:56:18'),
(11, 23, NULL, '2018-08-08 03:01:17', '2018-08-08 03:01:17'),
(12, 23, NULL, '2018-08-08 03:02:50', '2018-08-08 03:02:50'),
(13, 21, NULL, '2018-08-08 03:06:18', '2018-08-08 03:06:18'),
(14, 25, 'motivo de pruebas', '2018-08-09 00:31:49', '2018-08-09 00:31:49'),
(15, 31, 'pendejo ...  haceme bien las cosas', '2018-08-15 02:21:57', '2018-08-15 02:21:57'),
(16, 33, 'rechazado', '2018-08-15 02:22:17', '2018-08-15 02:22:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2018-07-21 10:11:12', '2018-07-21 10:11:12'),
(2, 'soliciatdor', 'solicitador', '2018-07-21 10:11:12', '2018-08-07 00:44:16'),
(3, 'Aprobador', 'Aprobador', '2018-08-04 02:50:23', '2018-08-04 02:50:23'),
(4, 'Elaborador', 'Elaborador', '2018-08-04 02:55:54', '2018-08-04 02:55:54'),
(5, 'ventas', 'ventas', '2018-08-07 00:44:45', '2018-08-07 00:44:45'),
(6, 'contador', 'Contador', '2018-08-09 02:26:04', '2018-08-09 02:26:04'),
(7, 'soporte', 'Soporte', '2018-08-10 03:32:52', '2018-08-10 03:32:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `details` text COLLATE utf8_unicode_ci,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Webpc v1.0', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Sistema Web para Proyectos Civiles', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Turiro', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Webpc v1.0 - LoginWeb 2018', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin'),
(11, 'admin.mensaje_no_autorizado', 'mensaje_no_autorizado', 'No tienes los permisos para ver esta interface, comunicate con el administrador.', NULL, 'text', 6, 'Admin'),
(12, 'admin.paginate', 'paginate', '4', NULL, 'text', 7, 'Admin'),
(13, 'admin.firma', 'firma', '', NULL, 'image', 8, 'Admin'),
(14, 'admin.items_descripcion_default', 'items_descripcion_default', 'sin descripción', NULL, 'text', 9, 'Admin'),
(16, 'admin.pedidos_referencia_default', 'pedidos_referencia_default', 'sin referencia.', NULL, 'text', 10, 'Admin'),
(17, 'admin.pedidos_observacion_default', 'pedidos_observacion_default', 'sin observación.', NULL, 'text', 11, 'Admin'),
(18, 'admin.pedidos_datos_default', 'pedidos_datos_default', 'Nombre Cheque :\r\nBanco                   :\r\nNª de Cheque .    :', NULL, 'text_area', 12, 'Admin'),
(19, 'admin.bombeado_valor', 'bombeado_valor', '10', NULL, 'text', 13, 'Admin'),
(20, 'admin.load', 'load', 'settings/August2018/JxETND4uFSAo6pSKS9DD.gif', NULL, 'image', 14, 'Admin'),
(21, 'admin.detalle_envio', 'detalle_envio', 'Item # :\r\nCantidad :', NULL, 'text_area', 15, 'Admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes`
--

CREATE TABLE `solicitudes` (
  `id` int(10) UNSIGNED NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `direccion_entrega` text COLLATE utf8_unicode_ci,
  `latitud` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longitud` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `hora_entrega` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `solicitudes`
--

INSERT INTO `solicitudes` (`id`, `cliente_id`, `total`, `fecha_entrega`, `direccion_entrega`, `latitud`, `longitud`, `created_at`, `updated_at`, `user_id`, `hora_entrega`) VALUES
(1, 1, '2501', '2018-08-21', 'Zona en algun lugar del prueblo', NULL, NULL, '2018-08-06 02:40:11', '2018-08-06 02:40:11', 1, '00:00:00'),
(2, 1, '601', '2018-08-10', 'Calle Toborochi', NULL, NULL, '2018-08-10 02:08:09', '2018-08-10 02:08:09', 1, '14:30:00'),
(3, 1, '601', '2018-08-10', 'Calle Toborochi', NULL, NULL, '2018-08-10 02:08:57', '2018-08-10 02:08:57', 1, '14:30:00'),
(4, 2, '1057', '2018-08-10', 'Villa corina', NULL, NULL, '2018-08-10 04:20:01', '2018-08-10 04:20:01', 6, '10:24:00'),
(5, 1, '1312', '2018-08-11', 'Calle', '-14.83961117635595', '-64.89504116023556', '2018-08-11 15:24:46', '2018-08-11 15:24:46', 1, '23:00:00'),
(6, 1, '7414', '2018-08-17', 'calle', '-14.840108983419606', '-64.8959852978088', '2018-08-11 20:07:04', '2018-08-11 20:07:04', 1, '02:01:00'),
(7, 1, '250', '2018-08-11', 'Calle', '-14.8390304', '-64.9059202', '2018-08-11 22:46:18', '2018-08-11 22:46:18', 1, '03:04:00'),
(8, 3, '0', '2018-12-31', 'calle', '-14.838532590453466', '-64.91724985087887', '2018-08-15 02:53:29', '2018-08-15 02:53:29', 1, '00:00:00'),
(9, 2, '431', '2018-08-14', 'C/ 6 de agoto', '-14.836935443756243', '-64.90104930842892', '2018-08-15 02:57:03', '2018-08-15 02:57:03', 9, '23:01:00'),
(10, 4, '250', '2018-08-14', 'calle mamore final lado excachivateca', '-14.837246577154717', '-64.9151469990112', '2018-08-15 02:58:15', '2018-08-15 02:58:15', 11, '10:30:00'),
(11, 1, '431', '2018-08-14', 'nn', '-14.8390304', '-64.9059202', '2018-08-15 02:59:29', '2018-08-15 02:59:29', 9, '22:00:00'),
(12, 1, '431', '2018-08-14', 'nn', '-14.8390304', '-64.9059202', '2018-08-15 02:59:47', '2018-08-15 02:59:47', 9, '22:00:00'),
(13, 1, '225', '2018-08-14', 'calle', '-14.8390304', '-64.9059202', '2018-08-15 03:00:15', '2018-08-15 03:00:15', 1, '00:00:00'),
(14, 1, '431', '2018-08-14', 'nn', '-14.8390304', '-64.9059202', '2018-08-15 03:00:19', '2018-08-15 03:00:19', 9, '10:00:00'),
(15, 1, '431', '2018-08-14', 'nn', '-14.8390304', '-64.9059202', '2018-08-15 03:02:08', '2018-08-15 03:02:08', 9, '10:00:00'),
(16, 1, '225', '2018-08-14', 'calle', '-14.8390304', '-64.9059202', '2018-08-15 03:02:09', '2018-08-15 03:02:09', 1, '00:00:00'),
(17, 4, '166', '2018-08-14', 'nn', '-14.8390304', '-64.9059202', '2018-08-15 03:03:14', '2018-08-15 03:03:14', 9, '10:01:00'),
(18, 5, '250', '2018-08-17', 'nn', '-14.8390304', '-64.9059202', '2018-08-15 03:05:00', '2018-08-15 03:05:00', 9, '12:00:00'),
(19, 7, '680', '2018-08-27', 'Calle', '-14.842846901784323', '-64.92806451762692', '2018-08-26 20:56:19', '2018-08-26 20:56:19', 1, '17:10:00'),
(20, 8, '1807', '2018-08-26', 'Calle lejos', '-14.805010779947995', '-64.88497751201169', '2018-08-27 01:26:40', '2018-08-27 01:26:40', 1, '20:50:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos`
--

CREATE TABLE `tipos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tipos`
--

INSERT INTO `tipos` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'Solicitud de Compra', 'Solicitudes de compras para maquinarias como para la empresa', '2018-07-31 02:20:51', '2018-08-06 23:25:47'),
(2, 'Pagos de Sueldos', 'Para los pagos de sueldos', '2018-08-03 21:06:00', '2018-08-06 23:26:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2018-07-21 10:11:14', '2018-07-21 10:11:14'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2018-07-21 10:11:14', '2018-07-21 10:11:14'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2018-07-21 10:11:14', '2018-07-21 10:11:14'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2018-07-21 10:11:14', '2018-07-21 10:11:14'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2018-07-21 10:11:14', '2018-07-21 10:11:14'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2018-07-21 10:11:14', '2018-07-21 10:11:14'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2018-07-21 10:11:14', '2018-07-21 10:11:14'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2018-07-21 10:11:14', '2018-07-21 10:11:14'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2018-07-21 10:11:14', '2018-07-21 10:11:14'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2018-07-21 10:11:14', '2018-07-21 10:11:14'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2018-07-21 10:11:14', '2018-07-21 10:11:14'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2018-07-21 10:11:14', '2018-07-21 10:11:14'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2018-07-21 10:11:14', '2018-07-21 10:11:14'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2018-07-21 10:11:14', '2018-07-21 10:11:14'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2018-07-21 10:11:14', '2018-07-21 10:11:14'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2018-07-21 10:11:14', '2018-07-21 10:11:14'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2018-07-21 10:11:14', '2018-07-21 10:11:14'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2018-07-21 10:11:14', '2018-07-21 10:11:14'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2018-07-21 10:11:14', '2018-07-21 10:11:14'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2018-07-21 10:11:14', '2018-07-21 10:11:14'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2018-07-21 10:11:14', '2018-07-21 10:11:14'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2018-07-21 10:11:14', '2018-07-21 10:11:14'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2018-07-21 10:11:14', '2018-07-21 10:11:14'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2018-07-21 10:11:14', '2018-07-21 10:11:14'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2018-07-21 10:11:14', '2018-07-21 10:11:14'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2018-07-21 10:11:14', '2018-07-21 10:11:14'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2018-07-21 10:11:14', '2018-07-21 10:11:14'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2018-07-21 10:11:14', '2018-07-21 10:11:14'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2018-07-21 10:11:14', '2018-07-21 10:11:14'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2018-07-21 10:11:14', '2018-07-21 10:11:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades`
--

CREATE TABLE `unidades` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `abrev` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `unidades`
--

INSERT INTO `unidades` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`, `abrev`) VALUES
(1, 'Segundo', 'unidade expresada en segundo', '2018-07-31 02:50:20', '2018-08-08 01:03:13', 's'),
(2, 'Peajes', 'Unidad de medida en peaje', '2018-08-08 00:45:33', '2018-08-08 01:02:35', 'peajes'),
(3, 'mol', 'unidad expresada en mol', '2018-08-08 00:46:13', '2018-08-08 01:02:03', 'mol'),
(4, 'metro cubico', 'unidad en metros cubicos', '2018-08-08 00:47:08', '2018-08-08 01:01:44', 'm3'),
(5, 'metro cuadrado', 'unidad en metros cuadrados', '2018-08-08 00:47:36', '2018-08-08 01:01:24', 'm²'),
(6, 'metro', 'unidad expresada en metros', '2018-08-08 00:48:07', '2018-08-08 01:01:00', 'm'),
(7, 'Litros', 'unidad de medida expresada en listros', '2018-08-08 00:48:53', '2018-08-08 01:00:46', 'L'),
(8, 'Kilogramo', 'unidad expresada en kilogramos', '2018-08-08 00:49:25', '2018-08-08 01:00:26', 'Kg'),
(9, 'Kelvin', 'unidad expresada en kelvin', '2018-08-08 00:51:44', '2018-08-08 01:00:08', 'k'),
(10, 'candela', 'unidad expresada en candela', '2018-08-08 00:52:15', '2018-08-08 00:59:40', 'cd'),
(11, 'Bolivianos', 'unidad de medida expresada en bolivianos', '2018-08-08 00:52:43', '2018-08-08 00:59:28', 'BS'),
(12, 'Ampere', 'expresada en ampere', '2018-08-08 00:53:08', '2018-08-08 00:59:15', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'users/default.png',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', '$2y$10$C7.519zYw7ES4SZ7BYZq.O3RFegLMgz2FvjPZG1lgMkNVf4hcQauu', 'MOpBfYUPokq21fW7gYbQkbLir6n3be0ni7cbtyqlPiEzmSIwxBZz3nYkfzoz', NULL, '2018-07-21 10:11:14', '2018-07-21 10:11:14'),
(3, 3, 'maria dias', 'maria.dias@admin.com', 'users/August2018/NZHLlq0JvzSmVlwoU4OS.jpg', '$2y$10$fYGeQPg4HO1jlpnNJcE/1OA0V6ivGM22qSDVaCnBsbwDKyMABojc2', 'PrvrxgKQE7gptSp6qcPCQXdu4TtA3bhJM39GludMzWxnRDUR7NgZ0sQ4qZmb', '{\"locale\":\"es\"}', '2018-07-29 20:15:33', '2018-08-04 02:53:48'),
(5, 4, 'luis flores', 'luis.flores@admin.com', 'users/August2018/HniGlyTnsDdQrOLGQHin.jpg', '$2y$10$s4qKizUtLbvw5ri1HhoQa.el3sxCtfPdWHCL2aDuf4HCWlNNGYJ/6', 'OXR33gJ2wLveVrxkZWMe0oBZPDaXrrXkqViTABBxB6ng5L1oNA3wtcZELtnM', '{\"locale\":\"es\"}', '2018-07-29 20:16:29', '2018-08-04 03:17:40'),
(6, 2, 'Augusto Carvalho', 'auguss24@gmail.com', 'users/August2018/1VSUeZg4gI64iVuLxENz.png', '$2y$10$X2haCy4bQjlkx/BGfwnJq.1wJXHd9aolyIzNuBiZQIKiY0s.yQDqe', 'ptJdLYR9AGsvH9vjM4JoGJGrOSvIHGdj41DGWBuTmhrXOL0zN3zVapAvhh9Y', '{\"locale\":\"es\"}', '2018-08-06 23:47:17', '2018-08-14 02:52:06'),
(7, 7, 'soporte', 'soporte@turiro.com', 'users/default.png', '$2y$10$Ec.roki069Rw4uca/OGqouXOpYdId.Otd1w7zcmAMVFzjtt9G90Tq', 'KFeI6DLFT4n2EcT0gLnUNW7sMns17Bfc90MbiLawD8rLFUP1OygTe50ri9qb', '{\"locale\":\"es\"}', '2018-08-09 00:56:20', '2018-08-10 03:36:01'),
(8, 2, 'laura zambrana', 'laura.zambra@admin.com', 'users/August2018/KkmorjArnS5WK9g7asuM.png', '$2y$10$jAUYlOqXjTQFXxjq/Kmbo.fsryOAy0Pl9AVXgBThPwAjoJVVgBfVq', 'ew8rlksD8ODrluR3ExB4GE0CF5kLOSRbQ7zW8Bg228bwcHXHJepbdZ2J4PU8', '{\"locale\":\"es\"}', '2018-08-14 02:07:38', '2018-08-14 02:07:52'),
(9, 2, 'Agustin', 'buddy.m091@gmail.com', 'users/default.png', '$2y$10$w1E/shgDW0hggn2o.UfT5uUvF8C92Ae8WGTT4.m/XYKWYyNRbCUuO', NULL, NULL, '2018-08-15 01:48:01', '2018-08-15 01:48:01'),
(10, 2, 'lola lopez', 'lola.lopez@admin.com', 'users/August2018/kpTx344qtN79jTUgHwY7.jpg', '$2y$10$SQ8cDaSztaMUCIl.FOaAq.Ati/8g5QxW.iLAaMeHDaFf11JCqxd6y', '4732lAfJrWVaOtUphPAEfskIzj3gvigohfZM3m7MAH6reIHe0rls3YmP2MUx', NULL, '2018-08-15 01:59:12', '2018-08-15 02:03:21'),
(11, 2, 'wilfredo santos calle', 'silver200711_wil@hotmail.com', 'users/default.png', '$2y$10$E59G2oF3RXFKWZeNGIP/Nelw8Lpn.LG0dbiHbMkqWbEXcJT2KzDau', 'Bs1zOhcyZCm84LeosJMM5uESZjekpP0dA1L2Csy3fIKnGS4DPAkHkLqvm8Lg', NULL, '2018-08-15 01:59:18', '2018-08-15 01:59:18'),
(12, 2, 'Mariano Lopez', 'mariano@turiro.com', 'users/default.png', '$2y$10$Q2ZIdgwgMBeXSLxyM5vR.OD2fglgTO3ogskiSN7NOkBgl0J2B8zfO', 's7xjxNSI632DEwZ4enKvNmoT13BQuY4EZY6qSqdUSfRtLyGSYpQQDuz5HsYs', NULL, '2018-08-15 02:01:21', '2018-08-15 02:01:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(6, 5),
(9, 5),
(9, 6),
(11, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(10) UNSIGNED NOT NULL,
  `solicitud_id` int(11) DEFAULT NULL,
  `observacion` text COLLATE utf8_unicode_ci,
  `users_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `solicitud_id`, `observacion`, `users_id`, `created_at`, `updated_at`) VALUES
(1, 6, NULL, 1, '2018-08-11 20:08:35', '2018-08-11 20:08:35'),
(2, 3, 'observaciones nn', NULL, '2018-08-15 02:52:29', '2018-08-15 02:52:29'),
(3, 1, 'observacion nnn', NULL, '2018-08-15 02:53:23', '2018-08-15 02:53:23'),
(4, 10, NULL, 11, '2018-08-15 03:04:37', '2018-08-15 03:04:37'),
(5, 16, NULL, 1, '2018-08-15 03:06:20', '2018-08-15 03:06:20'),
(6, 19, NULL, 1, '2018-08-27 01:21:22', '2018-08-27 01:21:22');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `choferes`
--
ALTER TABLE `choferes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `choferes_carnet_unique` (`carnet`),
  ADD UNIQUE KEY `choferes_licencia_unique` (`licencia`);

--
-- Indices de la tabla `clasificaciones`
--
ALTER TABLE `clasificaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indices de la tabla `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indices de la tabla `detalle_materiales`
--
ALTER TABLE `detalle_materiales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detalle_materiales_solicitud_id_index` (`solicitude_id`),
  ADD KEY `detalle_materiales_material_id_index` (`materiale_id`);

--
-- Indices de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index1` (`pedido_id`),
  ADD KEY `index2` (`item_id`);

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `envios`
--
ALTER TABLE `envios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estados_cambios`
--
ALTER TABLE `estados_cambios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `lugares`
--
ALTER TABLE `lugares`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `maquinarias`
--
ALTER TABLE `maquinarias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `materiales`
--
ALTER TABLE `materiales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indices de la tabla `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indices de la tabla `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rechazos`
--
ALTER TABLE `rechazos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indices de la tabla `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indices de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipos`
--
ALTER TABLE `tipos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indices de la tabla `unidades`
--
ALTER TABLE `unidades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `choferes`
--
ALTER TABLE `choferes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `clasificaciones`
--
ALTER TABLE `clasificaciones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=234;

--
-- AUTO_INCREMENT de la tabla `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `detalle_materiales`
--
ALTER TABLE `detalle_materiales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT de la tabla `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `envios`
--
ALTER TABLE `envios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `estados_cambios`
--
ALTER TABLE `estados_cambios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `items`
--
ALTER TABLE `items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `lugares`
--
ALTER TABLE `lugares`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `maquinarias`
--
ALTER TABLE `maquinarias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `materiales`
--
ALTER TABLE `materiales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `rechazos`
--
ALTER TABLE `rechazos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `tipos`
--
ALTER TABLE `tipos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `unidades`
--
ALTER TABLE `unidades`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
