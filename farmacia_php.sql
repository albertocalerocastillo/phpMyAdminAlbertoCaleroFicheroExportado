-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-04-2022 a las 17:07:44
-- Versión del servidor: 8.0.27
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `farmacia_php`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idCliente` int NOT NULL,
  `telefonoCliente` varchar(9) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `idPersonaFK` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idCliente`, `telefonoCliente`, `idPersonaFK`) VALUES
(1, '667835466', 1),
(2, '663231927', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `idEmpleado` int NOT NULL,
  `correoElectronicoEmpleado` varchar(100) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `idPersonaFK` int NOT NULL,
  `idEmpleadoJefeFK` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`idEmpleado`, `correoElectronicoEmpleado`, `idPersonaFK`, `idEmpleadoJefeFK`) VALUES
(1, 'rodolfort@gmail.com', 1, 1),
(2, 'martamc@gmail.com', 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `codigoFactura` int NOT NULL,
  `fechaFactura` date NOT NULL,
  `totalFactura` decimal(6,2) NOT NULL,
  `idClienteFK` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`codigoFactura`, `fechaFactura`, `totalFactura`, `idClienteFK`) VALUES
(1, '2022-04-03', '11.80', 1),
(2, '2022-03-09', '15.30', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `idPersona` int NOT NULL,
  `dniPersona` varchar(9) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `nombrePersona` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `apellidosPersona` varchar(100) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `domicilioPersona` varchar(100) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`idPersona`, `dniPersona`, `nombrePersona`, `apellidosPersona`, `domicilioPersona`) VALUES
(1, '12345678L', 'Rodolfo', 'Ruiz Torres\r\n', 'C/ Feria, 28\r\n'),
(2, '87654321D', 'Marta', 'Medina Carrasco\r\n', 'C/ Agua, 5\r\n');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pertenecer`
--

CREATE TABLE `pertenecer` (
  `idPertenencia` int NOT NULL,
  `cantidad` int NOT NULL,
  `codigoFacturaFK` int NOT NULL,
  `codigoProductoFK` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `pertenecer`
--

INSERT INTO `pertenecer` (`idPertenencia`, `cantidad`, `codigoFacturaFK`, `codigoProductoFK`) VALUES
(1, 2, 1, 1),
(2, 1, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `codigoProducto` int NOT NULL,
  `descripcionProducto` varchar(100) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `precioProducto` decimal(4,2) NOT NULL,
  `cantidadProducto` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`codigoProducto`, `descripcionProducto`, `precioProducto`, `cantidadProducto`) VALUES
(1, 'Ibuprofeno.', '9.90', 5),
(2, 'Paracetamol.', '5.30', 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idCliente`),
  ADD KEY `idPersonaFK` (`idPersonaFK`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`idEmpleado`),
  ADD KEY `idPersonaFK` (`idPersonaFK`),
  ADD KEY `idEmpleadoJefeFK` (`idEmpleadoJefeFK`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`codigoFactura`),
  ADD KEY `idClienteFK` (`idClienteFK`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`idPersona`);

--
-- Indices de la tabla `pertenecer`
--
ALTER TABLE `pertenecer`
  ADD PRIMARY KEY (`idPertenencia`),
  ADD KEY `codigoFacturaFK` (`codigoFacturaFK`,`codigoProductoFK`),
  ADD KEY `codigoProductoFK` (`codigoProductoFK`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`codigoProducto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idCliente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `idEmpleado` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `codigoFactura` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `idPersona` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `pertenecer`
--
ALTER TABLE `pertenecer`
  MODIFY `idPertenencia` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `codigoProducto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`idPersonaFK`) REFERENCES `personas` (`idPersona`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`idPersonaFK`) REFERENCES `personas` (`idPersona`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`idEmpleadoJefeFK`) REFERENCES `empleados` (`idEmpleado`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`idClienteFK`) REFERENCES `clientes` (`idCliente`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `pertenecer`
--
ALTER TABLE `pertenecer`
  ADD CONSTRAINT `pertenecer_ibfk_1` FOREIGN KEY (`codigoFacturaFK`) REFERENCES `facturas` (`codigoFactura`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `pertenecer_ibfk_2` FOREIGN KEY (`codigoProductoFK`) REFERENCES `productos` (`codigoProducto`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
