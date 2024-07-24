-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-07-2024 a las 04:47:22
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
-- Base de datos: `igans`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `batallas`
--

DROP TABLE IF EXISTS `batallas`;
CREATE TABLE `batallas` (
  `id_ batalla` int(11) NOT NULL,
  `id_digans_01` int(11) DEFAULT NULL,
  `id_digans_02` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `id_planificacion_batalla` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `digans`
--

DROP TABLE IF EXISTS `digans`;
CREATE TABLE `digans` (
  `id_digans` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `nivel` int(11) DEFAULT NULL,
  `id_entrenador` int(11) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `habilidad` varchar(50) DEFAULT NULL,
  `estadistica` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrenadores`
--

DROP TABLE IF EXISTS `entrenadores`;
CREATE TABLE `entrenadores` (
  `id_entrenador` int(11) NOT NULL,
  `nombre_entrenador` varchar(40) NOT NULL,
  `habilidad_entrenador` varchar(40) NOT NULL,
  `email_entrenador` varchar(40) NOT NULL,
  `nivel_entrenador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrenamiento`
--

DROP TABLE IF EXISTS `entrenamiento`;
CREATE TABLE `entrenamiento` (
  `id_entrenamiento` int(11) NOT NULL,
  `id_entrenador` int(11) DEFAULT NULL,
  `id_digans` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `nivel_obtenido` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planificacion_batalla`
--

DROP TABLE IF EXISTS `planificacion_batalla`;
CREATE TABLE `planificacion_batalla` (
  `id_planificacion_batalla` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `id_digans1` int(11) DEFAULT NULL,
  `id_digans2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultado_batallas`
--

DROP TABLE IF EXISTS `resultado_batallas`;
CREATE TABLE `resultado_batallas` (
  `id_resultado_batalla` int(11) NOT NULL,
  `id_batalla` int(11) DEFAULT NULL,
  `id_resultado_ganador` int(11) DEFAULT NULL,
  `id_resultado_perdedor` int(11) DEFAULT NULL,
  `id_puntaje_ganador` int(11) DEFAULT NULL,
  `id_puntaje_perdedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `batallas`
--
ALTER TABLE `batallas`
  ADD PRIMARY KEY (`id_ batalla`),
  ADD KEY `id_digans_01` (`id_digans_01`),
  ADD KEY `id_digans_02` (`id_digans_02`);

--
-- Indices de la tabla `digans`
--
ALTER TABLE `digans`
  ADD PRIMARY KEY (`id_digans`),
  ADD KEY `id_entrenador` (`id_entrenador`);

--
-- Indices de la tabla `entrenadores`
--
ALTER TABLE `entrenadores`
  ADD PRIMARY KEY (`id_entrenador`);

--
-- Indices de la tabla `entrenamiento`
--
ALTER TABLE `entrenamiento`
  ADD PRIMARY KEY (`id_entrenamiento`),
  ADD KEY `id_digans` (`id_digans`);

--
-- Indices de la tabla `planificacion_batalla`
--
ALTER TABLE `planificacion_batalla`
  ADD PRIMARY KEY (`id_planificacion_batalla`);

--
-- Indices de la tabla `resultado_batallas`
--
ALTER TABLE `resultado_batallas`
  ADD PRIMARY KEY (`id_resultado_batalla`),
  ADD KEY `id_resultado_ganador` (`id_resultado_ganador`),
  ADD KEY `id_resultado_perdedor` (`id_resultado_perdedor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `batallas`
--
ALTER TABLE `batallas`
  MODIFY `id_ batalla` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `digans`
--
ALTER TABLE `digans`
  MODIFY `id_digans` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `entrenadores`
--
ALTER TABLE `entrenadores`
  MODIFY `id_entrenador` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `entrenamiento`
--
ALTER TABLE `entrenamiento`
  MODIFY `id_entrenamiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `planificacion_batalla`
--
ALTER TABLE `planificacion_batalla`
  MODIFY `id_planificacion_batalla` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `resultado_batallas`
--
ALTER TABLE `resultado_batallas`
  MODIFY `id_resultado_batalla` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `batallas`
--
ALTER TABLE `batallas`
  ADD CONSTRAINT `id_digans_01` FOREIGN KEY (`id_digans_01`) REFERENCES `digans` (`id_digans`),
  ADD CONSTRAINT `id_digans_02` FOREIGN KEY (`id_digans_02`) REFERENCES `digans` (`id_digans`);

--
-- Filtros para la tabla `digans`
--
ALTER TABLE `digans`
  ADD CONSTRAINT `id_entrenador` FOREIGN KEY (`id_entrenador`) REFERENCES `entrenadores` (`id_entrenador`);

--
-- Filtros para la tabla `entrenamiento`
--
ALTER TABLE `entrenamiento`
  ADD CONSTRAINT `id_digans` FOREIGN KEY (`id_digans`) REFERENCES `digans` (`id_digans`);

--
-- Filtros para la tabla `resultado_batallas`
--
ALTER TABLE `resultado_batallas`
  ADD CONSTRAINT `id_resultado_ganador` FOREIGN KEY (`id_resultado_ganador`) REFERENCES `digans` (`id_digans`),
  ADD CONSTRAINT `id_resultado_perdedor` FOREIGN KEY (`id_resultado_perdedor`) REFERENCES `digans` (`id_digans`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
