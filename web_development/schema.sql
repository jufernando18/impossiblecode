-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'user_history'
-- 
-- ---

DROP TABLE IF EXISTS `user_history`;
		
CREATE TABLE `user_history` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `id_user_info` BIGINT NOT NULL,
  `username` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `password_hash` VARCHAR(300) NOT NULL,
  `token_secret` VARCHAR(300) NOT NULL,
  `timestamp` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'user_log'
-- 
-- ---

DROP TABLE IF EXISTS `user_log`;
		
CREATE TABLE `user_log` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `id_user_info` BIGINT NOT NULL,
  `client_ip` VARCHAR(16) NOT NULL,
  `timestamp` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'user_info'
-- 
-- ---

DROP TABLE IF EXISTS `user_info`;
		
CREATE TABLE `user_info` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `password_hash` VARCHAR(300) NOT NULL,
  `token_secret` VARCHAR(300) NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'user_role'
-- 
-- ---

DROP TABLE IF EXISTS `user_role`;
		
CREATE TABLE `user_role` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `id_user_info` BIGINT NOT NULL,
  `id_role` BIGINT NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'role'
-- 
-- ---

DROP TABLE IF EXISTS `role`;
		
CREATE TABLE `role` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `user_history` ADD FOREIGN KEY (id_user_info) REFERENCES `user_info` (`id`);
ALTER TABLE `user_log` ADD FOREIGN KEY (id_user_info) REFERENCES `user_info` (`id`);
ALTER TABLE `user_role` ADD FOREIGN KEY (id_user_info) REFERENCES `user_info` (`id`);
ALTER TABLE `user_role` ADD FOREIGN KEY (id_role) REFERENCES `role` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `user_history` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `user_log` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `user_info` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `user_role` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `role` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `user_history` (`id`,`id_user_info`,`username`,`email`,`password_hash`,`token_secret`,`timestamp`) VALUES
-- ('','','','','','','');
-- INSERT INTO `user_log` (`id`,`id_user_info`,`client_ip`,`timestamp`) VALUES
-- ('','','','');
-- INSERT INTO `user_info` (`id`,`username`,`email`,`password_hash`,`token_secret`) VALUES
-- ('','','','','');
-- INSERT INTO `user_role` (`id`,`id_user_info`,`id_role`) VALUES
-- ('','','');
-- INSERT INTO `role` (`id`,`name`) VALUES
-- ('','');