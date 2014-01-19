SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `mydb` ;
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Security`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Security` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Security` (
  `SEC_ID` DECIMAL(18,0) NOT NULL ,
  `SEC_NAME` VARCHAR(45) NULL ,
  `TICKER` VARCHAR(45) NULL ,
  PRIMARY KEY (`SEC_ID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Order` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Order` (
  `ORDER_ID` DECIMAL(18,0) NOT NULL ,
  `TRANS_TYPE` VARCHAR(5) NULL ,
  `SEC_ID` DECIMAL(18,0) NULL ,
  `STATUS` VARCHAR(10) NULL ,
  `TRADE_DATE` DATETIME NULL ,
  PRIMARY KEY (`ORDER_ID`) ,
  INDEX `SEC_ID_idx` (`SEC_ID` ASC) ,
  CONSTRAINT `SEC_ID_ORDER`
    FOREIGN KEY (`SEC_ID` )
    REFERENCES `mydb`.`Security` (`SEC_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Broker`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Broker` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Broker` (
  `BKR_ID` VARCHAR(12) NOT NULL ,
  `BKR_NAME` VARCHAR(60) NULL ,
  PRIMARY KEY (`BKR_ID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Fund`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Fund` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Fund` (
  `ACCT_CD` VARCHAR(45) NOT NULL ,
  `ACCT_NAME` VARCHAR(60) NULL ,
  `MKT_VAL` DECIMAL(19,4) NULL ,
  `NET_ASSETS` DECIMAL(17,2) NULL ,
  `TOT_ASSETS` DECIMAL(17,2) NULL ,
  `CRNCY_CD` VARCHAR(3) NULL ,
  `CUST_CD` VARCHAR(15) NULL ,
  `UDF_CHAR_1` VARCHAR(45) NULL ,
  `UDF_FLOAT_1` FLOAT NULL ,
  `UDF_DATE_1` DATETIME NULL ,
  `UDF_CHAR_2` VARCHAR(45) NULL ,
  PRIMARY KEY (`ACCT_CD`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Order_Alloc`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Order_Alloc` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Order_Alloc` (
  `TRADE_ID` DECIMAL(18,0) NOT NULL ,
  `ORDER_ID` DECIMAL(18,0) NULL ,
  `ACCT_CD` VARCHAR(45) NULL ,
  `TGT_QTY` DECIMAL(18,4) NULL ,
  `TGT_AMT` DECIMAL(18,4) NULL ,
  `EXEC_QTY` DECIMAL(18,4) NULL ,
  `EXEC_AMT` DECIMAL(18,4) NULL ,
  `BKR_ID` VARCHAR(12) NULL ,
  PRIMARY KEY (`TRADE_ID`) ,
  INDEX `ORDER_ID_idx` (`ORDER_ID` ASC) ,
  INDEX `BKR_ID_idx` (`BKR_ID` ASC) ,
  INDEX `ACCT_CD_idx` (`ACCT_CD` ASC) ,
  CONSTRAINT `ORDER_ID_ORDER_ALLOC`
    FOREIGN KEY (`ORDER_ID` )
    REFERENCES `mydb`.`Order` (`ORDER_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `BKR_ID_ORDER_ALLOC`
    FOREIGN KEY (`BKR_ID` )
    REFERENCES `mydb`.`Broker` (`BKR_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ACCT_CD_ORDER_ALLOC`
    FOREIGN KEY (`ACCT_CD` )
    REFERENCES `mydb`.`Fund` (`ACCT_CD` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Position`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Position` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Position` (
  `ACCT_CD` VARCHAR(45) NOT NULL ,
  `SEC_ID` DECIMAL(18) NOT NULL ,
  `QTY_INTRADAY` DECIMAL(18,4) NULL ,
  `QTY_SOD` DECIMAL(18,4) NULL ,
  `MKT_VAL_SOD` DECIMAL(18,4) NULL ,
  `MKT_VAL_INTRADAY` DECIMAL(18,4) NULL ,
  INDEX `ACCT_CD_idx` (`ACCT_CD` ASC) ,
  INDEX `SEC_ID_idx` (`SEC_ID` ASC) ,
  UNIQUE INDEX `ACCT_CD_UNIQUE` (`ACCT_CD` ASC) ,
  UNIQUE INDEX `SEC_ID_UNIQUE` (`SEC_ID` ASC) ,
  CONSTRAINT `ACCT_CD_POSITION`
    FOREIGN KEY (`ACCT_CD` )
    REFERENCES `mydb`.`Fund` (`ACCT_CD` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `SEC_ID_POSITION`
    FOREIGN KEY (`SEC_ID` )
    REFERENCES `mydb`.`Security` (`SEC_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Price`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Price` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`Price` (
  `SEC_ID` DECIMAL(18,0) NOT NULL ,
  `PRICE_DATE` DATETIME NOT NULL ,
  `PRICE` FLOAT NULL ,
  INDEX `SEC_ID_idx` (`SEC_ID` ASC) ,
  UNIQUE INDEX `SEC_ID_UNIQUE` (`SEC_ID` ASC) ,
  UNIQUE INDEX `PRICE_DATE_UNIQUE` (`PRICE_DATE` ASC) ,
  CONSTRAINT `SEC_ID_PRICE`
    FOREIGN KEY (`SEC_ID` )
    REFERENCES `mydb`.`Security` (`SEC_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


