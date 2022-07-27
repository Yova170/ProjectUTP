-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:33065
-- Tiempo de generación: 27-07-2022 a las 03:49:23
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gallinero`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ventas`
--

CREATE TABLE `detalle_ventas` (
  `IdDetalle_Venta` int(11) NOT NULL,
  `IdFactura` int(11) NOT NULL,
  `IdProducto` int(11) NOT NULL,
  `IdVenta` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Precio` decimal(20,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalle_ventas`
--

INSERT INTO `detalle_ventas` (`IdDetalle_Venta`, `IdFactura`, `IdProducto`, `IdVenta`, `Cantidad`, `Precio`) VALUES
(2, 2, 1, 23, 1, '0.25'),
(3, 2, 1, 23, 1, '0.25'),
(6, 0, 2, 50, 1, '1.10'),
(7, 0, 1, 51, 1, '0.25'),
(8, 0, 2, 51, 1, '1.10'),
(9, 0, 3, 51, 1, '8.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `IdProducto` int(11) NOT NULL,
  `NombreProducto` varchar(255) DEFAULT NULL,
  `Precio` decimal(20,2) DEFAULT NULL,
  `DescripProducto` text DEFAULT NULL,
  `Imagen` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`IdProducto`, `NombreProducto`, `Precio`, `DescripProducto`, `Imagen`) VALUES
(1, 'Huevos', '0.25', 'bnmk,l.', 'https://solidstarts.com/wp-content/uploads/when-can-babies-eat-eggs.jpg'),
(2, 'Pechuga de Pollo', '1.10', 'La mejor pechuga', 'https://gastronomiaycia.republica.com/wp-content/uploads/2017/06/pechugas_madera-680x445.jpg'),
(3, 'Pollo entero', '8.00', 'Pollo entero de la mejor calidad', 'https://i.blogs.es/8ceb02/pollo_entero/840_560.jpg'),
(4, 'Gallo Macho', '12.00', 'Gallos para venta', 'https://www.eltiempo.com/files/image_640_428/files/crop/uploads/2021/03/01/603d6e3c27085.r_1614703186322.0-0-2121-1055.jpeg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `IdVenta` int(11) NOT NULL,
  `ClaveTrans` varchar(250) NOT NULL,
  `Fecha` date NOT NULL,
  `Correo` varchar(250) NOT NULL,
  `Total` decimal(20,2) NOT NULL,
  `Estado` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`IdVenta`, `ClaveTrans`, `Fecha`, `Correo`, `Total`, `Estado`) VALUES
(14, 'l4v5d5cvloamaev8affeshn0dr', '2022-07-01', 'uncorreo@gmail.com', '9.00', 'Pendiente'),
(15, 'l4v5d5cvloamaev8affeshn0dr', '2022-07-01', 'fghjk@hjkl.com', '9.00', 'Pendiente'),
(16, 'l4v5d5cvloamaev8affeshn0dr', '2022-07-01', 'fghjk@hjkl.com', '9.10', 'Pendiente'),
(17, 'l4v5d5cvloamaev8affeshn0dr', '2022-07-01', 'ertyui@gmail.com', '9.10', 'Pendiente'),
(18, 'l4v5d5cvloamaev8affeshn0dr', '2022-07-01', 'ertyui@gmail.com', '9.10', 'Pendiente'),
(19, 'l4v5d5cvloamaev8affeshn0dr', '2022-07-01', 'ertyui@gmail.com', '9.10', 'Pendiente'),
(20, 'l4v5d5cvloamaev8affeshn0dr', '2022-07-01', 'ertyui@gmail.com', '9.10', 'Pendiente'),
(21, 'l4v5d5cvloamaev8affeshn0dr', '2022-07-01', 'david.rodriguez6@utp.ac.pa', '1.35', 'Pendiente'),
(22, 'mfqgqsq4i4hq77aef31e1gt3r7', '2022-07-05', 'agua@dfghj.com', '9.10', 'Pendiente'),
(23, 'ihnumub57fcco46pj177gbb6cv', '2022-07-05', '2345678@tel.com', '1.10', 'Pendiente'),
(24, 'n3ucpprujnjjp5bi0j5n8c23n7', '2022-07-25', 'ertyuio@gmail.com', '9.10', 'Pendiente'),
(25, 'n3ucpprujnjjp5bi0j5n8c23n7', '2022-07-25', '1234567@gmail.com', '1.35', 'Pendiente'),
(26, 'n3ucpprujnjjp5bi0j5n8c23n7', '2022-07-25', '34567@lol.com', '1.60', 'Pendiente'),
(27, 'n3ucpprujnjjp5bi0j5n8c23n7', '2022-07-25', '34567@lol.com', '1.60', 'Pendiente'),
(28, 'n3ucpprujnjjp5bi0j5n8c23n7', '2022-07-25', '34567@lol.com', '1.60', 'Pendiente'),
(29, 'n3ucpprujnjjp5bi0j5n8c23n7', '2022-07-25', 'uuu@uuu.com', '1.60', 'Pendiente'),
(30, 'n3ucpprujnjjp5bi0j5n8c23n7', '2022-07-25', 'uuu@uuu.com', '1.60', 'Pendiente'),
(31, 'n3ucpprujnjjp5bi0j5n8c23n7', '2022-07-25', 'fghj@ee.com', '1.60', 'Pendiente'),
(32, 'n3ucpprujnjjp5bi0j5n8c23n7', '2022-07-25', 'nuevo@gmail.com', '1.10', 'Pendiente'),
(33, 'n3ucpprujnjjp5bi0j5n8c23n7', '2022-07-25', 'nuevo@gmail.com', '1.10', 'Pendiente'),
(34, 'n3ucpprujnjjp5bi0j5n8c23n7', '2022-07-25', 'lol@gmail.com', '1.10', 'Pendiente'),
(35, 'n3ucpprujnjjp5bi0j5n8c23n7', '2022-07-25', 'fire@er.com', '1.10', 'Pendiente'),
(36, 'n3ucpprujnjjp5bi0j5n8c23n7', '2022-07-25', 'fire@er.com', '1.10', 'Pendiente'),
(37, 'n3ucpprujnjjp5bi0j5n8c23n7', '2022-07-25', 'fire@er.com', '1.10', 'Pendiente'),
(38, 'n3ucpprujnjjp5bi0j5n8c23n7', '2022-07-25', 'fire@er.com', '1.10', 'Pendiente'),
(39, 'n3ucpprujnjjp5bi0j5n8c23n7', '2022-07-25', 'fire@er.com', '1.10', 'Pendiente'),
(40, 'n3ucpprujnjjp5bi0j5n8c23n7', '2022-07-25', 'fire@er.com', '1.10', 'Pendiente'),
(41, 'n3ucpprujnjjp5bi0j5n8c23n7', '2022-07-25', 'fire@er.com', '1.10', 'Pendiente'),
(42, 'n3ucpprujnjjp5bi0j5n8c23n7', '2022-07-25', 'fire@er.com', '1.10', 'Pendiente'),
(43, 'n3ucpprujnjjp5bi0j5n8c23n7', '2022-07-25', 'lol@gmail.com', '1.10', 'Pendiente'),
(44, 'n3ucpprujnjjp5bi0j5n8c23n7', '2022-07-25', 'lol@gmail.com', '1.10', 'Pendiente'),
(45, 'n3ucpprujnjjp5bi0j5n8c23n7', '2022-07-25', 'lol@gmail.com', '1.10', 'Pendiente'),
(46, 'n3ucpprujnjjp5bi0j5n8c23n7', '2022-07-25', 'lol@gmail.com', '1.10', 'Pendiente'),
(47, 'n3ucpprujnjjp5bi0j5n8c23n7', '2022-07-25', 'lol@gmail.com', '1.10', 'Pendiente'),
(48, 'n3ucpprujnjjp5bi0j5n8c23n7', '2022-07-25', 'lol@gmail.com', '1.10', 'Pendiente'),
(49, 'n3ucpprujnjjp5bi0j5n8c23n7', '2022-07-25', 'lol@llll.com', '1.10', 'Pendiente'),
(50, 'n3ucpprujnjjp5bi0j5n8c23n7', '2022-07-25', 'lol@llll.com', '1.10', 'Pendiente'),
(51, 'n3ucpprujnjjp5bi0j5n8c23n7', '2022-07-25', 'lol@llll.com', '9.35', 'Pendiente');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD PRIMARY KEY (`IdDetalle_Venta`),
  ADD KEY `IdProducto` (`IdProducto`),
  ADD KEY `IdVenta` (`IdVenta`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`IdProducto`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`IdVenta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  MODIFY `IdDetalle_Venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `IdVenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD CONSTRAINT `detalle_ventas_ibfk_1` FOREIGN KEY (`IdVenta`) REFERENCES `ventas` (`IdVenta`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_ventas_ibfk_2` FOREIGN KEY (`IdProducto`) REFERENCES `productos` (`IdProducto`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
