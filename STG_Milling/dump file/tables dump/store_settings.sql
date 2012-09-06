DROP TABLE IF EXISTS `dbinventory`.`store_settings`;
CREATE TABLE  `dbinventory`.`store_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_name` varchar(45) NOT NULL,
  `activated` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;