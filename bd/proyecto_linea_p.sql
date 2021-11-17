-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-11-2021 a las 05:02:00
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto_linea_p`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coins`
--

CREATE TABLE `coins` (
  `id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `short_name` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `symbol` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `description` varchar(70) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `coins`
--

INSERT INTO `coins` (`id`, `name`, `short_name`, `symbol`, `description`) VALUES
(1, 'Peso Colombiano', 'COP', '$', 'Pesos Colombianos'),
(2, 'dolar', 'usd', '$', 'dolar estadounidense'),
(3, 'euros', 'eu', 'e', 'moneda europea');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `dni` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `gender` enum('masculino','femenino','','') COLLATE utf8_spanish_ci DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `province_id` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `district_id` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `address` varchar(160) COLLATE utf8_spanish_ci DEFAULT NULL,
  `mobile` varchar(32) COLLATE utf8_spanish_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `business_name` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ruc` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `company` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `loan_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `customers`
--

INSERT INTO `customers` (`id`, `dni`, `first_name`, `last_name`, `gender`, `department_id`, `province_id`, `district_id`, `address`, `mobile`, `phone`, `business_name`, `ruc`, `company`, `loan_status`) VALUES
(8, '12345678', 'Celia', 'Cruz', 'femenino', 0, '', NULL, '', '', '', NULL, NULL, '', 0),
(9, '344555', 'mario', 'flores', 'femenino', 10, '1003', '', '', '', '', '', '', '', 1),
(10, '12344', 'ruben', 'chavez', 'masculino', 10, '1002', '', 'av el incas98', '', '', '', '', '', 1),
(11, '123451', 'diego', 'arnica', 'masculino', 12, '1203', '', 'mariano cron 45', '', '', '', '', '', 1),
(12, '7654321', 'matilde', 'frisanc', 'femenino', 3, '0302', NULL, 'choqwur n455', '', '', NULL, NULL, '', 1),
(13, '1223', 'pablo', 'moralesss', 'masculino', 1, '0102', NULL, 'Cr 4 A N bibon', '3322', '2233', NULL, NULL, 'Aseo', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loans`
--

CREATE TABLE `loans` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `credit_amount` decimal(15,2) NOT NULL,
  `interest_amount` decimal(15,2) NOT NULL,
  `num_fee` int(3) NOT NULL,
  `fee_amount` decimal(10,2) NOT NULL,
  `payment_m` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `coin_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `loans`
--

INSERT INTO `loans` (`id`, `customer_id`, `credit_amount`, `interest_amount`, `num_fee`, `fee_amount`, `payment_m`, `coin_id`, `date`, `status`) VALUES
(10, 11, '3000.00', '3.00', 4, '772.50', 'mensual', 1, '2021-07-04', b'1'),
(11, 10, '3000.00', '4.00', 3, '1040.00', 'mensual', 1, '2021-07-18', b'1'),
(12, 9, '2000.00', '2.00', 3, '680.00', 'mensual', 1, '2021-07-18', b'1'),
(13, 12, '1000.00', '2.00', 4, '255.00', 'mensual', 2, '2021-07-18', b'1'),
(14, 13, '4000.00', '3.00', 4, '1030.00', 'mensual', 1, '2021-07-18', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loan_items`
--

CREATE TABLE `loan_items` (
  `id` int(11) NOT NULL,
  `loan_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `num_quota` int(11) NOT NULL,
  `fee_amount` decimal(25,2) NOT NULL,
  `pay_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `loan_items`
--

INSERT INTO `loan_items` (`id`, `loan_id`, `date`, `num_quota`, `fee_amount`, `pay_date`, `status`) VALUES
(41, 10, '2021-08-04', 1, '772.50', '2021-07-08 22:40:50', b'0'),
(42, 10, '2021-09-04', 2, '772.50', '2021-07-08 22:40:50', b'0'),
(43, 10, '2021-10-04', 3, '772.50', '2021-07-05 01:12:13', b'1'),
(44, 10, '2021-11-04', 4, '772.50', '2021-07-05 01:12:13', b'1'),
(45, 11, '2021-08-18', 1, '1040.00', '2021-07-19 00:56:48', b'0'),
(46, 11, '2021-09-18', 2, '1040.00', '2021-07-19 00:55:17', b'1'),
(47, 11, '2021-10-18', 3, '1040.00', '2021-07-19 00:55:17', b'1'),
(48, 12, '2021-08-18', 1, '680.00', '2021-07-19 02:09:52', b'1'),
(49, 12, '2021-09-18', 2, '680.00', '2021-07-19 02:09:53', b'1'),
(50, 12, '2021-10-18', 3, '680.00', '2021-07-19 02:09:53', b'1'),
(51, 13, '2021-08-18', 1, '255.00', '2021-07-19 02:10:53', b'1'),
(52, 13, '2021-09-18', 2, '255.00', '2021-07-19 02:10:53', b'1'),
(53, 13, '2021-10-18', 3, '255.00', '2021-07-19 02:10:53', b'1'),
(54, 13, '2021-11-18', 4, '255.00', '2021-07-19 02:10:53', b'1'),
(55, 14, '2021-08-18', 1, '1030.00', '2021-07-19 02:26:15', b'0'),
(56, 14, '2021-09-18', 2, '1030.00', '2021-07-19 02:26:16', b'0'),
(57, 14, '2021-10-18', 3, '1030.00', '2021-07-19 02:23:32', b'1'),
(58, 14, '2021-11-18', 4, '1030.00', '2021-07-19 02:23:32', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubigeo_departments`
--

CREATE TABLE `ubigeo_departments` (
  `id` varchar(2) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ubigeo_departments`
--

INSERT INTO `ubigeo_departments` (`id`, `name`) VALUES
('01', 'Amazonas'),
('02', 'Antioquia'),
('03', 'Atlántico'),
('04', 'Boyacá'),
('05', 'Caldas'),
('06', 'Cundinamarca'),
('07', 'Bogota D.C'),
('08', 'Huila'),
('09', 'Magdalena'),
('10', 'Tolima'),
('11', 'Valle del Cauca'),
('12', 'Texas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubigeo_districts`
--

CREATE TABLE `ubigeo_districts` (
  `id` varchar(6) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `province_id` varchar(4) DEFAULT NULL,
  `department_id` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ubigeo_districts`
--

INSERT INTO `ubigeo_districts` (`id`, `name`, `province_id`, `department_id`) VALUES
('010101', 'Prueba', '0101', '01'),
('020101', 'El diario de un borracho', '0201', '02'),
('030101', 'Dos amigo', '0301', '03'),
('040101', 'Maiz molio', '0401', '04'),
('050101', 'Ayacucho', '0501', '05'),
('061301', 'Santa Cruz', '0613', '06'),
('070103', 'Camioneta roja', '0701', '07'),
('081204', 'Ccarhuayo', '0812', '08'),
('090722', 'Pichos', '0907', '09'),
('101108', 'Choras', '1011', '10'),
('110501', 'Pisco', '1105', '11'),
('120106', 'Chicche', '1201', '12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubigeo_provinces`
--

CREATE TABLE `ubigeo_provinces` (
  `id` varchar(4) NOT NULL,
  `name` varchar(45) NOT NULL,
  `department_id` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ubigeo_provinces`
--

INSERT INTO `ubigeo_provinces` (`id`, `name`, `department_id`) VALUES
('0101', 'Leticia', '01'),
('0102', 'La chorrera', '01'),
('0201', 'Medellin', '02'),
('0202', 'Uraba', '02'),
('0203', 'Valle de aburra', '02'),
('0301', 'Barranquilla', '03'),
('0302', 'Manati', '03'),
('0401', 'Achi', '04'),
('0402', 'Tunja', '04'),
('0501', 'Neira', '05'),
('0502', 'Salamina', '05'),
('0503', 'Manizales', '05'),
('0601', 'Fusagasugá', '06'),
('0602', 'Pasca', '06'),
('0603', 'Tibacuy', '06'),
('0604', 'Arbelaez', '06'),
('0605', 'San bernando', '06'),
('0606', 'Chinauta', '06'),
('0701', 'Bogotá D.C', '07'),
('0801', 'Neiva', '08'),
('0802', 'La plata', '08'),
('0803', 'Pitalito', '08'),
('0804', 'San agustin', '08'),
('0805', 'Oporapa', '08'),
('0806', 'Gigante Huila', '08'),
('0901', 'Pueblo viejo', '09'),
('0902', 'Santa Marta', '09'),
('1001', 'Ibagué', '10'),
('1101', 'Cali', '11'),
('1102', 'Palmira', '11'),
('1103', 'Buga', '11'),
('1104', 'Houston', '12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `last_name` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(250) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`) VALUES
(1, 'Carletto', 'Perilla', 'admin@gmail.com', 'ad57cb3de9c53c1fc7de94665f6f1db2dfbcaaf73063769fed0b3011466eba602c2f423c4725c6dfacdc2973a518a18e0784e848ca3aabd7cadfd140df1df447');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `coins`
--
ALTER TABLE `coins`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `coin_id` (`coin_id`);

--
-- Indices de la tabla `loan_items`
--
ALTER TABLE `loan_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `loan_id` (`loan_id`);

--
-- Indices de la tabla `ubigeo_departments`
--
ALTER TABLE `ubigeo_departments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ubigeo_districts`
--
ALTER TABLE `ubigeo_districts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ubigeo_provinces`
--
ALTER TABLE `ubigeo_provinces`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `coins`
--
ALTER TABLE `coins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `loans`
--
ALTER TABLE `loans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `loan_items`
--
ALTER TABLE `loan_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `loans`
--
ALTER TABLE `loans`
  ADD CONSTRAINT `loans_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `loans_ibfk_2` FOREIGN KEY (`coin_id`) REFERENCES `coins` (`id`);

--
-- Filtros para la tabla `loan_items`
--
ALTER TABLE `loan_items`
  ADD CONSTRAINT `loan_items_ibfk_1` FOREIGN KEY (`loan_id`) REFERENCES `loans` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
