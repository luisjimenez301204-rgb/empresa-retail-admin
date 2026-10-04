-- -----------------------------------------------------
-- Table `empresa-retail-db`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresa-retail-db`.`cliente` (
  `cli_id_cliente` INT NOT NULL AUTO_INCREMENT,
  `cli_nombre` VARCHAR(100) NOT NULL,
  `cli_apellido` VARCHAR(100) NOT NULL,
  `cli_correo` VARCHAR(100) NOT NULL,
  `cli_telefono` VARCHAR(25) NOT NULL,
  `cli_ciudad` VARCHAR(45) NOT NULL,
  `cli_fecha_registro` DATE NOT NULL,
  PRIMARY KEY (`cli_id_cliente`),
  UNIQUE INDEX `cli_correo_UNIQUE` (`cli_correo` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 31
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `empresa-retail-db`.`conversion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresa-retail-db`.`conversion` (
  `con_id_conversion` INT NOT NULL AUTO_INCREMENT,
  `con_tipo` ENUM('Compra', 'Suscripcion', 'Descarga', 'venta', 'Registro') NULL DEFAULT NULL,
  `con_valor` DECIMAL(10,2) NULL DEFAULT NULL,
  `con_fecha` DATE NOT NULL,
  `cliente_cli_id_cliente` INT NOT NULL,
  PRIMARY KEY (`con_id_conversion`, `cliente_cli_id_cliente`),
  INDEX `fk_conversacion_cliente1_idx` (`cliente_cli_id_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_conversacion_cliente1`
    FOREIGN KEY (`cliente_cli_id_cliente`)
    REFERENCES `empresa-retail-db`.`cliente` (`cli_id_cliente`))
ENGINE = InnoDB
AUTO_INCREMENT = 89
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `empresa-retail-db`.`interaccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresa-retail-db`.`interaccion` (
  `int_id_interaccion` INT NOT NULL AUTO_INCREMENT,
  `int_tipo` VARCHAR(50) NULL DEFAULT NULL,
  `int_fecha` DATE NOT NULL,
  `campania_cam_id_campania` INT NOT NULL,
  `cliente_cli_id_cliente` INT NOT NULL,
  PRIMARY KEY (`int_id_interaccion`, `campania_cam_id_campania`, `cliente_cli_id_cliente`),
  INDEX `fk_interaccion_campania1_idx` (`campania_cam_id_campania` ASC) VISIBLE,
  INDEX `fk_interaccion_cliente1_idx` (`cliente_cli_id_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_interaccion_campania1`
    FOREIGN KEY (`campania_cam_id_campania`)
    REFERENCES `empresa-retail-db`.`campania` (`cam_id_campania`),
  CONSTRAINT `fk_interaccion_cliente1`
    FOREIGN KEY (`cliente_cli_id_cliente`)
    REFERENCES `empresa-retail-db`.`cliente` (`cli_id_cliente`))
ENGINE = InnoDB
AUTO_INCREMENT = 150
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;