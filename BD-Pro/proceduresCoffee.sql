USE Coffee;
-- CARGOS
DELIMITER $$
DROP PROCEDURE IF EXISTS insertarCargo;
CREATE PROCEDURE insertarCargo(
	IN _id_cargo VARCHAR(3),
	IN _cargo VARCHAR(50))
BEGIN
	INSERT INTO Cargos(id_cargo, cargo) 
	VALUES(_id_cargo, _cargo);
END$$

-- PERSONA
DELIMITER $$
DROP PROCEDURE IF EXISTS insertarPersona;
CREATE PROCEDURE insertarPersona(
	IN _id_persona VARCHAR(3),
	IN _nombre VARCHAR(50),
	IN _p_apellido VARCHAR(50),
	IN _s_apellido VARCHAR(50),
	IN _num_contacto VARCHAR(9),
	IN _fech_nac DATE,
	IN _direccion VARCHAR(100))
BEGIN
	INSERT INTO Personas(id_persona, nombre, p_apellido, s_apellido, num_contacto, fech_nac, direccion) 
	VALUES(_id_persona, _nombre, _p_apellido, _s_apellido, _num_contacto, _fech_nac, _direccion);
END$$

-- SUCURSALES
DELIMITER $$
DROP PROCEDURE IF EXISTS insertarSucursal;
CREATE PROCEDURE insertarSucursal(
	IN _id_sucursal VARCHAR(3),
	IN _nombre VARCHAR(50),
	IN _ubicacion VARCHAR(100),
	IN _telefono VARCHAR(9))
BEGIN
	INSERT INTO Sucursales(id_sucursal, nombre, ubicacion, telefono) 
	VALUES(_id_sucursal, _nombre, _ubicacion, _telefono);
END$$

-- MESAS
DELIMITER $$
DROP PROCEDURE IF EXISTS insertarMesa;
CREATE PROCEDURE insertarMesa(
	IN _id_mesa VARCHAR(3),
	IN _capacidad TINYINT UNSIGNED,
	IN _id_sucursal VARCHAR(3))
BEGIN
	INSERT INTO Mesas(id_mesa, capacidad, id_sucursal) 
	VALUES(_id_mesa, _capacidad, _id_sucursal);
END$$

-- EMPLEADOS
DELIMITER $$
DROP PROCEDURE IF EXISTS insertarEmpleado;
CREATE PROCEDURE insertarEmpleado(
	IN _id_empleado VARCHAR(3),
	IN _nombre VARCHAR(50),
    	IN _p_apellido VARCHAR(50),
	IN _s_apellido VARCHAR(50),
	IN _num_contacto VARCHAR(9),
	IN _fech_nac DATE,
	IN _direccion VARCHAR(100),
	IN _id_jefe VARCHAR(3),
	IN _id_cargo VARCHAR(3),
	IN _id_sucursal VARCHAR(3))
BEGIN
	INSERT INTO Empleados(id_empleado, nombre, p_apellido, s_apellido, num_contacto, fech_nac, direccion, id_jefe, id_cargo, id_sucursal) 
	VALUES(_id_empleado, _nombre, _p_apellido, _s_apellido, _num_contacto, _fech_nac, _direccion, _id_jefe, _id_cargo, _id_sucursal);
END$$

-- PROVEEDOR
DELIMITER $$
DROP PROCEDURE IF EXISTS insertarProveedor;
CREATE PROCEDURE insertarProveedor(
	IN _id_proveedor VARCHAR(3),
	IN _nombre_contacto VARCHAR(50),
	IN _proveedor VARCHAR(50),
	IN _correo VARCHAR(50),
	IN _telefono VARCHAR(9))
BEGIN
	INSERT INTO Proveedores(id_proveedor, nombre_contacto, proveedor, correo, telefono) 
	VALUES(_id_proveedor, _nombre_contacto, _proveedor, _correo, _telefono);
END$$

-- INSERT INSUMOS
DELIMITER $$
DROP PROCEDURE IF EXISTS insertarInsumo;
CREATE PROCEDURE insertarInsumo(
	IN _id_insumo VARCHAR(3),
	IN _nombre VARCHAR(50),
	IN _cantidad SMALLINT UNSIGNED,
	IN _umbral TINYINT,
	IN _id_proveedor VARCHAR(3))
BEGIN
	INSERT INTO Insumos(id_insumo, nombre, cantidad, umbral, id_proveedor) 
	VALUES(_id_insumo, _nombre, _cantidad, _umbral, _id_proveedor);
END$$

-- INSERT CLIENTE
DELIMITER $$
DROP PROCEDURE IF EXISTS insertarCliente;
CREATE PROCEDURE insertarCliente(
	IN _id_cliente VARCHAR(3),
	IN _nombre VARCHAR(50),
	IN _p_apellido VARCHAR(50),
	IN _s_apellido VARCHAR(50),
	IN _num_contacto VARCHAR(9))

BEGIN
	INSERT INTO Clientes(id_cliente, nombre, p_apellido, s_apellido, num_contacto) 
	VALUES(_id_cliente, _nombre, _p_apellido, _s_apellido, _num_contacto);
END$$

-- INSERT PRODUCTO
DELIMITER $$
DROP PROCEDURE IF EXISTS insertarProducto;
CREATE PROCEDURE insertarProducto(
	IN _id_producto VARCHAR(3),
	IN _nombre VARCHAR(50),
	IN _precio VARCHAR(50),
	IN _imagen VARCHAR(100))
BEGIN
	INSERT INTO Productos(id_producto, nombre, precio, imagen) 
	VALUES(_id_producto, _nombre, _precio, _imagen);
END$$

-- INSERT RESERVACION
DELIMITER $$
DROP PROCEDURE IF EXISTS insertarReservacion;
CREATE PROCEDURE insertarReservacion(
	IN _id_reservacion VARCHAR(3),
	IN _fecha DATE,
	IN _hora TIME,
	IN _id_cliente VARCHAR(3))

BEGIN
	INSERT INTO Reservaciones(id_reservacion, fecha, hora, id_cliente) 
	VALUES(_id_reservacion, _fecha, _hora, _id_cliente);
END$$

-- INSERT FACTURA
DELIMITER $$
DROP PROCEDURE IF EXISTS insertarFactura;
CREATE PROCEDURE insertarFactura(
	IN _id_factura VARCHAR(3),
	IN _fecha DATE,
	IN _total_pagar SMALLINT UNSIGNED,
	IN _efectivo SMALLINT UNSIGNED,
	IN _cambio SMALLINT UNSIGNED,
	IN _id_cliente VARCHAR(3),
	IN _id_forma_pago VARCHAR(3))
BEGIN
	INSERT INTO Facturas(id_factura, fecha, total_pagar, efectivo, cambio, id_cliente, id_forma_pago) 
	VALUES(_id_factura, _fecha, _total_pagar, _efectivo, _cambio, _id_cliente, _id_forma_pago);
END$$

-- INSERT PEDIDO
DELIMITER $$
DROP PROCEDURE IF EXISTS insertarPedido;
CREATE PROCEDURE insertarPedido(
	IN _id_pedido VARCHAR(3),
	IN _fecha DATE,
	IN _cantidad SMALLINT UNSIGNED,
	IN _precio SMALLINT UNSIGNED,
	IN _id_sucursal VARCHAR(3),
	IN _id_insumo VARCHAR(3))
BEGIN
	INSERT INTO Pedidos(id_pedido, fecha, cantidad, precio, id_sucursal, id_insumo) 
	VALUES(_id_pedido, _fecha, _cantidad, _precio, _id_sucursal, _id_insumo);
END$$

-- BUSCAR EMPLEADO
DELIMITER $$
DROP PROCEDURE IF EXISTS buscarEmpleado;
CREATE PROCEDURE buscarEmpleado(
	IN _id_empleado VARCHAR(3))
BEGIN
	SELECT * FROM Empleados WHERE id_empleado = _id_empleado; 
END$$

-- BUSCAR INSUMO
DELIMITER $$
DROP PROCEDURE IF EXISTS buscarInsumo;
CREATE PROCEDURE buscarInsumo(
	IN _id_insumo VARCHAR(3))
BEGIN
	SELECT * FROM Insumos WHERE id_insumo = _id_insumo; 
END$$

-- BUSCAR CLIENTE
DELIMITER $$
DROP PROCEDURE IF EXISTS buscarCliente;
CREATE PROCEDURE buscarCliente(
	IN _id_cliente VARCHAR(3))
BEGIN
	SELECT * FROM Clientes WHERE id_cliente = _id_cliente; 
END$$

-- SELECT EMPLEADO
DELIMITER $$
DROP PROCEDURE IF EXISTS selectEmpleado;
CREATE PROCEDURE selectEmpleado(
	IN _id_sucursal VARCHAR(3))
BEGIN
	SELECT a.id_empleado, a.p_apellido, a.s_apellido, a.nombre, a.fech_nac, a.num_contacto, a.direccion, b.nombre as 'jefe' FROM Empleados a
INNER JOIN Empleados b ON a.id_jefe = b.id_empleado
WHERE _id_sucursal = a.id_sucursal
ORDER BY a.id_empleado; 
END$$

-- SELECT CLIENTE
DELIMITER $$
DROP PROCEDURE IF EXISTS selectCliente;
CREATE PROCEDURE selectCliente( IN _word VARCHAR(2))
BEGIN
	SELECT * FROM Clientes WHERE id_cliente LIKE _word;
END$$

-- SELECT INSUMOS
DELIMITER $$
DROP PROCEDURE IF EXISTS selectInsumo;
CREATE PROCEDURE selectInsumo( IN _word VARCHAR(2))
BEGIN
	SELECT id_insumo, nombre, cantidad, umbral, proveedor FROM Insumos a
INNER JOIN Proveedores b ON a.id_proveedor = b.id_proveedor
WHERE id_insumo LIKE _word
ORDER BY id_insumo;
END$$

-- SELECT PEDIDO
DELIMITER $$
DROP PROCEDURE IF EXISTS selectPedido;
CREATE PROCEDURE selectPedido( IN _id_sucursal VARCHAR(3))
BEGIN
	SELECT id_pedido, nombre, fecha, a.cantidad, precio FROM Pedidos a
INNER JOIN Insumos b ON a.id_insumo = b.id_insumo
WHERE id_sucursal = _id_sucursal
ORDER BY id_pedido ;
END$$


-- SELECT PRODUCTOS
DELIMITER $$
DROP PROCEDURE IF EXISTS selectProducto;
CREATE PROCEDURE selectProducto()
BEGIN
	SELECT * FROM Productos; 
END$$

-- SELECT RESERVACIONES
DELIMITER $$
DROP PROCEDURE IF EXISTS selectReservaciones;
CREATE PROCEDURE selectReservaciones( IN _word VARCHAR(2))
BEGIN
	SELECT id_reservacion, hora, fecha, b.nombre FROM Reservaciones a
INNER JOIN Clientes b ON a.id_cliente = b.id_cliente
WHERE id_reservacion LIKE _word
ORDER BY id_reservacion;
END$$

-- SELECT RESERVACIONES
DELIMITER $$
DROP PROCEDURE IF EXISTS selectFacturas;
CREATE PROCEDURE selectFacturas( IN _word VARCHAR(2))
BEGIN
SELECT id_factura, nombre, total_pagar, efectivo, cambio, fecha, modo FROM Facturas a
INNER JOIN Clientes b ON a.id_cliente = b.id_cliente
INNER JOIN Formas_Pago c ON a.id_forma_pago = c.id_forma_pago 
WHERE id_factura LIKE _word
ORDER BY id_factura;
END$$

-- ACTUALIZAR EMPLEADO
DELIMITER $$
DROP PROCEDURE IF EXISTS actualizarEmpleado;
CREATE PROCEDURE actualizarEmpleado(
	IN _id_empleado VARCHAR(3),
	IN _nombre VARCHAR(50),
	IN _p_apellido VARCHAR(50),
	IN _s_apellido VARCHAR(50),
	IN _num_contacto VARCHAR(9),
	IN _fech_nac DATE,
	IN _direccion VARCHAR(100),
	IN _id_jefe VARCHAR(3),
	IN _id_cargo VARCHAR(3))
BEGIN
	UPDATE Empleados SET nombre = _nombre, p_apellido = _p_apellido, s_apellido = _s_apellido, num_contacto = _num_contacto, fech_nac = _fech_nac, direccion = _direccion, id_jefe = _id_jefe, id_cargo = _id_cargo WHERE id_empleado = _id_empleado;
END$$

-- ACTUALIZAR CLIENTE
DELIMITER $$
DROP PROCEDURE IF EXISTS actualizarCliente;
CREATE PROCEDURE actualizarCliente(
	IN _id_cliente VARCHAR(3),
	IN _nombre VARCHAR(50),
	IN _p_apellido VARCHAR(50),
	IN _s_apellido VARCHAR(50),
	IN _num_contacto VARCHAR(9))

BEGIN
	UPDATE Clientes SET nombre = _nombre, p_apellido = _p_apellido, s_apellido = _s_apellido, num_contacto = _num_contacto WHERE id_cliente = _id_cliente;
END$$

-- ACTUALIZAR INSUMO
DELIMITER $$
DROP PROCEDURE IF EXISTS actualizarInsumo;
CREATE PROCEDURE actualizarInsumo(
	IN _id_insumo VARCHAR(3),
	IN _nombre VARCHAR(50),
	IN _cantidad VARCHAR(50),
	IN _umbral VARCHAR(50),
	IN _cod_proveedor VARCHAR(9))

BEGIN
	UPDATE Insumos SET nombre = _nombre, cantidad = _cantidad, umbral = _umbral, id_proveedor = _cod_proveedor WHERE id_insumo = _id_insumo;
END$$

-- ELIMINAR EMPLEADO
DELIMITER $$
DROP PROCEDURE IF EXISTS eliminarEmpleado;
CREATE PROCEDURE eliminarEmpleado(
	IN _id_empleado VARCHAR(3))

BEGIN
	DELETE FROM Empleados WHERE id_empleado = _id_empleado;
END$$

-- ELIMINAR CLIENTE
DELIMITER $$
DROP PROCEDURE IF EXISTS eliminarCliente;
CREATE PROCEDURE eliminarCliente(
	IN _id_cliente VARCHAR(3))

BEGIN
	DELETE FROM Clientes WHERE id_cliente = _id_cliente;
END$$

-- ELIMINAR INSUMO
DELIMITER $$
DROP PROCEDURE IF EXISTS eliminarInsumo;
CREATE PROCEDURE eliminarInsumo(
	IN _id_insumo VARCHAR(3))

BEGIN
	DELETE FROM Insumos WHERE id_insumo = _id_insumo;
END$$

-- FILTRAR EMPLEADO
DELIMITER $$
DROP PROCEDURE IF EXISTS filtrarEmpleado;
CREATE PROCEDURE filtrarEmpleado(
	IN _word VARCHAR(3), 
	IN _local VARCHAR(3))

BEGIN
	SELECT a.id_empleado, a.p_apellido, a.s_apellido, a.nombre, a.fech_nac, a.num_contacto, a.direccion, b.nombre as 'jefe' FROM Empleados a
	INNER JOIN Empleados b ON a.id_jefe = b.id_empleado
	WHERE a.nombre LIKE _word AND _local = a.id_sucursal
	ORDER BY a.id_empleado;
END$$

-- FILTRAR CLIENTE
DELIMITER $$
DROP PROCEDURE IF EXISTS filtrarCliente;
CREATE PROCEDURE filtrarCliente(
	IN _word VARCHAR(3),
	IN _local VARCHAR(2))

BEGIN
	SELECT * FROM Clientes WHERE nombre LIKE _word AND id_cliente LIKE _local;
END$$

-- FILTRAR INSUMOS
DELIMITER $$
DROP PROCEDURE IF EXISTS filtrarInsumo;
CREATE PROCEDURE filtrarInsumo(
	IN _word VARCHAR(3),
	IN _local VARCHAR(2))

BEGIN
	SELECT id_insumo, nombre, cantidad, umbral, proveedor FROM Insumos a
	INNER JOIN Proveedores b ON a.id_proveedor = b.id_proveedor
	WHERE nombre LIKE _word AND id_insumo LIKE _local
	ORDER BY id_insumo;
END$$


-- FILTRAR PRODUCTO1
DELIMITER $$
DROP PROCEDURE IF EXISTS filtrarProducto;
CREATE PROCEDURE filtrarProducto(
	IN _word VARCHAR(3))

BEGIN
	SELECT * FROM Productos
	WHERE nombre LIKE _word
	ORDER BY nombre;
END$$

-- FILTRAR PRODUCTO2
DELIMITER $$
DROP PROCEDURE IF EXISTS filtrarProducto1;
CREATE PROCEDURE filtrarProducto1(
	IN _id_producto VARCHAR(3))

BEGIN
	SELECT * FROM Productos
	WHERE id_producto = _id_producto;
END$$


