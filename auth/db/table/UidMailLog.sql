CREATE TABLE `authUidMailLog` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,`uid` BIGINT UNSIGNED NOT NULL,`authMailId` BIGINT UNSIGNED NOT NULL,`hostId` BIGINT UNSIGNED NOT NULL,`dts` BIGINT UNSIGNED NOT NULL,PRIMARY KEY (`id`),KEY `unique` (`uid`,`hostId`)
);