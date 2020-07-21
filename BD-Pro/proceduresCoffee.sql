-- CARGOS
DROP PROCEDURE IF EXISTS insertarCargo;
DELIMITER $$
CREATE PROCEDURE insertarCargo(
	IN _id_cargo VARCHAR(3),
	IN _cargo VARCHAR(50))
BEGIN
	START TRANSACTION;
	INSERT INTO Cargos(id_cargo, cargo) 
	VALUES(_id_cargo, _cargo);
	COMMIT;
END$$

-- PERSONA
DROP PROCEDURE IF EXISTS insertarPersona;
DELIMITER $$
CREATE PROCEDURE insertarPersona(
	IN _id_persona VARCHAR(3),
	IN _nombre VARCHAR(50),
	IN _p_apellido VARCHAR(50),
	IN _s_apellido VARCHAR(50),
	IN _num_contacto VARCHAR(9),
	IN _fech_nac DATE,
	IN _direccion VARCHAR(100))
BEGIN
	START TRANSACTION;
	INSERT INTO Personas(id_persona, nombre, p_apellido, s_apellido, num_contacto, fech_nac, direccion) 
	VALUES(_id_persona, _nombre, _p_apellido, _s_apellido, _num_contacto, _fech_nac, _direccion);
	COMMIT;
END$$

-- SUCURSALES
DROP PROCEDURE IF EXISTS insertarSucursal;
DELIMITER $$
CREATE PROCEDURE insertarSucursal(
	IN _id_sucursal VARCHAR(3),
	IN _nombre VARCHAR(50),
	IN _ubicacion VARCHAR(100),
	IN _telefono VARCHAR(9))
BEGIN
	START TRANSACTION;
	INSERT INTO Sucursales(id_sucursal, nombre, ubicacion, telefono) 
	VALUES(_id_sucursal, _nombre, _ubicacion, _telefono);
	COMMIT;
END$$

-- MESAS
DROP PROCEDURE IF EXISTS insertarMesa;
DELIMITER $$
CREATE PROCEDURE insertarMesa(
	IN _id_mesa VARCHAR(3),
	IN _capacidad TINYINT UNSIGNED,
	IN _id_sucursal VARCHAR(3))
BEGIN
	START TRANSACTION;
	INSERT INTO Mesas(id_mesa, capacidad, id_sucursal) 
	VALUES(_id_mesa, _capacidad, _id_sucursal);
	COMMIT;
END$$

-- EMPLEADOS
DROP PROCEDURE IF EXISTS insertarEmpleado;
DELIMITER $$
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
	START TRANSACTION;
	INSERT INTO Empleados(id_empleado, nombre, p_apellido, s_apellido, num_contacto, fech_nac, direccion, id_jefe, id_cargo, id_sucursal) 
	VALUES(_id_empleado, _nombre, _p_apellido, _s_apellido, _num_contacto, _fech_nac, _direccion, _id_jefe, _id_cargo, _id_sucursal);
	COMMIT;
END$$

-- PROVEEDOR
DROP PROCEDURE IF EXISTS insertarProveedor;
DELIMITER $$
CREATE PROCEDURE insertarProveedor(
	IN _id_proveedor VARCHAR(3),
	IN _nombre_contacto VARCHAR(50),
	IN _proveedor VARCHAR(50),
	IN _correo VARCHAR(50),
	IN _telefono VARCHAR(9))

BEGIN
	START TRANSACTION;
	INSERT INTO Proveedores(id_proveedor, nombre_contacto, proveedor, correo, telefono) 
	VALUES(_id_proveedor, _nombre_contacto, _proveedor, _correo, _telefono);
	COMMIT;
END$$

-- INSERT INSUMOS
DROP PROCEDURE IF EXISTS insertarInsumo;
DELIMITER $$
CREATE PROCEDURE insertarInsumo(
	IN _id_insumo VARCHAR(3),
	IN _nombre VARCHAR(50),
	IN _cantidad SMALLINT UNSIGNED,
	IN _umbral TINYINT,
	IN _id_proveedor VARCHAR(3))

BEGIN
	START TRANSACTION;
	INSERT INTO Insumos(id_insumo, nombre, cantidad, umbral, id_proveedor) 
	VALUES(_id_insumo, _nombre, _cantidad, _umbral, _id_proveedor);
	COMMIT;
END$$

-- INSERT CLIENTE
DROP PROCEDURE IF EXISTS insertarCliente;
DELIMITER $$
CREATE PROCEDURE insertarCliente(
	IN _id_cliente VARCHAR(3),
	IN _nombre VARCHAR(50),
	IN _p_apellido VARCHAR(50),
	IN _s_apellido VARCHAR(50),
	IN _num_contacto VARCHAR(9))

BEGIN
	START TRANSACTION;
	INSERT INTO Clientes(id_cliente, nombre, p_apellido, s_apellido, num_contacto) 
	VALUES(_id_cliente, _nombre, _p_apellido, _s_apellido, _num_contacto);
	COMMIT;
END$$

-- BUSCAR EMPLEADO
DROP PROCEDURE IF EXISTS buscarEmpleado;
DELIMITER $$
CREATE PROCEDURE buscarEmpleado(
	IN _id_empleado VARCHAR(3))
BEGIN
	SELECT * FROM Empleados WHERE id_empleado = _id_empleado; 
END$$

-- BUSCAR INSUMO
DROP PROCEDURE IF EXISTS buscarInsumo;
DELIMITER $$
CREATE PROCEDURE buscarInsumo(
	IN _id_insumo VARCHAR(3))
BEGIN
	SELECT * FROM Insumos WHERE id_insumo = _id_insumo; 
END$$

-- BUSCAR CLIENTE
DROP PROCEDURE IF EXISTS buscarCliente;
DELIMITER $$
CREATE PROCEDURE buscarCliente(
	IN _id_cliente VARCHAR(3))
BEGIN
	SELECT * FROM Clientes WHERE id_cliente = _id_cliente; 
END$$

-- SELECT EMPLEADO
DROP PROCEDURE IF EXISTS selectEmpleado;
DELIMITER $$
CREATE PROCEDURE selectEmpleado()
BEGIN
	SELECT a.id_empleado, a.p_apellido, a.s_apellido, a.nombre, a.fech_nac, a.num_contacto, a.direccion, b.nombre as 'jefe' FROM Empleados a
INNER JOIN Empleados b ON a.id_jefe = b.id_empleado
ORDER BY a.id_empleado; 
END$$

-- SELECT CLIENTE
DROP PROCEDURE IF EXISTS selectCliente;
DELIMITER $$
CREATE PROCEDURE selectCliente()
BEGIN
	SELECT * FROM Clientes;
END$$

-- SELECT INSUMOS
DROP PROCEDURE IF EXISTS selectInsumo;
DELIMITER $$
CREATE PROCEDURE selectInsumo()
BEGIN
	SELECT id_insumo, nombre, cantidad, umbral, proveedor FROM Insumos a
INNER JOIN Proveedores b ON a.id_proveedor = b.id_proveedor; 
END$$

-- ACTUALIZAR EMPLEADO
DROP PROCEDURE IF EXISTS actualizarEmpleado;
DELIMITER $$
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
	START TRANSACTION;
	UPDATE Empleados SET nombre = _nombre, p_apellido = _p_apellido, s_apellido = _s_apellido, num_contacto = _num_contacto, fech_nac = _fech_nac, direccion = _direccion, id_jefe = _id_jefe, id_cargo = _id_cargo WHERE id_empleado = _id_empleado;
	COMMIT;
END$$

-- ACTUALIZAR CLIENTE
DROP PROCEDURE IF EXISTS actualizarCliente;
DELIMITER $$
CREATE PROCEDURE actualizarCliente(
	IN _id_cliente VARCHAR(3),
	IN _nombre VARCHAR(50),
	IN _p_apellido VARCHAR(50),
	IN _s_apellido VARCHAR(50),
	IN _num_contacto VARCHAR(9))

BEGIN
	START TRANSACTION;
	UPDATE Clientes SET nombre = _nombre, p_apellido = _p_apellido, s_apellido = _s_apellido, num_contacto = _num_contacto WHERE id_cliente = _id_cliente;
	COMMIT;
END$$

-- ACTUALIZAR INSUMO
DROP PROCEDURE IF EXISTS actualizarInsumo;
DELIMITER $$
CREATE PROCEDURE actualizarInsumo(
	IN _id_insumo VARCHAR(3),
	IN _nombre VARCHAR(50),
	IN _cantidad VARCHAR(50),
	IN _umbral VARCHAR(50),
	IN _cod_proveedor VARCHAR(9))

BEGIN
	START TRANSACTION;
	UPDATE Insumos SET nombre = _nombre, cantidad = _cantidad, umbral = _umbral, id_proveedor = _cod_proveedor WHERE id_insumo = _id_insumo;
	COMMIT;
END$$

-- ELIMINAR EMPLEADO
DROP PROCEDURE IF EXISTS eliminarEmpleado;
DELIMITER $$
CREATE PROCEDURE eliminarEmpleado(
	IN _id_empleado VARCHAR(3))

BEGIN
	START TRANSACTION;
	DELETE FROM Empleados WHERE id_empleado = _id_empleado;
	COMMIT;
END$$

-- ELIMINAR CLIENTE
DROP PROCEDURE IF EXISTS eliminarCliente;
DELIMITER $$
CREATE PROCEDURE eliminarCliente(
	IN _id_cliente VARCHAR(3))

BEGIN
	START TRANSACTION;
	DELETE FROM Clientes WHERE id_cliente = _id_cliente;
	COMMIT;
END$$

-- ELIMINAR INSUMO
DROP PROCEDURE IF EXISTS eliminarInsumo;
DELIMITER $$
CREATE PROCEDURE eliminarInsumo(
	IN _id_insumo VARCHAR(3))

BEGIN
	START TRANSACTION;
	DELETE FROM Insumos WHERE id_insumo = _id_insumo;
	COMMIT;
END$$

-- FILTRAR EMPLEADO
DROP PROCEDURE IF EXISTS filtrarEmpleado;
DELIMITER $$
CREATE PROCEDURE filtrarEmpleado(
	IN _word VARCHAR(3))

BEGIN
	START TRANSACTION;
	SELECT a.id_empleado, a.p_apellido, a.s_apellido, a.nombre, a.fech_nac, a.num_contacto, a.direccion, b.nombre as 'jefe' FROM Empleados a
	INNER JOIN Empleados b ON a.id_jefe = b.id_empleado
	WHERE a.nombre LIKE _word
	ORDER BY a.id_empleado;
	COMMIT;
END$$

-- FILTRAR CLIENTE
DROP PROCEDURE IF EXISTS filtrarCliente;
DELIMITER $$
CREATE PROCEDURE filtrarCliente(
	IN _word VARCHAR(3))

BEGIN
	START TRANSACTION;
	SELECT * FROM Clientes WHERE nombre LIKE _word;
	COMMIT;
END$$





