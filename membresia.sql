--
-- Estructura de tabla para la tabla `info_iglesia`
--

CREATE TABLE `info_iglesia` (
  `id_iglesia` int(11) NOT NULL,
  `nombre_iglesia` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `direccion_iglesia` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `departamento_iglesia` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `ciudad_iglesia` varchar(100) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `membresias`
--

CREATE TABLE `membresias` (
  `id_membresia` int(11) NOT NULL,
  `nombre` varchar(60) COLLATE utf8_spanish2_ci NOT NULL,
  `apellidos` varchar(60) COLLATE utf8_spanish2_ci NOT NULL,
  `tipo_documento` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `numero_documento` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `departamento_nacimiento` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `ciudad_nacimiento` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `foto` varchar(200) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `nivel_escolaridad` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `ocupacion_actual` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `direccion_residencia` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `telefono_fijo` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `telefono_celular` varchar(30) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `correo_electronico` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `estado_civil` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `casado_ipuc` tinyint(1) DEFAULT NULL,
  `casado_notaria` tinyint(1) DEFAULT NULL,
  `conyugue_tribunal_eclesiastico` tinyint(1) DEFAULT NULL,
  `concepto_tribunal_eclesiastico` varchar(15) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `nombre_conyugue` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `documento_conyugue` varchar(30) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `numero_hijos` smallint(6) DEFAULT NULL,
  `detalle_hijos` json DEFAULT NULL,
  `fecha_bautismo` date DEFAULT NULL,
  `departamento_bautismo` varchar(30) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `ciudad_bautismo` varchar(30) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `pastor_bautismo` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `fecha_espititu_santo` date DEFAULT NULL,
  `cargos_iglesia` json DEFAULT NULL,
  `observaciones` json DEFAULT NULL,
  `iglesia_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `info_iglesia`
--
ALTER TABLE `info_iglesia`
  ADD PRIMARY KEY (`id_iglesia`);

--
-- Indices de la tabla `membresias`
--
ALTER TABLE `membresias`
  ADD PRIMARY KEY (`id_membresia`),
  ADD KEY `iglesia_id` (`iglesia_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `info_iglesia`
--
ALTER TABLE `info_iglesia`
  MODIFY `id_iglesia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `membresias`
--
ALTER TABLE `membresias`
  MODIFY `id_membresia` int(11) NOT NULL AUTO_INCREMENT;