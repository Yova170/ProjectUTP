-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema AvicolaSystem
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema AvicolaSystem
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `AvicolaSystem` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
-- -----------------------------------------------------
-- Schema panama
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema panama
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `panama` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `AvicolaSystem` ;

-- -----------------------------------------------------
-- Table `AvicolaSystem`.`Avicultores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AvicolaSystem`.`Avicultores` (
  `Cedula` VARCHAR(45) NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Apellido` VARCHAR(45) NULL,
  `Password` VARCHAR(45) NULL,
  PRIMARY KEY (`Cedula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AvicolaSystem`.`Fincas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AvicolaSystem`.`Fincas` (
  `idFincas` INT NOT NULL AUTO_INCREMENT,
  `Cedula` VARCHAR(45) NULL,
  `Nombre` VARCHAR(45) NULL,
  `Direccion` VARCHAR(45) NULL,
  PRIMARY KEY (`idFincas`),
  INDEX `Cedula_idx` (`Cedula` ASC) VISIBLE,
  CONSTRAINT `Cedula`
    FOREIGN KEY (`Cedula`)
    REFERENCES `AvicolaSystem`.`Avicultores` (`Cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AvicolaSystem`.`Medicamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AvicolaSystem`.`Medicamentos` (
  `IdMedicamento` INT NOT NULL AUTO_INCREMENT,
  `NombreMedicamento` VARCHAR(45) NULL,
  `CantidadDisponible` VARCHAR(45) NULL,
  PRIMARY KEY (`IdMedicamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AvicolaSystem`.`Galpon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AvicolaSystem`.`Galpon` (
  `IdGalpon` INT NOT NULL AUTO_INCREMENT,
  `IdFinca` INT NOT NULL,
  `NumeroGalpon` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Proposito` VARCHAR(45) NOT NULL,
  `Detalle` VARCHAR(45) NULL,
  PRIMARY KEY (`IdGalpon`),
  INDEX `idFincas_idx` (`IdFinca` ASC) VISIBLE,
  CONSTRAINT `idFincas_idfk`
    FOREIGN KEY (`IdFinca`)
    REFERENCES `AvicolaSystem`.`Fincas` (`idFincas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AvicolaSystem`.`Gallinas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AvicolaSystem`.`Gallinas` (
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
    REFERENCES `AvicolaSystem`.`Galpon` (`IdGalpon`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AvicolaSystem`.`Gallina_Medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AvicolaSystem`.`Gallina_Medicamento` (
  `IdGallina` INT NOT NULL,
  `IdMedicamento` INT NOT NULL AUTO_INCREMENT,
  `FechaAdministracion` VARCHAR(45) NULL,
  INDEX `IdGallina_idx` (`IdGallina` ASC) VISIBLE,
  INDEX `IdMedicamento_idx` (`IdMedicamento` ASC) VISIBLE,
  CONSTRAINT `IdGallina`
    FOREIGN KEY (`IdGallina`)
    REFERENCES `AvicolaSystem`.`Gallinas` (`IdGallina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `IdMedicamento`
    FOREIGN KEY (`IdMedicamento`)
    REFERENCES `AvicolaSystem`.`Medicamentos` (`IdMedicamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AvicolaSystem`.`Ponederos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AvicolaSystem`.`Ponederos` (
  `IdPonedero` INT NOT NULL AUTO_INCREMENT,
  `IdGalpon` INT NULL,
  `Fecha` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdPonedero`),
  INDEX `IdGalpon_idx` (`IdGalpon` ASC) VISIBLE,
  CONSTRAINT `IdGalpon_idfk`
    FOREIGN KEY (`IdGalpon`)
    REFERENCES `AvicolaSystem`.`Galpon` (`IdGalpon`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AvicolaSystem`.`ActividadPonedero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AvicolaSystem`.`ActividadPonedero` (
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
    REFERENCES `AvicolaSystem`.`Gallinas` (`IdGallina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `IdPonedero_idfk`
    FOREIGN KEY (`IdPonedero`)
    REFERENCES `AvicolaSystem`.`Ponederos` (`IdPonedero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AvicolaSystem`.`Alimento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AvicolaSystem`.`Alimento` (
  `IdAlimento` INT NOT NULL AUTO_INCREMENT,
  `NombreAlimento` VARCHAR(45) NOT NULL,
  `CantidadDisponible` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdAlimento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AvicolaSystem`.`GalponAlimento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AvicolaSystem`.`GalponAlimento` (
  `IdGalpon` INT NOT NULL AUTO_INCREMENT,
  `IdAlimento` INT NOT NULL,
  `Fecha` VARCHAR(45) NOT NULL,
  `Proposito` VARCHAR(45) NOT NULL,
  `CantidadSuministrada` VARCHAR(45) NULL,
  INDEX `IdAlimento_idx` (`IdAlimento` ASC) VISIBLE,
  INDEX `IdGalpon_idx` (`IdGalpon` ASC) VISIBLE,
  CONSTRAINT `IdAlimento_idfk`
    FOREIGN KEY (`IdAlimento`)
    REFERENCES `AvicolaSystem`.`Alimento` (`IdAlimento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `IdGalponAlimento_idfk`
    FOREIGN KEY (`IdGalpon`)
    REFERENCES `AvicolaSystem`.`Galpon` (`IdGalpon`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AvicolaSystem`.`Huevos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AvicolaSystem`.`Huevos` (
  `IdHuevo` INT NOT NULL AUTO_INCREMENT,
  `IdGallina` INT NOT NULL,
  `Peso` VARCHAR(45) NOT NULL,
  `Color` VARCHAR(45) NULL,
  PRIMARY KEY (`IdHuevo`),
  INDEX `IdGallina_idx` (`IdGallina` ASC) VISIBLE,
  CONSTRAINT `IdGallina_idfky`
    FOREIGN KEY (`IdGallina`)
    REFERENCES `AvicolaSystem`.`ActividadPonedero` (`IdGallina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AvicolaSystem`.`Productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AvicolaSystem`.`Productos` (
  `IdProductos` INT NOT NULL AUTO_INCREMENT,
  `NombreProducto` VARCHAR(45) NULL,
  `Imagen` VARCHAR(45) NULL,
  `Precio` VARCHAR(45) NULL,
  `Descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`IdProductos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AvicolaSystem`.`Posturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AvicolaSystem`.`Posturas` (
  `Fecha` DATE NOT NULL,
  `IdProducto` INT NOT NULL,
  `IdGalpon` INT NULL,
  `Cantidad` INT NOT NULL,
  INDEX `IdGalpon_idx` (`IdGalpon` ASC) VISIBLE,
  INDEX `IdProducto_idx` (`IdProducto` ASC) VISIBLE,
  PRIMARY KEY (`Fecha`),
  CONSTRAINT `IdGalponPosturas_idfk`
    FOREIGN KEY (`IdGalpon`)
    REFERENCES `AvicolaSystem`.`Galpon` (`IdGalpon`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `IdProducto_idfk`
    FOREIGN KEY (`IdProducto`)
    REFERENCES `AvicolaSystem`.`Productos` (`IdProductos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AvicolaSystem`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AvicolaSystem`.`Clientes` (
  `IdClientes` INT NOT NULL AUTO_INCREMENT,
  `NombreCliente` VARCHAR(45) NULL,
  `Direccion` VARCHAR(45) NULL,
  `Telefono` VARCHAR(45) NULL,
  PRIMARY KEY (`IdClientes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AvicolaSystem`.`Ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AvicolaSystem`.`Ventas` (
  `IdCliente` INT NOT NULL AUTO_INCREMENT,
  `IdProducto` INT NULL,
  `FechaVenta` VARCHAR(45) NULL,
  `Cantidad` VARCHAR(45) NULL,
  INDEX `IdCliente_idx` (`IdCliente` ASC) VISIBLE,
  INDEX `IdProducto_idx` (`IdProducto` ASC) VISIBLE,
  CONSTRAINT `IdCliente_idfkd`
    FOREIGN KEY (`IdCliente`)
    REFERENCES `AvicolaSystem`.`Clientes` (`IdClientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `IdProducto_idfdk`
    FOREIGN KEY (`IdProducto`)
    REFERENCES `AvicolaSystem`.`Productos` (`IdProductos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `panama` ;

-- -----------------------------------------------------
-- Table `panama`.`provincias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `panama`.`provincias` (
  `id_provincia` INT NOT NULL DEFAULT '0',
  `provincia` VARCHAR(20) NOT NULL DEFAULT 'POR DEFINIR',
  `latitud` VARCHAR(45) NOT NULL,
  `longitud` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_provincia`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `panama`.`distritos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `panama`.`distritos` (
  `id_provincia` INT NOT NULL DEFAULT '0',
  `id_distrito` INT NOT NULL DEFAULT '0',
  `distrito` VARCHAR(130) NOT NULL DEFAULT 'POR DEFINIR',
  `latitud` VARCHAR(45) NOT NULL,
  `longitud` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_distrito`, `id_provincia`),
  INDEX `ID_PROVINCIA` USING BTREE (`id_provincia`) VISIBLE,
  CONSTRAINT `distritos_ibfk_1`
    FOREIGN KEY (`id_provincia`)
    REFERENCES `panama`.`provincias` (`id_provincia`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `panama`.`corregimientos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `panama`.`corregimientos` (
  `id_provincia` INT NOT NULL DEFAULT '0',
  `id_distrito` INT NOT NULL DEFAULT '0',
  `id_corregimiento` INT NOT NULL DEFAULT '0',
  `corregimiento` VARCHAR(130) NOT NULL DEFAULT 'POR DEFINIR',
  `latitud` VARCHAR(45) NOT NULL DEFAULT '',
  `longitud` VARCHAR(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_provincia`, `id_distrito`, `id_corregimiento`),
  INDEX `ID_PROVINCIA` USING BTREE (`id_provincia`) VISIBLE,
  INDEX `ID_DISTRITO` USING BTREE (`id_distrito`) VISIBLE,
  CONSTRAINT `corregimientos_ibfk_1`
    FOREIGN KEY (`id_provincia`)
    REFERENCES `panama`.`provincias` (`id_provincia`)
    ON UPDATE CASCADE,
  CONSTRAINT `corregimientos_ibfk_2`
    FOREIGN KEY (`id_distrito`)
    REFERENCES `panama`.`distritos` (`id_distrito`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
