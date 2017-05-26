
SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `userid` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `name` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `registerDateTime` datetime DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


