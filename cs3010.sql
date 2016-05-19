-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema cs3010
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cs3010
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cs3010` ;
USE `cs3010` ;

-- -----------------------------------------------------
-- Table `cs3010`.`cpu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs3010`.`cpu` (
  `cpu_id` VARCHAR(10) NOT NULL,
  `speed_mhz` INT NULL,
  PRIMARY KEY (`cpu_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs3010`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs3010`.`orders` (
  `order_num` INT NOT NULL,
  `cust_num` INT NULL,
  `cpu` VARCHAR(45) NULL,
  `ram_mhz` INT NULL,
  PRIMARY KEY (`order_num`),
  UNIQUE INDEX `order_num_UNIQUE` (`order_num` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs3010`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs3010`.`customer` (
  `cust_num` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `addr` VARCHAR(45) NULL,
  `orders_order_num` INT NULL,
  UNIQUE INDEX `cust_num_UNIQUE` (`cust_num` ASC),
  PRIMARY KEY (`cust_num`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `cs3010`.`cpu`
-- -----------------------------------------------------
START TRANSACTION;
USE `cs3010`;
INSERT INTO `cs3010`.`cpu` (`cpu_id`, `speed_mhz`) VALUES ('IA32_3', 2300);
INSERT INTO `cs3010`.`cpu` (`cpu_id`, `speed_mhz`) VALUES ('Z80', 1);
INSERT INTO `cs3010`.`cpu` (`cpu_id`, `speed_mhz`) VALUES ('Anal Mach', 1);
INSERT INTO `cs3010`.`cpu` (`cpu_id`, `speed_mhz`) VALUES ('Vax 11/780', 5);
INSERT INTO `cs3010`.`cpu` (`cpu_id`, `speed_mhz`) VALUES ('Power27', 3550);

COMMIT;


-- -----------------------------------------------------
-- Data for table `cs3010`.`orders`
-- -----------------------------------------------------
START TRANSACTION;
USE `cs3010`;
INSERT INTO `cs3010`.`orders` (`order_num`, `cust_num`, `cpu`, `ram_mhz`) VALUES (1, 61, 'Z80', 1);
INSERT INTO `cs3010`.`orders` (`order_num`, `cust_num`, `cpu`, `ram_mhz`) VALUES (22, 123, 'Z80', 1);
INSERT INTO `cs3010`.`orders` (`order_num`, `cust_num`, `cpu`, `ram_mhz`) VALUES (23, 2, 'Power27', 3550);

COMMIT;


-- -----------------------------------------------------
-- Data for table `cs3010`.`customer`
-- -----------------------------------------------------
START TRANSACTION;
USE `cs3010`;
INSERT INTO `cs3010`.`customer` (`cust_num`, `name`, `addr`, `orders_order_num`) VALUES (2, 'Augusta Ada King', 'London, UK', NULL);
INSERT INTO `cs3010`.`customer` (`cust_num`, `name`, `addr`, `orders_order_num`) VALUES (45, 'Steve Jobs', 'San Francisco, CA', NULL);
INSERT INTO `cs3010`.`customer` (`cust_num`, `name`, `addr`, `orders_order_num`) VALUES (61, 'Grace Hopper', 'Washington, DC', NULL);
INSERT INTO `cs3010`.`customer` (`cust_num`, `name`, `addr`, `orders_order_num`) VALUES (123, 'William Gates', 'Seatle, WA', NULL);
INSERT INTO `cs3010`.`customer` (`cust_num`, `name`, `addr`, `orders_order_num`) VALUES (356, 'Edsger Dijkstra', 'Nuenen, NL', NULL);
INSERT INTO `cs3010`.`customer` (`cust_num`, `name`, `addr`, `orders_order_num`) VALUES (409, 'Donald Knuth', 'St. Anford, CA', NULL);
INSERT INTO `cs3010`.`customer` (`cust_num`, `name`, `addr`, `orders_order_num`) VALUES (1452, 'C.A.R. Hoare', 'Cambridge, GB', NULL);

COMMIT;

