
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
);

CREATE TABLE Ordenes(
	id_orden VARCHAR(3) NOT NULL PRIMARY KEY,
	id_empleado VARCHAR(3) NOT NULL,
	id_mesa VARCHAR(3) NOT NULL,

	INDEX `idx_empleado`(id_empleado),
    	CONSTRAINT `fk_orden_empleado`
    	FOREIGN KEY(id_empleado)
    	REFERENCES Empleados(id_empleado) ON UPDATE CASCADE ON DELETE RESTRICT,
        
	INDEX `idx_mesa`(id_mesa),
    	CONSTRAINT `fk_orden_mesa`
    	FOREIGN KEY(id_mesa)
    	REFERENCES Mesas(id_mesa) ON UPDATE CASCADE ON DELETE RESTRICT
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
	id_sucursal VARCHAR(3) NOT NULL,

	INDEX `idx_sucursal`(id_sucursal),
    	CONSTRAINT `fk_predido_sucursal`
    	FOREIGN KEY(id_sucursal)
    	REFERENCES Sucursales(id_sucursal) ON UPDATE CASCADE ON DELETE RESTRICT
	
);

CREATE TABLE Facturas(
	id_factura VARCHAR(3) NOT NULL PRIMARY KEY,
	fecha DATE NOT NULL,
	igv TINYINT UNSIGNED NOT NULL,
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

CREATE TABLE Tarjetas(
	nro_tarjeta VARCHAR(16) NOT NULL PRIMARY KEY,
	CVV VARCHAR(3) NOT NULL,
	id_cliente VARCHAR(3) NOT NULL,

	INDEX `idx_cliente`(id_cliente),
    	CONSTRAINT `fk_tarjeta_cliente`
    	FOREIGN KEY(id_cliente)
    	REFERENCES Clientes(id_cliente) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE Transacciones(
	id_transaccion VARCHAR(3) NOT NULL PRIMARY KEY,
	nro_tarjeta VARCHAR(3) NOT NULL,
	id_factura VARCHAR(3) NOT NULL,
	
	INDEX `idx_tarjeta`(nro_tarjeta),
    	CONSTRAINT `fk_transaccion_tarjeta`
    	FOREIGN KEY(nro_tarjeta)
    	REFERENCES Tarjetas(nro_tarjeta) ON UPDATE CASCADE ON DELETE RESTRICT,

	INDEX `idx_factura`(id_factura),
    	CONSTRAINT `fk_transaccion_factura`
    	FOREIGN KEY(id_factura)
    	REFERENCES Facturas(id_factura) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE Reservaciones(
	id_reservacion VARCHAR(3) NOT NULL PRIMARY KEY,
	fecha DATE NOT NULL,
	hora TIME NOT NULL,
	id_mesa VARCHAR(3) NOT NULL,
	id_cliente VARCHAR(3) NOT NULL,
	
	INDEX `idx_mesa`(id_mesa),
    	CONSTRAINT `fk_reservacion_mesa`
    	FOREIGN KEY(id_mesa)
    	REFERENCES Mesas(id_mesa) ON UPDATE CASCADE ON DELETE RESTRICT,
	
	INDEX `idx_cliente`(id_cliente),
    	CONSTRAINT `fk_reservacion_cliente`
    	FOREIGN KEY(id_cliente)
    	REFERENCES Clientes(id_cliente) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE Combos_Ordenes(
	id_combo VARCHAR(3) NOT NULL,
	id_orden VARCHAR(3) NOT NULL,
	
	INDEX `idx_combo`(id_combo),
    	CONSTRAINT `fk_co_combo`
    	FOREIGN KEY(id_combo)
    	REFERENCES Combos(id_combo) ON UPDATE CASCADE ON DELETE RESTRICT,
        
	INDEX `idx_orden`(id_orden),
    	CONSTRAINT `fk_co_orden`
    	FOREIGN KEY(id_orden)
    	REFERENCES Ordenes(id_orden) ON UPDATE CASCADE ON DELETE RESTRICT
);

ALTER TABLE Combos_Ordenes ADD PRIMARY KEY(id_combo, id_orden);

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


CREATE TABLE Productos_Combos(
	id_combo VARCHAR(3) NOT NULL,
	id_producto VARCHAR(3) NOT NULL,
	
	INDEX `idx_combo`(id_combo),
    	CONSTRAINT `fk_pc_combo`
    	FOREIGN KEY(id_combo)
    	REFERENCES Combos(id_combo) ON UPDATE CASCADE ON DELETE RESTRICT,
        
	INDEX `idx_producto`(id_producto),
    	CONSTRAINT `fk_pc_producto`
    	FOREIGN KEY(id_producto)
    	REFERENCES Productos(id_producto) ON UPDATE CASCADE ON DELETE RESTRICT
);

ALTER TABLE Productos_Combos ADD PRIMARY KEY(id_combo, id_producto);


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

CREATE TABLE Insumos_Pedidos(
	id_pedido VARCHAR(3) NOT NULL,
	id_insumo VARCHAR(3) NOT NULL,

	INDEX `idx_pedido`(id_pedido),
    	CONSTRAINT `fk_ipe_pedido`
    	FOREIGN KEY(id_pedido)
    	REFERENCES Pedidos(id_pedido) ON UPDATE CASCADE ON DELETE RESTRICT,
        
	INDEX `idx_insumo`(id_insumo),
    	CONSTRAINT `fk_ipe_insumo`
    	FOREIGN KEY(id_insumo)
    	REFERENCES Insumos(id_insumo) ON UPDATE CASCADE ON DELETE RESTRICT
);

ALTER TABLE Insumos_Pedidos ADD PRIMARY KEY(id_pedido, id_insumo);

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






