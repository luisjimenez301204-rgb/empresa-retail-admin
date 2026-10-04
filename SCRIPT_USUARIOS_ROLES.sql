-- PROYECTO FINAL: empresa-retail
-- Configuración de usuarios, roles y permisos

-- Empezamos utilizando la base de datos de la empresa retail 
USE `empresa-retail-db`;

-- creamos el usuario ana_crm
CREATE USER IF NOT EXISTS 'ana_cmr'@'localhost' IDENTIFIED BY 'Retail2026!Caja';
-- creamos el usuario pedro_mkt
CREATE USER IF NOT EXISTS 'pedro_mkt'@'localhost' IDENTIFIED BY 'Retail2026!Stock';
-- creamos el usuario marta_auditoria
CREATE USER IF NOT EXISTS 'marta_auditoria'@'localhost' IDENTIFIED BY 'Retail2026!Admin';


-- 2. Refrescamos los privilegios para asegurar que tome los cambios
FLUSH PRIVILEGES;
-- CREACIÓN DE ROLES
-- Rol 1: Gestor de Clientes e Interacciones (Lectura y Escritura)
CREATE ROLE IF NOT EXISTS 'rol_gestor_clientes';
-- Rol 2: Gestor de Canales y Campañas (Lectura y Escritura), solo puede ver los clientes y no editarlos
CREATE ROLE IF NOT EXISTS 'rol_gestor_canales';
-- Rol 3: Auditor - Solo lectura en Conversiones y ejecución de procedimientos de consulta
CREATE ROLE IF NOT EXISTS 'rol_auditor';


