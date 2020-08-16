-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 15-08-2020 a las 20:43:34
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `academico`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE IF NOT EXISTS `carrera` (
  `idcarrera` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `estado` varchar(1) NOT NULL,
  PRIMARY KEY (`idcarrera`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`idcarrera`, `nombre`, `estado`) VALUES
(1, 'Ing. de Sistemas', 'A'),
(2, 'Administracion', 'A'),
(3, 'Ing. Mecánica', 'A'),
(4, 'Ing. Electrónica', 'A'),
(5, 'Contabilidad', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE IF NOT EXISTS `curso` (
  `idcurso` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `horas` int(11) NOT NULL,
  `creditos` int(11) NOT NULL,
  `estado` varchar(1) NOT NULL,
  PRIMARY KEY (`idcurso`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`idcurso`, `nombre`, `horas`, `creditos`, `estado`) VALUES
(1, 'Fundamento de programación', 7, 5, 'D'),
(4, 'Sistemas digitales', 5, 4, 'A'),
(8, 'Lenguaje de programación II', 6, 3, 'A'),
(12, 'Diseño de base de datos', 4, 6, 'D');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE IF NOT EXISTS `estudiante` (
  `idestudiante` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `dni` varchar(8) NOT NULL,
  `codigo` varchar(9) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `estado` varchar(1) NOT NULL,
  PRIMARY KEY (`idestudiante`),
  UNIQUE KEY `dni` (`dni`,`codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`idestudiante`, `nombre`, `apellidos`, `dni`, `codigo`, `direccion`, `estado`) VALUES
(4, 'jean', 'Jara Solis', '99885252', '181301151', '', 'A'),
(8, 'Jhon', 'Chavez Tapia', '88996633', '159753111', '', 'D'),
(9, 'jose elias', 'padilla mattos', '88550022', '181301151', '', 'A'),
(14, 'Alex david', 'Palacios', '88888888', '888888888', '', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matricula`
--

CREATE TABLE IF NOT EXISTS `matricula` (
  `idmatricula` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `semestre` varchar(6) NOT NULL,
  `ciclo` int(11) NOT NULL,
  `estado` varchar(1) NOT NULL,
  `idestudiante` int(10) unsigned NOT NULL,
  `idcurso` int(10) unsigned NOT NULL,
  `idcarrera` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idmatricula`),
  KEY `idestudiante` (`idestudiante`),
  KEY `idcurso` (`idcurso`),
  KEY `idcarrera` (`idcarrera`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Volcado de datos para la tabla `matricula`
--

INSERT INTO `matricula` (`idmatricula`, `semestre`, `ciclo`, `estado`, `idestudiante`, `idcurso`, `idcarrera`) VALUES
(8, '2020-2', 5, 'A', 4, 8, 1),
(10, '2017-1', 3, 'A', 9, 8, 2),
(12, '2019-1', 2, 'A', 8, 4, 1),
(13, '2014-1', 8, 'A', 4, 1, 3),
(14, '2019-1', 2, 'A', 8, 4, 4),
(15, '2019-1', 2, 'A', 8, 4, 4),
(16, '2019-1', 2, 'A', 8, 4, 4);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `matricula`
--
ALTER TABLE `matricula`
  ADD CONSTRAINT `matricula_ibfk_5` FOREIGN KEY (`idestudiante`) REFERENCES `estudiante` (`idestudiante`) ON UPDATE CASCADE,
  ADD CONSTRAINT `matricula_ibfk_6` FOREIGN KEY (`idcurso`) REFERENCES `curso` (`idcurso`) ON UPDATE CASCADE,
  ADD CONSTRAINT `matricula_ibfk_7` FOREIGN KEY (`idcarrera`) REFERENCES `carrera` (`idcarrera`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
