DROP TABLE IF EXISTS `dbinventory`.`price_rule`;
CREATE TABLE  `dbinventory`.`price_rule` (
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;