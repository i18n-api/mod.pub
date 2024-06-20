CREATE TABLE `payBill` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,`uid` BIGINT UNSIGNED NOT NULL,`n` BIGINT NOT NULL,`cid` SMALLINT UNSIGNED NOT NULL COMMENT 'category,大分类，比如 充值',`kid` BIGINT UNSIGNED NOT NULL COMMENT 'kind,小分类，比如支付宝',`rid` BIGINT UNSIGNED NOT NULL COMMENT 'relevant,关联id，比如订单id',`day` MEDIUMINT NOT NULL,PRIMARY KEY (`id`),KEY `udckr` (`uid`,`day`,`cid`,`kid`,`rid`)
);