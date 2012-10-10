DROP TABLE IF EXISTS `dbinventory`.`ratings`;
CREATE TABLE  `dbinventory`.`ratings` (
  `customer_id` int(10) unsigned NOT NULL,
  `rating` int(10) unsigned DEFAULT NULL,
  KEY `FK_ratings_1` (`customer_id`),
  CONSTRAINT `FK_ratings_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customers_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;