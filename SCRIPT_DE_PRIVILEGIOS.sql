-- ASIGNACIÓN DE PRIVILEGIOS A LOS ROLES
-- DESCRIPCION: La asignacion de los roles se hace a traves de otra conexion que se 
-- nombro como ACTIVIDAD_FINAL para que en la conexion example_user no genere error

USE `empresa-retail-db`;
-- ROL Gestor de Clientes (ana_crm) 
-- Lectura y escritura en cliente, conversion e interaccion en el rol_gestor_clientes
-- CLIENTE
GRANT SELECT, INSERT, UPDATE, DELETE ON `empresa-retail-db`.cliente TO 'rol_gestor_clientes';
-- INTERACCION
GRANT SELECT, INSERT, UPDATE, DELETE ON `empresa-retail-db`.interaccion TO 'rol_gestor_clientes';
-- rol_gestor_clientes Solo lee en canal y campaña, no es su área, pero puede consultar
GRANT SELECT ON `empresa-retail-db`.canal TO 'rol_gestor_clientes';
GRANT SELECT ON `empresa-retail-db`.campania TO 'rol_gestor_clientes';

-- ------------------------------------------------------------ --
-- ROL Gestor de Canales y Campañas (pedro_mkt) 
-- Lectura y escritura en canal y campania
-- CANAL
GRANT SELECT, INSERT, UPDATE, DELETE ON `empresa-retail-db`.canal TO 'rol_gestor_canales';
-- CAMPAÑA
GRANT SELECT, INSERT, UPDATE, DELETE ON `empresa-retail-db`.campania TO 'rol_gestor_canales';
-- Solo puede ver clientes, no editarlos
-- VER CLIENTES
GRANT SELECT ON `empresa-retail-db`.cliente TO 'rol_gestor_canales';
-- También puede consultar interacciones para análisis
GRANT SELECT ON `empresa-retail-db`.interaccion TO 'rol_gestor_canales';

-- ------------------------------------------------------------------------
-- ROL Auditor (marta_auditoria) 
-- Solo lectura en conversion (compras, registros, ventas)
GRANT SELECT ON `empresa-retail-db`.conversion TO 'rol_auditor';
-- Solo lectura en el resto de tablas para auditoría
-- LEER CLIENTES
GRANT SELECT ON `empresa-retail-db`.cliente TO 'rol_auditor';
-- LEER CANALES
GRANT SELECT ON `empresa-retail-db`.canal TO 'rol_auditor';
-- LEER CAMPAÑAS
GRANT SELECT ON `empresa-retail-db`.campania TO 'rol_auditor';
-- LEER INTERACCIONES
GRANT SELECT ON `empresa-retail-db`.interaccion TO 'rol_auditor';

-- Permisos unicamente para EJECUTAR procedimientos almacenados de consulta (SELECT)
-- PARA CANAL
GRANT EXECUTE ON PROCEDURE `empresa-retail-db`.spSelectCanal TO 'rol_auditor';
-- PARA CAMPAÑA
GRANT EXECUTE ON PROCEDURE `empresa-retail-db`.sp_select_campania TO 'rol_auditor';
-- PARA CLIENTE
GRANT EXECUTE ON PROCEDURE `empresa-retail-db`.sp_select_cliente TO 'rol_auditor';
-- PARA CONVERSION
GRANT EXECUTE ON PROCEDURE `empresa-retail-db`.sp_select_conversion TO 'rol_auditor';
-- PARA INTERACCION
GRANT EXECUTE ON PROCEDURE `empresa-retail-db`.sp_select_interaccion TO 'rol_auditor';
-- Un auditor puede  contar cuántos canales hay para su reporte.
GRANT EXECUTE ON PROCEDURE `empresa-retail-db`.sp_count_canal TO 'rol_auditor';

-- ASIGNACION DE ROLES A USUARIOS 
GRANT 'rol_gestor_clientes' TO 'ana_cmr'@'localhost';
GRANT 'rol_gestor_canales' TO 'pedro_mkt'@'localhost';
GRANT 'rol_auditor' TO 'marta_auditoria'@'localhost';

-- Activar los roles por defecto al iniciar sesión
SET DEFAULT ROLE 'rol_gestor_clientes' TO 'ana_cmr'@'localhost';
SET DEFAULT ROLE 'rol_gestor_canales' TO 'pedro_mkt'@'localhost';
SET DEFAULT ROLE 'rol_auditor' TO 'marta_auditoria'@'localhost';

FLUSH PRIVILEGES;








