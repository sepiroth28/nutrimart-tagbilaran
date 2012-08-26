DROP TABLE IF EXISTS `dbinventory`.`pricerule_customer`;
CREATE TABLE  `dbinventory`.`pricerule_customer` (
  `price_id` int(10) unsigned NOT NULL,
  `cutomer_id` varchar(45) NOT NULL,
  KEY `FK_pricerule_customer_1` (`price_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;