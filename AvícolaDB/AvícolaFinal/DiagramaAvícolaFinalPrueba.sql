-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema avicoladb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema avicoladb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `avicoladb` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
USE `avicoladb` ;

-- -----------------------------------------------------
-- Table `avicoladb`.`avicultores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avicoladb`.`avicultores` (
  `Cedula` VARCHAR(45) NOT NULL,
  `Nombre` VARCHAR(45) NULL DEFAULT NULL,
  `Apellido` VARCHAR(45) NULL DEFAULT NULL,
  `Password` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Cedula`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `avicoladb`.`fincas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avicoladb`.`fincas` (
  `idFincas` INT NOT NULL AUTO_INCREMENT,
  `Cedula` VARCHAR(45) NULL DEFAULT NULL,
  `Nombre` VARCHAR(45) NULL DEFAULT NULL,
  `Direccion` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idFincas`),
  INDEX `Cedula_idx` (`Cedula` ASC) VISIBLE,
  CONSTRAINT `Cedula`
    FOREIGN KEY (`Cedula`)
    REFERENCES `avicoladb`.`avicultores` (`Cedula`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `avicoladb`.`galpones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avicoladb`.`galpones` (
  `IdGalpon` INT NOT NULL AUTO_INCREMENT,
  `IdFinca` INT NOT NULL,
  `NumeroGalpon` INT NOT NULL,
  `Proposito` VARCHAR(45) NOT NULL,
  `Detalle` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`IdGalpon`),
  INDEX `idFincas_idx` (`IdFinca` ASC) VISIBLE,
  CONSTRAINT `idFincas_idfk`
    FOREIGN KEY (`IdFinca`)
    REFERENCES `avicoladb`.`fincas` (`idFincas`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `avicoladb`.`gallinas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avicoladb`.`gallinas` (
  `IdGallina` INT NOT NULL AUTO_INCREMENT,
  `Codigo` INT NOT NULL,
  `IdGalpon` INT NOT NULL,
  `Raza` VARCHAR(45) NULL DEFAULT NULL,
  `FechaNacimiento` DATE NULL DEFAULT NULL,
  `Estatus` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`IdGallina`, `Codigo`),
  INDEX `IdGalpon_idx` (`IdGalpon` ASC) VISIBLE,
  CONSTRAINT `IdGalpon`
    FOREIGN KEY (`IdGalpon`)
    REFERENCES `avicoladb`.`galpones` (`IdGalpon`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `avicoladb`.`ponederos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avicoladb`.`ponederos` (
  `IdPonedero` INT NOT NULL AUTO_INCREMENT,
  `IdGalpon` INT NULL DEFAULT NULL,
  `Fecha` DATE NOT NULL,
  `Descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdPonedero`),
  INDEX `IdGalpon_idx` (`IdGalpon` ASC) VISIBLE,
  CONSTRAINT `IdGalpon_idfk`
    FOREIGN KEY (`IdGalpon`)
    REFERENCES `avicoladb`.`galpones` (`IdGalpon`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `avicoladb`.`actividadponedero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avicoladb`.`actividadponedero` (
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
    REFERENCES `avicoladb`.`gallinas` (`IdGallina`),
  CONSTRAINT `IdPonedero_idfk`
    FOREIGN KEY (`IdPonedero`)
    REFERENCES `avicoladb`.`ponederos` (`IdPonedero`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `avicoladb`.`alimento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avicoladb`.`alimento` (
  `IdAlimento` INT NOT NULL AUTO_INCREMENT,
  `NombreAlimento` VARCHAR(45) NOT NULL,
  `CantidadDisponible` INT NOT NULL,
  PRIMARY KEY (`IdAlimento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `avicoladb`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avicoladb`.`clientes` (
  `IdClientes` INT NOT NULL AUTO_INCREMENT,
  `NombreCliente` VARCHAR(45) NULL DEFAULT NULL,
  `Direccion` VARCHAR(45) NULL DEFAULT NULL,
  `Telefono` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`IdClientes`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `avicoladb`.`diariocompras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avicoladb`.`diariocompras` (
  `idDiarioCompras` INT NOT NULL,
  `idFactura` VARCHAR(45) NULL DEFAULT NULL,
  `idProveedor` VARCHAR(45) NULL DEFAULT NULL,
  `Fecha` DATE NULL DEFAULT NULL,
  `ComprasDebido` VARCHAR(45) NULL DEFAULT NULL,
  `ITBMSDebito` VARCHAR(45) NULL DEFAULT NULL,
  `CtsCredito` VARCHAR(45) NULL DEFAULT NULL,
  `Condicion` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idDiarioCompras`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `avicoladb`.`diarioegresos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avicoladb`.`diarioegresos` (
  `idDiarioEgresos` INT NOT NULL,
  `idCheque` VARCHAR(45) NULL DEFAULT NULL,
  `Detalle` VARCHAR(45) NULL DEFAULT NULL,
  `Fecha` DATE NULL DEFAULT NULL,
  `GeneralDeb` VARCHAR(45) NULL DEFAULT NULL,
  `Compras` VARCHAR(45) NULL DEFAULT NULL,
  `ITBMS` VARCHAR(45) NULL DEFAULT NULL,
  `CtsPag` VARCHAR(45) NULL DEFAULT NULL,
  `Banco` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idDiarioEgresos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `avicoladb`.`diariogeneral`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avicoladb`.`diariogeneral` (
  `idDiarioGeneral` INT NOT NULL,
  `idDiarioCompras` VARCHAR(45) NULL DEFAULT NULL,
  `Fecha` DATE NULL DEFAULT NULL,
  `Debito` VARCHAR(45) NULL DEFAULT NULL,
  `Credito` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idDiarioGeneral`),
  UNIQUE INDEX `idDiarioCompras_UNIQUE` (`idDiarioCompras` ASC) VISIBLE,
  CONSTRAINT `idDiarioCompras`
    FOREIGN KEY (`idDiarioGeneral`)
    REFERENCES `avicoladb`.`diariocompras` (`idDiarioCompras`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `avicoladb`.`diarioventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avicoladb`.`diarioventas` (
  `idDiarioVentas` INT NOT NULL,
  `idFactura` VARCHAR(45) NULL DEFAULT NULL,
  `idCliente` VARCHAR(45) NULL DEFAULT NULL,
  `Fehca` DATE NULL DEFAULT NULL,
  `CuentasCob` VARCHAR(45) NULL DEFAULT NULL,
  `ITBMS` VARCHAR(45) NULL DEFAULT NULL,
  `Ventas` VARCHAR(45) NULL DEFAULT NULL,
  `Condicion` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idDiarioVentas`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `avicoladb`.`diariogeneral2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avicoladb`.`diariogeneral2` (
  `idDiarioGeneral1` INT NOT NULL,
  `idDiarioVentas` INT NULL DEFAULT NULL,
  `Detalle` VARCHAR(45) NULL DEFAULT NULL,
  `Fecha` DATE NULL DEFAULT NULL,
  `Debito` VARCHAR(45) NULL DEFAULT NULL,
  `Credito` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idDiarioGeneral1`),
  INDEX `idDiarioVentas_idx` (`idDiarioVentas` ASC) VISIBLE,
  CONSTRAINT `idDiarioVentas`
    FOREIGN KEY (`idDiarioVentas`)
    REFERENCES `avicoladb`.`diarioventas` (`idDiarioVentas`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `avicoladb`.`diariogeneral3`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avicoladb`.`diariogeneral3` (
  `idDiarioGeneral3` INT NOT NULL,
  `idiarioEgresos` INT NULL DEFAULT NULL,
  `Fecha` DATE NULL DEFAULT NULL,
  `Detalle` VARCHAR(45) NULL DEFAULT NULL,
  `Debito` VARCHAR(45) NULL DEFAULT NULL,
  `Credito` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idDiarioGeneral3`),
  INDEX `idDiarioEgresos_idx` (`idiarioEgresos` ASC) VISIBLE,
  CONSTRAINT `idDiarioEgresos`
    FOREIGN KEY (`idiarioEgresos`)
    REFERENCES `avicoladb`.`diarioegresos` (`idDiarioEgresos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `avicoladb`.`diarioingresos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avicoladb`.`diarioingresos` (
  `idDiarioIngresos` INT NOT NULL,
  `idDoc` INT NULL DEFAULT NULL,
  `Detalle` VARCHAR(45) NULL DEFAULT NULL,
  `Fecha` DATE NULL DEFAULT NULL,
  `GeneralCredit` VARCHAR(45) NULL DEFAULT NULL,
  `Banco` VARCHAR(45) NULL DEFAULT NULL,
  `CtsCob` VARCHAR(45) NULL DEFAULT NULL,
  `ITBMS` VARCHAR(45) NULL DEFAULT NULL,
  `Ventas` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idDiarioIngresos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `avicoladb`.`diariogeneraln`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avicoladb`.`diariogeneraln` (
  `idDiarioGeneralN` INT NOT NULL,
  `idDiarioIngresos` INT NULL DEFAULT NULL,
  `Fecha` DATE NULL DEFAULT NULL,
  `Debito` VARCHAR(45) NULL DEFAULT NULL,
  `Credito` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idDiarioGeneralN`),
  INDEX `idDiarioIngresos1_idx` (`idDiarioIngresos` ASC) VISIBLE,
  CONSTRAINT `idDiarioIngresos`
    FOREIGN KEY (`idDiarioIngresos`)
    REFERENCES `avicoladb`.`diarioingresos` (`idDiarioIngresos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `avicoladb`.`diariosmayorgeneralitbms2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avicoladb`.`diariosmayorgeneralitbms2` (
  `idDiariosMayorGeneralITBMS2` INT NOT NULL,
  `idDiarioEgresos` INT NULL DEFAULT NULL,
  `Fecha` DATE NULL DEFAULT NULL,
  `Detalle` VARCHAR(45) NULL DEFAULT NULL,
  `Debito` VARCHAR(45) NULL DEFAULT NULL,
  `Credito` VARCHAR(45) NULL DEFAULT NULL,
  `Saldo` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idDiariosMayorGeneralITBMS2`),
  INDEX `idDiarioEgresos4_idx` (`idDiarioEgresos` ASC) VISIBLE,
  CONSTRAINT `idDiarioEgresos4`
    FOREIGN KEY (`idDiarioEgresos`)
    REFERENCES `avicoladb`.`diarioegresos` (`idDiarioEgresos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `avicoladb`.`medicamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avicoladb`.`medicamentos` (
  `IdMedicamento` INT NOT NULL AUTO_INCREMENT,
  `NombreMedicamento` VARCHAR(45) NULL DEFAULT NULL,
  `CantidadDisponible` INT NULL DEFAULT NULL,
  PRIMARY KEY (`IdMedicamento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `avicoladb`.`gallina_medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avicoladb`.`gallina_medicamento` (
  `IdGallina` INT NOT NULL,
  `IdMedicamento` INT NOT NULL AUTO_INCREMENT,
  `FechaAdministracion` DATE NULL DEFAULT NULL,
  INDEX `IdGallina_idx` (`IdGallina` ASC) VISIBLE,
  INDEX `IdMedicamento_idx` (`IdMedicamento` ASC) VISIBLE,
  CONSTRAINT `IdGallina`
    FOREIGN KEY (`IdGallina`)
    REFERENCES `avicoladb`.`gallinas` (`IdGallina`),
  CONSTRAINT `IdMedicamento`
    FOREIGN KEY (`IdMedicamento`)
    REFERENCES `avicoladb`.`medicamentos` (`IdMedicamento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `avicoladb`.`galponalimento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avicoladb`.`galponalimento` (
  `IdGalpon` INT NOT NULL AUTO_INCREMENT,
  `IdAlimento` INT NOT NULL,
  `Fecha` VARCHAR(45) NOT NULL,
  `Proposito` VARCHAR(45) NOT NULL,
  `CantidadSuministrada` INT NULL DEFAULT NULL,
  INDEX `IdAlimento_idx` (`IdAlimento` ASC) VISIBLE,
  INDEX `IdGalpon_idx` (`IdGalpon` ASC) VISIBLE,
  CONSTRAINT `IdAlimento_idfk`
    FOREIGN KEY (`IdAlimento`)
    REFERENCES `avicoladb`.`alimento` (`IdAlimento`),
  CONSTRAINT `IdGalponAlimento_idfk`
    FOREIGN KEY (`IdGalpon`)
    REFERENCES `avicoladb`.`galpones` (`IdGalpon`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `avicoladb`.`huevos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avicoladb`.`huevos` (
  `IdHuevo` INT NOT NULL AUTO_INCREMENT,
  `IdGallina` INT NOT NULL,
  `Peso` DOUBLE NOT NULL,
  `Color` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`IdHuevo`),
  INDEX `IdGallina_idx` (`IdGallina` ASC) VISIBLE,
  CONSTRAINT `IdGallina_idfky`
    FOREIGN KEY (`IdGallina`)
    REFERENCES `avicoladb`.`actividadponedero` (`IdGallina`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `avicoladb`.`mayorcuentascob2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avicoladb`.`mayorcuentascob2` (
  `idMayorCuentasPag2` INT NOT NULL,
  `idDiarioVentas` INT NULL DEFAULT NULL,
  `Detalle` VARCHAR(45) NULL DEFAULT NULL,
  `Fecha` DATE NULL DEFAULT NULL,
  `Debito` VARCHAR(45) NULL DEFAULT NULL,
  `Credito` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idMayorCuentasPag2`),
  INDEX `idDiarioVentas2_idx` (`idDiarioVentas` ASC) VISIBLE,
  CONSTRAINT `idDiarioVentas2`
    FOREIGN KEY (`idDiarioVentas`)
    REFERENCES `avicoladb`.`diarioventas` (`idDiarioVentas`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `avicoladb`.`mayorgeneral/general7`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avicoladb`.`mayorgeneral/general7` (
  `idMayorGeneral/General7` INT NOT NULL,
  `idDiarioVentas` INT NULL DEFAULT NULL,
  `Fecha` DATE NULL DEFAULT NULL,
  `Detalle` VARCHAR(45) NULL DEFAULT NULL,
  `Debito` VARCHAR(45) NULL DEFAULT NULL,
  `Credito` VARCHAR(45) NULL DEFAULT NULL,
  `Saldo` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idMayorGeneral/General7`),
  INDEX `idDiarioEgresos1_idx` (`idDiarioVentas` ASC) VISIBLE,
  CONSTRAINT `idDiarioEgresos1`
    FOREIGN KEY (`idDiarioVentas`)
    REFERENCES `avicoladb`.`diarioegresos` (`idDiarioEgresos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `avicoladb`.`mayorgeneral/general8`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avicoladb`.`mayorgeneral/general8` (
  `idMayorGeneral/General8` INT NOT NULL,
  `idDiarioIngresos` INT NULL DEFAULT NULL,
  `Fecha` DATE NULL DEFAULT NULL,
  `Debito` VARCHAR(45) NULL DEFAULT NULL,
  `Credito` VARCHAR(45) NULL DEFAULT NULL,
  `Saldo` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idMayorGeneral/General8`),
  INDEX `idDiarioIngresos1_idx` (`idDiarioIngresos` ASC) VISIBLE,
  CONSTRAINT `idDiarioIngresos1`
    FOREIGN KEY (`idDiarioIngresos`)
    REFERENCES `avicoladb`.`diarioingresos` (`idDiarioIngresos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `avicoladb`.`mayorgeneralbanc6`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avicoladb`.`mayorgeneralbanc6` (
  `idMayorGeneralBanc6` INT NOT NULL,
  `idDiarioIngresos` INT NULL DEFAULT NULL,
  `Fecha` DATE NULL DEFAULT NULL,
  `Debito` VARCHAR(45) NULL DEFAULT NULL,
  `Credito` VARCHAR(45) NULL DEFAULT NULL,
  `Saldo` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idMayorGeneralBanc6`),
  INDEX `idDiarioIngresos2_idx` (`idDiarioIngresos` ASC) VISIBLE,
  CONSTRAINT `idDiarioIngresos2`
    FOREIGN KEY (`idDiarioIngresos`)
    REFERENCES `avicoladb`.`diarioingresos` (`idDiarioIngresos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `avicoladb`.`mayorgeneralbanco6`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avicoladb`.`mayorgeneralbanco6` (
  `idMayorGeneralBanco6` INT NOT NULL,
  `idDiarioEgresos` INT NULL DEFAULT NULL,
  `Fecha` DATE NULL DEFAULT NULL,
  `Detalle` VARCHAR(45) NULL DEFAULT NULL,
  `Debito` VARCHAR(45) NULL DEFAULT NULL,
  `Credito` VARCHAR(45) NULL DEFAULT NULL,
  `Saldo` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idMayorGeneralBanco6`),
  INDEX `idDiarioEgresos5_idx` (`idDiarioEgresos` ASC) VISIBLE,
  CONSTRAINT `idDiarioEgresos5`
    FOREIGN KEY (`idDiarioEgresos`)
    REFERENCES `avicoladb`.`diarioegresos` (`idDiarioEgresos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `avicoladb`.`mayorgeneralcompras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avicoladb`.`mayorgeneralcompras` (
  `idMayorGeneralCompras` INT NOT NULL,
  `idDiarioCompras` INT NULL DEFAULT NULL,
  `Fehca` DATE NULL DEFAULT NULL,
  `Detalle` VARCHAR(45) NULL DEFAULT NULL,
  `Credito` VARCHAR(45) NULL DEFAULT NULL,
  `Debito` VARCHAR(45) NULL DEFAULT NULL,
  `Saldo` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idMayorGeneralCompras`),
  INDEX `Fecha_idx` (`idDiarioCompras` ASC) VISIBLE,
  CONSTRAINT `Fecha`
    FOREIGN KEY (`idDiarioCompras`)
    REFERENCES `avicoladb`.`diariocompras` (`idDiarioCompras`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `avicoladb`.`mayorgeneralcompras1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avicoladb`.`mayorgeneralcompras1` (
  `idMayorGeneralCompras1` INT NOT NULL,
  `idDiarioEgresos` INT NULL DEFAULT NULL,
  `Fecha` DATE NULL DEFAULT NULL,
  `Detalle` VARCHAR(45) NULL DEFAULT NULL,
  `Debito` VARCHAR(45) NULL DEFAULT NULL,
  `Credito` VARCHAR(45) NULL DEFAULT NULL,
  `Saldo` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idMayorGeneralCompras1`),
  INDEX `idDiarioEgresos2_idx` (`idDiarioEgresos` ASC) VISIBLE,
  CONSTRAINT `idDiarioEgresos2`
    FOREIGN KEY (`idDiarioEgresos`)
    REFERENCES `avicoladb`.`diarioegresos` (`idDiarioEgresos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `avicoladb`.`mayorgeneralctsporpag3`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avicoladb`.`mayorgeneralctsporpag3` (
  `idMayorGeneralCtsPorPag3` INT NOT NULL,
  `idDiarioEgresos` INT NULL DEFAULT NULL,
  `Fecha` DATE NULL DEFAULT NULL,
  `Detalle` VARCHAR(45) NULL DEFAULT NULL,
  `Debito` VARCHAR(45) NULL DEFAULT NULL,
  `Credito` VARCHAR(45) NULL DEFAULT NULL,
  `Saldo` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idMayorGeneralCtsPorPag3`),
  INDEX `idDiarioEgresos6_idx` (`idDiarioEgresos` ASC) VISIBLE,
  CONSTRAINT `idDiarioEgresos6`
    FOREIGN KEY (`idDiarioEgresos`)
    REFERENCES `avicoladb`.`diarioegresos` (`idDiarioEgresos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `avicoladb`.`mayorgeneralcuentaspag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avicoladb`.`mayorgeneralcuentaspag` (
  `idMayorGeneralCuentasPag` INT NOT NULL,
  `idDiarioCompras` INT NULL DEFAULT NULL,
  `Fecha` DATE NULL DEFAULT NULL,
  `Debito` VARCHAR(45) NULL DEFAULT NULL,
  `Credito` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idMayorGeneralCuentasPag`),
  INDEX `idDiarioCompras_idx` (`idDiarioCompras` ASC) VISIBLE,
  CONSTRAINT `idDiarioCompras1`
    FOREIGN KEY (`idDiarioCompras`)
    REFERENCES `avicoladb`.`diariocompras` (`idDiarioCompras`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `avicoladb`.`mayorgeneralcuentcob`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avicoladb`.`mayorgeneralcuentcob` (
  `idMayorGeneralCuentCob` INT NOT NULL,
  `idDiarioIngresos` INT NULL DEFAULT NULL,
  `Fecha` DATE NULL DEFAULT NULL,
  `Debito` VARCHAR(45) NULL DEFAULT NULL,
  `Credito` VARCHAR(45) NULL DEFAULT NULL,
  `Saldo` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idMayorGeneralCuentCob`),
  INDEX `idDiarioIngresos3_idx` (`idDiarioIngresos` ASC) VISIBLE,
  CONSTRAINT `idDiarioIngresos3`
    FOREIGN KEY (`idDiarioIngresos`)
    REFERENCES `avicoladb`.`diarioingresos` (`idDiarioIngresos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `avicoladb`.`mayorgeneralitbms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avicoladb`.`mayorgeneralitbms` (
  `idMayorGeneralITBMS` INT NOT NULL,
  `idDiarioCompras` INT NULL DEFAULT NULL,
  `Fehca` DATE NULL DEFAULT NULL,
  `Debito` VARCHAR(45) NULL DEFAULT NULL,
  `Credito` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idMayorGeneralITBMS`),
  INDEX `idDiarioCompras_idx` (`idDiarioCompras` ASC) VISIBLE,
  CONSTRAINT `Fecha1`
    FOREIGN KEY (`idDiarioCompras`)
    REFERENCES `avicoladb`.`diariocompras` (`idDiarioCompras`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `avicoladb`.`mayorgeneralitbms1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avicoladb`.`mayorgeneralitbms1` (
  `idMayorGeneralITBMS2` INT NOT NULL,
  `idDiarioVentas` INT NULL DEFAULT NULL,
  `Detalle` VARCHAR(45) NULL DEFAULT NULL,
  `Fecha` DATE NULL DEFAULT NULL,
  `Debito` VARCHAR(45) NULL DEFAULT NULL,
  `Credito` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idMayorGeneralITBMS2`),
  INDEX `idDiarioVentas1_idx` (`idDiarioVentas` ASC) VISIBLE,
  CONSTRAINT `idDiarioVentas1`
    FOREIGN KEY (`idDiarioVentas`)
    REFERENCES `avicoladb`.`diarioventas` (`idDiarioVentas`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `avicoladb`.`mayorgeneralitbms2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avicoladb`.`mayorgeneralitbms2` (
  `idMayorGeneralITBMS2` INT NOT NULL,
  `idDiarioIngresos` INT NULL DEFAULT NULL,
  `Fecha` VARCHAR(45) NULL DEFAULT NULL,
  `Debito` VARCHAR(45) NULL DEFAULT NULL,
  `Credito` VARCHAR(45) NULL DEFAULT NULL,
  `Saldo` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idMayorGeneralITBMS2`),
  INDEX `idDiarioIngresos5_idx` (`idDiarioIngresos` ASC) VISIBLE,
  CONSTRAINT `idDiarioIngresos5`
    FOREIGN KEY (`idDiarioIngresos`)
    REFERENCES `avicoladb`.`diarioingresos` (`idDiarioIngresos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `avicoladb`.`mayorgeneralventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avicoladb`.`mayorgeneralventas` (
  `idMayorGeneralVentas` INT NOT NULL,
  `idDiarioVentas` INT NULL DEFAULT NULL,
  `Detalle` VARCHAR(45) NULL DEFAULT NULL,
  `Fecha` VARCHAR(45) NULL DEFAULT NULL,
  `Debito` VARCHAR(45) NULL DEFAULT NULL,
  `Credito` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idMayorGeneralVentas`),
  INDEX `idDiarioVentas3_idx` (`idDiarioVentas` ASC) VISIBLE,
  CONSTRAINT `idDiarioVentas3`
    FOREIGN KEY (`idDiarioVentas`)
    REFERENCES `avicoladb`.`diarioventas` (`idDiarioVentas`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `avicoladb`.`mayorgeneralventas5`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avicoladb`.`mayorgeneralventas5` (
  `idMayorGeneralVentas5` INT NOT NULL,
  `idDiarioIngresos` INT NULL DEFAULT NULL,
  `Fecha` DATE NULL DEFAULT NULL,
  `Debito` VARCHAR(45) NULL DEFAULT NULL,
  `Credito` VARCHAR(45) NULL DEFAULT NULL,
  `Saldo` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idMayorGeneralVentas5`),
  INDEX `idDiarioIngresos4_idx` (`idDiarioIngresos` ASC) VISIBLE,
  CONSTRAINT `idDiarioIngresos4`
    FOREIGN KEY (`idDiarioIngresos`)
    REFERENCES `avicoladb`.`diarioingresos` (`idDiarioIngresos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `avicoladb`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avicoladb`.`productos` (
  `IdProductos` INT NOT NULL AUTO_INCREMENT,
  `NombreProducto` VARCHAR(45) NULL DEFAULT NULL,
  `Imagen` VARCHAR(45) NULL DEFAULT NULL,
  `Precio` FLOAT NULL DEFAULT NULL,
  `Descripcion` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`IdProductos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `avicoladb`.`posturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avicoladb`.`posturas` (
  `Fecha` DATE NOT NULL,
  `IdProducto` INT NOT NULL,
  `IdGalpon` INT NULL DEFAULT NULL,
  `Cantidad` INT NOT NULL,
  PRIMARY KEY (`Fecha`),
  INDEX `IdGalpon_idx` (`IdGalpon` ASC) VISIBLE,
  INDEX `IdProducto_idx` (`IdProducto` ASC) VISIBLE,
  CONSTRAINT `IdGalponPosturas_idfk`
    FOREIGN KEY (`IdGalpon`)
    REFERENCES `avicoladb`.`galpones` (`IdGalpon`),
  CONSTRAINT `IdProducto_idfk`
    FOREIGN KEY (`IdProducto`)
    REFERENCES `avicoladb`.`productos` (`IdProductos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `avicoladb`.`ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avicoladb`.`ventas` (
  `IdCliente` INT NOT NULL AUTO_INCREMENT,
  `IdProducto` INT NULL DEFAULT NULL,
  `FechaVenta` DATE NULL DEFAULT NULL,
  `Cantidad` INT NULL DEFAULT NULL,
  INDEX `IdCliente_idx` (`IdCliente` ASC) VISIBLE,
  INDEX `IdProducto_idx` (`IdProducto` ASC) VISIBLE,
  CONSTRAINT `IdCliente_idfkd`
    FOREIGN KEY (`IdCliente`)
    REFERENCES `avicoladb`.`clientes` (`IdClientes`),
  CONSTRAINT `IdProducto_idfdk`
    FOREIGN KEY (`IdProducto`)
    REFERENCES `avicoladb`.`productos` (`IdProductos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
