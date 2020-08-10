USE Coffee;

-- CARGOS
CALL insertarCargo('GER','Gerente');
CALL insertarCargo('EMP','Empleado');
CALL insertarCargo('ADM','Administrativo');

-- SUCURSALES
CALL insertarSucursal('MIR','Miraflores','Av. Progreso #256','996513256');
CALL insertarSucursal('CER','Cercado','Calle San Francisto #320','998877665');
CALL insertarSucursal('JLB','Jose Luis Bustamante y Rivero','Av. La Cultura #1245','996655443');
CALL insertarSucursal('PAU','Paucarpata','Av. Jesus #2306','995544332');

-- GERENTE
INSERT INTO Empleados(id_empleado, nombre, p_apellido, s_apellido, num_contacto, fech_nac, direccion, id_cargo, id_sucursal) 
VALUES('B00','Brian','Pinto','Medina','993393953','1996-03-23','Av. Jesus #2008','GER','JLB');
INSERT INTO Empleados(id_empleado, nombre, p_apellido, s_apellido, num_contacto, fech_nac, direccion, id_cargo, id_sucursal) 
VALUES('C00','Daniel','Gallegos','Solis','987654321','1995-05-01','Urb. El Lago J-8','GER','CER');
INSERT INTO Empleados(id_empleado, nombre, p_apellido, s_apellido, num_contacto, fech_nac, direccion, id_cargo, id_sucursal) 
VALUES('M00','Shiomara','Benites','Farfan','987412536','1995-06-09','Urb. Independencia F-6','GER','MIR');
INSERT INTO Empleados(id_empleado, nombre, p_apellido, s_apellido, num_contacto, fech_nac, direccion, id_cargo, id_sucursal) 
VALUES('P00','Gabriel','Gonza','Condori','987987987','1999-07-15','Av. Puno #321','GER','PAU');

-- FORMA PAGO
INSERT INTO Formas_Pago(id_forma_pago, modo) VALUES('EFE','Efectivo');
INSERT INTO Formas_Pago(id_forma_pago, modo) VALUES('TAR','Tarjeta');

-- PROVEEDOR
CALL insertarProveedor('P00','Bruno','Coffee S.A.C.','coffeesac@gmail.com','999999999');
CALL insertarProveedor('P01','Hugo','Plasticos S.A.C.','plasticossac@gmail.com','999999998');
CALL insertarProveedor('P02','Luisa','Leche S.A.C.','lechesac@gmail.com','999999997');
CALL insertarProveedor('P03','Silvia','Harina S.A.C.','harinasac@gmail.com','999999996');
CALL insertarProveedor('P04','Milagros','Frutas S.A.C.','frutassac@gmail.com','999999995');
CALL insertarProveedor('P05','Maria','Chocolates S.A.C.','chocolatessac@gmail.com','999999994');












