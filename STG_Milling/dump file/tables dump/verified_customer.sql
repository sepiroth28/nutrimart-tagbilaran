DROP TABLE IF EXISTS `dbinventory`.`verified_customer`;
CREATE TABLE  `dbinventory`.`verified_customer` (
  `customers_id` int(10) unsigned NOT NULL,
  `verefied` int(10) unsigned NOT NULL,
  KEY `FK_verified_customer_1` (`customers_id`),
  CONSTRAINT `FK_verified_customer_1` FOREIGN KEY (`customers_id`) REFERENCES `customers` (`customers_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;