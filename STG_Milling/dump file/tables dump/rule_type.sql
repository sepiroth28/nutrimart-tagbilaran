DROP TABLE IF EXISTS `dbinventory`.`rule_type`;
CREATE TABLE  `dbinventory`.`rule_type` (
  `ruletype_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`ruletype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;