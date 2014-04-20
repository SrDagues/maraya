-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-04-2014 a las 16:39:18
-- Versión del servidor: 5.6.14
-- Versión de PHP: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `maraya`
--
CREATE DATABASE IF NOT EXISTS `maraya` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `maraya`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especializaciones`
--

CREATE TABLE IF NOT EXISTS `especializaciones` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `especializacion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `especializacion` (`especializacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `especializaciones`
--

INSERT INTO `especializaciones` (`ID`, `especializacion`) VALUES
(2, 'Cardiólogo'),
(1, 'Endocrino'),
(5, 'Ginecólogo'),
(3, 'Médico de cabecera'),
(4, 'Neurocirujano');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gruposmedicos`
--

CREATE TABLE IF NOT EXISTS `gruposmedicos` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `paciente` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `medico` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `medico` (`medico`),
  KEY `paciente` (`paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `gruposmedicos`
--

INSERT INTO `gruposmedicos` (`ID`, `paciente`, `medico`) VALUES
(1, '0000000003', '0000000000000002'),
(2, '0000000003', '45123qweasdzxc14'),
(3, '123qweasdx', '45123qweasdzxc12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE IF NOT EXISTS `historial` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `nHistorial` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `informacion` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `nHistorial` (`nHistorial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `historial`
--

INSERT INTO `historial` (`ID`, `nHistorial`, `informacion`, `fecha_creacion`) VALUES
(1, '0000000000000001', 'El paciente sufre de bajones de tensión al ver sangre', '2014-04-18'),
(2, '0000000000000002', 'El paciente sufre de Diabetes', '2014-04-18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicos`
--

CREATE TABLE IF NOT EXISTS `medicos` (
  `nColegiado` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `DNI` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `apellidos` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `especializacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`nColegiado`),
  KEY `especializacion` (`especializacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `medicos`
--

INSERT INTO `medicos` (`nColegiado`, `DNI`, `nombre`, `apellidos`, `especializacion`) VALUES
('0000000000000001', '42102329H', 'Javier', 'Ordíñez Martínez', 5),
('0000000000000002', '42102321L', 'Paco', 'Domínguez Guillen', 1),
('45123qweasdzxc12', '69017485L', 'Dani Cuenca', 'Fernández Rodríguez', 3),
('45123qweasdzxc14', '69017485X', 'Nathan', 'Explosion', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE IF NOT EXISTS `paciente` (
  `NSS` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `DNI` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `apellidos` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `historial` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`NSS`),
  KEY `historial` (`historial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`NSS`, `DNI`, `nombre`, `apellidos`, `fecha_nacimiento`, `historial`) VALUES
('0000000003', '76918475L', 'Edgar', 'Pérez Ferrando', '1989-12-28', NULL),
('123qweasdc', '79019418L', 'Francisco José', 'Dominguez Ruiz', '2010-01-08', NULL),
('123qweasdx', '79019417L', 'Francisco Jesus', 'Dominguez Ruiz', '1993-06-12', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_historial`
--

CREATE TABLE IF NOT EXISTS `registro_historial` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `historial` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `medico` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contenido` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `medico` (`medico`),
  KEY `historial` (`historial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_medicos`
--

CREATE TABLE IF NOT EXISTS `usuarios_medicos` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `medico` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `medico` (`medico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `usuarios_medicos`
--

INSERT INTO `usuarios_medicos` (`ID`, `user`, `password`, `medico`) VALUES
(1, 'Paco', '1234', '0000000000000002'),
(2, 'Pulgy', '1234', '0000000000000001');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_pacientes`
--

CREATE TABLE IF NOT EXISTS `usuarios_pacientes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paciente` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `paciente` (`paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `usuarios_pacientes`
--

INSERT INTO `usuarios_pacientes` (`ID`, `user`, `password`, `paciente`) VALUES
(1, 'Edgar', '1234', '0000000003'),
(2, 'Chiki', '1234', '123qweasdx');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `gruposmedicos`
--
ALTER TABLE `gruposmedicos`
  ADD CONSTRAINT `gruposmedicos_ibfk_1` FOREIGN KEY (`medico`) REFERENCES `medicos` (`nColegiado`),
  ADD CONSTRAINT `gruposmedicos_ibfk_2` FOREIGN KEY (`paciente`) REFERENCES `paciente` (`NSS`);

--
-- Filtros para la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD CONSTRAINT `medicos_ibfk_1` FOREIGN KEY (`especializacion`) REFERENCES `especializaciones` (`ID`);

--
-- Filtros para la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD CONSTRAINT `paciente_ibfk_1` FOREIGN KEY (`historial`) REFERENCES `historial` (`nHistorial`);

--
-- Filtros para la tabla `registro_historial`
--
ALTER TABLE `registro_historial`
  ADD CONSTRAINT `registro_historial_ibfk_1` FOREIGN KEY (`medico`) REFERENCES `medicos` (`nColegiado`),
  ADD CONSTRAINT `registro_historial_ibfk_2` FOREIGN KEY (`historial`) REFERENCES `historial` (`nHistorial`);

--
-- Filtros para la tabla `usuarios_medicos`
--
ALTER TABLE `usuarios_medicos`
  ADD CONSTRAINT `usuarios_medicos_ibfk_1` FOREIGN KEY (`medico`) REFERENCES `medicos` (`nColegiado`);

--
-- Filtros para la tabla `usuarios_pacientes`
--
ALTER TABLE `usuarios_pacientes`
  ADD CONSTRAINT `usuarios_pacientes_ibfk_1` FOREIGN KEY (`paciente`) REFERENCES `paciente` (`NSS`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;