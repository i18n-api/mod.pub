CREATE TABLE `webpushEndpointHost` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,`host` VARBINARY(255) NOT NULL,PRIMARY KEY (`id`),UNIQUE KEY `host` (`host`)
);