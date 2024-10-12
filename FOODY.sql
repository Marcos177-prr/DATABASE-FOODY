create DATABASE FOODY

use DATABASE FOODY

create table fabrica(
    codigo VARCHAR (5)PRIMARY key not null,
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
    Foreign Key (fabrica) REFERENCES fabrica(num),
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
    Foreign Key (empleado) REFERENCES empleado(num),
    Foreign Key (estado) REFERENCES estado(codigo)
)

create table recibo(
    num int PRIMARY KEY AUTO_INCREMENT,
    total float not null,
    fecha date not null,
    estadoReporte VARCHAR(20) not null,
    Foreign Key (reporte) REFERENCES reporte(num),
    Foreign Key (orden) REFERENCES orden(num)
)

create table reporte(
    num int PRIMARY KEY AUTO_INCREMENT,
    totalVenta int not null,
    fechaInicio  date not null,
    fechaFinal date not null,
    Periodo date not null,
    fechaElabo date not null
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

INSERT INTO Fabrica (codigo, nombre, tel, email, dirCalle, dirNum) VALUES
('FERROS', 'Ferros Inc', '664-258-8677', 'ferrostijuana@gmail.com', 'Brisa', '2'),
('ACEROS', 'Aceros del Norte', '664-158-9814', 'acerosnorte@gmail.com', 'Reforma', '5'),
('ALUMEX', 'Alumex Corp', '664-358-4872', 'aluminiosmexico@gmail.com', 'Insurgentes', '15'),
('MADERB', 'Maderas Benitez', '664-165-1487', 'madebenitez@gmail.com', 'Las Rosas', '14'),
('TEXTIL', 'Textiles SA', '664-458-5759', 'textilesssa@gmail.com', 'Alameda', '12'),
('PLASTI', 'Plastica Mex', '664-658-5478', 'plasticosmex123@gmail.com', 'Blvd. Diaz Ordaz', '10'),
('ELECTNO', 'Electro Nova', '664-124-3257', 'electronova142@gmail.com', 'Castaños', '54'),
('MUEBLES', 'Muebles Elvia', '663-147-8799', 'muebleselvia@gmail.com', 'Colinas', 'A-72'),
('DULMEX', 'Dulmex Paletas', '664-849-8742', 'dulmexpaletas@gmail.com', 'Monterrey', '45'),
('CMTNOR', 'CMT Norte', '663-422-8879', 'CMTNORTE@gmail.com', 'Jamaica', '54');

insert into ciudad(codigo,nombre) VALUES
("TIJ","Tijuana"),
("MEX","Mexicali"),
("ENS","Ensenada"),
("ROS","Rosarito");

INSERT INTO administradorFabrica (num, nombrePila, apePat, apeMat, tel, fabrica) VALUES
(1, 'Javier', 'Diaz', 'Molina', '664-574-8912', 'FERROS'),
(2, 'Ernesto', 'Mendoza', 'Cardenas', '664-741-9988', 'ACEROS'),
(3, 'Marta', 'Figueroa', 'Castro', '664-158-7441', 'ALUMEX'),
(4, 'Alejandra', 'Alvarez', 'Cruz', '664-157-5863', 'MADERB'),
(5, 'Fernando', 'Ortega', 'Salinas', '664-236-8941', 'TEXTIL'),
(6, 'Carlos', 'Vasquez', 'Beltran', '663-222-5413', 'PLASTI'),
(7, 'Armando', 'Nuñes', 'Murillo', '664-789-4152', 'ELECTNO'),
(8, 'Rigoberta', 'Osuna', 'Valencia', '664-987-1420', 'MUEBLES'),
(9, 'Genaro', 'Brito', 'Canales', '664-021-1470', 'DULMEX'),
(10, 'Josefa', 'Hernandez', 'Ochoa', '663-799-1481', 'CMTNOR');

INSERT INTO empleado (num, nombrePila, apePat, apeMat, tel, correo) VALUES
(1, 'Santiago', 'Garcia', 'Roman', '664-421-6897', 'santiago.Garcia@gmail.com'),
(2, 'Luis', 'Rodríguez', 'Sorte', '664-711-6666', 'luis.Rodríguez@gmail.com'),
(3, 'Marta', 'Martínez', 'Mendoza', '664-117-8531', 'marta.Martínez@gmail.com'),
(4, 'Ángel', 'López', 'Chávez', '664-871-5471', 'angel.López@gmail.com'),
(5, 'Carmen', 'González', 'Aguilar', '664-578-1245', 'carmen.González@gmail.com'),
(6, 'Fernando', 'Pérez', 'Rojas', '664-125-2549', 'hernán.Pérez@gmail.com'),
(7, 'Antonia', 'Sánchez', 'Medina', '664-478-6655', 'antonia.Sánchez@gmail.com'),
(8, 'Rodrigo', 'Ramírez', 'Delgado', '664-887-1478', 'rodrigo.Ramírez@gmail.com'),
(9, 'Norma', 'Torres', 'Soto', '664-378-1211', 'norma.Torres@gmail.com'),
(10, 'Eduardo', 'Flores', 'Vega', '664-422-5314', 'eduardo.Flores@gmail.com'),
(11, 'Fabiana', 'Rivera', 'Silva', '664-713-4745', 'fabiana.Rivera@gmail.com'),
(12, 'Sebastián', 'Gómez', 'Salazar', '644-332-1078', 'sebastián.Gómez@gmail.com'),
(13, 'Maribel', 'Díaz', 'León', '664-137-8799', 'maribel.Díaz@gmail.com'),
(14, 'Iván', 'Vázquez', 'Cruz', '663-555-6871', 'iván.Vázquez@gmail.com'),
(15, 'Paloma', 'Romero', 'Navarro', '664-571-8125', 'paloma.Romero@gmail.com'),
(16, 'Rafael', 'Herrera', 'Fuentes', '664-357-4785', 'rafael.Herrera@gmail.com'),
(17, 'Juana', 'Castro', 'Paredes', '664-745-6541', 'juana.Castro@gmail.com'),
(18, 'Mateo', 'Domínguez', 'Ramos', '664-141-9873', 'mateo.Domínguez@gmail.com'),
(19, 'Claudia', 'Morales', 'Valencia', '664-423-4777', 'claudia.Morales@gmail.com'),
(20, 'Tomás', 'Ortiz', 'Acosta', '664-879-6517', 'tomas.Ortiz@gmail.com'),
(21, 'Fátima', 'Ruiz', 'Molina', '664-748-2311', 'fátima.Ruiz@gmail.com'),
(22, 'Jorge', 'Jiménez', 'Orozco', '664-879-8999', 'jorge.Jiménez@gmail.com'),
(23, 'Pilar', 'Mendoza', 'Ponce', '664-171-1781', 'pilar.Mendoza@gmail.com'),
(24, 'Damián', 'Chávez', 'Serrano', '664-877-9983', 'damián.Chávez@gmail.com'),
(25, 'Vanessa', 'Aguilar', 'Miranda', '664-875-2214', 'vanesa.Aguilar@gmail.com'),
(26, 'Lucas', 'Rojas', 'Cárdenas', '664-147-1556', 'lucas.Rojas@gmail.com'),
(27, 'Cristina', 'Medina', 'Esquivel', '664-744-1444', 'cristina.Medina@gmail.com'),
(28, 'Joaquín', 'Delgado', 'Barrios', '664-111-9874', 'joaquín.Delgado@gmail.com'),
(29, 'Selene', 'Soto', 'Reyes', '664-874-9386', 'selene.Soto@gmail.com'),
(30, 'Hugo', 'Vega', 'Palacios', '664-478-1236', 'hugo.Vega@gmail.com'),
(31, 'Jimena', 'Silva', 'Bautista', '664-774-2356', 'jimena.Silva@gmail.com'),
(32, 'Bruno', 'Salazar', 'Zamora', '664-387-9511', 'bruno.Salazar@gmail.com'),
(33, 'Regina', 'León', 'Castañeda', '664-144-4786', 'regina.León@gmail.com'),
(34, 'Esteban', 'Cruz', 'Ramos', '664-897-5751', 'esteban.Cruz@gmail.com'),
(35, 'Almudena', 'Navarro', 'Luna', '664-845-2312', 'almudena.Navarro@gmail.com'),
(36, 'César', 'Fuentes', 'Villanueva', '664-447-4777', 'césar.Fuentes@gmail.com'),
(37, 'Gloria', 'Paredes', 'Montes', '664-784-7176', 'gloria.Paredes@gmail.com'),
(38, 'Alexis', 'Ramos', 'Lara', '664-485-7892', 'alexis.Ramos@gmail.com'),
(39, 'Sabrina', 'Valencia', 'Montero', '664-784-2344', 'sabrina.Valencia@gmail.com'),
(40, 'Guillermo', 'Acosta', 'Mora', '664-838-2241', 'guillermo.Acosta@gmail.com'),
(41, 'Aitana', 'Sandoval', 'Olivares', '664-478-1161', 'aitana.Sandoval@gmail.com'),
(42, 'Lorenzo', 'Peña', 'Salinas', '664-758-4561', 'lorenzo.Peña@gmail.com'),
(43, 'Melissa', 'Escobar', 'Cordero', '664-585-8144', 'melisa.Escobar@gmail.com'),
(44, 'Álvaro', 'Carrillo', 'Nuñez', '664-831-6937', 'álvaro.Carrillo@gmail.com'),
(45, 'Rosario', 'Muñoz', 'Aguirre', '664-788-6191', 'rosario.Muñoz@gmail.com'),
(46, 'Enrique', 'Vázquez', 'Peralta', '663-742-5487', 'enrique.Vázquez@gmail.com'),
(47, 'Daniela', 'Vargas', 'Santiago', '664-231-6741', 'daniela.Vargas@gmail.com'),
(48, 'Samuel', 'Molina', 'Coronado', '664-784-9386', 'samuel.Molina@gmail.com'),
(49, 'Sonia', 'Orozco', 'Trujillo', '663-148-3715', 'sonia.Orozco@gmail.com');
