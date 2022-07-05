-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema AvicolaDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema AvicolaDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `AvicolaDB` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
USE `AvicolaDB` ;

-- -----------------------------------------------------
-- Table `AvicolaDB`.`Avicultores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AvicolaDB`.`Avicultores` (
  `Cedula` VARCHAR(45) NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Apellido` VARCHAR(45) NULL,
  `Password` VARCHAR(45) NULL,
  PRIMARY KEY (`Cedula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AvicolaDB`.`Fincas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AvicolaDB`.`Fincas` (
  `idFincas` INT NOT NULL AUTO_INCREMENT,
  `Cedula` VARCHAR(45) NULL,
  `Nombre` VARCHAR(45) NULL,
  `Direccion` VARCHAR(45) NULL,
  PRIMARY KEY (`idFincas`),
  INDEX `Cedula_idx` (`Cedula` ASC) VISIBLE,
  CONSTRAINT `Cedula`
    FOREIGN KEY (`Cedula`)
    REFERENCES `AvicolaDB`.`Avicultores` (`Cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AvicolaDB`.`Medicamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AvicolaDB`.`Medicamentos` (
  `IdMedicamento` INT NOT NULL AUTO_INCREMENT,
  `NombreMedicamento` VARCHAR(45) NULL,
  `CantidadDisponible` VARCHAR(45) NULL,
  PRIMARY KEY (`IdMedicamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AvicolaDB`.`Galpones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AvicolaDB`.`Galpones` (
  `IdGalpon` INT NOT NULL AUTO_INCREMENT,
  `IdFinca` INT NOT NULL,
  `NumeroGalpon` VARCHAR(45) NOT NULL,
  `Proposito` VARCHAR(45) NOT NULL,
  `Detalle` VARCHAR(45) NULL,
  PRIMARY KEY (`IdGalpon`),
  INDEX `idFincas_idx` (`IdFinca` ASC) VISIBLE,
  CONSTRAINT `idFincas_idfk`
    FOREIGN KEY (`IdFinca`)
    REFERENCES `AvicolaDB`.`Fincas` (`idFincas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AvicolaDB`.`Gallinas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AvicolaDB`.`Gallinas` (
  `IdGallina` INT NOT NULL AUTO_INCREMENT,
  `Codigo` INT NOT NULL,
  `IdGalpon` INT NOT NULL,
  `Raza` VARCHAR(45) NULL,
  `FechaNacimiento` VARCHAR(45) NULL,
  `Estatus` VARCHAR(45) NULL,
  PRIMARY KEY (`IdGallina`, `Codigo`),
  INDEX `IdGalpon_idx` (`IdGalpon` ASC) VISIBLE,
  CONSTRAINT `IdGalpon`
    FOREIGN KEY (`IdGalpon`)
    REFERENCES `AvicolaDB`.`Galpones` (`IdGalpon`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AvicolaDB`.`Gallina_Medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AvicolaDB`.`Gallina_Medicamento` (
  `IdGallina` INT NOT NULL,
  `IdMedicamento` INT NOT NULL AUTO_INCREMENT,
  `FechaAdministracion` VARCHAR(45) NULL,
  INDEX `IdGallina_idx` (`IdGallina` ASC) VISIBLE,
  INDEX `IdMedicamento_idx` (`IdMedicamento` ASC) VISIBLE,
  CONSTRAINT `IdGallina`
    FOREIGN KEY (`IdGallina`)
    REFERENCES `AvicolaDB`.`Gallinas` (`IdGallina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `IdMedicamento`
    FOREIGN KEY (`IdMedicamento`)
    REFERENCES `AvicolaDB`.`Medicamentos` (`IdMedicamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AvicolaDB`.`Ponederos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AvicolaDB`.`Ponederos` (
  `IdPonedero` INT NOT NULL AUTO_INCREMENT,
  `IdGalpon` INT NULL,
  `Fecha` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdPonedero`),
  INDEX `IdGalpon_idx` (`IdGalpon` ASC) VISIBLE,
  CONSTRAINT `IdGalpon_idfk`
    FOREIGN KEY (`IdGalpon`)
    REFERENCES `AvicolaDB`.`Galpones` (`IdGalpon`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AvicolaDB`.`ActividadPonedero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AvicolaDB`.`ActividadPonedero` (
  `FechaActividad` DATETIME NOT NULL,
  `IdGallina` INT NOT NULL,
  `IdGallinaCodigo` INT NOT NULL,
  `IdPonedero` INT NOT NULL,
  `HoraEntrada` TIME NOT NULL,
  `HoraSalida` TIME NOT NULL,
  PRIMARY KEY (`FechaActividad`),
  INDEX `IdGallina_idfk_idx` (`IdGallina` ASC) VISIBLE,
  INDEX `IdPonedero_idfk_idx` (`IdPonedero` ASC) VISIBLE,
  CONSTRAINT `IdGallina_idfk`
    FOREIGN KEY (`IdGallina`)
    REFERENCES `AvicolaDB`.`Gallinas` (`IdGallina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `IdPonedero_idfk`
    FOREIGN KEY (`IdPonedero`)
    REFERENCES `AvicolaDB`.`Ponederos` (`IdPonedero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AvicolaDB`.`Alimento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AvicolaDB`.`Alimento` (
  `IdAlimento` INT NOT NULL AUTO_INCREMENT,
  `NombreAlimento` VARCHAR(45) NOT NULL,
  `CantidadDisponible` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdAlimento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AvicolaDB`.`GalponAlimento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AvicolaDB`.`GalponAlimento` (
  `IdGalpon` INT NOT NULL AUTO_INCREMENT,
  `IdAlimento` INT NOT NULL,
  `Fecha` VARCHAR(45) NOT NULL,
  `Proposito` VARCHAR(45) NOT NULL,
  `CantidadSuministrada` VARCHAR(45) NULL,
  INDEX `IdAlimento_idx` (`IdAlimento` ASC) VISIBLE,
  INDEX `IdGalpon_idx` (`IdGalpon` ASC) VISIBLE,
  CONSTRAINT `IdAlimento_idfk`
    FOREIGN KEY (`IdAlimento`)
    REFERENCES `AvicolaDB`.`Alimento` (`IdAlimento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `IdGalponAlimento_idfk`
    FOREIGN KEY (`IdGalpon`)
    REFERENCES `AvicolaDB`.`Galpones` (`IdGalpon`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AvicolaDB`.`Huevos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AvicolaDB`.`Huevos` (
  `IdHuevo` INT NOT NULL AUTO_INCREMENT,
  `IdGallina` INT NOT NULL,
  `Peso` VARCHAR(45) NOT NULL,
  `Color` VARCHAR(45) NULL,
  PRIMARY KEY (`IdHuevo`),
  INDEX `IdGallina_idx` (`IdGallina` ASC) VISIBLE,
  CONSTRAINT `IdGallina_idfky`
    FOREIGN KEY (`IdGallina`)
    REFERENCES `AvicolaDB`.`ActividadPonedero` (`IdGallina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AvicolaDB`.`Productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AvicolaDB`.`Productos` (
  `IdProductos` INT NOT NULL AUTO_INCREMENT,
  `NombreProducto` VARCHAR(45) NULL,
  `Imagen` VARCHAR(45) NULL,
  `Precio` VARCHAR(45) NULL,
  `Descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`IdProductos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AvicolaDB`.`Posturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AvicolaDB`.`Posturas` (
  `Fecha` DATE NOT NULL,
  `IdProducto` INT NOT NULL,
  `IdGalpon` INT NULL,
  `Cantidad` INT NOT NULL,
  INDEX `IdGalpon_idx` (`IdGalpon` ASC) VISIBLE,
  INDEX `IdProducto_idx` (`IdProducto` ASC) VISIBLE,
  PRIMARY KEY (`Fecha`),
  CONSTRAINT `IdGalponPosturas_idfk`
    FOREIGN KEY (`IdGalpon`)
    REFERENCES `AvicolaDB`.`Galpones` (`IdGalpon`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `IdProducto_idfk`
    FOREIGN KEY (`IdProducto`)
    REFERENCES `AvicolaDB`.`Productos` (`IdProductos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AvicolaDB`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AvicolaDB`.`Clientes` (
  `IdClientes` INT NOT NULL AUTO_INCREMENT,
  `NombreCliente` VARCHAR(45) NULL,
  `Direccion` VARCHAR(45) NULL,
  `Telefono` VARCHAR(45) NULL,
  PRIMARY KEY (`IdClientes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AvicolaDB`.`Ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AvicolaDB`.`Ventas` (
  `IdCliente` INT NOT NULL AUTO_INCREMENT,
  `IdProducto` INT NULL,
  `FechaVenta` VARCHAR(45) NULL,
  `Cantidad` VARCHAR(45) NULL,
  INDEX `IdCliente_idx` (`IdCliente` ASC) VISIBLE,
  INDEX `IdProducto_idx` (`IdProducto` ASC) VISIBLE,
  CONSTRAINT `IdCliente_idfkd`
    FOREIGN KEY (`IdCliente`)
    REFERENCES `AvicolaDB`.`Clientes` (`IdClientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `IdProducto_idfdk`
    FOREIGN KEY (`IdProducto`)
    REFERENCES `AvicolaDB`.`Productos` (`IdProductos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
