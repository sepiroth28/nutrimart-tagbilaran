-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.59-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema dbinventory
--

CREATE DATABASE IF NOT EXISTS dbinventory;
USE dbinventory;

--
-- Temporary table structure for view `view_ending_balance`
--
DROP TABLE IF EXISTS `view_ending_balance`;
DROP VIEW IF EXISTS `view_ending_balance`;
CREATE TABLE `view_ending_balance` (
  `item_code` varchar(45),
  `item_qty` double(10,2)
);

--
-- Temporary table structure for view `vtotal_amount_paid`
--
DROP TABLE IF EXISTS `vtotal_amount_paid`;
DROP VIEW IF EXISTS `vtotal_amount_paid`;
CREATE TABLE `vtotal_amount_paid` (
  `total_amount_paid` double(19,2),
  `responsible_customer` int(10) unsigned
);

--
-- Definition of table `account_receivable`
--

DROP TABLE IF EXISTS `account_receivable`;
CREATE TABLE `account_receivable` (
  `sales_order_no` varchar(45) NOT NULL DEFAULT '0',
  `remarks` varchar(45) DEFAULT 'unsettled',
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`sales_order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_receivable`
--

/*!40000 ALTER TABLE `account_receivable` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_receivable` ENABLE KEYS */;


--
-- Definition of table `account_recievable_cart`
--

DROP TABLE IF EXISTS `account_recievable_cart`;
CREATE TABLE `account_recievable_cart` (
  `acount_recievable_cart_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_code` varchar(45) NOT NULL,
  `qty` int(10) unsigned NOT NULL,
  `customer_type` varchar(45) NOT NULL,
  `acount_recievable_cart_date` datetime NOT NULL,
  `price` double(2,2) NOT NULL,
  `total_price` double(2,2) NOT NULL,
  `discount_amount` double(2,2) NOT NULL,
  PRIMARY KEY (`acount_recievable_cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_recievable_cart`
--

/*!40000 ALTER TABLE `account_recievable_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_recievable_cart` ENABLE KEYS */;


--
-- Definition of table `account_recievable_payments`
--

DROP TABLE IF EXISTS `account_recievable_payments`;
CREATE TABLE `account_recievable_payments` (
  `account_recievable_id` int(10) unsigned NOT NULL DEFAULT '0',
  `payment_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`account_recievable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_recievable_payments`
--

/*!40000 ALTER TABLE `account_recievable_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_recievable_payments` ENABLE KEYS */;


--
-- Definition of table `account_recievable_to_account_recievable_cart`
--

DROP TABLE IF EXISTS `account_recievable_to_account_recievable_cart`;
CREATE TABLE `account_recievable_to_account_recievable_cart` (
  `account_recievable_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`account_recievable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_recievable_to_account_recievable_cart`
--

/*!40000 ALTER TABLE `account_recievable_to_account_recievable_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_recievable_to_account_recievable_cart` ENABLE KEYS */;


--
-- Definition of table `agent`
--

DROP TABLE IF EXISTS `agent`;
CREATE TABLE `agent` (
  `agent_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Mobile` varchar(45) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agent`
--

/*!40000 ALTER TABLE `agent` DISABLE KEYS */;
/*!40000 ALTER TABLE `agent` ENABLE KEYS */;


--
-- Definition of table `agent_customers`
--

DROP TABLE IF EXISTS `agent_customers`;
CREATE TABLE `agent_customers` (
  `agent_id` int(10) unsigned DEFAULT NULL,
  `customers_id` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agent_customers`
--

/*!40000 ALTER TABLE `agent_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `agent_customers` ENABLE KEYS */;


--
-- Definition of table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `cart_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_code` varchar(45) NOT NULL,
  `qty` int(10) unsigned NOT NULL,
  `customer_type` varchar(45) NOT NULL,
  `cart_date` datetime NOT NULL,
  `price` double(2,2) NOT NULL,
  `total_price` double(2,2) NOT NULL,
  `discount` varchar(45) NOT NULL,
  `discount_amount` double(2,2) NOT NULL,
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;


--
-- Definition of table `cod`
--

DROP TABLE IF EXISTS `cod`;
CREATE TABLE `cod` (
  `sales_order_no` varchar(45) NOT NULL DEFAULT '0',
  `remarks` varchar(45) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`sales_order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cod`
--

/*!40000 ALTER TABLE `cod` DISABLE KEYS */;
/*!40000 ALTER TABLE `cod` ENABLE KEYS */;


--
-- Definition of table `cod_remitted`
--

DROP TABLE IF EXISTS `cod_remitted`;
CREATE TABLE `cod_remitted` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sales_date` date DEFAULT NULL,
  `remit_by` varchar(45) DEFAULT NULL,
  `received_by` varchar(45) DEFAULT NULL,
  `date_accepted` date DEFAULT NULL,
  `amount` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cod_remitted`
--

/*!40000 ALTER TABLE `cod_remitted` DISABLE KEYS */;
/*!40000 ALTER TABLE `cod_remitted` ENABLE KEYS */;


--
-- Definition of table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `customers_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customers_name` varchar(45) DEFAULT NULL,
  `customers_add` varchar(45) DEFAULT NULL,
  `customers_number` varchar(45) DEFAULT NULL,
  `dealers_type` varchar(45) DEFAULT 'dealer',
  `credit_limit` double(10,2) DEFAULT NULL,
  `visible` tinyint(3) unsigned DEFAULT '1',
  PRIMARY KEY (`customers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;


--
-- Definition of table `customers_discount`
--

DROP TABLE IF EXISTS `customers_discount`;
CREATE TABLE `customers_discount` (
  `customers_id` int(10) unsigned NOT NULL DEFAULT '0',
  `discount_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`customers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers_discount`
--

/*!40000 ALTER TABLE `customers_discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers_discount` ENABLE KEYS */;


--
-- Definition of table `cutomer_reference`
--

DROP TABLE IF EXISTS `cutomer_reference`;
CREATE TABLE `cutomer_reference` (
  `address` varchar(120) DEFAULT NULL,
  `reference` varchar(100) DEFAULT NULL,
  `work` varchar(50) DEFAULT NULL,
  `store_name` varchar(50) DEFAULT NULL,
  `cus_id` int(10) unsigned NOT NULL,
  KEY `FK_cutomer_reference_1` (`cus_id`),
  CONSTRAINT `FK_cutomer_reference_1` FOREIGN KEY (`cus_id`) REFERENCES `customers` (`customers_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cutomer_reference`
--

/*!40000 ALTER TABLE `cutomer_reference` DISABLE KEYS */;
/*!40000 ALTER TABLE `cutomer_reference` ENABLE KEYS */;


--
-- Definition of table `deleted_so`
--

DROP TABLE IF EXISTS `deleted_so`;
CREATE TABLE `deleted_so` (
  `sales_order_no` varchar(45) NOT NULL,
  `responsible_customer` int(10) unsigned DEFAULT NULL,
  `responsible_agent` int(10) unsigned DEFAULT NULL,
  `discount` double(10,2) NOT NULL,
  `grand_total` double(10,2) NOT NULL,
  `net_total` double(10,2) NOT NULL,
  `tendered_amount` double(10,2) DEFAULT NULL,
  `change` double(10,2) DEFAULT NULL,
  `delivery_date` datetime NOT NULL,
  `prepared_by` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deleted_so`
--

/*!40000 ALTER TABLE `deleted_so` DISABLE KEYS */;
/*!40000 ALTER TABLE `deleted_so` ENABLE KEYS */;


--
-- Definition of table `discount`
--

DROP TABLE IF EXISTS `discount`;
CREATE TABLE `discount` (
  `discount_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `discount_code` varchar(45) DEFAULT NULL,
  `discount_name` varchar(45) DEFAULT NULL,
  `amount` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`discount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `discount`
--

/*!40000 ALTER TABLE `discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `discount` ENABLE KEYS */;


--
-- Definition of table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `item_code` varchar(45) DEFAULT NULL,
  `beginning_balance` double(10,2) DEFAULT NULL,
  `ending_balance` double(10,2) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory`
--

/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;


--
-- Definition of table `item_category`
--

DROP TABLE IF EXISTS `item_category`;
CREATE TABLE `item_category` (
  `item_code` varchar(45) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_category`
--

/*!40000 ALTER TABLE `item_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_category` ENABLE KEYS */;


--
-- Definition of table `item_conversion_details`
--

DROP TABLE IF EXISTS `item_conversion_details`;
CREATE TABLE `item_conversion_details` (
  `parent_id` varchar(45) DEFAULT NULL,
  `associated_id` varchar(45) DEFAULT NULL,
  `qty` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_conversion_details`
--

/*!40000 ALTER TABLE `item_conversion_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_conversion_details` ENABLE KEYS */;


--
-- Definition of table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_code` varchar(45) NOT NULL,
  `item_qty` double(10,2) NOT NULL,
  `item_price` double(10,2) NOT NULL,
  `dealers_price` double(10,2) DEFAULT NULL,
  `date_added` date DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  `manufacturers_id` int(10) unsigned DEFAULT NULL,
  `reorder_point` int(10) unsigned DEFAULT NULL,
  `include_in_rebate` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`,`item_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

/*!40000 ALTER TABLE `items` DISABLE KEYS */;
/*!40000 ALTER TABLE `items` ENABLE KEYS */;


--
-- Definition of table `items_description`
--

DROP TABLE IF EXISTS `items_description`;
CREATE TABLE `items_description` (
  `item_code` varchar(45) NOT NULL,
  `item_name` varchar(50) DEFAULT NULL,
  `item_description` varchar(100) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `unit_of_measure` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`item_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items_description`
--

/*!40000 ALTER TABLE `items_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `items_description` ENABLE KEYS */;


--
-- Definition of table `items_with_tracking`
--

DROP TABLE IF EXISTS `items_with_tracking`;
CREATE TABLE `items_with_tracking` (
  `item_code` varchar(45) DEFAULT NULL,
  `with_tracking` int(11) DEFAULT NULL,
  `with_half` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items_with_tracking`
--

/*!40000 ALTER TABLE `items_with_tracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `items_with_tracking` ENABLE KEYS */;


--
-- Definition of table `items_with_tracking_price`
--

DROP TABLE IF EXISTS `items_with_tracking_price`;
CREATE TABLE `items_with_tracking_price` (
  `item_id` int(10) unsigned NOT NULL,
  `item_code` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items_with_tracking_price`
--

/*!40000 ALTER TABLE `items_with_tracking_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `items_with_tracking_price` ENABLE KEYS */;


--
-- Definition of table `last_inventory`
--

DROP TABLE IF EXISTS `last_inventory`;
CREATE TABLE `last_inventory` (
  `item_id` int(10) unsigned DEFAULT NULL,
  `item_code` varchar(45) DEFAULT NULL,
  `beginning_balance` double(10,2) DEFAULT NULL,
  `ending_balance` double(10,2) DEFAULT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `last_inventory`
--

/*!40000 ALTER TABLE `last_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `last_inventory` ENABLE KEYS */;


--
-- Definition of table `manufacturers`
--

DROP TABLE IF EXISTS `manufacturers`;
CREATE TABLE `manufacturers` (
  `manufacturers_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `manufacturers_name` varchar(45) DEFAULT NULL,
  `manufacturers_add` varchar(45) DEFAULT NULL,
  `manufacturers_number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`manufacturers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manufacturers`
--

/*!40000 ALTER TABLE `manufacturers` DISABLE KEYS */;
/*!40000 ALTER TABLE `manufacturers` ENABLE KEYS */;


--
-- Definition of table `municipal_agent`
--

DROP TABLE IF EXISTS `municipal_agent`;
CREATE TABLE `municipal_agent` (
  `agent_id` int(10) unsigned DEFAULT NULL,
  `municipal_id` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `municipal_agent`
--

/*!40000 ALTER TABLE `municipal_agent` DISABLE KEYS */;
/*!40000 ALTER TABLE `municipal_agent` ENABLE KEYS */;


--
-- Definition of table `municipalities`
--

DROP TABLE IF EXISTS `municipalities`;
CREATE TABLE `municipalities` (
  `municipal_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `municipal_name` varchar(45) NOT NULL,
  `tracking_price` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`municipal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `municipalities`
--

/*!40000 ALTER TABLE `municipalities` DISABLE KEYS */;
/*!40000 ALTER TABLE `municipalities` ENABLE KEYS */;


--
-- Definition of table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `payment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `amount` double(2,2) NOT NULL,
  `date_of_payment` datetime NOT NULL,
  `remarks` varchar(45) NOT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;


--
-- Definition of table `payment_records`
--

DROP TABLE IF EXISTS `payment_records`;
CREATE TABLE `payment_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sales_order_no` varchar(45) DEFAULT NULL,
  `amount` double(10,2) DEFAULT NULL,
  `balance` double(10,2) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `remarks` varchar(45) DEFAULT NULL,
  `received_by` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_records`
--

/*!40000 ALTER TABLE `payment_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_records` ENABLE KEYS */;


--
-- Definition of table `previleges`
--

DROP TABLE IF EXISTS `previleges`;
CREATE TABLE `previleges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `previleges` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `previleges`
--

/*!40000 ALTER TABLE `previleges` DISABLE KEYS */;
INSERT INTO `previleges` (`id`,`previleges`) VALUES 
 (16,'payment'),
 (17,'customer_add'),
 (18,'stockin'),
 (19,'inventory'),
 (20,'stockout'),
 (21,'technician'),
 (22,'manage_manufacturer'),
 (23,'sales_order_responsible'),
 (24,'manage_useraccount'),
 (25,'view_sales'),
 (26,'print_sales_details'),
 (27,'credit_limit'),
 (28,'view_stock_in'),
 (29,'sales_adjustment'),
 (30,'print_receipt'),
 (31,'delete_customer'),
 (32,'manage_item'),
 (33,'delete_item'),
 (34,'customer_visibility'),
 (35,'can_accept_remit_payments'),
 (36,'can_issue_rebate'),
 (37,'can_overwrite_price'),
 (38,'can_verify_customer');
/*!40000 ALTER TABLE `previleges` ENABLE KEYS */;


--
-- Definition of table `price_rule`
--

DROP TABLE IF EXISTS `price_rule`;
CREATE TABLE `price_rule` (
  `pricerule_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rule_type_id` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `charge_type` varchar(45) DEFAULT NULL,
  `value` varchar(45) DEFAULT NULL,
  `created_at` varchar(45) DEFAULT NULL,
  `use_coupon_code` varchar(45) DEFAULT '0',
  `valid_until` varchar(45) DEFAULT NULL,
  `number_of_use` int(10) unsigned DEFAULT '0',
  `active` int(10) unsigned DEFAULT '1',
  `auto_apply` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`pricerule_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `price_rule`
--

/*!40000 ALTER TABLE `price_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `price_rule` ENABLE KEYS */;


--
-- Definition of table `pricerule_customer`
--

DROP TABLE IF EXISTS `pricerule_customer`;
CREATE TABLE `pricerule_customer` (
  `price_id` int(10) unsigned NOT NULL,
  `cutomer_id` varchar(45) NOT NULL,
  KEY `FK_pricerule_customer_1` (`price_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pricerule_customer`
--

/*!40000 ALTER TABLE `pricerule_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `pricerule_customer` ENABLE KEYS */;


--
-- Definition of table `pricerule_product`
--

DROP TABLE IF EXISTS `pricerule_product`;
CREATE TABLE `pricerule_product` (
  `price_id` int(10) unsigned NOT NULL,
  `item_code` varchar(45) NOT NULL,
  KEY `FK_pricerule_product_1` (`price_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pricerule_product`
--

/*!40000 ALTER TABLE `pricerule_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `pricerule_product` ENABLE KEYS */;


--
-- Definition of table `quick_report_items`
--

DROP TABLE IF EXISTS `quick_report_items`;
CREATE TABLE `quick_report_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_code` varchar(45) NOT NULL,
  `item_qty` double NOT NULL,
  `item_qty_standing` double NOT NULL,
  `transaction_type` varchar(45) NOT NULL,
  `transaction_date` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quick_report_items`
--

/*!40000 ALTER TABLE `quick_report_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `quick_report_items` ENABLE KEYS */;


--
-- Definition of table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
CREATE TABLE `ratings` (
  `customer_id` int(10) unsigned NOT NULL,
  `rating` int(10) unsigned DEFAULT NULL,
  KEY `FK_ratings_1` (`customer_id`),
  CONSTRAINT `FK_ratings_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customers_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ratings`
--

/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;


--
-- Definition of table `rebate_price_table`
--

DROP TABLE IF EXISTS `rebate_price_table`;
CREATE TABLE `rebate_price_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qty_from` double(10,2) DEFAULT NULL,
  `qty_to` double(10,2) DEFAULT NULL,
  `applied_price` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rebate_price_table`
--

/*!40000 ALTER TABLE `rebate_price_table` DISABLE KEYS */;
INSERT INTO `rebate_price_table` (`id`,`qty_from`,`qty_to`,`applied_price`) VALUES 
 (1,1.00,10.00,10.00);
/*!40000 ALTER TABLE `rebate_price_table` ENABLE KEYS */;


--
-- Definition of table `rebates`
--

DROP TABLE IF EXISTS `rebates`;
CREATE TABLE `rebates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `total_rebate_amount` double(10,2) DEFAULT NULL,
  `total_qty_bought` double(10,2) DEFAULT NULL,
  `month` varchar(45) DEFAULT NULL,
  `issue_by` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rebates`
--

/*!40000 ALTER TABLE `rebates` DISABLE KEYS */;
/*!40000 ALTER TABLE `rebates` ENABLE KEYS */;


--
-- Definition of table `remitted`
--

DROP TABLE IF EXISTS `remitted`;
CREATE TABLE `remitted` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_date` date NOT NULL,
  `remit_by` varchar(45) DEFAULT NULL,
  `accepted_by` varchar(45) DEFAULT NULL,
  `date_accepted` date DEFAULT NULL,
  `amount` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `remitted`
--

/*!40000 ALTER TABLE `remitted` DISABLE KEYS */;
/*!40000 ALTER TABLE `remitted` ENABLE KEYS */;


--
-- Definition of table `rule_type`
--

DROP TABLE IF EXISTS `rule_type`;
CREATE TABLE `rule_type` (
  `ruletype_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`ruletype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rule_type`
--

/*!40000 ALTER TABLE `rule_type` DISABLE KEYS */;
INSERT INTO `rule_type` (`ruletype_id`,`name`,`description`) VALUES 
 (1,'PERCENTAGE','percentag from total amount'),
 (2,'DISCOUNT','discount of total amount');
/*!40000 ALTER TABLE `rule_type` ENABLE KEYS */;


--
-- Definition of table `salesorder_responsible`
--

DROP TABLE IF EXISTS `salesorder_responsible`;
CREATE TABLE `salesorder_responsible` (
  `SaleOrder_Responsible_Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Prepared_by` varchar(100) DEFAULT NULL,
  `Checked_by` varchar(100) DEFAULT NULL,
  `Posted_by` varchar(100) DEFAULT NULL,
  `Delivered_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`SaleOrder_Responsible_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salesorder_responsible`
--

/*!40000 ALTER TABLE `salesorder_responsible` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesorder_responsible` ENABLE KEYS */;


--
-- Definition of table `stock_in`
--

DROP TABLE IF EXISTS `stock_in`;
CREATE TABLE `stock_in` (
  `stockin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` varchar(45) NOT NULL,
  `qty_in` int(10) unsigned NOT NULL,
  PRIMARY KEY (`stockin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_in`
--

/*!40000 ALTER TABLE `stock_in` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_in` ENABLE KEYS */;


--
-- Definition of table `stock_in_reference`
--

DROP TABLE IF EXISTS `stock_in_reference`;
CREATE TABLE `stock_in_reference` (
  `reference_no` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_in_reference`
--

/*!40000 ALTER TABLE `stock_in_reference` DISABLE KEYS */;
INSERT INTO `stock_in_reference` (`reference_no`) VALUES 
 ('1');
/*!40000 ALTER TABLE `stock_in_reference` ENABLE KEYS */;


--
-- Definition of table `stock_in_transaction`
--

DROP TABLE IF EXISTS `stock_in_transaction`;
CREATE TABLE `stock_in_transaction` (
  `stock_in_transaction_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(45) NOT NULL,
  `stocked_in_to` varchar(45) DEFAULT NULL,
  `from_supplier` int(10) unsigned DEFAULT NULL,
  `remarks` text,
  `stock_in_date` date DEFAULT NULL,
  `total_number_of_items` int(10) unsigned DEFAULT NULL,
  `total_qty` int(10) unsigned DEFAULT NULL,
  `prepared_by` varchar(45) DEFAULT NULL,
  `approved_by` varchar(45) DEFAULT NULL,
  `received_by` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`stock_in_transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_in_transaction`
--

/*!40000 ALTER TABLE `stock_in_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_in_transaction` ENABLE KEYS */;


--
-- Definition of table `stock_in_transaction_to_stock_in_items`
--

DROP TABLE IF EXISTS `stock_in_transaction_to_stock_in_items`;
CREATE TABLE `stock_in_transaction_to_stock_in_items` (
  `stock_in_transaction_id` int(10) unsigned DEFAULT NULL,
  `stock_id` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_in_transaction_to_stock_in_items`
--

/*!40000 ALTER TABLE `stock_in_transaction_to_stock_in_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_in_transaction_to_stock_in_items` ENABLE KEYS */;


--
-- Definition of table `stock_out`
--

DROP TABLE IF EXISTS `stock_out`;
CREATE TABLE `stock_out` (
  `stockout_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` varchar(45) DEFAULT NULL,
  `qty_out` double(10,2) DEFAULT NULL,
  `amount` double(10,2) DEFAULT NULL,
  `discount` double(10,2) DEFAULT NULL,
  `tracking_price` double(10,2) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`stockout_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_out`
--

/*!40000 ALTER TABLE `stock_out` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_out` ENABLE KEYS */;


--
-- Definition of table `stock_out_reference`
--

DROP TABLE IF EXISTS `stock_out_reference`;
CREATE TABLE `stock_out_reference` (
  `reference_no` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_out_reference`
--

/*!40000 ALTER TABLE `stock_out_reference` DISABLE KEYS */;
INSERT INTO `stock_out_reference` (`reference_no`) VALUES 
 (1);
/*!40000 ALTER TABLE `stock_out_reference` ENABLE KEYS */;


--
-- Definition of table `stock_out_transaction`
--

DROP TABLE IF EXISTS `stock_out_transaction`;
CREATE TABLE `stock_out_transaction` (
  `sales_order_no` varchar(45) NOT NULL,
  `responsible_customer` int(10) unsigned DEFAULT NULL,
  `responsible_agent` int(10) unsigned DEFAULT NULL,
  `discount` double(10,2) NOT NULL,
  `grand_total` double(10,2) NOT NULL,
  `net_total` double(10,2) NOT NULL,
  `tendered_amount` double(10,2) DEFAULT NULL,
  `change` double(10,2) DEFAULT NULL,
  `delivery_date` datetime NOT NULL,
  `prepared_by` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`sales_order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_out_transaction`
--

/*!40000 ALTER TABLE `stock_out_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_out_transaction` ENABLE KEYS */;


--
-- Definition of table `stock_out_transaction_stock_out_items`
--

DROP TABLE IF EXISTS `stock_out_transaction_stock_out_items`;
CREATE TABLE `stock_out_transaction_stock_out_items` (
  `sales_order_no` varchar(45) DEFAULT NULL,
  `stockout_id` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_out_transaction_stock_out_items`
--

/*!40000 ALTER TABLE `stock_out_transaction_stock_out_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_out_transaction_stock_out_items` ENABLE KEYS */;


--
-- Definition of table `store_settings`
--

DROP TABLE IF EXISTS `store_settings`;
CREATE TABLE `store_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_name` varchar(45) NOT NULL,
  `activated` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `store_settings`
--

/*!40000 ALTER TABLE `store_settings` DISABLE KEYS */;
INSERT INTO `store_settings` (`id`,`store_name`,`activated`) VALUES 
 (1,'NUTRIMART- CALAPE',0),
 (2,'NUTRIMART- TAGBILARAN',1);
/*!40000 ALTER TABLE `store_settings` ENABLE KEYS */;


--
-- Definition of table `temp`
--

DROP TABLE IF EXISTS `temp`;
CREATE TABLE `temp` (
  `item_id` int(10) unsigned DEFAULT NULL,
  `item_code` varchar(45) DEFAULT NULL,
  `ending_balance` double(10,2) DEFAULT NULL,
  `item_qty` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `temp`
--

/*!40000 ALTER TABLE `temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `temp` ENABLE KEYS */;


--
-- Definition of table `user_previleges`
--

DROP TABLE IF EXISTS `user_previleges`;
CREATE TABLE `user_previleges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `previleges` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_previleges`
--

/*!40000 ALTER TABLE `user_previleges` DISABLE KEYS */;
INSERT INTO `user_previleges` (`id`,`username`,`previleges`,`status`) VALUES 
 (1,'admin','16','1'),
 (2,'admin','17','1'),
 (3,'admin','18','1'),
 (4,'admin','19','1'),
 (5,'admin','20','1'),
 (6,'admin','21','1'),
 (7,'admin','22','1'),
 (8,'admin','23','1'),
 (9,'admin','24','1'),
 (10,'admin','25','1'),
 (11,'admin','26','1'),
 (12,'admin','27','1'),
 (13,'admin','28','1'),
 (14,'admin','29','1'),
 (15,'admin','30','1'),
 (16,'admin','31','1'),
 (17,'admin','32','1'),
 (18,'admin','33','1'),
 (19,'admin','34','1'),
 (20,'admin','35','1'),
 (21,'admin','36','1'),
 (22,'admin','37','1'),
 (23,'admin','38','1');
/*!40000 ALTER TABLE `user_previleges` ENABLE KEYS */;


--
-- Definition of table `useraccount`
--

DROP TABLE IF EXISTS `useraccount`;
CREATE TABLE `useraccount` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `user_type` varchar(50) NOT NULL DEFAULT 'user',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `useraccount`
--

/*!40000 ALTER TABLE `useraccount` DISABLE KEYS */;
INSERT INTO `useraccount` (`username`,`password`,`user_type`) VALUES 
 ('admin','21232f297a57a5a743894a0e4a801fc3','admin');
/*!40000 ALTER TABLE `useraccount` ENABLE KEYS */;


--
-- Definition of table `verified_customer`
--

DROP TABLE IF EXISTS `verified_customer`;
CREATE TABLE `verified_customer` (
  `customers_id` int(10) unsigned NOT NULL,
  `verefied` int(10) unsigned NOT NULL,
  KEY `FK_verified_customer_1` (`customers_id`),
  CONSTRAINT `FK_verified_customer_1` FOREIGN KEY (`customers_id`) REFERENCES `customers` (`customers_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `verified_customer`
--

/*!40000 ALTER TABLE `verified_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `verified_customer` ENABLE KEYS */;


--
-- Definition of view `view_ending_balance`
--

DROP TABLE IF EXISTS `view_ending_balance`;
DROP VIEW IF EXISTS `view_ending_balance`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_ending_balance` AS select `items`.`item_code` AS `item_code`,`items`.`item_qty` AS `item_qty` from `items`;

--
-- Definition of view `vtotal_amount_paid`
--

DROP TABLE IF EXISTS `vtotal_amount_paid`;
DROP VIEW IF EXISTS `vtotal_amount_paid`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vtotal_amount_paid` AS select sum(`pr`.`amount`) AS `total_amount_paid`,`sot`.`responsible_customer` AS `responsible_customer` from ((`account_receivable` `acr` left join `stock_out_transaction` `sot` on((`acr`.`sales_order_no` = `sot`.`sales_order_no`))) left join `payment_records` `pr` on((`pr`.`sales_order_no` = `sot`.`sales_order_no`))) group by `sot`.`responsible_customer`;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
