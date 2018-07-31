-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 31-07-2018 a las 04:33:48
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
(1, 'Categoria 1', 'Descripcion del categoria 1', '2018-07-31 02:50:45', '2018-07-31 02:50:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cheques`
--

CREATE TABLE `cheques` (
  `id` int(10) UNSIGNED NOT NULL,
  `beneficiario` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `monto_numeral` decimal(10,0) DEFAULT NULL,
  `monto_literal` text COLLATE utf8_unicode_ci,
  `fecha` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `entidad` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `numero_cuenta` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `choferes`
--

CREATE TABLE `choferes` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombres` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apellidos` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `documento` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '', 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '', 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '', 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '', 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '', 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '', 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '', 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\"}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'locale', 'text', 'Locale', 0, 1, 1, 1, 1, 0, '', 12),
(12, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '', 12),
(13, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1),
(14, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '', 2),
(15, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '', 3),
(16, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '', 4),
(17, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1),
(18, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '', 2),
(19, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '', 3),
(20, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '', 4),
(21, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, '', 5),
(22, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, '', 9),
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
(59, 8, 'direccion', 'text_area', 'Direccion', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\",\"rows\":\"3\"}}', 6),
(60, 8, 'telefono', 'text', 'Telefono', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 4),
(61, 8, 'celular', 'text', 'Celular', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 5),
(62, 8, 'correo', 'text', 'Correo', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 3),
(63, 8, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 8),
(64, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 9),
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
(86, 12, 'nombre', 'text', 'Nombre', 0, 1, 1, 1, 1, 1, NULL, 2),
(87, 12, 'descripcion', 'text_area', 'Descripcion', 0, 1, 1, 1, 1, 1, NULL, 3),
(88, 12, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 4),
(89, 12, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(90, 13, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(91, 13, 'nombre', 'text', 'Nombre', 0, 1, 1, 1, 1, 1, NULL, 2),
(92, 13, 'descrcipcion', 'text_area', 'Descrcipcion', 0, 1, 1, 1, 1, 1, NULL, 3),
(93, 13, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 4),
(94, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(95, 14, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(96, 14, 'codigo', 'text', 'Codigo', 0, 1, 1, 1, 1, 1, NULL, 2),
(97, 14, 'nombre', 'text', 'Nombre', 0, 1, 1, 1, 1, 1, NULL, 3),
(98, 14, 'placa', 'text', 'Placa', 0, 1, 1, 1, 1, 1, NULL, 4),
(99, 14, 'marca', 'text', 'Marca', 0, 1, 1, 1, 1, 1, NULL, 5),
(100, 14, 'modelo', 'text', 'Modelo', 0, 1, 1, 1, 1, 1, NULL, 6),
(101, 14, 'chasis', 'text_area', 'Chasis', 0, 0, 1, 1, 1, 1, NULL, 7),
(102, 14, 'lugar_id', 'text', 'Lugar Id', 0, 0, 1, 1, 1, 1, NULL, 8),
(103, 14, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 9),
(104, 14, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 10),
(105, 15, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(106, 15, 'departamento', 'text', 'Departamento', 0, 1, 1, 1, 1, 1, NULL, 2),
(107, 15, 'provincia', 'text', 'Provincia', 0, 1, 1, 1, 1, 1, NULL, 3),
(108, 15, 'municipio', 'text', 'Municipio', 0, 1, 1, 1, 1, 1, NULL, 4),
(109, 15, 'localidad', 'text', 'Localidad', 0, 1, 1, 1, 1, 1, NULL, 5),
(110, 15, 'referencia', 'text', 'Referencia', 0, 0, 1, 1, 1, 1, NULL, 6),
(111, 15, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 7),
(112, 15, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 8),
(113, 16, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(114, 16, 'nombres', 'text', 'Nombres', 0, 1, 1, 1, 1, 1, NULL, 2),
(115, 16, 'apellidos', 'text', 'Apellidos', 0, 1, 1, 1, 1, 1, NULL, 3),
(116, 16, 'documento', 'text', 'Documento', 0, 1, 1, 1, 1, 1, NULL, 4),
(117, 16, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 5),
(118, 16, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 6),
(119, 6, 'pedido_belongsto_proveedore_relationship', 'relationship', 'proveedor', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Proveedore\",\"table\":\"proveedores\",\"type\":\"belongsTo\",\"column\":\"proveedor_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"categorias\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4),
(120, 6, 'pedido_belongsto_pago_relationship', 'relationship', 'Tipo de Pago', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Pago\",\"table\":\"pagos\",\"type\":\"belongsTo\",\"column\":\"pago_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"categorias\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(121, 6, 'pedido_belongsto_tipo_relationship', 'relationship', 'tipos', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Tipo\",\"table\":\"tipos\",\"type\":\"belongsTo\",\"column\":\"tipo_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"categorias\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6),
(122, 6, 'pedido_belongsto_proyecto_relationship', 'relationship', 'proyecto', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Proyecto\",\"table\":\"proyectos\",\"type\":\"belongsTo\",\"column\":\"proyecto_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"categorias\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(123, 6, 'pedido_belongsto_cheque_relationship', 'relationship', 'cheques', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Cheque\",\"table\":\"cheques\",\"type\":\"belongsTo\",\"column\":\"cheque_id\",\"key\":\"id\",\"label\":\"beneficiario\",\"pivot_table\":\"categorias\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(124, 8, 'imagen', 'image', 'Imagen', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 7),
(125, 17, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(126, 17, 'beneficiario', 'text', 'Beneficiario', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 5),
(127, 17, 'monto_numeral', 'number', 'Monto Numeral', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 6),
(128, 17, 'monto_literal', 'text', 'Monto Literal', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 7),
(129, 17, 'fecha', 'date', 'Fecha', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 4),
(130, 17, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 8),
(131, 17, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 9),
(132, 17, 'entidad', 'text', 'Entidad', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 2),
(133, 17, 'numero_cuenta', 'text', 'Numero Cuenta', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 3),
(134, 18, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(135, 18, 'nombre', 'text', 'Nombre', 0, 1, 1, 1, 1, 1, NULL, 2),
(136, 18, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 3),
(137, 18, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(138, 6, 'pedido_belongsto_estado_relationship', 'relationship', 'estados', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Estado\",\"table\":\"estados\",\"type\":\"belongsTo\",\"column\":\"estado_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"categorias\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(139, 6, 'estado_id', 'text', 'Estado Id', 0, 1, 1, 1, 1, 1, NULL, 21),
(140, 6, 'literal', 'text', 'Literal', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 12),
(141, 11, 'item_belongsto_categoria_relationship', 'relationship', 'categorias', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Categoria\",\"table\":\"categorias\",\"type\":\"belongsTo\",\"column\":\"categoria_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"categorias\",\"pivot\":\"0\",\"taggable\":\"0\"}', 1),
(142, 11, 'item_belongsto_unidade_relationship', 'relationship', 'unidades', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Unidade\",\"table\":\"unidades\",\"type\":\"belongsTo\",\"column\":\"unidad_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"categorias\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(143, 11, 'imagen', 'image', 'Imagen', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 9),
(145, 6, 'pedido_belongstomany_item_relationship', 'relationship', 'items', 0, 0, 1, 1, 1, 1, '{\"model\":\"App\\\\Item\",\"table\":\"items\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"detalle_pedidos\",\"pivot\":\"1\",\"taggable\":\"0\"}', 22);

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
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', '', '', 1, 0, NULL, '2018-07-21 10:11:12', '2018-07-21 10:11:12'),
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
(14, 'maquinarias', 'maquinarias', 'Maquinaria', 'Maquinarias', NULL, 'App\\Maquinaria', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-07-29 22:11:23', '2018-07-29 22:11:23'),
(15, 'lugares', 'lugares', 'Lugare', 'Lugares', NULL, 'App\\Lugare', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-07-29 22:13:34', '2018-07-29 22:13:34'),
(16, 'choferes', 'choferes', 'Chofere', 'Choferes', NULL, 'App\\Chofere', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-07-29 22:15:52', '2018-07-29 22:15:52'),
(17, 'cheques', 'cheques', 'Cheque', 'Cheques', 'voyager-news', 'App\\Cheque', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null}', '2018-07-31 02:23:31', '2018-07-31 02:31:52'),
(18, 'estados', 'estados', 'Estado', 'Estados', NULL, 'App\\Estado', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-07-31 02:36:54', '2018-07-31 02:36:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_maquinarias`
--

CREATE TABLE `detalle_maquinarias` (
  `id` int(10) UNSIGNED NOT NULL,
  `detallepedido_id` int(11) DEFAULT NULL,
  `maquinaria_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedidos`
--

CREATE TABLE `detalle_pedidos` (
  `id` int(10) UNSIGNED NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT '0',
  `precio` double DEFAULT '0',
  `subtotal` double DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `detalle_pedidos`
--

INSERT INTO `detalle_pedidos` (`id`, `pedido_id`, `item_id`, `cantidad`, `precio`, `subtotal`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0, 0, 0, NULL, NULL),
(2, 1, 2, 0, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'Borrador', '2018-07-31 02:39:37', '2018-07-31 02:39:37');

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
  `imagen` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `items`
--

INSERT INTO `items` (`id`, `nombre`, `descripcion`, `categoria_id`, `unidad_id`, `created_at`, `updated_at`, `imagen`) VALUES
(1, 'Item 1', 'Descripcion del item 1', 1, 1, '2018-07-31 02:54:25', '2018-07-31 02:54:25', NULL),
(2, 'Item 2', 'Descripcion del item 2', 1, 1, '2018-07-31 02:55:33', '2018-07-31 03:25:06', NULL),
(3, 'Item 3', 'Descripcion del item 3', 1, 1, '2018-07-31 03:24:56', '2018-07-31 03:24:56', NULL),
(4, 'Item 4', 'Descripcion del Item 4', 1, 1, '2018-07-31 03:25:30', '2018-07-31 03:25:30', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lugares`
--

CREATE TABLE `lugares` (
  `id` int(10) UNSIGNED NOT NULL,
  `departamento` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provincia` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `municipio` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `localidad` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `referencia` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maquinarias`
--

CREATE TABLE `maquinarias` (
  `id` int(10) UNSIGNED NOT NULL,
  `codigo` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `placa` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `marca` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modelo` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chasis` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lugar_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(1, 1, 'Inicio', '', '_self', 'voyager-boat', '#000000', NULL, 1, '2018-07-21 10:11:12', '2018-07-29 19:04:00', 'voyager.profile', 'null'),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, 5, 1, '2018-07-21 10:11:12', '2018-07-21 06:24:11', 'voyager.media.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 5, '2018-07-21 10:11:12', '2018-07-21 06:27:51', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 2, '2018-07-21 10:11:12', '2018-07-21 06:24:11', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 3, '2018-07-21 10:11:12', '2018-07-21 06:24:11', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 4, '2018-07-21 10:11:12', '2018-07-21 06:24:11', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 5, '2018-07-21 10:11:12', '2018-07-21 06:24:11', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, 5, 7, '2018-07-21 10:11:12', '2018-07-21 06:24:11', 'voyager.settings.index', NULL),
(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 6, '2018-07-21 10:11:14', '2018-07-21 06:24:11', 'voyager.hooks', NULL),
(15, 1, 'Seguridad', '', '_self', 'voyager-lock', '#000000', NULL, 4, '2018-07-21 06:26:03', '2018-07-29 21:14:09', NULL, ''),
(16, 1, 'Gestiòn de Proyectos', '', '_self', 'voyager-data', '#000000', NULL, 2, '2018-07-21 06:27:02', '2018-07-29 21:14:39', NULL, ''),
(17, 1, 'Ventas de Hormigon', '', '_self', 'voyager-shop', '#000000', NULL, 3, '2018-07-21 06:27:41', '2018-07-29 21:14:48', NULL, ''),
(18, 1, 'Usuarios', '', '_self', NULL, '#000000', 15, 1, '2018-07-29 21:11:29', '2018-07-29 21:11:39', 'voyager.users.index', NULL),
(19, 1, 'Roles', '', '_self', NULL, '#000000', 15, 2, '2018-07-29 21:12:03', '2018-07-29 21:12:09', 'voyager.roles.index', NULL),
(21, 1, 'Permisos', '', '_self', NULL, '#000000', 15, 3, '2018-07-29 21:13:51', '2018-07-29 21:14:00', 'voyager.permissions.index', NULL),
(22, 1, 'Proyectos', '', '_self', NULL, NULL, 16, 2, '2018-07-29 21:26:03', '2018-07-30 01:05:02', 'voyager.proyectos.index', NULL),
(23, 1, 'Pedidos', '', '_self', NULL, NULL, 16, 3, '2018-07-29 21:31:18', '2018-07-30 01:05:02', 'voyager.pedidos.index', NULL),
(24, 1, 'Tipos', '', '_self', NULL, NULL, 16, 5, '2018-07-29 21:34:59', '2018-07-30 01:04:59', 'voyager.tipos.index', NULL),
(25, 1, 'Proveedores', '', '_self', NULL, NULL, 16, 6, '2018-07-29 21:37:03', '2018-07-30 01:04:59', 'voyager.proveedores.index', NULL),
(26, 1, 'Pagos', '', '_self', NULL, NULL, 16, 9, '2018-07-29 21:38:00', '2018-07-30 01:04:57', 'voyager.pagos.index', NULL),
(28, 1, 'Items', '', '_self', NULL, NULL, 16, 4, '2018-07-29 21:51:09', '2018-07-30 01:04:59', 'voyager.items.index', NULL),
(29, 1, 'Unidades', '', '_self', NULL, NULL, 16, 11, '2018-07-29 21:56:44', '2018-07-30 01:04:57', 'voyager.unidades.index', NULL),
(30, 1, 'Categorias', '', '_self', NULL, NULL, 16, 12, '2018-07-29 21:58:10', '2018-07-30 01:04:57', 'voyager.categorias.index', NULL),
(31, 1, 'Maquinarias', '', '_self', NULL, NULL, 16, 7, '2018-07-29 22:11:23', '2018-07-30 01:04:59', 'voyager.maquinarias.index', NULL),
(32, 1, 'Lugares', '', '_self', NULL, NULL, 16, 8, '2018-07-29 22:13:34', '2018-07-30 01:04:57', 'voyager.lugares.index', NULL),
(33, 1, 'Choferes', '', '_self', NULL, NULL, 16, 10, '2018-07-29 22:15:52', '2018-07-30 01:04:57', 'voyager.choferes.index', NULL),
(34, 1, 'Mis Pedidos', '', '_self', NULL, '#000000', 16, 1, '2018-07-30 01:04:47', '2018-07-30 02:09:04', 'pedidos.index', 'null'),
(35, 1, 'Cheques', '', '_self', NULL, NULL, 16, 13, '2018-07-31 02:23:31', '2018-07-31 02:23:59', 'voyager.cheques.index', NULL),
(36, 1, 'Estados', '', '_self', NULL, NULL, 15, 4, '2018-07-31 02:36:54', '2018-07-31 02:37:18', 'voyager.estados.index', NULL);

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
(1, 'Pago1', 'Tipo de Pago 1', '2018-07-31 02:21:38', '2018-07-31 02:21:38');

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
  `cheque_id` int(11) DEFAULT NULL,
  `tipo_id` int(11) DEFAULT NULL,
  `pago_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `literal` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `firma`, `referencia`, `estado_id`, `total`, `observacion`, `user_id`, `proveedor_id`, `proyecto_id`, `cheque_id`, `tipo_id`, `pago_id`, `created_at`, `updated_at`, `literal`) VALUES
(1, NULL, 'Referencia del pedido 1', 1, 100, 'Observaciones del pedido 1', 1, 1, 1, NULL, 1, 1, '2018-07-31 02:45:37', '2018-07-31 02:45:37', 'cien');

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
(107, 'browse_cheques', 'cheques', '2018-07-31 02:23:31', '2018-07-31 02:23:31'),
(108, 'read_cheques', 'cheques', '2018-07-31 02:23:31', '2018-07-31 02:23:31'),
(109, 'edit_cheques', 'cheques', '2018-07-31 02:23:31', '2018-07-31 02:23:31'),
(110, 'add_cheques', 'cheques', '2018-07-31 02:23:31', '2018-07-31 02:23:31'),
(111, 'delete_cheques', 'cheques', '2018-07-31 02:23:31', '2018-07-31 02:23:31'),
(112, 'browse_estados', 'estados', '2018-07-31 02:36:54', '2018-07-31 02:36:54'),
(113, 'read_estados', 'estados', '2018-07-31 02:36:54', '2018-07-31 02:36:54'),
(114, 'edit_estados', 'estados', '2018-07-31 02:36:54', '2018-07-31 02:36:54'),
(115, 'add_estados', 'estados', '2018-07-31 02:36:54', '2018-07-31 02:36:54'),
(116, 'delete_estados', 'estados', '2018-07-31 02:36:54', '2018-07-31 02:36:54');

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
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1);

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
  `imagen` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id`, `nombre`, `direccion`, `telefono`, `celular`, `correo`, `created_at`, `updated_at`, `imagen`) VALUES
(1, 'Proveedor 1', 'Calle', '33434324', '7111212', 'proveedor1@admin.com', '2018-07-31 02:18:25', '2018-07-31 02:18:25', 'proveedores/July2018/11j6vA2BxZqUVYw5CMsH.png');

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
(1, 'Proyecto 1', 'Descripción del proyecto 1', '500000', 1, '2018-08-15 00:00:00', NULL, NULL, '2018-07-31 01:23:04', '2018-07-31 01:28:43');

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
(2, 'user', 'Normal User', '2018-07-21 10:11:12', '2018-07-21 10:11:12');

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
(1, 'site.title', 'Site Title', 'Webpc v.10', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Sistema Web para Proyectos Civiles', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Turiro', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Webpc v1.0 - LoginWeb 2018', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin'),
(11, 'admin.mensaje_no_autorizado', 'mensaje_no_autorizado', 'No tienes los permisos para ver esta interface, comunicate con el administrador.', NULL, 'text', 6, 'Admin');

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
(1, 'Tipo1', 'Tipo de pedido 1', '2018-07-31 02:20:51', '2018-07-31 02:20:51');

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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `unidades`
--

INSERT INTO `unidades` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'unidad 1', 'Descripcion de la unidad 1', '2018-07-31 02:50:20', '2018-07-31 02:50:20');

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
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', '$2y$10$C7.519zYw7ES4SZ7BYZq.O3RFegLMgz2FvjPZG1lgMkNVf4hcQauu', 'ViYLLvzOXqBGpVb0yCHi8rpQ98iegGSsK8toiLdXSBiDHx5odz6XflsSgFgr', NULL, '2018-07-21 10:11:14', '2018-07-21 10:11:14'),
(3, 2, 'maria dias', 'maria.dias@admin.com', 'users/default.png', '$2y$10$eWaqmXQ44Uwg3yOAsVyzTOrG1DgKRjzcxedU7cPMK5wksZc89GNmK', NULL, NULL, '2018-07-29 20:15:33', '2018-07-29 20:15:33'),
(5, 2, 'luis flores', 'luis.flores@admin.com', 'users/default.png', '$2y$10$s4qKizUtLbvw5ri1HhoQa.el3sxCtfPdWHCL2aDuf4HCWlNNGYJ/6', 'FYIBu5ClmzDuA6wjYy8LUfu7MIAXOuEw3081aUvf053WxkgYh5zyucEA8ygi', NULL, '2018-07-29 20:16:29', '2018-07-29 20:16:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cheques`
--
ALTER TABLE `cheques`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `choferes`
--
ALTER TABLE `choferes`
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
-- Indices de la tabla `detalle_maquinarias`
--
ALTER TABLE `detalle_maquinarias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index1` (`pedido_id`),
  ADD KEY `index2` (`item_id`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
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
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cheques`
--
ALTER TABLE `cheques`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `choferes`
--
ALTER TABLE `choferes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT de la tabla `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `detalle_maquinarias`
--
ALTER TABLE `detalle_maquinarias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `items`
--
ALTER TABLE `items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `lugares`
--
ALTER TABLE `lugares`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `maquinarias`
--
ALTER TABLE `maquinarias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `tipos`
--
ALTER TABLE `tipos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `unidades`
--
ALTER TABLE `unidades`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
