--conexion tbl usuario con tbl rol
SELECT
	tblusuario.nombre,
	tblusuario.apellido,
	tblrol.descripcion
FROM tblusuario 
INNER JOIN tblrol
on tblusuario.id_rol=tblrol.id_rol;

--conexion tbl usuario con tabla rol
SELECT
	tblusuario.nombre,
    tblrol.descripcion
FROM tblusuario 
LEFT JOIN tblrol
ON tblusuario.id_rol=tblrol.id_rol;
 
 --conexion tbl usuario con tbl cita 
SELECT tblusuario.nombre, tblcita.fecha
FROM tblusuario
INNER JOIN tblcita
ON tblusuario.id_usuario = tblcita.id_usuario;
    
SELECT tbltratamiento.diagnostico, tblmetodopago.descripcion
FROM tbltratamiento
INNER JOIN tblmetodopago
ON tbltratamiento.id_tratamiento = tblmetodopago.id_metodo
INNER JOIN tblpago
ON tblmetodopago.id_metodo = tblpago.id_metodo;