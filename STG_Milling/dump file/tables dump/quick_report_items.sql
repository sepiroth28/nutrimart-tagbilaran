DROP TABLE IF EXISTS `dbinventory`.`quick_report_items`;
CREATE TABLE  `dbinventory`.`quick_report_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_code` varchar(45) NOT NULL,
  `item_qty` double NOT NULL,
  `item_qty_standing` double NOT NULL,
  `transaction_type` varchar(45) NOT NULL,
  `transaction_date` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;