USE Coffee;
-- CARGOS
CALL insertarCargo('GER','Gerente');
CALL insertarCargo('EMP','Empleado');
CALL insertarCargo('ADM','Administrativo');

-- SUCURSALES
CALL insertarSucursal('MIR','Miraflores','Av. Progreso #256','996513256');
CALL insertarSucursal('CER','Cercado','Calle San Francisto #320','998877665');
CALL insertarSucursal('JLB','Jose Luis Bustamante y Rivero','Av. La Cultura #1245','996655443');
CALL insertarSucursal('CAY','Cayma','Av. Cayma #236','995544332');

-- GERENTE
INSERT INTO Empleados(id_empleado, nombre, p_apellido, s_apellido, num_contacto, fech_nac, direccion, id_cargo, id_sucursal) 
VALUES('B00','Brian','Pinto','Medina','993393953','1996-03-23','Av. Jesus #2008','GER','JLB');

-- PROVEEDOR
CALL insertarProveedor('P01','Bruno','Coffee S.A.C.','coffeesac@gmail.com','997788662');
CALL insertarProveedor('P02','Julio','Plasticos S.A.C.','plasticossac@gmail.com','997788664');
CALL insertarProveedor('P03','Hugo','Leche S.A.C.','lechesac@gmail.com','997788666');
CALL insertarProveedor('P04','Lucia','Harina S.A.C.','harinasac@gmail.com','997788668');
CALL insertarProveedor('P05','Pedro','Frutas S.A.C.','frutassac@gmail.com','997788660');
CALL insertarProveedor('P06','David','Chocolates S.A.C.','chocolatessac@gmail.com','997788661');

-- PERSONAS
CALL insertarPersona('M00','Brian','Pinto','Medina','993393953','1996-03-23','Av. Jesus #2008');
CALL insertarPersona('M01','Gabriel','Gonza','Condori','987987987','1999-07-15','Av. Puno #321');
CALL insertarPersona('B00','Stephani','Juarez','Rivera','987456987','1985-06-01','Urb. Casa Blanca A-7');
CALL insertarPersona('B01','Adrian','Valdivia','Calle','987456789','1995-08-25','Calle Tarapaca #256');
CALL insertarPersona('C00','Shiomara','Benites','Farfan','987412536','1995-06-09','Urb. Independencia F-6');
CALL insertarPersona('C01','Daniel','Gallegos','Solis','987654321','1995-05-01','Urb. El Lago J-8');
CALL insertarPersona('P00','Gerardo','Cuadros','Cuadros','987652341','1995-11-14','Av. Nueva Union #310');
CALL insertarPersona('P01','Andre','Garcia','Carnero','987564132','1995-04-25','Av. Estados Unidos #845');









