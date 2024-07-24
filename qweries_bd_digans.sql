--**crear bd igans**
CREATE DATABASE igans;
--**crear tabla digans(ya esta creada)**
CREATE TABLE igans.digans (`(`id_digans`, `id_entrenador`, `nombre`, `id_tipo`, `id_habilidad`, `id_nivel`, `id_estadistica`, `puntaje`) VALUES ('1', '1', '2', '2', '0', '1', '2', '2024-07-23', NULL) ;

--**crear tabla registro de entrenadores**-- 
CREATE TABLE igans.registro_entrenadores (`(`id_entrenador`, `nombre_entrenador`, `email_entrenador`, `contrasena`, `rol`, `fecha`) VALUES ('8', 'MN', 'mn@gmail.com', '123456', 'entrenador8', '2024-07-24') ;

/*Insercion de datos en tabla digans**
digans7*/
INSERT INTO `digans` (`id_digans`, `id_entrenador`, `nombre`, `id_tipo`, `id_habilidad`, `id_nivel`, `id_estadistica`, `puntaje`) VALUES (7, 3, 'Juan Perez', NULL, NULL, NULL, NULL, 0);
--digans8
INSERT INTO `digans` (`id_digans`, `id_entrenador`, `nombre`, `id_tipo`, `id_habilidad`, `id_nivel`, `id_estadistica`, `puntaje`) VALUES (8, 4, 'Ana Gomez', NULL, NULL, NULL, NULL, 0);

/* relacion Entrenadores digans**
entrenamiento5*/
INSERT INTO `entrenamiento`(`id_entrenamiento`, `id_entrenador`, `id_digans`, `fecha`, `nivel`, `nivel_obtenido`) VALUES ('5', '3', '7','2024-07-24', '0', '1');
--entrenamiento6
INSERT INTO `entrenamiento`(`id_entrenamiento`, `id_entrenador`, `id_digans`, `fecha`, `nivel`, `nivel_obtenido`) VALUES ('6', '4', '8','2024-07-23', '0', '1');
/*Tabla de Batallas**
esta tabla ya esta creada*/
CREATE TABLE igans.batallas (`(`id_batalla`, `id_digans_01`, `id_digans_02`, `id_resultado_01`, `id_resultado_02`, `ganador`, `perdedor`, `fecha`, `id_planificacion_batalla`) VALUES ('1', '1', '2', '2', '0', '1', '2', '2024-07-23', NULL) ;

--insertando batallas de digans 7 y 8, los demas no estan creados--
INSERT INTO igans.batallas (`id_batalla`, `id_digans_01`, `id_digans_02`, `id_resultado_01`, `id_resultado_02`, `ganador`, `perdedor`, `fecha`, `id_planificacion_batalla`)
VALUES 
('', 7, 8, 1, 1, 0, 0, '2024-07-24', NULL),

('', 9, 10, 2, 0, 9, 10, '2024-07-24' NULL),

('', 11, 12, 0, 2, 12, 11, '2024-07-24' NULL);


--Operaciones Multi-Table**

SELECT entrenamiento.id_entrenador, entrenamiento.id_digans, entrenamiento.id_entrenamiento, 
digans.id_entrenador, digans.nombre, digans.puntaje, 
batallas.id_digans_01, batallas.id_batalla, batallas.id_resultado_01 
FROM entrenamiento 
JOIN digans ON entrenamiento.id_digans = digans.id_digans 
JOIN batallas ON entrenamiento.id_digans = batallas.id_digans_01 WHERE batallas.id_batalla = 1;