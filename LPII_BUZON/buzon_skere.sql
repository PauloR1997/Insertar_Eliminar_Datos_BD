-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 30-07-2020 a las 05:09:07
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `buzon_skere`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `skerearea`
--

CREATE TABLE IF NOT EXISTS `skerearea` (
  `idarea` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `estado` varchar(2) NOT NULL,
  PRIMARY KEY (`idarea`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `skerearea`
--

INSERT INTO `skerearea` (`idarea`, `nombre`, `estado`) VALUES
(1, 'Recursos Humano', 'A'),
(2, 'Logistica', 'A'),
(3, 'Administracion', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `skerepersona`
--

CREATE TABLE IF NOT EXISTS `skerepersona` (
  `idpersona` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `DNI` varchar(8) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  PRIMARY KEY (`idpersona`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `skerepersona`
--

INSERT INTO `skerepersona` (`idpersona`, `nombre`, `DNI`, `telefono`) VALUES
(1, 'Saul Chambi Rojas', '74971621', '935731514'),
(2, 'Sergio Vite Chochachin', '85427621', '935104585'),
(3, 'Paulo Ramirez Huamani', '67481524', '925415748'),
(4, 'Jamil Salazar Rubio', '57841651', '935481547');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `skererol`
--

CREATE TABLE IF NOT EXISTS `skererol` (
  `idrol` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `skererol`
--

INSERT INTO `skererol` (`idrol`, `nombre`) VALUES
(1, 'Jefe'),
(2, 'Supervisor'),
(3, 'Operario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `skeresugerencia`
--

CREATE TABLE IF NOT EXISTS `skeresugerencia` (
  `idsugerencia` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) NOT NULL,
  `fecha` date NOT NULL,
  `idarea` int(11) unsigned NOT NULL,
  `idpersona` int(11) unsigned NOT NULL,
  `idrol` int(11) unsigned NOT NULL,
  PRIMARY KEY (`idsugerencia`),
  KEY `idarea` (`idarea`),
  KEY `idpersona` (`idpersona`),
  KEY `idrol` (`idrol`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `skeresugerencia`
--

INSERT INTO `skeresugerencia` (`idsugerencia`, `descripcion`, `fecha`, `idarea`, `idpersona`, `idrol`) VALUES
(1, 'Mis empleados son vagos', '2020-07-29', 1, 1, 1),
(2, 'Aumente el sueldo jefe Chambi', '2020-07-13', 1, 2, 2),
(3, 'Me estan explotando en mi trabajo', '2020-07-09', 1, 3, 3),
(4, 'Aveces no tolero a mi compañero Paulo Ramirez', '2020-07-16', 1, 4, 3);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `skeresugerencia`
--
ALTER TABLE `skeresugerencia`
  ADD CONSTRAINT `skeresugerencia_ibfk_1` FOREIGN KEY (`idarea`) REFERENCES `skerearea` (`idarea`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `skeresugerencia_ibfk_2` FOREIGN KEY (`idpersona`) REFERENCES `skerepersona` (`idpersona`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `skeresugerencia_ibfk_3` FOREIGN KEY (`idrol`) REFERENCES `skererol` (`idrol`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
