-- Parte 1: Crear entorno de trabajo

create database trabajo_grupal5;
CREATE USER 'telovendo'@'trabajo_grupal5' IDENTIFIED BY 'grupo4';
GRANT ALL PRIVILEGES ON *.* TO 'telovendo'@'trabajo_grupal5';

use trabajo_grupal5;

-- Parte 2: Crear dos tablas.
-- - La primera almacena a los usuarios de la aplicación (id_usuario, nombre, apellido,
-- contraseña, zona horaria (por defecto UTC-3), género y teléfono de contacto).

create table usuarios (
id_usuario int not null auto_increment,
nombre varchar(45) null,
apellido varchar(45) null,
contraseña varchar(45) null,
zona_horario varchar(45) default 'UTC-3' null,
género varchar(45) null,
teléfono int null,
primary key (id_usuario)
);

select * from usuarios;
-- La segunda tabla almacena información relacionada a la fecha-hora de ingreso de los
-- usuarios a la plataforma (id_ingreso, id_usuario y la fecha-hora de ingreso (por defecto la
-- fecha-hora actual)).

select * from ingreso_plataforma;
describe ingreso_plataforma;
create table ingreso_plataforma (
id_ingreso int not null auto_increment,
id_usuario int not null,
fecha_ingreso datetime default current_timestamp,
primary key (id_ingreso),
foreign key (id_usuario) references usuarios (id_usuario) on delete restrict on update restrict
);

-- Parte 3: Modificación de la tabla
-- Modifique el UTC por defecto.Desde UTC-3 a UTC-2.
describe usuarios;
select * from usuarios;
alter table usuarios alter column zona_horario set default 'UTC-2';

-- Parte 4: Creación de registros.
-- Para cada tabla crea 8 registros.
select * from usuarios;

insert into usuarios (nombre, apellido, contraseña, género, teléfono)
values ('Cristian', 'Molina', 'cris123', 'Masculino', 982995345);
insert into usuarios (nombre, apellido, contraseña, género, teléfono)
values ('Mario', 'Briceño', 'marioBri', 'Masculino', 985667490);
insert into usuarios (nombre, apellido, contraseña, género, teléfono)
values ('Leticia', 'Olivares', 'letu67', 'Femenino', 976779098);
insert into usuarios (nombre, apellido, contraseña, género, teléfono)
values ('Roberto', 'Acuña', 'robertAcu', 'Masculino', 986654903);
insert into usuarios (nombre, apellido, contraseña, género, teléfono)
values ('Javiera', 'Aguirre', 'javiA_3', 'Femenino', 955690876);
insert into usuarios (nombre, apellido, contraseña, género, teléfono)
values ('Romina', 'Olivares', 'rominoli', 'Femenino', 956678043);
insert into usuarios (nombre, apellido, contraseña, género, teléfono)
values ('Antonio', 'Torres', 'antTors', 'Masculino', 998504329);
insert into usuarios (nombre, apellido, contraseña, género, teléfono)
values ('Jaime', 'Contreras', 'jaime12', 'Masculino', 900874556);

select * from ingreso_plataforma;
describe ingreso_plataforma;
insert into ingreso_plataforma(id_usuario) values (1);
insert into ingreso_plataforma(id_usuario) values (2);
insert into ingreso_plataforma(id_usuario) values (3);
insert into ingreso_plataforma(id_usuario) values (4);
insert into ingreso_plataforma(id_usuario) values (5);
insert into ingreso_plataforma(id_usuario) values (6);
insert into ingreso_plataforma(id_usuario) values (7);
insert into ingreso_plataforma(id_usuario) values (8);

-- Creen una nueva tabla llamada Contactos (id_contacto, id_usuario, numero de telefono,
-- correo electronico).
select * from contacto;
describe contacto;

create table contacto (
id_contacto int not null auto_increment,
id_usuario int not null,
teléfono int not null,
email varchar(45) null,
primary key (id_contacto)
);

-- Modifique la columna teléfono de contacto, para crear un vínculo entre la tabla Usuarios y la
-- tabla Contactos.
select * from contacto;
describe contacto;

alter table contacto
add foreign key (id_usuario) references usuarios(id_usuario) 
on delete restrict on update restrict
; 