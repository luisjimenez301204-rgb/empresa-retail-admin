
-- PRUEBAS DE PERMISOS
-- ============================================
-- Prueba 1: ana conecta corectamente con cliente
USE `empresa-retail-db`;
SELECT USER(), CURRENT_USER();
SELECT * FROM cliente;

-- ---- Prueba 2: ana_crm NO debe poder borrar canales ----
DELETE FROM canal WHERE can_id_canal = 1;
-- Debe dar error de permisos

-- ---- Prueba 3: pedro_mkt puede insertar campañas ----
-- Conectar con pedro_mkt / Retail2026!
INSERT INTO campania (cam_nombre, cam_presupuesto, cam_fecha_inicio, 
                      cam_fecha_final, canal_can_id_canal)
VALUES ('Campaña Verano', 5000000, '2026-06-01', '2026-08-31', 1);
-- Debe funcionar

-- ---- Prueba 4: pedro_mkt NO puede modificar clientes ----
UPDATE cliente SET cli_ciudad = 'Medellín' WHERE cli_id_cliente = 1;
-- Debe dar error de permisos

-- ---- Prueba 5: marta_auditoria solo puede leer conversiones ----
-- Conectar con marta_auditoria / Retail2026!
SELECT * FROM conversion;
-- Debe funcionar

INSERT INTO conversion (con_tipo, con_valor, con_fecha, cliente_cli_id_cliente)
VALUES ('Compra', 150000, CURDATE(), 1);
--  Debe dar error (no tiene INSERT)

CALL sp_select_conversion();
--  Debe funcionar (procedimiento autorizado)

-- PRUEBAS DE ACCESO DENEGADO 

-- PEDRO PRUEBA 1
UPDATE cliente SET cli_nombre = cli_nombre WHERE 1 = 0;
-- DA ERROR porque no tiene permisos de lectura