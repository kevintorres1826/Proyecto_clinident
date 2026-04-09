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

--conexion tbl historial con tbl cita y tbl tratamiento
SELECT 
    tblhistorialclinico.id_historial_clinico,
    tblhistorialclinico.fecha,
    tblcita.id_cita,
    tblcita.fecha,
    tbltratamiento.id_tratamiento,
    tbltratamiento.diagnostico,
    tbltratamiento.valor
FROM tblhistorialclinico
INNER JOIN tblcita
ON tblhistorialclinico.id_cita = tblcita.id_cita
INNER JOIN tbltratamiento
ON tblhistorialclinico.id_tratamiento = tbltratamiento.id_tratamiento;

--conexion citas con odontologo
SELECT 
    tblcita.id_cita,
    tblcita.fecha,
    tblusuario.nombre,
    tblusuario.apellido
FROM tblcita
INNER JOIN tblusuario
ON tblcita.id_odontologo = tblusuario.id_usuario;

--conexion tbl pago con tbl metodo de pago
SELECT 
    tblpago.id_pago,
    tblmetodopago.descripcion,
    tblpago.pagado
FROM tblpago
INNER JOIN tblmetodopago
ON tblpago.id_metodo = tblmetodopago.id_metodo;