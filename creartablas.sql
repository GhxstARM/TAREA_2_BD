CREATE TABLE `mysql`.`articulos` (
  `articulo_id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `fecha_envio` date NOT NULL,
  `resumen` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
ALTER TABLE `mysql`.`articulos` ADD PRIMARY KEY (`articulo_id`);
ALTER TABLE `mysql`.`articulos` MODIFY `articulo_id` int(11) NOT NULL AUTO_INCREMENT;
CREATE TABLE `mysql`.`articulos_autores` (
  `articulo_id` int(11) NOT NULL,
  `autor_id` int(11) NOT NULL,
  `es_contacto` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
ALTER TABLE `mysql`.`articulos_autores` ADD PRIMARY KEY (`articulo_id`,`autor_id`), ADD KEY `autor_id` (`autor_id`);
CREATE TABLE `mysql`.`articulos_especialidades` (
  `articulo_id` int(11) NOT NULL,
  `especialidad_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
ALTER TABLE `mysql`.`articulos_especialidades` ADD PRIMARY KEY (`articulo_id`,`especialidad_id`), ADD KEY `especialidad_id` (`especialidad_id`);
CREATE TABLE `mysql`.`articulos_revisores` (
  `articulo_id` int(11) NOT NULL,
  `revisor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
ALTER TABLE `mysql`.`articulos_revisores` ADD PRIMARY KEY (`articulo_id`,`revisor_id`), ADD KEY `revisor_id` (`revisor_id`);
CREATE TABLE `mysql`.`autores` (
  `autor_id` int(11) NOT NULL,
  `rut` varchar(12) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `email` varchar(320) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
ALTER TABLE `mysql`.`autores` ADD PRIMARY KEY (`autor_id`);
ALTER TABLE `mysql`.`autores` MODIFY `autor_id` int(11) NOT NULL AUTO_INCREMENT;
CREATE TABLE `mysql`.`especialidades` (
  `especialidad_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
ALTER TABLE `mysql`.`especialidades` ADD PRIMARY KEY (`especialidad_id`);
ALTER TABLE `mysql`.`especialidades` MODIFY `especialidad_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7 ;
CREATE TABLE `mysql`.`revisores` (
  `revisor_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(320) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
ALTER TABLE `mysql`.`revisores` ADD PRIMARY KEY (`revisor_id`);
ALTER TABLE `mysql`.`revisores` MODIFY `revisor_id` int(11) NOT NULL AUTO_INCREMENT;
CREATE TABLE `mysql`.`revisores_especialidades` (
  `revisor_id` int(11) NOT NULL,
  `especialidad_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
ALTER TABLE `mysql`.`revisores_especialidades` ADD PRIMARY KEY (`revisor_id`,`especialidad_id`), ADD KEY `especialidad_id` (`especialidad_id`);
CREATE TABLE `mysql`.`usuarios` (
  `user_id` int(11) NOT NULL,
  `email` varchar(320) NOT NULL,
  `password` varchar(255) NOT NULL,
  `revisor_id` int(11) DEFAULT NULL,
  `autor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
ALTER TABLE `mysql`.`usuarios` ADD PRIMARY KEY (`user_id`), ADD UNIQUE KEY `email` (`email`), ADD KEY `revisor_id` (`revisor_id`), ADD KEY `autor_id` (`autor_id`);
ALTER TABLE `mysql`.`usuarios` MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;
