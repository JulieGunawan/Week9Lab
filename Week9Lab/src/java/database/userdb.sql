DROP SCHEMA IF EXISTS `userdb`;
CREATE SCHEMA IF NOT EXISTS `userdb` DEFAULT CHARACTER SET latin1;
USE `userdb`;

-- -----------------------------------------------------
-- Table `userdb`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `userdb`.`role` (
  `role_id` INT(11) NOT NULL,
  `role_name` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`role_id`));

-- -----------------------------------------------------
-- Table `userdb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `userdb`.`user` (
  `email` VARCHAR(40) NOT NULL,
  `active` TINYINT(1) NOT NULL DEFAULT '1',
  `first_name` VARCHAR(20) NOT NULL,
  `last_name` VARCHAR(20) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  `role` INT(11) NOT NULL,
  PRIMARY KEY (`email`),
  CONSTRAINT `fk_user_role`
    FOREIGN KEY (`role`)
    REFERENCES `userdb`.`role` (`role_id`));


INSERT INTO `role` VALUES (1, 'system admin');
INSERT INTO `role` VALUES (2, 'regular user');
INSERT INTO `role` VALUES (3, 'company admin');


INSERT INTO `user` (`email`,`active`,`first_name`,`last_name`,`password`,`role`)
	VALUES ('cprg352+admin@gmail.com', true, 'Admin','Admin', 'password', 1);
INSERT INTO `user` (`email`,`active`,`first_name`,`last_name`,`password`,`role`)
	VALUES ('cprg352+admin2@gmail.com', true, 'Admin2','Admin2', 'password', 3);
INSERT INTO `user` (`email`,`active`,`first_name`,`last_name`,`password`,`role`)
	VALUES ('cprg352+anne@gmail.com', true, 'Anne','Annerson', 'password', 2);
INSERT INTO `user` (`email`,`active`,`first_name`,`last_name`,`password`,`role`)
	VALUES ('cprg352+barb@gmail.com', true, 'Barb','Barber', 'password', 2);
