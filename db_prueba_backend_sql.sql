CREATE DATABASE db_prueba_backend_sql;
USE db_prueba_backend_sql;
CREATE TABLE `users` (
  `id` bigint ,
  `nombre` varchar(255),
  `email` varchar(255) ,
  `email_verified_at` timestamp ,
  `estado` tinyint ,
  `created_by` bigint ,
  `update_by` bigint ,
  `foto` varchar(255),
  `password` varchar(255) ,
  `created_at` timestamp NULL ,
  `updated_at` timestamp NULL ,
  `deleted_at` timestamp NULL,
 PRIMARY KEY (id)
) ;
ALTER TABLE productos
ADD CONSTRAINT update_by
FOREIGN KEY (update_by) REFERENCES users(id);


ALTER TABLE productos
ADD CONSTRAINT created_by
FOREIGN KEY (created_by) REFERENCES users(id);

ALTER TABLE bodegas
ADD CONSTRAINT created_by1
FOREIGN KEY (created_by) REFERENCES users(id);

ALTER TABLE bodegas
ADD CONSTRAINT update_by1
FOREIGN KEY (update_by) REFERENCES users(id); 

ALTER TABLE bodegas
ADD CONSTRAINT id_responsable
FOREIGN KEY (id_responsable) REFERENCES users(id);

ALTER TABLE inventarios
ADD CONSTRAINT id_responsable
FOREIGN KEY (id_responsable) REFERENCES users(id);




ALTER TABLE historiales
ADD CONSTRAINT created_by3
FOREIGN KEY (created_by) REFERENCES users(id);

ALTER TABLE historiales
ADD CONSTRAINT update_by3
FOREIGN KEY (update_by) REFERENCES users(id);


ALTER TABLE inventarios
ADD CONSTRAINT update_by2
FOREIGN KEY (update_by) REFERENCES users(id);

ALTER TABLE inventarios
ADD CONSTRAINT created_by2
FOREIGN KEY (created_by) REFERENCES users(id);

ALTER TABLE historiales
ADD CONSTRAINT id_bodega_origen
FOREIGN KEY (id_bodega_origen) REFERENCES bodegas(id);

ALTER TABLE historiales
ADD CONSTRAINT id_bodega_destino
FOREIGN KEY (id_bodega_destino) REFERENCES bodegas(id);

ALTER TABLE inventarios
ADD CONSTRAINT id_bodega
FOREIGN KEY (id_bodega) REFERENCES bodegas(id);

ALTER TABLE historiales
ADD CONSTRAINT id_inventario
FOREIGN KEY (id_inventario) REFERENCES inventarios(id);

ALTER TABLE inventarios
ADD CONSTRAINT id_producto
FOREIGN KEY (id_producto) REFERENCES productos(id);

drop TABLE users;

CREATE TABLE `productos` (
  `id` bigint,
  `nombre` varchar(255) ,
  `descripcion` varchar(255) ,
  `estado` tinyint ,
  `created_by` bigint ,
  `update_by` bigint ,
  `created_at` timestamp NULL ,
  `updated_at` timestamp NULL ,
  `deleted_at` timestamp NULL ,
  PRIMARY KEY (id)
);
DROP table productos;

CREATE TABLE `bodegas` (
  `id` bigint ,
  `nombre` varchar(255),
  `id_responsable` bigint ,
  `estado` tinyint ,
  `created_by` bigint ,
  `update_by` bigint ,
  `created_at` timestamp NULL ,
  `updated_at` timestamp NULL ,
  `deleted_at` timestamp NULL,
   PRIMARY KEY (id)
);




drop table bodegas;

CREATE TABLE `historiales` (
  `id` bigint ,
  `cantidad` int ,
  `id_bodega_origen` bigint ,
  `id_bodega_destino` bigint ,
  `id_inventario` bigint ,
  `created_by` bigint ,
  `update_by` bigint ,
  `created_at` timestamp NULL ,
  `updated_at` timestamp NULL ,
  `deleted_at` timestamp NULL,
  PRIMARY KEY (id)
);

drop table historiales;

CREATE TABLE `inventarios` (
  `id` bigint ,
  `id_bodega` bigint ,
  `id_producto` bigint ,
  `cantidad` int ,
  `created_by` bigint ,
  `update_by` bigint ,
  `created_at` timestamp NULL ,
  `updated_at` timestamp NULL ,
  `deleted_at` timestamp NULL ,
   PRIMARY KEY (id)
);

drop TABLE inventarios;


INSERT INTO `users` (`id`, `nombre`, `email`, `email_verified_at`, `estado`, `created_by`, `update_by`, `foto`, `password`, `created_at`, `updated_at`, `deleted_at`) VALUES
(11, 'juan0', 'juan 0@hotmail.com', NULL, 1, NULL, NULL, NULL, '12345', NULL, NULL, NULL),
(12, 'juan1', 'juan 1@hotmail.com', NULL, 1, NULL, NULL, NULL, '12345', NULL, NULL, NULL),
(13, 'juan2', 'juan 2@hotmail.com', NULL, 1, NULL, NULL, NULL, '12345', NULL, NULL, NULL),
(14, 'juan3', 'juan 3@hotmail.com', NULL, 1, NULL, NULL, NULL, '12345', NULL, NULL, NULL),
(15, 'juan4', 'juan 4@hotmail.com', NULL, 1, NULL, NULL, NULL, '12345', NULL, NULL, NULL),
(16, 'juan5', 'juan 5@hotmail.com', NULL, 1, NULL, NULL, NULL, '12345', NULL, NULL, NULL),
(17, 'juan6', 'juan 6@hotmail.com', NULL, 1, NULL, NULL, NULL, '12345', NULL, NULL, NULL),
(18, 'juan7', 'juan 7@hotmail.com', NULL, 1, NULL, NULL, NULL, '12345', NULL, NULL, NULL),
(19, 'juan8', 'juan 8@hotmail.com', NULL, 1, NULL, NULL, NULL, '12345', NULL, NULL, NULL),
(20, 'juan9', 'juan 9@hotmail.com', NULL, 1, NULL, NULL, NULL, '12345', NULL, NULL, NULL);

INSERT INTO `bodegas` (`id`, `nombre`, `id_responsable`, `estado`, `created_by`, `update_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(11, 'bodega0', 16, 1, 16, NULL, '2022-06-02 15:33:48', NULL, NULL),
(12, 'bodega1', 18, 1, 18, NULL, '2022-06-02 15:33:48', NULL, NULL),
(13, 'bodega2', 18, 1, 18, NULL, '2022-06-02 15:33:48', NULL, NULL),
(18, 'bodega7', 17, 1, 17, NULL, '2022-06-02 15:33:48', NULL, NULL),
(19, 'bodega8', 11, 1, 11, NULL, '2022-06-02 15:33:48', NULL, NULL),
(20, 'bodega9', 18, 1, 18, NULL, '2022-06-02 15:33:48', NULL, NULL),
(22, 'jsjsjss', 13, 1, NULL, NULL, '2022-06-02 21:30:47', '2022-06-02 21:30:47', NULL),
(23, 'leeche', 13, 1, NULL, NULL, '2022-06-02 21:43:08', '2022-06-02 21:43:08', NULL),
(24, 'soto1', 15, 1, NULL, NULL, '2022-06-02 21:46:40', '2022-06-02 21:46:40', NULL),
(25, 'soto2', 15, 1, NULL, NULL, '2022-06-02 21:47:29', '2022-06-02 21:47:29', NULL),
(26, 'prueba', 12, 1, NULL, NULL, '2022-06-02 21:47:48', '2022-06-02 21:47:48', NULL),
(27, 'fsfdf', 13, 1, NULL, NULL, '2022-06-02 21:48:00', '2022-06-02 21:48:00', NULL),
(28, 'prueba', 12, 1, NULL, NULL, '2022-06-03 00:10:32', '2022-06-03 00:10:32', NULL),
(29, 'bodegajuanpablo', 19, 1, NULL, NULL, '2022-06-03 00:41:51', '2022-06-03 00:41:51', NULL),
(30, 'micasa', 18, 1, NULL, NULL, '2022-06-03 01:31:09', '2022-06-03 01:31:09', NULL),
(31, 'casamedrano', 17, 1, NULL, NULL, '2022-06-03 03:21:32', '2022-06-03 03:21:32', NULL),
(32, 'centro', 18, 1, NULL, NULL, '2022-06-03 03:33:19', '2022-06-03 03:33:19', NULL),
(35, 'bodega35', 11, 1, NULL, NULL, '2022-06-24 22:30:37', '2022-06-24 22:30:37', NULL),
(36, 'asdefg', 11, 1, 11, NULL, '2022-06-29 02:24:49', '2022-06-29 02:24:49', NULL),
(37, 'bodega fg', 11, 1, 11, NULL, '2022-06-29 02:25:17', '2022-06-29 02:25:17', NULL),
(38, 'bodega fg', 11, 1, 11, NULL, '2022-06-29 02:25:40', '2022-06-29 02:25:40', NULL),
(39, 'bodega fg 2', 11, 1, 11, NULL, '2022-06-29 02:28:31', '2022-06-29 02:28:31', NULL),
(40, 'bodega fg 2', 11, 1, 11, NULL, '2022-06-29 02:28:44', '2022-06-29 02:28:44', NULL),
(41, 'Bodega 13.2', 11, 1, 11, NULL, '2022-07-01 20:29:51', '2022-07-01 20:29:51', NULL),
(42, 'Bodega Developer 13.2', 11, 1, 11, NULL, '2022-07-01 20:30:24', '2022-07-01 20:30:24', NULL),
(43, 'Bodega Developer 13.2', 11, 1, 11, NULL, '2022-07-11 18:37:11', '2022-07-11 18:37:11', NULL),
(44, 'Bodega 59', 11, 1, 11, NULL, '2022-07-11 18:44:50', '2022-07-11 18:44:50', NULL),
(48, 'Bodega Anderson Atuesta', 11, 11, NULL, NULL, '2022-07-21 19:57:05', '2022-07-21 19:57:05', NULL),
(49, 'Bodega Anderson Atuesta555', 11, 11, NULL, NULL, '2022-07-21 21:27:13', '2022-07-21 21:27:13', NULL),
(50, 'A Bodega', 11, 1, NULL, NULL, '2023-05-25 01:02:57', '2023-05-25 01:02:57', NULL);