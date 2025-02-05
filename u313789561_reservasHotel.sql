-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 05-02-2025 a las 01:00:25
-- Versión del servidor: 10.11.10-MariaDB
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `u313789561_reservasHotel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administradores`
--

CREATE TABLE `administradores` (
  `id` int(11) NOT NULL,
  `perfil` text NOT NULL,
  `nombre` text NOT NULL,
  `usuario` text NOT NULL,
  `password` text NOT NULL,
  `estado` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administradores`
--

INSERT INTO `administradores` (`id`, `perfil`, `nombre`, `usuario`, `password`, `estado`, `fecha`) VALUES
(5, 'Administrador', 'Gerencia', 'Gerencia', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 1, '2025-01-14 01:24:29'),
(6, 'Empleado', 'RESERVAS', 'RESERVAS', '$2a$07$asxx54ahjppf45sd87a5auRajNP0zeqOkB9Qda.dSiTb2/n.wAC/2', 0, '2025-01-17 14:26:36'),
(7, 'Empleado', 'LOGISTICA ', 'LOGISTICA', '$2a$07$asxx54ahjppf45sd87a5auRajNP0zeqOkB9Qda.dSiTb2/n.wAC/2', 0, '2025-01-17 14:27:35'),
(8, 'Empleado', 'SOCIOS', 'SOCIOS', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 0, '2025-01-17 14:29:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agenda`
--

CREATE TABLE `agenda` (
  `id` int(11) NOT NULL,
  `id_habitacion` int(11) NOT NULL,
  `fecha_ingreso` datetime NOT NULL,
  `fecha_salida` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `agenda`
--

INSERT INTO `agenda` (`id`, `id_habitacion`, `fecha_ingreso`, `fecha_salida`) VALUES
(1, 1, '2019-05-29 18:00:00', '2019-05-29 19:00:00'),
(2, 2, '2019-05-29 18:00:00', '2019-05-29 19:00:00'),
(3, 3, '2019-05-29 18:00:00', '2019-05-29 19:00:00'),
(4, 4, '2019-04-29 18:00:00', '2019-04-29 19:00:00'),
(5, 5, '2019-05-29 18:00:00', '2019-05-29 19:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banner`
--

CREATE TABLE `banner` (
  `id` int(11) NOT NULL,
  `img` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `banner`
--

INSERT INTO `banner` (`id`, `img`, `fecha`) VALUES
(1, 'vistas/img/banner/666.jpg', '2025-01-23 22:47:54'),
(2, 'vistas/img/banner/425.jpg', '2025-01-17 02:29:42'),
(3, 'vistas/img/banner/857.jpg', '2025-01-23 22:47:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `ruta` text NOT NULL,
  `color` text NOT NULL,
  `tipo` text NOT NULL,
  `img` text NOT NULL,
  `descripcion` text NOT NULL,
  `incluye` text NOT NULL,
  `continental_alta` float NOT NULL,
  `continental_baja` float NOT NULL,
  `americano_alta` float NOT NULL,
  `americano_baja` float NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `ruta`, `color`, `tipo`, `img`, `descripcion`, `incluye`, `continental_alta`, `continental_baja`, `americano_alta`, `americano_baja`, `fecha`) VALUES
(1, 'habitacion-casa-3', '#000000', 'Casa 3', 'vistas/img/suite/329.jpg', 'Espacios cómodos y versátiles', '[{\"item\":\"TV de 42 Pulg\",\"icono\":\"fas fa-tv\"},{\"item\":\"Sofá\",\"icono\":\"fas fa-couch\"},{\"item\":\"Servicio Wifi\",\"icono\":\"fas fa-wifi\"}]', 50000, 50000, 50000, 50000, '2025-01-23 14:19:08'),
(2, 'habitacion-casa-2', '#197DB1', 'Casa 2', 'vistas/img/especial/476.jpg', 'Opciones cómodas y funcionales', '[{\"item\":\"TV de 42 Pulg\",\"icono\":\"fas fa-tv\"},{\"item\":\"Agua Caliente\",\"icono\":\"fas fa-tint\"},{\"item\":\"Baño privado\",\"icono\":\"fas fa-toilet\"},{\"item\":\"Sofá\",\"icono\":\"fas fa-couch\"},{\"item\":\"Balcón\",\"icono\":\"far fa-image\"},{\"item\":\"Servicio Wifi\",\"icono\":\"fas fa-wifi\"}]', 50000, 50000, 50000, 50000, '2025-01-23 14:18:54'),
(3, 'habitacion-casa-1', '#2F7D84', 'Casa 1', 'vistas/img/standar/950.jpg', 'Experiencia cómoda y adaptable', '[{\"item\":\"Cama 2 x 2\",\"icono\":\"fas fa-bed\"},{\"item\":\"TV de 42 Pulg\",\"icono\":\"fas fa-tv\"},{\"item\":\"Agua Caliente\",\"icono\":\"fas fa-tint\"},{\"item\":\"Jacuzzi\",\"icono\":\"fas fa-water\"},{\"item\":\"Baño privado\",\"icono\":\"fas fa-toilet\"},{\"item\":\"Sofá\",\"icono\":\"fas fa-couch\"},{\"item\":\"Balcón\",\"icono\":\"far fa-image\"},{\"item\":\"Servicio Wifi\",\"icono\":\"fas fa-wifi\"}]', 50000, 50000, 50000, 50000, '2025-01-23 14:18:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitaciones`
--

CREATE TABLE `habitaciones` (
  `id_h` int(11) NOT NULL,
  `tipo_h` int(11) NOT NULL,
  `estilo` text NOT NULL,
  `galeria` text NOT NULL,
  `video` text NOT NULL,
  `recorrido_virtual` text NOT NULL,
  `descripcion_h` text NOT NULL,
  `fecha_h` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `habitaciones`
--

INSERT INTO `habitaciones` (`id_h`, `tipo_h`, `estilo`, `galeria`, `video`, `recorrido_virtual`, `descripcion_h`, `fecha_h`) VALUES
(11, 3, 'HAB 201', '[\"vistas\\/img\\/standar\\/caribena01.jpg\",\"vistas\\/img\\/standar\\/caribena02.jpg\",\"vistas\\/img\\/standar\\/caribena03.jpg\",\"vistas\\/img\\/standar\\/caribena04.jpg\"]', 'JTu790_yyRc', 'vistas/img/standar/colonial-360.jpg', '<p>Lorem ipsum dolor sit amet, consectetur adipisi...</p>', '2025-01-23 14:09:10'),
(12, 3, 'HAB 202', '[\"vistas/img/standar/colonial01.jpg\", \"vistas/img/standar/colonial02.jpg\", \"vistas/img/standar/colonial03.jpg\",\"vistas/img/standar/colonial04.jpg\"]\r\n', 'JTu790_yyRc', 'vistas/img/standar/colonial-360.jpg', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cum sit, quia blanditiis fugiat nam libero possimus totam modi sint autem repellat fugit dicta est pariatur? Ut aut vel ad sapiente. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae, reprehenderit! Deserunt laborum dolorum deleniti molestiae quae vitae animi ratione nihil, minus ut quibusdam incidunt voluptate eos sed id repudiandae ex.\r\n					</p>	\r\n\r\n					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cum sit, quia blanditiis fugiat nam libero possimus totam modi sint autem repellat fugit dicta est pariatur? Ut aut vel ad sapiente. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae, reprehenderit! Deserunt laborum dolorum deleniti molestiae quae vitae animi ratione nihil, minus ut quibusdam incidunt voluptate eos sed id repudiandae ex.\r\n					</p>\r\n\r\n					<br>\r\n\r\n					<h3>PLAN CONTINENTAL</h3>\r\n\r\n					<p>(Precio x pareja 1 día 1 noche, incluye: desayuno)<br>\r\n					Temporada Baja: S/300<br>\r\n					Temporada Alta: S/350</p>	\r\n\r\n					<br>\r\n\r\n					<h3>PLAN AMERICANO</h3>\r\n\r\n					<p>(Precio x pareja 1 día 1 noche, incluye: cena, desayuno, almuerzo)<br>\r\n					Temporada Baja: S/380<br>\r\n					Temporada Alta: S/420</p>\r\n					\r\n					<br>\r\n\r\n					<p>Hora de entrada (Check in) 3:00 pm | Hora de salida (Check out) 1:00 pm</p>', '2025-01-23 13:54:09'),
(13, 3, 'HAB 203', '[\"vistas/img/standar/hindu01.jpg\", \"vistas/img/standar/hindu02.jpg\", \"vistas/img/standar/hindu03.jpg\",\"vistas/img/standar/hindu04.jpg\"]', 'JTu790_yyRc', 'vistas/img/standar/hindu-360.jpg', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cum sit, quia blanditiis fugiat nam libero possimus totam modi sint autem repellat fugit dicta est pariatur? Ut aut vel ad sapiente. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae, reprehenderit! Deserunt laborum dolorum deleniti molestiae quae vitae animi ratione nihil, minus ut quibusdam incidunt voluptate eos sed id repudiandae ex.\r\n					</p>	\r\n\r\n					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cum sit, quia blanditiis fugiat nam libero possimus totam modi sint autem repellat fugit dicta est pariatur? Ut aut vel ad sapiente. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae, reprehenderit! Deserunt laborum dolorum deleniti molestiae quae vitae animi ratione nihil, minus ut quibusdam incidunt voluptate eos sed id repudiandae ex.\r\n					</p>\r\n\r\n					<br>\r\n\r\n					<h3>PLAN CONTINENTAL</h3>\r\n\r\n					<p>(Precio x pareja 1 día 1 noche, incluye: desayuno)<br>\r\n					Temporada Baja: S/300<br>\r\n					Temporada Alta: S/350</p>	\r\n\r\n					<br>\r\n\r\n					<h3>PLAN AMERICANO</h3>\r\n\r\n					<p>(Precio x pareja 1 día 1 noche, incluye: cena, desayuno, almuerzo)<br>\r\n					Temporada Baja: S/380<br>\r\n					Temporada Alta: S/420</p>\r\n					\r\n					<br>\r\n\r\n					<p>Hora de entrada (Check in) 3:00 pm | Hora de salida (Check out) 1:00 pm</p>', '2025-01-23 13:53:25'),
(14, 3, 'HAB 101', '[\"vistas/img/standar/marroqui01.jpg\", \"vistas/img/standar/marroqui02.jpg\", \"vistas/img/standar/marroqui03.jpg\",\"vistas/img/standar/marroqui04.jpg\"]', 'JTu790_yyRc', 'vistas/img/standar/marroqui-360.jpg', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cum sit, quia blanditiis fugiat nam libero possimus totam modi sint autem repellat fugit dicta est pariatur? Ut aut vel ad sapiente. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae, reprehenderit! Deserunt laborum dolorum deleniti molestiae quae vitae animi ratione nihil, minus ut quibusdam incidunt voluptate eos sed id repudiandae ex.\r\n					</p>	\r\n\r\n					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cum sit, quia blanditiis fugiat nam libero possimus totam modi sint autem repellat fugit dicta est pariatur? Ut aut vel ad sapiente. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae, reprehenderit! Deserunt laborum dolorum deleniti molestiae quae vitae animi ratione nihil, minus ut quibusdam incidunt voluptate eos sed id repudiandae ex.\r\n					</p>\r\n\r\n					<br>\r\n\r\n					<h3>PLAN CONTINENTAL</h3>\r\n\r\n					<p>(Precio x pareja 1 día 1 noche, incluye: desayuno)<br>\r\n					Temporada Baja: S/300<br>\r\n					Temporada Alta: S/350</p>	\r\n\r\n					<br>\r\n\r\n					<h3>PLAN AMERICANO</h3>\r\n\r\n					<p>(Precio x pareja 1 día 1 noche, incluye: cena, desayuno, almuerzo)<br>\r\n					Temporada Baja: S/380<br>\r\n					Temporada Alta: S/420</p>\r\n					\r\n					<br>\r\n\r\n					<p>Hora de entrada (Check in) 3:00 pm | Hora de salida (Check out) 1:00 pm</p>', '2025-01-23 13:52:44'),
(15, 3, 'HAB 102', '[\"vistas/img/standar/retro01.jpg\", \"vistas/img/standar/retro02.jpg\", \"vistas/img/standar/retro03.jpg\",\"vistas/img/standar/retro04.jpg\"]\r\n', 'JTu790_yyRc', 'vistas/img/standar/retro-360.jpg', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cum sit, quia blanditiis fugiat nam libero possimus totam modi sint autem repellat fugit dicta est pariatur? Ut aut vel ad sapiente. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae, reprehenderit! Deserunt laborum dolorum deleniti molestiae quae vitae animi ratione nihil, minus ut quibusdam incidunt voluptate eos sed id repudiandae ex.\r\n					</p>	\r\n\r\n					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cum sit, quia blanditiis fugiat nam libero possimus totam modi sint autem repellat fugit dicta est pariatur? Ut aut vel ad sapiente. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae, reprehenderit! Deserunt laborum dolorum deleniti molestiae quae vitae animi ratione nihil, minus ut quibusdam incidunt voluptate eos sed id repudiandae ex.\r\n					</p>\r\n\r\n					<br>\r\n\r\n					<h3>PLAN CONTINENTAL</h3>\r\n\r\n					<p>(Precio x pareja 1 día 1 noche, incluye: desayuno)<br>\r\n					Temporada Baja: S/300<br>\r\n					Temporada Alta: S/350</p>	\r\n\r\n					<br>\r\n\r\n					<h3>PLAN AMERICANO</h3>\r\n\r\n					<p>(Precio x pareja 1 día 1 noche, incluye: cena, desayuno, almuerzo)<br>\r\n					Temporada Baja: S/380<br>\r\n					Temporada Alta: S/420</p>\r\n					\r\n					<br>\r\n\r\n					<p>Hora de entrada (Check in) 3:00 pm | Hora de salida (Check out) 1:00 pm</p>', '2025-01-23 13:53:01'),
(25, 3, 'HAB 204', '[\"vistas/img/standar/hindu01.jpg\", \"vistas/img/standar/hindu02.jpg\", \"vistas/img/standar/hindu03.jpg\",\"vistas/img/standar/hindu04.jpg\"]', 'JTu790_yyRc', 'vistas/img/standar/hindu-360.jpg', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cum sit, quia blanditiis fugiat nam libero possimus totam modi sint autem repellat fugit dicta est pariatur? Ut aut vel ad sapiente. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae, reprehenderit! Deserunt laborum dolorum deleniti molestiae quae vitae animi ratione nihil, minus ut quibusdam incidunt voluptate eos sed id repudiandae ex.\r\n					</p>	\r\n\r\n					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cum sit, quia blanditiis fugiat nam libero possimus totam modi sint autem repellat fugit dicta est pariatur? Ut aut vel ad sapiente. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae, reprehenderit! Deserunt laborum dolorum deleniti molestiae quae vitae animi ratione nihil, minus ut quibusdam incidunt voluptate eos sed id repudiandae ex.\r\n					</p>\r\n\r\n					<br>\r\n\r\n					<h3>PLAN CONTINENTAL</h3>\r\n\r\n					<p>(Precio x pareja 1 día 1 noche, incluye: desayuno)<br>\r\n					Temporada Baja: S/300<br>\r\n					Temporada Alta: S/350</p>	\r\n\r\n					<br>\r\n\r\n					<h3>PLAN AMERICANO</h3>\r\n\r\n					<p>(Precio x pareja 1 día 1 noche, incluye: cena, desayuno, almuerzo)<br>\r\n					Temporada Baja: S/380<br>\r\n					Temporada Alta: S/420</p>\r\n					\r\n					<br>\r\n\r\n					<p>Hora de entrada (Check in) 3:00 pm | Hora de salida (Check out) 1:00 pm</p>', '2025-01-23 14:07:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones`
--

CREATE TABLE `notificaciones` (
  `id` int(11) NOT NULL,
  `tipo` text NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `notificaciones`
--

INSERT INTO `notificaciones` (`id`, `tipo`, `cantidad`, `fecha`) VALUES
(1, 'reservas', 0, '2020-08-23 01:49:14'),
(2, 'testimonios', 0, '2020-08-23 01:41:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planes`
--

CREATE TABLE `planes` (
  `id` int(11) NOT NULL,
  `tipo` text NOT NULL,
  `img` text NOT NULL,
  `descripcion` text NOT NULL,
  `precio_alta` float NOT NULL,
  `precio_baja` float NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `planes`
--

INSERT INTO `planes` (`id`, `tipo`, `img`, `descripcion`, `precio_alta`, `precio_baja`, `fecha`) VALUES
(4, 'TOUR ISLA SAN BERNARDO ', 'vistas/img/planes/434.jpg', '<p>&nbsp;¿Listo para descubrir el paraíso tropical de las Islas de San Bernardo? ¡No te pierdas esta oportunidad única de experimentar la belleza natural y la cultura de la región!&nbsp;</p><p>Sumérgete en las aguas cristalinas del mar Caribe, disfruta de playas de arena blanca y déjate llevar por la belleza de la naturaleza. Desde la Isla Mangle hasta la Isla Tintipán, cada isla es un mundo por descubrir, lleno de sorpresas y aventuras.</p>', 550, 450, '2025-01-17 02:39:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recorrido`
--

CREATE TABLE `recorrido` (
  `id` int(11) NOT NULL,
  `foto_peq` text NOT NULL,
  `foto_grande` text NOT NULL,
  `titulo` text NOT NULL,
  `descripcion` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `recorrido`
--

INSERT INTO `recorrido` (`id`, `foto_peq`, `foto_grande`, `titulo`, `descripcion`, `fecha`) VALUES
(1, 'vistas/img/recorrido/pueblo01a.png', 'vistas/img/recorrido/pueblo01b.png', 'LOREM IPSUM', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo velit quis iusto magnam cupiditate dolorum repudiandae tempore cum minus eos a iure, officiis, eius, consequuntur unde nulla, enim quibusdam beatae.', '2019-04-09 19:32:53'),
(2, 'vistas/img/recorrido/pueblo02a.png', 'vistas/img/recorrido/pueblo02b.png', 'LOREM IPSUM', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo velit quis iusto magnam cupiditate dolorum repudiandae tempore cum minus eos a iure, officiis, eius, consequuntur unde nulla, enim quibusdam beatae.', '2019-04-09 19:32:53'),
(6, 'vistas/img/recorrido/357.jpg', 'vistas/img/recorrido/201.jpg', 'PARQUE MUSEO DE INFANTERíA DE MARINA EN COVEñAS', 'Uno de los lugares imperdibles es el Parque Museo de Infantería de Marina, que rinde homenaje a la labor de los infantes de marina en Colombia a lo largo de los años.\r\nEste museo inaugurado el 17 de agosto de 2012', '2025-01-22 22:32:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `id_reserva` int(11) NOT NULL,
  `id_habitacion` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `pago_reserva` float NOT NULL,
  `numero_transaccion` text NOT NULL,
  `codigo_reserva` text NOT NULL,
  `descripcion_reserva` text NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_salida` date NOT NULL,
  `fecha_reserva` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`id_reserva`, `id_habitacion`, `id_usuario`, `pago_reserva`, `numero_transaccion`, `codigo_reserva`, `descripcion_reserva`, `fecha_ingreso`, `fecha_salida`, `fecha_reserva`) VALUES
(8, 1, 8, 900000, '19680828', '6NJS06V8L', 'Habitación Suite Oriental - Plan Continental - 2 personas', '2020-08-13', '2020-08-17', '2020-07-16 18:11:33'),
(9, 2, 8, 760000, '19680844', 'M1UHK6R50', 'Habitación Suite Moderna - Plan Americano - 2 personas', '2020-06-18', '2020-06-20', '2020-06-16 18:12:53'),
(10, 3, 8, 420000, '19680849', 'YK51N1HAQ', 'Habitación Suite Africana - Plan Romantico - 2 personas', '2020-02-20', '2020-02-22', '2020-08-22 01:43:15'),
(11, 1, 7, 860000, '19680940', '2S7PLNC32', 'Habitación Suite Oriental - Plan Luna de Miel - 2 personas', '2020-08-12', '2020-08-15', '2020-08-22 01:44:18'),
(12, 2, 7, 820000, '19681854', '3UD1XIBEO', 'Habitación Suite Moderna - Plan Aventura - 2 personas', '2020-04-16', '2020-04-20', '2020-08-22 01:43:49'),
(13, 3, 7, 1260000, '19681866', 'WFZIEN8MO', 'Habitación Suite Africana - Plan Romantico - 2 personas', '2020-02-07', '2020-02-10', '2020-08-22 01:44:39'),
(14, 1, 3, 900000, '19681883', '3U2WO6002', 'Habitación Suite Oriental - Plan Continental - 2 personas', '2020-03-27', '2020-03-30', '2020-08-22 01:45:10'),
(15, 2, 3, 860000, '19681896', 'N10L457ZB', 'Habitación Suite Moderna - Plan Luna de Miel - 2 personas', '2020-09-25', '2020-09-27', '2020-08-21 18:51:05'),
(16, 3, 3, 900000, '19681906', 'IMSB2OKGV', 'Habitación Suite Africana - Plan Continental - 2 personas', '0000-00-00', '0000-00-00', '2020-08-22 01:23:22'),
(17, 1, 4, 425000, '19681954', '6VZ4HIZ27', 'Habitación Suite Oriental - Plan SPA - 2 personas', '2020-08-19', '2020-08-20', '2020-08-21 18:08:33'),
(18, 2, 4, 300000, '19681999', 'L5BCTUYGM', 'Habitación Suite Moderna - Plan Continental - 2 personas', '2020-08-15', '2020-08-22', '2020-08-21 18:09:02'),
(19, 3, 4, 1290000, '19682031', 'ACXC0HPO5', 'Habitación Suite Africana - Plan Luna de Miel - 2 personas', '2020-08-19', '2020-08-21', '2020-08-21 17:51:08'),
(20, 1, 3, 760000, '19686161', 'ZLMAOP6C0', 'Habitación Suite Oriental - Plan Americano - 2 personas', '0000-00-00', '0000-00-00', '2020-08-22 01:23:30'),
(21, 2, 9, 600, '28947282', '1K7B9F5ID', 'Habitación Suite Moderna - Plan Continental - 2 personas', '2020-03-18', '2020-03-20', '2020-08-04 01:42:19'),
(22, 1, 10, 300, '28947388', 'YEHXHSRIK', 'Habitación Suite Oriental - Plan Continental - 2 personas', '2020-08-16', '2020-08-17', '2020-08-15 02:56:25'),
(23, 8, 11, 500, '28947652', '0YGPLCHX8', 'Habitación Especial Africana - Plan Continental - 2 personas', '2020-06-20', '2020-06-22', '2020-04-09 01:42:08'),
(24, 2, 12, 600, '28961574', '6BUZBJUJO', 'Habitación Suite Moderna - Plan Continental - 2 personas', '0000-00-00', '0000-00-00', '2020-08-22 01:18:57'),
(25, 6, 4, 250, '29129954', 'O6M8YWMF5', 'Habitación Especial Oriental - Plan Continental - 2 personas', '2020-05-22', '2020-05-23', '2020-04-17 01:41:54'),
(26, 11, 13, 600, '29155556', 'WW9XWNJNA', 'Habitación Standar Caribeña - Plan Continental - 2 personas', '2025-02-19', '2025-02-22', '2025-02-04 19:26:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas2`
--

CREATE TABLE `reservas2` (
  `id` int(11) NOT NULL,
  `id_habitacion` int(11) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_salida` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `reservas2`
--

INSERT INTO `reservas2` (`id`, `id_habitacion`, `fecha_ingreso`, `fecha_salida`) VALUES
(1, 1, '2019-05-03', '2019-05-05'),
(2, 2, '2019-05-02', '2019-05-05'),
(3, 3, '2019-05-03', '2019-05-05'),
(4, 4, '2019-05-05', '2019-05-07'),
(5, 5, '2019-05-03', '2019-05-05'),
(6, 1, '2019-05-06', '2019-05-07'),
(7, 2, '2019-05-06', '2019-05-08'),
(8, 3, '2019-05-05', '2019-05-05'),
(9, 4, '2019-05-08', '2019-05-10'),
(10, 5, '2019-05-06', '2019-05-07'),
(11, 1, '2019-05-09', '2019-05-12'),
(12, 2, '2019-05-09', '2019-05-13'),
(13, 3, '2019-05-05', '2019-05-10'),
(14, 4, '2019-05-10', '2019-05-11'),
(15, 5, '2019-05-07', '2019-05-09'),
(16, 1, '2019-05-16', '2019-05-17'),
(17, 2, '2019-05-15', '2019-05-16'),
(18, 3, '2019-05-19', '2019-05-21'),
(19, 4, '2019-05-18', '2019-05-19'),
(20, 5, '2019-05-11', '2019-05-15'),
(21, 1, '2019-05-26', '2019-05-28'),
(22, 2, '2019-05-26', '2019-05-28'),
(23, 3, '2019-05-26', '2019-05-28'),
(24, 4, '2019-05-26', '2019-05-28'),
(25, 5, '2019-05-26', '2019-05-28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restaurante`
--

CREATE TABLE `restaurante` (
  `id` int(11) NOT NULL,
  `img` text NOT NULL,
  `descripcion` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `testimonios`
--

CREATE TABLE `testimonios` (
  `id_testimonio` int(11) NOT NULL,
  `id_res` int(11) NOT NULL,
  `id_us` int(11) NOT NULL,
  `id_hab` int(11) NOT NULL,
  `testimonio` text NOT NULL,
  `aprobado` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `testimonios`
--

INSERT INTO `testimonios` (`id_testimonio`, `id_res`, `id_us`, `id_hab`, `testimonio`, `aprobado`, `fecha`) VALUES
(1, 20, 3, 1, 'Fue una experiencia maravillosa', 1, '2019-05-15 00:35:52'),
(2, 14, 3, 1, 'Siempre quise una Luna de Miel como la que viví en este hotel', 1, '2019-05-15 00:36:05'),
(3, 15, 3, 2, 'La mejor experiencia de mi vida', 1, '2019-05-15 00:36:07'),
(4, 16, 3, 3, 'Me encantó estar en esta habitación.', 1, '2019-05-15 00:36:09'),
(5, 8, 8, 1, 'Super siempre quise estar acá', 1, '2019-05-15 00:36:12'),
(6, 9, 8, 2, 'Estoy muy agradecido con el personal del hotel', 1, '2019-05-15 00:36:14'),
(7, 10, 8, 3, 'La comida maravillosa', 1, '2019-05-15 00:36:16'),
(8, 11, 7, 1, 'Es una experiencia inolvidable', 1, '2019-05-15 00:36:20'),
(9, 12, 7, 2, 'El lugar es de ensueños', 0, '2020-08-22 02:51:58'),
(10, 13, 7, 3, 'Gracias, todo muy bien!', 0, '2020-08-22 02:52:29'),
(11, 17, 4, 1, 'Que belleza de lugar', 1, '2019-05-15 00:36:26'),
(12, 18, 4, 2, 'Volveré con mi familia', 1, '2019-05-15 00:36:29'),
(13, 19, 4, 3, 'Sin lugar a dudas, el mejor hotel de la zona', 0, '2020-08-22 02:51:01'),
(15, 22, 10, 1, 'Muy agradable', 0, '2020-08-15 02:56:40'),
(16, 23, 11, 8, 'Muy buena Habitación', 0, '2020-08-15 03:11:23'),
(17, 24, 12, 2, 'Muy agradable buena experiencia.', 1, '2020-08-22 02:52:16'),
(19, 26, 13, 11, 'Muy buena habitación, me gusto', 1, '2020-08-23 00:16:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_u` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `password` text NOT NULL,
  `email` text NOT NULL,
  `foto` text NOT NULL,
  `modo` text NOT NULL,
  `verificacion` int(11) NOT NULL,
  `email_encriptado` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_u`, `nombre`, `password`, `email`, `foto`, `modo`, `verificacion`, `email_encriptado`, `fecha`) VALUES
(3, 'Juan Fernando Urrego', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 'correotutorialesatualcance@gmail.com', 'vistas/img/usuarios/3/279.png', 'directo', 1, '678ec21f18a39c43b95e93de54d78a93', '2019-05-14 22:15:37'),
(4, 'Felipe Trujillo', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 'felipe@hotmail.com', '', 'directo', 1, '8fe863573a42ae1ec12c4d3c1d591c6d', '2019-05-14 17:16:14'),
(7, 'Tutoriales a tu Alcance', 'null', 'correo.tutorialesatualcance@gmail.com', 'https://lh4.googleusercontent.com/-80gqeIg_Gq8/AAAAAAAAAAI/AAAAAAAAAF4/0_8JQ_8Gffk/s96-c/photo.jpg', 'google', 1, 'null', '2019-05-11 00:16:27'),
(8, 'Juan Fernando Urrego Alvarez', 'null', 'juanustudio@hotmail.com', 'http://graph.facebook.com/10219668435251136/picture?type=large', 'facebook', 1, 'null', '2019-05-14 17:05:28'),
(10, 'Luis Homero Tuesta Pereda', 'null', 'ltuestapereda@gmail.com', 'https://lh3.googleusercontent.com/a-/AOh14GjO1-4R2YiyOpqZXs0KfqDxmEcuRYXdGABo5R4=s96-c', 'google', 1, 'null', '2020-08-15 02:53:41'),
(11, 'Hector Tuesta Pereda', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 'tuestaperedahf@gmail.com', '', 'directo', 1, '88cee69fafa201a2f327619d49ca42d8', '2020-08-15 03:09:37'),
(12, 'Yenmy Guizado Zuñiga', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 'guizado@gmail.com', '', 'directo', 1, 'd05777fb5263e7df96d91bd9743eb4a2', '2020-08-15 23:55:20'),
(13, 'Junior Castillo ', '$2a$07$asxx54ahjppf45sd87a5auJRR6foEJ7ynpjisKtbiKJbvJsoQ8VPS', 'junior@gmail.com', '', 'directo', 1, '7f1faf39a24fa6a1bd053b454fd97f11', '2020-08-22 23:41:08'),
(14, 'HECTOR GOMEZ', '$2a$07$asxx54ahjppf45sd87a5au3.TF7TH1kNHlZ0SyHl9deFvHQuiHmUS', 'HDGOMEZ0@GMAIL.COM', '', 'directo', 0, '46f8f6c07b8f698c556454c10e41e04e', '2025-01-13 19:25:02'),
(15, 'David', '$2a$07$asxx54ahjppf45sd87a5augi3vp8hkK7ZOzxBSMKzuHtU70kZlirC', 'desarrolladorhd@gmail.com', '', 'directo', 0, 'd0cccc47117168bec5dbc5e92ff04aae', '2025-01-13 19:32:04'),
(16, 'Hector sanchez', '$2a$07$asxx54ahjppf45sd87a5auRajNP0zeqOkB9Qda.dSiTb2/n.wAC/2', 'hectorh.sancheza12345@gmail.com', '', 'directo', 0, '67c59631bb7905746e40d97eb044c4c7', '2025-01-14 01:32:53'),
(17, 'santamartero', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 'santamartero92@gmail.com', '', 'directo', 1, '7fdb6a25b9499dd2a982e500359cb88a', '2025-01-14 01:30:10'),
(18, 'vanesa martinez', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 'estefaniagm2023@gmail.com', '', 'directo', 1, 'c62c3753d2a16e79e20f9b608abb8d16', '2025-01-14 01:35:02'),
(19, 'gillermo giraldo ', '$2a$07$asxx54ahjppf45sd87a5auRajNP0zeqOkB9Qda.dSiTb2/n.wAC/2', 'girmo23@hotmail.es', '', 'directo', 0, '5e47b3134abf5d50799d8e854d318ba0', '2025-01-19 13:51:04'),
(20, 'gillermo giraldo ', '$2a$07$asxx54ahjppf45sd87a5auRajNP0zeqOkB9Qda.dSiTb2/n.wAC/2', 'gillermo23@gmail.com', '', 'directo', 0, '62aa52ff82e21198d58305cc5c94114d', '2025-01-19 13:52:16'),
(21, 'Guillermo giraldo', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 'guillermogiraldoforero@gmail.com', '', 'directo', 1, 'ad08d2c4244c37ecc1edf7019d438064', '2025-01-21 21:58:08');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administradores`
--
ALTER TABLE `administradores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `habitaciones`
--
ALTER TABLE `habitaciones`
  ADD PRIMARY KEY (`id_h`);

--
-- Indices de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `planes`
--
ALTER TABLE `planes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `recorrido`
--
ALTER TABLE `recorrido`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id_reserva`);

--
-- Indices de la tabla `reservas2`
--
ALTER TABLE `reservas2`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `restaurante`
--
ALTER TABLE `restaurante`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `testimonios`
--
ALTER TABLE `testimonios`
  ADD PRIMARY KEY (`id_testimonio`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_u`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administradores`
--
ALTER TABLE `administradores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `agenda`
--
ALTER TABLE `agenda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `habitaciones`
--
ALTER TABLE `habitaciones`
  MODIFY `id_h` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `planes`
--
ALTER TABLE `planes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `recorrido`
--
ALTER TABLE `recorrido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id_reserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `reservas2`
--
ALTER TABLE `reservas2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `restaurante`
--
ALTER TABLE `restaurante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `testimonios`
--
ALTER TABLE `testimonios`
  MODIFY `id_testimonio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_u` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
