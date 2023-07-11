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

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `estado`, `created_by`, `update_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(11, 'producto0', 'producto0', 1, 16, NULL, NULL, NULL, NULL),
(12, 'producto1', 'producto1', 1, 14, NULL, NULL, NULL, NULL),
(13, 'producto2', 'producto2', 1, 13, NULL, NULL, NULL, NULL),
(14, 'producto3', 'producto3', 1, 20, NULL, NULL, NULL, NULL),
(15, 'producto4', 'producto4', 1, 19, NULL, NULL, NULL, NULL),
(16, 'producto5', 'producto5', 1, 11, NULL, NULL, NULL, NULL),
(17, 'producto6', 'producto6', 1, 12, NULL, NULL, NULL, NULL),
(18, 'producto7', 'producto7', 1, 11, NULL, NULL, NULL, NULL),
(19, 'producto8', 'producto8', 1, 11, NULL, NULL, NULL, NULL),
(20, 'producto9', 'producto9', 1, 19, NULL, NULL, NULL, NULL),
(23, 'get chocolatinas', 'chocolate', 1, NULL, NULL, '2022-06-03 00:33:43', '2022-06-03 00:33:43', NULL),
(24, 'lololol', 'chocolate', 1, NULL, NULL, '2022-06-03 00:36:44', '2022-06-03 00:36:44', NULL),
(25, 'sadasdasd', 'chocolate', 1, NULL, NULL, '2022-06-03 00:37:56', '2022-06-03 00:37:56', NULL),
(26, 'milo', '500 kg', 1, NULL, NULL, '2022-06-03 00:40:11', '2022-06-03 00:40:11', NULL),
(27, 'chocolisto', 'jjjjjj', 1, NULL, NULL, '2022-06-03 00:40:43', '2022-06-03 00:40:43', NULL),
(28, 'Leche', 'deslactosada', 1, NULL, NULL, '2022-06-03 00:49:21', '2022-06-03 00:49:21', NULL),
(29, 'yogurt', 'frescaleche', 1, NULL, NULL, '2022-06-03 01:44:09', '2022-06-03 01:44:09', NULL),
(30, 'cocacola', 'coca cola', 1, NULL, NULL, '2022-06-03 03:01:54', '2022-06-03 03:01:54', NULL),
(31, 'pepsi', 'copia', 1, NULL, NULL, '2022-06-03 03:19:58', '2022-06-03 03:19:58', NULL),
(32, 'postobon', 'manzana', 1, NULL, NULL, '2022-06-03 03:33:46', '2022-06-03 03:33:46', NULL),
(33, 'gaseosa', 'sadasd', 1, NULL, NULL, '2022-06-03 03:44:25', '2022-06-03 03:44:25', NULL),
(34, 'asdasd', 'dfdfssdf', 1, NULL, NULL, '2022-06-03 03:48:25', '2022-06-03 03:48:25', NULL),
(35, 'producto fg 1', 'producto prueba fg', 1, 11, NULL, '2022-06-29 03:22:05', '2022-06-29 03:22:05', NULL),
(36, 'producto fg 1', 'producto prueba fg', 1, 11, NULL, '2022-06-29 03:27:10', '2022-06-29 03:27:10', NULL),
(37, 'producto fg 1', 'producto prueba fg', 1, 11, NULL, '2022-06-29 03:44:36', '2022-06-29 03:44:36', NULL),
(39, 'Dulces', 'Ricos dulces', 1, 11, NULL, '2022-07-01 17:34:12', NULL, NULL),
(40, 'Caramelos', 'Dulces y mas', 1, 11, NULL, '2022-07-01 17:37:06', NULL, NULL),
(41, 'gato', 'comidad de gato', 1, 11, NULL, '2022-07-11 14:22:47', NULL, NULL),
(42, 'gato', 'comidad de gato', 1, 13, NULL, '2022-07-11 19:26:27', '2022-07-11 19:26:27', NULL),
(43, 'whiskas', 'comidad de gato', 1, 13, NULL, '2022-07-11 19:28:27', '2022-07-11 19:28:27', NULL),
(44, 'whiskas', 'comidad de gato', 1, 13, NULL, '2022-07-11 19:29:42', '2022-07-11 19:29:42', NULL),
(45, 'whiskas', 'comidad de gato', 1, 13, NULL, '2022-07-11 19:32:42', '2022-07-11 19:32:42', NULL),
(46, 'whiskas', 'comidad de gato', 1, 13, NULL, '2022-07-11 19:32:44', '2022-07-11 19:32:44', NULL),
(47, 'whiskas', 'comidad de gato', 1, 13, NULL, '2022-07-11 19:32:45', '2022-07-11 19:32:45', NULL),
(48, 'whiskas', 'comidad de gato', 1, 13, NULL, '2022-07-11 19:32:45', '2022-07-11 19:32:45', NULL),
(49, 'whiskas', 'comidad de gato', 1, 13, NULL, '2022-07-11 19:33:42', '2022-07-11 19:33:42', NULL),
(50, 'whiskas', 'comidad de gato', 1, 13, NULL, '2022-07-11 19:42:53', '2022-07-11 19:42:53', NULL),
(51, 'whiskas', 'comidad de gato', 1, 13, NULL, '2022-07-11 19:43:52', '2022-07-11 19:43:52', NULL),
(52, 'whiskas', 'comidad de gato', 1, 13, NULL, '2022-07-11 19:44:12', '2022-07-11 19:44:12', NULL),
(53, 'whiskas', 'comidad de gato', 1, 13, NULL, '2022-07-11 19:44:57', '2022-07-11 19:44:57', NULL),
(54, 'whiskas', 'comidad de gato', 1, 13, NULL, '2022-07-11 19:47:25', '2022-07-11 19:47:25', NULL),
(55, 'dog food', 'comida de perro', 1, 13, NULL, '2022-07-11 20:55:42', '2022-07-11 20:55:42', NULL),
(56, 'Producto Anderson Atuesta', 'Esta es una prueba', 1, 11, NULL, '2022-07-21 20:33:00', '2022-07-21 20:33:00', NULL),
(57, 'Producto Anderson Atuesta', 'Esta es una prueba', 1, 11, NULL, '2022-07-21 20:34:37', '2022-07-21 20:34:37', NULL),
(58, 'Producto Anderson Atuesta', 'Esta es una prueba', 1, 11, NULL, '2022-07-21 20:38:17', '2022-07-21 20:38:17', NULL),
(59, 'Producto Anderson Atuesta', 'Esta es una prueba', 1, 11, NULL, '2022-07-21 20:49:42', '2022-07-21 20:49:42', NULL),
(60, 'Pringles', 'papas fritas', 1, NULL, NULL, '2023-05-25 03:52:26', '2023-05-25 03:52:26', NULL);

INSERT INTO `inventarios` (`id`, `id_bodega`, `id_producto`, `cantidad`, `created_by`, `update_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(12, 12, 18, 103, 11, NULL, NULL, '2023-05-26 01:35:52', NULL),
(13, 19, 18, 220, 19, NULL, NULL, NULL, NULL),
(14, 20, 13, 13, 14, NULL, NULL, NULL, NULL),
(18, 19, 14, 7, 15, NULL, NULL, NULL, NULL),
(20, 12, 27, 9, 16, NULL, NULL, NULL, NULL),
(25, 19, 23, 45666, NULL, NULL, '2022-06-03 00:33:43', '2022-06-03 00:33:43', NULL),
(27, 26, 24, 45000, NULL, NULL, '2022-06-03 00:36:44', '2022-06-03 00:36:44', NULL),
(29, 26, 25, 45666, NULL, NULL, '2022-06-03 00:37:56', '2022-06-03 00:37:56', NULL),
(31, 26, 26, 6000, NULL, NULL, '2022-06-03 00:40:11', '2022-06-03 00:40:11', NULL),
(32, 28, 27, 89700, NULL, NULL, '2022-06-03 00:40:44', '2022-06-03 00:40:44', NULL),
(33, 23, 28, 9999, NULL, NULL, '2022-06-03 00:49:21', '2022-06-03 00:49:21', NULL),
(34, 18, 18, 7898, NULL, NULL, '2022-06-03 01:15:12', '2022-06-03 01:15:12', NULL),
(35, 18, 27, 55281, NULL, NULL, '2022-06-03 01:32:51', '2022-06-03 01:32:51', NULL),
(36, 29, 29, 5993, NULL, NULL, '2022-06-03 01:44:09', '2022-06-03 01:44:09', NULL),
(37, 29, 27, 5005, NULL, NULL, '2022-06-03 02:56:32', '2022-06-03 02:56:32', NULL),
(38, 24, 30, 52222, NULL, NULL, '2022-06-03 03:01:54', '2022-06-03 03:01:54', NULL),
(39, 30, 29, 7, NULL, NULL, '2022-06-03 03:17:36', '2022-06-03 03:17:36', NULL),
(40, 24, 24, 666, NULL, NULL, '2022-06-03 03:19:14', '2022-06-03 03:19:14', NULL),
(41, 19, 31, 50, NULL, NULL, '2022-06-03 03:19:58', '2022-06-03 03:19:58', NULL),
(42, 18, 31, 4500, NULL, NULL, '2022-06-03 03:20:24', '2022-06-03 03:20:24', NULL),
(43, 13, 28, 87000, NULL, NULL, '2022-06-03 03:21:20', '2022-06-03 03:21:20', NULL),
(44, 26, 31, 50, NULL, NULL, '2022-06-03 03:27:47', '2022-06-03 03:27:47', NULL),
(45, 32, 32, 200, NULL, NULL, '2022-06-03 03:33:46', '2022-06-03 03:33:46', NULL),
(46, 13, 18, 6666, NULL, NULL, '2022-06-03 03:38:54', '2022-06-03 03:38:54', NULL),
(47, 11, 33, 900, NULL, NULL, '2022-06-03 03:44:26', '2022-07-21 21:24:15', NULL),
(48, 30, 13, 100, NULL, NULL, '2022-06-03 03:47:20', '2022-06-03 03:47:20', NULL),
(49, 28, 34, 8000, NULL, NULL, '2022-06-03 03:48:25', '2022-06-03 03:48:25', NULL),
(50, 30, 27, 6777, NULL, NULL, '2022-06-03 03:49:09', '2022-06-03 03:49:09', NULL),
(51, 12, 31, 600, NULL, NULL, '2022-06-03 03:51:23', '2022-06-03 03:51:23', NULL),
(53, 13, 35, 10, 11, NULL, '2022-06-29 03:22:05', '2022-06-29 03:22:05', NULL),
(54, 24, 36, 10, 11, NULL, '2022-06-29 03:27:10', '2022-06-29 03:27:10', NULL),
(55, 20, 37, 10, 11, NULL, '2022-06-29 03:44:36', '2022-06-29 03:44:36', NULL),
(60, 11, 11, 100, NULL, NULL, '2022-07-11 19:33:42', '2022-07-11 19:33:42', NULL),
(61, 11, 54, 100, NULL, NULL, '2022-07-11 19:47:25', '2022-07-11 19:47:25', NULL),
(62, 11, 55, 100, NULL, NULL, '2022-07-11 20:55:42', '2022-07-11 20:55:42', NULL),
(63, 11, 48, 200, NULL, NULL, '2022-07-11 21:08:07', '2022-07-11 21:08:07', NULL),
(67, 11, 20, 10, NULL, NULL, '2022-07-11 21:13:54', '2022-07-11 22:17:10', NULL),
(68, 12, 20, 92, NULL, NULL, '2022-07-11 21:16:42', '2022-07-11 22:17:10', NULL),
(69, 13, 20, 1080, NULL, NULL, '2022-07-11 21:17:12', '2022-07-18 20:02:46', NULL),
(70, 11, 57, 500, 11, NULL, '2022-07-21 20:34:37', '2022-07-21 20:34:37', NULL),
(71, 11, 58, 500, 11, NULL, '2022-07-21 20:38:17', '2022-07-21 20:38:17', NULL),
(72, 11, 59, 500, 11, NULL, '2022-07-21 20:49:42', '2022-07-21 20:49:42', NULL),
(73, 11, 34, 500, 11, NULL, '2022-07-21 21:00:37', '2022-07-21 21:00:37', NULL),
(74, 12, 34, 200, 11, NULL, '2022-07-21 21:19:32', '2022-07-21 21:19:32', NULL),
(75, 12, 33, 600, 11, NULL, '2022-07-21 21:21:45', '2022-07-21 21:24:15', NULL),
(76, 50, 60, 74, NULL, NULL, '2023-05-25 03:52:26', '2023-05-25 03:52:26', NULL),
(77, 12, 12, 124, NULL, NULL, '2023-05-26 01:36:15', '2023-05-26 01:37:39', NULL);

INSERT INTO `historiales` (`id`, `cantidad`, `id_bodega_origen`, `id_bodega_destino`, `id_inventario`, `created_by`, `update_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(18, 7, 12, 18, 18, 18, NULL, NULL, NULL, NULL),
(20, 9, 11, 12, 18, 15, NULL, NULL, NULL, NULL),
(21, 7, 29, 30, 36, NULL, NULL, '2022-06-03 03:18:19', '2022-06-03 03:18:19', NULL),
(22, 666, 26, 24, 27, NULL, NULL, '2022-06-03 03:19:14', '2022-06-03 03:19:14', NULL),
(23, 100, 19, 18, 41, NULL, NULL, '2022-06-03 03:20:24', '2022-06-03 03:20:24', NULL),
(24, 25, 19, 26, 41, NULL, NULL, '2022-06-03 03:27:47', '2022-06-03 03:27:47', NULL),
(25, 25, 19, 26, 41, NULL, NULL, '2022-06-03 03:28:27', '2022-06-03 03:28:27', NULL),
(26, 300, 18, 12, 42, NULL, NULL, '2022-06-03 03:51:23', '2022-06-03 03:51:23', NULL),
(27, 300, 18, 12, 42, NULL, NULL, '2022-06-03 03:51:35', '2022-06-03 03:51:35', NULL),
(28, 1, 12, 11, 67, NULL, NULL, '2022-07-11 22:17:10', '2022-07-11 22:17:10', NULL),
(29, 200, 11, 12, 75, 11, NULL, '2022-07-21 21:24:15', '2022-07-21 21:24:15', NULL);