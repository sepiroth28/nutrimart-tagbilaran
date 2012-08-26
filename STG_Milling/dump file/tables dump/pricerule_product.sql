DROP TABLE IF EXISTS `dbinventory`.`pricerule_product`;
CREATE TABLE  `dbinventory`.`pricerule_product` (
  `price_id` int(10) unsigned NOT NULL,
  `item_code` varchar(45) NOT NULL,
  KEY `FK_pricerule_product_1` (`price_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;