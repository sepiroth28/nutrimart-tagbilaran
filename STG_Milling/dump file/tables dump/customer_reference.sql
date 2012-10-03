DROP TABLE IF EXISTS `dbinventory`.`cutomer_reference`;
CREATE TABLE  `dbinventory`.`cutomer_reference` (
  `address` varchar(120) NOT NULL,
  `reference` varchar(100) NOT NULL,
  `work` varchar(50) NOT NULL,
  `store_name` varchar(50) NOT NULL,
  `cus_id` int(10) unsigned NOT NULL,
  KEY `FK_cutomer_reference_1` (`cus_id`),
  CONSTRAINT `FK_cutomer_reference_1` FOREIGN KEY (`cus_id`) REFERENCES `customers` (`customers_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;