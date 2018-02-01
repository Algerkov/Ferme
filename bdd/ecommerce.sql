SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `ecommerce` ;
CREATE SCHEMA IF NOT EXISTS `ecommerce` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `ecommerce` ;

-- -----------------------------------------------------
-- Table `ecommerce`.`customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommerce`.`customer` ;

CREATE  TABLE IF NOT EXISTS `ecommerce`.`customer` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  `email` VARCHAR(45) NOT NULL ,
  `phone` VARCHAR(45) NOT NULL ,
  `address` VARCHAR(45) NOT NULL ,
  `city_region` VARCHAR(2) NOT NULL ,
  `cc_number` VARCHAR(19) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
COMMENT = 'maintains customer details';


-- -----------------------------------------------------
-- Table `ecommerce`.`customer_order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommerce`.`customer_order` ;

CREATE  TABLE IF NOT EXISTS `ecommerce`.`customer_order` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `amount` DECIMAL(6,2) NOT NULL ,
  `date_created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `confirmation_number` INT UNSIGNED NOT NULL ,
  `customer_id` INT UNSIGNED NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_customer_order_customer` (`customer_id` ASC) ,
  CONSTRAINT `fk_customer_order_customer`
    FOREIGN KEY (`customer_id` )
    REFERENCES `ecommerce`.`customer` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'maintains customer order details';


-- -----------------------------------------------------
-- Table `ecommerce`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommerce`.`category` ;

CREATE  TABLE IF NOT EXISTS `ecommerce`.`category` (
  `id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
COMMENT = 'contains product categories, e.g., dairy, meats, etc.';


-- -----------------------------------------------------
-- Table `ecommerce`.`product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommerce`.`product` ;

CREATE  TABLE IF NOT EXISTS `ecommerce`.`product` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  `price` DECIMAL(5,2) NOT NULL ,
  `description` TINYTEXT NULL ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `category_id` TINYINT UNSIGNED NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_product_category` (`category_id` ASC) ,
  CONSTRAINT `fk_product_category1`
    FOREIGN KEY (`category_id` )
    REFERENCES `ecommerce`.`category` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'contains product details';


-- -----------------------------------------------------
-- Table `ecommerce`.`ordered_product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommerce`.`ordered_product` ;

CREATE  TABLE IF NOT EXISTS `ecommerce`.`ordered_product` (
  `customer_order_id` INT UNSIGNED NOT NULL ,
  `product_id` INT UNSIGNED NOT NULL ,
  `quantity` SMALLINT UNSIGNED NOT NULL DEFAULT 1 ,
  PRIMARY KEY (`customer_order_id`, `product_id`) ,
  INDEX `fk_ordered_product_customer_order` (`customer_order_id` ASC) ,
  INDEX `fk_ordered_product_product` (`product_id` ASC) ,
  CONSTRAINT `fk_ordered_product_customer_order`
    FOREIGN KEY (`customer_order_id` )
    REFERENCES `ecommerce`.`customer_order` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordered_product_product`
    FOREIGN KEY (`product_id` )
    REFERENCES `ecommerce`.`product` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- --------------------------------------------------------

--
-- Sample data for table `category`
--

INSERT INTO `category` (name) VALUES ('Produits Laitiers'),('Viande'),('Boulangerie'),('Fruits et légumes');


--
-- Sample data for table `product`
--

INSERT INTO `product` (`name`, price, description, category_id) VALUES ('Lait', 1.70, 'semi-écrémé (1L)', 1);
INSERT INTO `product` (`name`, price, description, category_id) VALUES ('Fromage', 2.39, 'cheddar doux (330g)', 1);
INSERT INTO `product` (`name`, price, description, category_id) VALUES ('Beurre', 1.09, 'Sans sel (250g)', 1);
INSERT INTO `product` (`name`, price, description, category_id) VALUES ('Oeufs de poules élevés en plein air', 1.76, '(6 oeufs)', 1);

INSERT INTO `product` (`name`, price, description, category_id) VALUES ('Jambon de Parme', 3.49, 'mature (70g)', 2);
INSERT INTO `product` (`name`, price, description, category_id) VALUES ('Cuisses de poulet', 2.59, '(250g)', 2);
INSERT INTO `product` (`name`, price, description, category_id) VALUES ('Baecon', 3.55, 'Miammm (350g)', 2);

INSERT INTO `product` (`name`, price, description, category_id) VALUES ('Galette frangipane', 9.15, 'Qui aura la fève ?', 3);
INSERT INTO `product` (`name`, price, description, category_id) VALUES ('Cookies au chocolat', 2.39, 'contain peanuts<br>(3 cookies)', 3);

INSERT INTO `product` (`name`, price, description, category_id) VALUES ('Maïs', 1.59, '2 pieces', 4);
INSERT INTO `product` (`name`, price, description, category_id) VALUES ('Froseilles rouges', 2.49, '150g', 4);
INSERT INTO `product` (`name`, price, description, category_id) VALUES ('Broccoli', 1.29, '500g', 4);
INSERT INTO `product` (`name`, price, description, category_id) VALUES ('Pastèque sans pépins', 1.49, '250g', 4);
