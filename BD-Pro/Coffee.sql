DROP SCHEMA IF EXISTS `Coffee`;
CREATE SCHEMA `Coffee` DEFAULT CHARACTER SET utf8;
USE Coffee;

CREATE TABLE Cargos(
	id_cargo VARCHAR(3) NOT NULL PRIMARY KEY,
	cargo VARCHAR(50) NOT NULL
);

CREATE TABLE Sucursales(
	id_sucursal VARCHAR(3) NOT NULL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	ubicacion VARCHAR(100) NOT NULL,
	telefono VARCHAR(9) NOT NULL
);

CREATE TABLE Mesas(
	id_mesa VARCHAR(3) NOT NULL PRIMARY KEY,
	capacidad TINYINT UNSIGNED NOT NULL,
	id_sucursal VARCHAR(3) NOT NULL,
	
	INDEX `idx_sucursal`(id_sucursal),
    	CONSTRAINT `fk_mesa_sucursal`
    	FOREIGN KEY(id_sucursal)
    	REFERENCES Sucursales(id_sucursal) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE Empleados(
	id_empleado VARCHAR(3) NOT NULL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	p_apellido VARCHAR(50) NOT NULL,
	s_apellido VARCHAR(50) NOT NULL,
	num_contacto VARCHAR(9) NOT NULL,
	fech_nac DATE NOT NULL,
	direccion VARCHAR(100) NOT NULL,
	id_jefe VARCHAR(3),
	id_sucursal VARCHAR(3) NOT NULL,
	id_cargo VARCHAR(3) NOT NULL,
	
	INDEX `idx_jefe`(id_jefe),
    	CONSTRAINT `fk_empleado_jefe`
    	FOREIGN KEY(id_jefe)
    	REFERENCES Empleados(id_empleado) ON UPDATE CASCADE ON DELETE RESTRICT,
	
	INDEX `idx_sucursal`(id_sucursal),
    	CONSTRAINT `fk_empleado_sucursal`
    	FOREIGN KEY(id_sucursal)
    	REFERENCES Sucursales(id_sucursal) ON UPDATE CASCADE ON DELETE RESTRICT,

	INDEX `idx_cargo`(id_cargo),
    	CONSTRAINT `fk_empleado_cargo`
    	FOREIGN KEY(id_cargo)
    	REFERENCES Cargos(id_cargo) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE Ordenes(
	id_orden VARCHAR(3) NOT NULL PRIMARY KEY,
	id_empleado VARCHAR(3) NOT NULL,

	INDEX `idx_empleado`(id_empleado),
    	CONSTRAINT `fk_orden_empleado`
    	FOREIGN KEY(id_empleado)
    	REFERENCES Empleados(id_empleado) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE Productos(
	id_producto VARCHAR(3) NOT NULL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	precio TINYINT UNSIGNED NOT NULL,
	imagen VARCHAR(100) NOT NULL,
	descripcion TINYTEXT
);

CREATE TABLE Proveedores(
	id_proveedor VARCHAR(3) NOT NULL PRIMARY KEY,
	nombre_contacto VARCHAR(50) NOT NULL,
	proveedor VARCHAR(50) NOT NULL,
	correo VARCHAR(50) NOT NULL,
	telefono VARCHAR(9)	
);

CREATE TABLE Insumos(
	id_insumo VARCHAR(3) NOT NULL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	cantidad SMALLINT UNSIGNED NOT NULL,
	umbral TINYINT NOT NULL,
	id_proveedor VARCHAR(3) NOT NULL,
	
	INDEX `idx_proveedor`(id_proveedor),
    	CONSTRAINT `fk_insumo_proveedor`
    	FOREIGN KEY(id_proveedor)
    	REFERENCES Proveedores(id_proveedor) ON UPDATE CASCADE ON DELETE RESTRICT	
);

CREATE TABLE Pedidos(
	id_pedido VARCHAR(3) NOT NULL PRIMARY KEY,
	fecha DATE NOT NULL,
	cantidad SMALLINT UNSIGNED NOT NULL,
	precio SMALLINT UNSIGNED NOT NULL,	
	id_sucursal VARCHAR(3) NOT NULL,
	id_insumo VARCHAR(3) NOT NULL,

	INDEX `idx_sucursal`(id_sucursal),
    	CONSTRAINT `fk_pedido_sucursal`
    	FOREIGN KEY(id_sucursal)
    	REFERENCES Sucursales(id_sucursal) ON UPDATE CASCADE ON DELETE RESTRICT,

	INDEX `idx_insumo`(id_insumo),
    	CONSTRAINT `fk_pedido_insumo`
    	FOREIGN KEY(id_insumo)
    	REFERENCES Insumos(id_insumo) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE Formas_Pago(
	id_forma_pago VARCHAR(3) NOT NULL PRIMARY KEY,
	modo VARCHAR(50) NOT NULL
);

CREATE TABLE Clientes(
	id_cliente VARCHAR(3) NOT NULL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	p_apellido VARCHAR(50) NOT NULL,
	s_apellido VARCHAR(50) NOT NULL,
	num_contacto VARCHAR(9) NOT NULL
);

CREATE TABLE Facturas(
	id_factura VARCHAR(3) NOT NULL PRIMARY KEY,
	fecha DATE NOT NULL,
	total_pagar SMALLINT UNSIGNED NOT NULL,
	efectivo SMALLINT UNSIGNED NOT NULL,
	cambio SMALLINT UNSIGNED NOT NULL,
	id_cliente VARCHAR(3) NOT NULL,
	id_forma_pago VARCHAR(3) NOT NULL,

	INDEX `idx_cliente`(id_cliente),
    	CONSTRAINT `fk_factura_cliente`
    	FOREIGN KEY(id_cliente)
    	REFERENCES Clientes(id_cliente) ON UPDATE CASCADE ON DELETE RESTRICT,
	
	INDEX `idx_forma_pago`(id_forma_pago),
    	CONSTRAINT `fk_factura_fp`
    	FOREIGN KEY(id_forma_pago)
    	REFERENCES Formas_Pago(id_forma_pago) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE Reservaciones(
	id_reservacion VARCHAR(3) NOT NULL PRIMARY KEY,
	fecha DATE NOT NULL,
	hora TIME NOT NULL,
	id_cliente VARCHAR(3) NOT NULL,
	
	INDEX `idx_cliente`(id_cliente),
    	CONSTRAINT `fk_reservacion_cliente`
    	FOREIGN KEY(id_cliente)
    	REFERENCES Clientes(id_cliente) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE Productos_Ordenes(
	id_producto VARCHAR(3) NOT NULL,
	id_orden VARCHAR(3) NOT NULL,
	
	INDEX `idx_producto`(id_producto),
    	CONSTRAINT `fk_po_producto`
    	FOREIGN KEY(id_producto)
    	REFERENCES Productos(id_producto) ON UPDATE CASCADE ON DELETE RESTRICT,
        
	INDEX `idx_orden`(id_orden),
    	CONSTRAINT `fk_po_orden`
    	FOREIGN KEY(id_orden)
    	REFERENCES Ordenes(id_orden) ON UPDATE CASCADE ON DELETE RESTRICT
);

ALTER TABLE Productos_Ordenes ADD PRIMARY KEY(id_producto, id_orden);

CREATE TABLE Insumos_Productos(
	id_producto VARCHAR(3) NOT NULL,
	id_insumo VARCHAR(3) NOT NULL,

	INDEX `idx_producto`(id_producto),
    	CONSTRAINT `fk_ip_producto`
    	FOREIGN KEY(id_producto)
    	REFERENCES Productos(id_producto) ON UPDATE CASCADE ON DELETE RESTRICT,
        
	INDEX `idx_insumo`(id_insumo),
    	CONSTRAINT `fk_ip_insumo`
    	FOREIGN KEY(id_insumo)
    	REFERENCES Insumos(id_insumo) ON UPDATE CASCADE ON DELETE RESTRICT
);

ALTER TABLE Insumos_Productos ADD PRIMARY KEY(id_producto, id_insumo);

CREATE TABLE Ordenes_Facturas(
	id_orden VARCHAR(3) NOT NULL,
	id_factura VARCHAR(3) NOT NULL,

	INDEX `idx_orden`(id_orden),
    	CONSTRAINT `fk_of_orden`
    	FOREIGN KEY(id_orden)
    	REFERENCES Ordenes(id_orden) ON UPDATE CASCADE ON DELETE RESTRICT,
        
	INDEX `idx_factura`(id_factura),
    	CONSTRAINT `fk_of_factura`
    	FOREIGN KEY(id_factura)
    	REFERENCES Facturas(id_factura) ON UPDATE CASCADE ON DELETE RESTRICT
);

ALTER TABLE Ordenes_Facturas ADD PRIMARY KEY(id_orden, id_factura);




