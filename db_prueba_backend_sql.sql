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