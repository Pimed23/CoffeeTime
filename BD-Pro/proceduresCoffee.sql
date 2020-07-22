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
CREATE PROCEDURE selectEmpleado()
BEGIN
	SELECT a.id_empleado, a.p_apellido, a.s_apellido, a.nombre, a.fech_nac, a.num_contacto, a.direccion, b.nombre as 'jefe' FROM Empleados a
INNER JOIN Empleados b ON a.id_jefe = b.id_empleado
ORDER BY a.id_empleado; 
END$$

-- SELECT CLIENTE
DELIMITER $$
DROP PROCEDURE IF EXISTS selectCliente;
CREATE PROCEDURE selectCliente()
BEGIN
	SELECT * FROM Clientes;
END$$

-- SELECT INSUMOS
DELIMITER $$
DROP PROCEDURE IF EXISTS selectInsumo;
CREATE PROCEDURE selectInsumo()
BEGIN
	SELECT id_insumo, nombre, cantidad, umbral, proveedor FROM Insumos a
INNER JOIN Proveedores b ON a.id_proveedor = b.id_proveedor; 
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
	IN _word VARCHAR(3))

BEGIN
	SELECT a.id_empleado, a.p_apellido, a.s_apellido, a.nombre, a.fech_nac, a.num_contacto, a.direccion, b.nombre as 'jefe' FROM Empleados a
	INNER JOIN Empleados b ON a.id_jefe = b.id_empleado
	WHERE a.nombre LIKE _word
	ORDER BY a.id_empleado;
END$$

-- FILTRAR CLIENTE
DELIMITER $$
DROP PROCEDURE IF EXISTS filtrarCliente;
CREATE PROCEDURE filtrarCliente(
	IN _word VARCHAR(3))

BEGIN
	SELECT * FROM Clientes WHERE nombre LIKE _word;
END$$





