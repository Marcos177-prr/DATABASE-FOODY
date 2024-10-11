create DATABASE FOODY

use DATABASE FOODY

create table fabrica(
    codigo VARCHAR (5)PRIMARY key UNIQUE,
    nombre varchar (20) not null,
    tel int null,
    email VARCHAR (20) null UNIQUE,
    dirCalle varchar (20)null,
    dirNUm int null,
    dirColonia varchar(20),
    cantEmp int not null,
    Foreign Key (ciudad) REFERENCES ciudad(codigo)
)

create table ciudad(
    codigo VARCHAR(5) PRIMARY KEY,
    nombre VARCHAR(20) not null UNIQUE,
)

create table administradorFabrica(
    num int PRIMARY KEY AUTO_INCREMENT,
    nombrePila VARCHAR(20) not null,
    apePat VARCHAR(20) not null,
    apeMat VARCHAR(20) null,
    tel int null,
    Foreign Key (Fabrica) REFERENCES Fabrica(codigo)
)

create table empleado(
    num int PRIMARY KEY AUTO_INCREMENT,
    nombrePila VARCHAR(20) not null,
    apePat VARCHAR(20) not null,
    apeMat VARCHAR(20) null,
    tel int null,
    correo VARCHAR(30) null UNIQUE,
    Foreign Key (fabrica) REFERENCES fabrica(num)
    Foreign Key (puesto) REFERENCES puesto(codigo)
) 

create table puesto(
    codigo VARCHAR (5),
    descripcion VARCHAR (20) UNIQUE
)

create table orden(
    num int PRIMARY KEY AUTO_INCREMENT,
    montoPago FLOAT not null,
    fecha date not null,
    totalDescuento float not null,
    Foreign Key (empleado) REFERENCES empleado(num)
    Foreign Key (estado) REFERENCES estado(codigo)
)

create table recibo(
    num int PRIMARY KEY AUTO_INCREMENT,
    total float not null,
    fecha date not null,
    estadoReporte VARCHAR(20) not null,
    Foreign Key (reporte) REFERENCES reporte(num)
    Foreign Key (orden) REFERENCES orden(num)
)

create table reporte(
    num int PRIMARY KEY AUTO_INCREMENT,
    totalVenta int not null,
    fechaInicio  date not null,
    fechaFinal date not null,
    Periodo date not null,
    fechaElabo
)

create table estado(
    codigo VARCHAR(5) PRIMARY KEY unique,
    descripcion VARCHAR(5) not null
)

create table categoria(
    codigo VARCHAR(5) PRIMARY KEY UNIQUE,
    nombre VARCHAR(20)
)

create table platillo(
    codigo VARCHAR(5) PRIMARY KEY UNIQUE,
    nombre VARCHAR(20) not null,
    descripcion VARCHAR(50) not null,
    precio float not null,
    porcenDescuento not null,
    Foreign Key (categoria) REFERENCES categoria(codigo),
    Foreign Key (menu) REFERENCES menu(codigo)
)

create table ingredientes(
    num int PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR (20) not NULL,
    FechCaducid date not NULL
)

create table pedido(
    num int PRIMARY KEY AUTO_INCREMENT,
    montoPago FLOAT not NULL,
    fecha date not null,
    Foreign Key (gerente_comedor) REFERENCES gerente_comedor(num),
    Foreign Key (proveedor) REFERENCES proveedor(codigo)
)

create table proveedor(
    codigo VARCHAR(5) PRIMARY KEY UNIQUE,
    nombre VARCHAR(20) not NULL,
    telefono INT null,
    correo VARCHAR (20) NULL UNIQUE
)

create table gerente_comedor(
    num int PRIMARY KEY AUTO_INCREMENT,
    nombrePila VARCHAR(20) not NULL,
    apePat VARCHAR (20) NOT NULL,
    apeMat VARCHAR (20) null,
    telefono INT null,
    correo VARCHAR (20) null,
    Foreign Key (comedor) REFERENCES comedor(num)
)

create table comedor(
    num int PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30) not NULL,
    ubicacion VARCHAR(30) not NULL,
    Foreign Key (fabrica) REFERENCES fabrica(codigo)
)

create table menu(
    codigo VARCHAR (5) PRIMARY KEY UNIQUE,
    nombre VARCHAR(30) NOT NULL,
    descripcion VARCHAR (30) NOT NULL
)

create table plat_ingred(
    cant_ingred int NOT NULL,
    PRIMARY KEY(platillo,ingredientes),
    Foreign Key (platillo) REFERENCES platillo(codigo),
    Foreign Key (ingredientes) REFERENCES ingredientes(num)
)

create table ingred_ped(
    cant_ingred int NOT NULL,
    PRIMARY KEY(ingredientes,pedido),
    Foreign Key (pedido) REFERENCES pedido(num),
    Foreign Key (ingredientes) REFERENCES ingredientes(num)
)

create table com_menu(
    PRIMARY KEY(ingredientes,pedido)
)

create table ord_plat(
cant_platillos int NOT NULL,
importe int NOT NULL,
PRIMARY KEY(platillo,orden)
Foreign Key (platillo) REFERENCES platillo(codigo)
Foreign Key (orden) REFERENCES orden(num)
)