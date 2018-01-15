-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema www
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `www` ;

-- -----------------------------------------------------
-- Schema www
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `www` DEFAULT CHARACTER SET utf8 ;
USE `www` ;

-- -----------------------------------------------------
-- Table `www`.`trip_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `www`.`trip_type` ;

CREATE TABLE IF NOT EXISTS `www`.`trip_type` (
  `trip_type_code` INT(11) NOT NULL AUTO_INCREMENT,
  `trip_type_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`trip_type_code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `www`.`employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `www`.`employee` ;

CREATE TABLE IF NOT EXISTS `www`.`employee` (
  `employee_id` INT(11) NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `nickname` VARCHAR(45) NOT NULL,
  `mobile_phone` VARCHAR(20) NULL,
  `home_phone` VARCHAR(20) NULL,
  `availability_notes` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`employee_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `www`.`can_guide`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `www`.`can_guide` ;

CREATE TABLE IF NOT EXISTS `www`.`can_guide` (
  `employee_id` INT(11) NOT NULL,
  `trip_type_code` INT(11) NOT NULL,
  INDEX `trip_type_code_idx` (`trip_type_code` ASC),
  INDEX `employee_id_idx` (`employee_id` ASC),
  PRIMARY KEY (`employee_id`, `trip_type_code`),
  CONSTRAINT `ct_trip_type_code`
    FOREIGN KEY (`trip_type_code`)
    REFERENCES `www`.`trip_type` (`trip_type_code`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `ce_employee_id`
    FOREIGN KEY (`employee_id`)
    REFERENCES `www`.`employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `www`.`role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `www`.`role` ;

CREATE TABLE IF NOT EXISTS `www`.`role` (
  `role_code` INT(11) NOT NULL AUTO_INCREMENT,
  `role_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`role_code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `www`.`plays_role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `www`.`plays_role` ;

CREATE TABLE IF NOT EXISTS `www`.`plays_role` (
  `employee_id` INT(11) NOT NULL,
  `role_code` INT(11) NOT NULL,
  INDEX `employee_id_idx` (`employee_id` ASC),
  INDEX `role_code_idx` (`role_code` ASC),
  PRIMARY KEY (`employee_id`, `role_code`),
  CONSTRAINT `pe_employee_id`
    FOREIGN KEY (`employee_id`)
    REFERENCES `www`.`employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `pr_role_code`
    FOREIGN KEY (`role_code`)
    REFERENCES `www`.`role` (`role_code`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `www`.`destination`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `www`.`destination` ;

CREATE TABLE IF NOT EXISTS `www`.`destination` (
  `destination_code` INT(11) NOT NULL AUTO_INCREMENT,
  `destination_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`destination_code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `www`.`gathering_point`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `www`.`gathering_point` ;

CREATE TABLE IF NOT EXISTS `www`.`gathering_point` (
  `gathering_point_id` INT(11) NOT NULL AUTO_INCREMENT,
  `gathering_point_description` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`gathering_point_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `www`.`trip`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `www`.`trip` ;

CREATE TABLE IF NOT EXISTS `www`.`trip` (
  `trip_number` INT(11) NOT NULL,
  `trip_date` DATE NOT NULL,
  `capacity` INT(11) NOT NULL,
  `latest_guest_arrival_time` TIME NOT NULL,
  `departure_time` TIME NOT NULL,
  `estimated_return_time` TIME NULL,
  `destination_code` INT(11) NOT NULL,
  `trip_type_code` INT(11) NOT NULL,
  `guide_employee_id` INT(11) NOT NULL,
  `gear_employee_id` INT(11) NULL,
  `gathering_point_id` INT(11) NOT NULL,
  PRIMARY KEY (`trip_number`),
  INDEX `trip_type_code_idx` (`trip_type_code` ASC),
  INDEX `guide_employee_id_idx` (`guide_employee_id` ASC),
  INDEX `gear_employee_id_idx` (`gear_employee_id` ASC),
  INDEX `distination_code_idx` (`destination_code` ASC),
  INDEX `gathering_point_id_idx` (`gathering_point_id` ASC),
  CONSTRAINT `tt_trip_type_code`
    FOREIGN KEY (`trip_type_code`)
    REFERENCES `www`.`trip_type` (`trip_type_code`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `te_guide_employee_id`
    FOREIGN KEY (`guide_employee_id`)
    REFERENCES `www`.`employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `te_gear_employee_id`
    FOREIGN KEY (`gear_employee_id`)
    REFERENCES `www`.`employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `td_distination_code`
    FOREIGN KEY (`destination_code`)
    REFERENCES `www`.`destination` (`destination_code`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `tg_gathering_point_id`
    FOREIGN KEY (`gathering_point_id`)
    REFERENCES `www`.`gathering_point` (`gathering_point_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `www`.`experience`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `www`.`experience` ;

CREATE TABLE IF NOT EXISTS `www`.`experience` (
  `experience_code` INT(11) NOT NULL AUTO_INCREMENT,
  `experience_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`experience_code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `www`.`guest`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `www`.`guest` ;

CREATE TABLE IF NOT EXISTS `www`.`guest` (
  `guest_id` INT(11) NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `age` INT(11) NOT NULL,
  `weight` INT(11) NOT NULL,
  `isSwimmer` TINYINT(1) NOT NULL,
  `mobile_phone` VARCHAR(20) NULL,
  `experience_code` INT(11) NOT NULL,
  PRIMARY KEY (`guest_id`),
  INDEX `experience_code_idx` (`experience_code` ASC),
  CONSTRAINT `ge_experience_code`
    FOREIGN KEY (`experience_code`)
    REFERENCES `www`.`experience` (`experience_code`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `www`.`reservation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `www`.`reservation` ;

CREATE TABLE IF NOT EXISTS `www`.`reservation` (
  `trip_number` INT(11) NOT NULL,
  `guest_id` INT(11) NOT NULL,
  INDEX `trip_number_idx` (`trip_number` ASC),
  INDEX `guest_id_idx` (`guest_id` ASC),
  PRIMARY KEY (`trip_number`, `guest_id`),
  CONSTRAINT `rt_trip_number`
    FOREIGN KEY (`trip_number`)
    REFERENCES `www`.`trip` (`trip_number`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `rg_guest_id`
    FOREIGN KEY (`guest_id`)
    REFERENCES `www`.`guest` (`guest_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- TRUNCATE all tables;
-- SET FOREIGN_KEY_CHECKS=0;
-- TRUNCATE TABLE reservation;
-- TRUNCATE TABLE guest;
-- TRUNCATE TABLE experience;
-- TRUNCATE TABLE trip;
-- TRUNCATE TABLE destination;
-- TRUNCATE TABLE gathering_point;
-- TRUNCATE TABLE plays_role;
-- TRUNCATE TABLE can_guide;
-- TRUNCATE TABLE employee;
-- TRUNCATE TABLE role;
-- TRUNCATE TABLE trip_type;
-- SET FOREIGN_KEY_CHECKS=1;


-- INSERT INTO `www`.`trip_type` (`trip_type_code`, `trip_type_name`) VALUES ('trip_type_code', 'trip_type_name');
INSERT INTO `www`.`trip_type` (`trip_type_code`, `trip_type_name`) VALUES ('2', 'Canoe');
INSERT INTO `www`.`trip_type` (`trip_type_code`, `trip_type_name`) VALUES ('1', 'Kayak');
INSERT INTO `www`.`trip_type` (`trip_type_code`, `trip_type_name`) VALUES ('3', 'Raft');

-- INSERT INTO `www`.`employee` (`employee_id`, `first_name`, `last_name`, `nickname`, `mobile_phone`, `home_phone`, `availability_notes`) VALUES ('employee_id', 'first_name', 'last_name', 'nickname', 'mobile_phone', 'home_phone', 'availability_notes');
INSERT INTO `www`.`employee` (`employee_id`, `first_name`, `last_name`, `nickname`, `mobile_phone`, `home_phone`, `availability_notes`) VALUES ('1', 'Wilma C.', 'Carson', 'Wilma', '414-555-1234', '414-555-9876', 'Year round, full-time');
INSERT INTO `www`.`employee` (`employee_id`, `first_name`, `last_name`, `nickname`, `mobile_phone`, `home_phone`, `availability_notes`) VALUES ('2', 'Walter C.', 'Carson', 'Bud', '414-555-1235', '414-555-9876', 'Year round, full-time, except for deer hunting season');
INSERT INTO `www`.`employee` (`employee_id`, `first_name`, `last_name`, `nickname`, `mobile_phone`, `home_phone`, `availability_notes`) VALUES ('3', 'Anne B.', 'Schultz', 'Annie', '414-555-1266', '414-555-2121', 'Year round, full-time, except for August vacation');
INSERT INTO `www`.`employee` (`employee_id`, `first_name`, `last_name`, `nickname`, `mobile_phone`, `home_phone`, `availability_notes`) VALUES ('4', 'Joshua', 'Green', 'Josh', '414-555-1268', NULL, 'Summers, full-time');
INSERT INTO `www`.`employee` (`employee_id`, `first_name`, `last_name`, `nickname`, `mobile_phone`, `home_phone`, `availability_notes`) VALUES ('5', 'William R.', 'Wagner  III', 'Billy', '414-555-1271', '414-555-3259', 'Summers, full-time, returns to school on August 19th');
INSERT INTO `www`.`employee` (`employee_id`, `first_name`, `last_name`, `nickname`, `mobile_phone`, `home_phone`, `availability_notes`) VALUES ('6', 'Constance', 'Simms', 'Summer', '414-555-1288', NULL, 'Year round, part-time, as needed');
INSERT INTO `www`.`employee` (`employee_id`, `first_name`, `last_name`, `nickname`, `mobile_phone`, `home_phone`, `availability_notes`) VALUES ('7', 'Blair Q.', 'McArthur', 'Blinky', '414-555-1289', '414-555-2121', 'Year round, full-time, except for May vacation');

-- INSERT INTO `www`.`can_guide` (`employee_id`, `trip_type_code`) VALUES ('employee_id', 'trip_type_code');
INSERT INTO `www`.`can_guide` (`employee_id`, `trip_type_code`) VALUES ('1', '1');
INSERT INTO `www`.`can_guide` (`employee_id`, `trip_type_code`) VALUES ('1', '2');
INSERT INTO `www`.`can_guide` (`employee_id`, `trip_type_code`) VALUES ('2', '1');
INSERT INTO `www`.`can_guide` (`employee_id`, `trip_type_code`) VALUES ('2', '2');
INSERT INTO `www`.`can_guide` (`employee_id`, `trip_type_code`) VALUES ('3', '1');
INSERT INTO `www`.`can_guide` (`employee_id`, `trip_type_code`) VALUES ('4', '2');
INSERT INTO `www`.`can_guide` (`employee_id`, `trip_type_code`) VALUES ('7', '2');

-- INSERT INTO `www`.`role` (`role_code`, `role_name`) VALUES ('role_code', 'role_name');
INSERT INTO `www`.`role` (`role_code`, `role_name`) VALUES ('3', 'Gear');
INSERT INTO `www`.`role` (`role_code`, `role_name`) VALUES ('2', 'Guide');
INSERT INTO `www`.`role` (`role_code`, `role_name`) VALUES ('1', 'Reservations');

-- INSERT INTO `www`.`plays_role` (`employee_id`, `role_code`) VALUES ('employee_id', 'role_code');
INSERT INTO `www`.`plays_role` (`employee_id`, `role_code`) VALUES ('1', '1');
INSERT INTO `www`.`plays_role` (`employee_id`, `role_code`) VALUES ('1', '2');
INSERT INTO `www`.`plays_role` (`employee_id`, `role_code`) VALUES ('1', '3');
INSERT INTO `www`.`plays_role` (`employee_id`, `role_code`) VALUES ('2', '2');
INSERT INTO `www`.`plays_role` (`employee_id`, `role_code`) VALUES ('2', '3');
INSERT INTO `www`.`plays_role` (`employee_id`, `role_code`) VALUES ('3', '1');
INSERT INTO `www`.`plays_role` (`employee_id`, `role_code`) VALUES ('3', '2');
INSERT INTO `www`.`plays_role` (`employee_id`, `role_code`) VALUES ('3', '3');
INSERT INTO `www`.`plays_role` (`employee_id`, `role_code`) VALUES ('4', '2');
INSERT INTO `www`.`plays_role` (`employee_id`, `role_code`) VALUES ('4', '3');
INSERT INTO `www`.`plays_role` (`employee_id`, `role_code`) VALUES ('5', '3');
INSERT INTO `www`.`plays_role` (`employee_id`, `role_code`) VALUES ('6', '1');
INSERT INTO `www`.`plays_role` (`employee_id`, `role_code`) VALUES ('6', '3');
INSERT INTO `www`.`plays_role` (`employee_id`, `role_code`) VALUES ('7', '2');
INSERT INTO `www`.`plays_role` (`employee_id`, `role_code`) VALUES ('7', '3');

-- INSERT INTO `www`.`destination` (`destination_code`, `destination_name`) VALUES ('destination_code', 'destination_name');
INSERT INTO `www`.`destination` (`destination_code`, `destination_name`) VALUES ('1', 'Lower Wisconsin River');
INSERT INTO `www`.`destination` (`destination_code`, `destination_name`) VALUES ('2', 'Upper Wisconsin River');
INSERT INTO `www`.`destination` (`destination_code`, `destination_name`) VALUES ('3', 'Wolf River');

-- INSERT INTO `www`.`gathering_point` (`gathering_point_id`, `gathering_point_description`) VALUES ('gathering_point_id', 'gathering_point_description');
INSERT INTO `www`.`gathering_point` (`gathering_point_id`, `gathering_point_description`) VALUES ('2', 'Omar\'s Live Bait and Bridal Salon; 3421 Highway KZ; Casino Springs; WI 54776');
INSERT INTO `www`.`gathering_point` (`gathering_point_id`, `gathering_point_description`) VALUES ('1', 'River Valley High School (Parking Lot); 660 Varsity Blvd; Spring Green; WI 53588');
INSERT INTO `www`.`gathering_point` (`gathering_point_id`, `gathering_point_description`) VALUES ('3', 'VFW #95001; 200 W. Main Street; Littleton; WI 55884');

-- INSERT INTO `www`.`trip` (`trip_number`, `trip_date`, `capacity`, `latest_guest_arrival_time`, `departure_time`, `estimated_return_time`, `destination_code`, `trip_type_code`, `guide_employee_id`, `gear_employee_id`, `gathering_point_id`) VALUES ('trip_number', 'trip_date', 'capacity', 'latest_guest_arrival_time', 'departure_time', 'estimated_return_time', 'destination_code', 'trip_type_code', 'guide_employee_id', 'gear_employee_id', 'gathering_point_id');
INSERT INTO `www`.`trip` (`trip_number`, `trip_date`, `capacity`, `latest_guest_arrival_time`, `departure_time`, `estimated_return_time`, `destination_code`, `trip_type_code`, `guide_employee_id`, `gear_employee_id`, `gathering_point_id`) VALUES ('561', '2014-08-02', '10', '07:30:00', '08:15:00', '16:00:00', '1', '2', '4', NULL, '1');
INSERT INTO `www`.`trip` (`trip_number`, `trip_date`, `capacity`, `latest_guest_arrival_time`, `departure_time`, `estimated_return_time`, `destination_code`, `trip_type_code`, `guide_employee_id`, `gear_employee_id`, `gathering_point_id`) VALUES ('562', '2014-08-02', '10', '07:30:00', '08:15:00', '16:00:00', '1', '1', '3', NULL, '1');
INSERT INTO `www`.`trip` (`trip_number`, `trip_date`, `capacity`, `latest_guest_arrival_time`, `departure_time`, `estimated_return_time`, `destination_code`, `trip_type_code`, `guide_employee_id`, `gear_employee_id`, `gathering_point_id`) VALUES ('563', '2014-08-09', '10', '07:30:00', '08:15:00', '16:00:00', '1', '2', '4', NULL, '1');
INSERT INTO `www`.`trip` (`trip_number`, `trip_date`, `capacity`, `latest_guest_arrival_time`, `departure_time`, `estimated_return_time`, `destination_code`, `trip_type_code`, `guide_employee_id`, `gear_employee_id`, `gathering_point_id`) VALUES ('564', '2014-08-09', '10', '07:30:00', '08:15:00', '16:00:00', '1', '1', '3', NULL, '1');
INSERT INTO `www`.`trip` (`trip_number`, `trip_date`, `capacity`, `latest_guest_arrival_time`, `departure_time`, `estimated_return_time`, `destination_code`, `trip_type_code`, `guide_employee_id`, `gear_employee_id`, `gathering_point_id`) VALUES ('565', '2014-08-16', '10', '07:30:00', '08:15:00', '16:00:00', '1', '2', '4', NULL, '1');
INSERT INTO `www`.`trip` (`trip_number`, `trip_date`, `capacity`, `latest_guest_arrival_time`, `departure_time`, `estimated_return_time`, `destination_code`, `trip_type_code`, `guide_employee_id`, `gear_employee_id`, `gathering_point_id`) VALUES ('566', '2014-08-16', '10', '07:30:00', '08:15:00', '16:00:00', '1', '1', '3', NULL, '1');
INSERT INTO `www`.`trip` (`trip_number`, `trip_date`, `capacity`, `latest_guest_arrival_time`, `departure_time`, `estimated_return_time`, `destination_code`, `trip_type_code`, `guide_employee_id`, `gear_employee_id`, `gathering_point_id`) VALUES ('567', '2014-08-23', '10', '07:30:00', '08:15:00', '16:00:00', '1', '2', '4', NULL, '1');
INSERT INTO `www`.`trip` (`trip_number`, `trip_date`, `capacity`, `latest_guest_arrival_time`, `departure_time`, `estimated_return_time`, `destination_code`, `trip_type_code`, `guide_employee_id`, `gear_employee_id`, `gathering_point_id`) VALUES ('568', '2014-08-23', '10', '07:30:00', '08:15:00', '16:00:00', '1', '1', '3', NULL, '1');
INSERT INTO `www`.`trip` (`trip_number`, `trip_date`, `capacity`, `latest_guest_arrival_time`, `departure_time`, `estimated_return_time`, `destination_code`, `trip_type_code`, `guide_employee_id`, `gear_employee_id`, `gathering_point_id`) VALUES ('569', '2014-08-30', '10', '07:30:00', '08:15:00', '16:00:00', '1', '2', '4', NULL, '1');
INSERT INTO `www`.`trip` (`trip_number`, `trip_date`, `capacity`, `latest_guest_arrival_time`, `departure_time`, `estimated_return_time`, `destination_code`, `trip_type_code`, `guide_employee_id`, `gear_employee_id`, `gathering_point_id`) VALUES ('570', '2014-08-30', '10', '07:30:00', '08:15:00', '16:00:00', '1', '1', '3', NULL, '1');
INSERT INTO `www`.`trip` (`trip_number`, `trip_date`, `capacity`, `latest_guest_arrival_time`, `departure_time`, `estimated_return_time`, `destination_code`, `trip_type_code`, `guide_employee_id`, `gear_employee_id`, `gathering_point_id`) VALUES ('571', '2014-08-02', '7', '07:30:00', '08:15:00', '16:00:00', '2', '1', '2', NULL, '2');
INSERT INTO `www`.`trip` (`trip_number`, `trip_date`, `capacity`, `latest_guest_arrival_time`, `departure_time`, `estimated_return_time`, `destination_code`, `trip_type_code`, `guide_employee_id`, `gear_employee_id`, `gathering_point_id`) VALUES ('572', '2014-08-09', '7', '07:30:00', '08:15:00', '16:00:00', '2', '1', '2', NULL, '2');
INSERT INTO `www`.`trip` (`trip_number`, `trip_date`, `capacity`, `latest_guest_arrival_time`, `departure_time`, `estimated_return_time`, `destination_code`, `trip_type_code`, `guide_employee_id`, `gear_employee_id`, `gathering_point_id`) VALUES ('573', '2014-08-16', '7', '07:30:00', '08:15:00', '16:00:00', '2', '1', '2', NULL, '2');
INSERT INTO `www`.`trip` (`trip_number`, `trip_date`, `capacity`, `latest_guest_arrival_time`, `departure_time`, `estimated_return_time`, `destination_code`, `trip_type_code`, `guide_employee_id`, `gear_employee_id`, `gathering_point_id`) VALUES ('574', '2014-08-23', '7', '07:30:00', '08:15:00', '16:00:00', '2', '1', '2', NULL, '2');
INSERT INTO `www`.`trip` (`trip_number`, `trip_date`, `capacity`, `latest_guest_arrival_time`, `departure_time`, `estimated_return_time`, `destination_code`, `trip_type_code`, `guide_employee_id`, `gear_employee_id`, `gathering_point_id`) VALUES ('575', '2014-08-30', '7', '07:30:00', '08:15:00', '16:00:00', '2', '1', '2', NULL, '2');
INSERT INTO `www`.`trip` (`trip_number`, `trip_date`, `capacity`, `latest_guest_arrival_time`, `departure_time`, `estimated_return_time`, `destination_code`, `trip_type_code`, `guide_employee_id`, `gear_employee_id`, `gathering_point_id`) VALUES ('576', '2014-08-02', '10', '07:30:00', '08:15:00', '16:00:00', '3', '1', '1', NULL, '3');
INSERT INTO `www`.`trip` (`trip_number`, `trip_date`, `capacity`, `latest_guest_arrival_time`, `departure_time`, `estimated_return_time`, `destination_code`, `trip_type_code`, `guide_employee_id`, `gear_employee_id`, `gathering_point_id`) VALUES ('577', '2014-08-02', '10', '07:30:00', '08:15:00', '16:00:00', '3', '2', '7', NULL, '3');
INSERT INTO `www`.`trip` (`trip_number`, `trip_date`, `capacity`, `latest_guest_arrival_time`, `departure_time`, `estimated_return_time`, `destination_code`, `trip_type_code`, `guide_employee_id`, `gear_employee_id`, `gathering_point_id`) VALUES ('578', '2014-08-09', '10', '07:30:00', '08:15:00', '16:00:00', '3', '1', '1', NULL, '3');
INSERT INTO `www`.`trip` (`trip_number`, `trip_date`, `capacity`, `latest_guest_arrival_time`, `departure_time`, `estimated_return_time`, `destination_code`, `trip_type_code`, `guide_employee_id`, `gear_employee_id`, `gathering_point_id`) VALUES ('579', '2014-08-09', '10', '07:30:00', '08:15:00', '16:00:00', '3', '2', '7', NULL, '3');
INSERT INTO `www`.`trip` (`trip_number`, `trip_date`, `capacity`, `latest_guest_arrival_time`, `departure_time`, `estimated_return_time`, `destination_code`, `trip_type_code`, `guide_employee_id`, `gear_employee_id`, `gathering_point_id`) VALUES ('580', '2014-08-16', '10', '07:30:00', '08:15:00', '16:00:00', '3', '1', '1', NULL, '3');
INSERT INTO `www`.`trip` (`trip_number`, `trip_date`, `capacity`, `latest_guest_arrival_time`, `departure_time`, `estimated_return_time`, `destination_code`, `trip_type_code`, `guide_employee_id`, `gear_employee_id`, `gathering_point_id`) VALUES ('581', '2014-08-16', '10', '07:30:00', '08:15:00', '16:00:00', '3', '2', '7', NULL, '3');
INSERT INTO `www`.`trip` (`trip_number`, `trip_date`, `capacity`, `latest_guest_arrival_time`, `departure_time`, `estimated_return_time`, `destination_code`, `trip_type_code`, `guide_employee_id`, `gear_employee_id`, `gathering_point_id`) VALUES ('582', '2014-08-23', '10', '07:30:00', '08:15:00', '16:00:00', '3', '1', '1', NULL, '3');
INSERT INTO `www`.`trip` (`trip_number`, `trip_date`, `capacity`, `latest_guest_arrival_time`, `departure_time`, `estimated_return_time`, `destination_code`, `trip_type_code`, `guide_employee_id`, `gear_employee_id`, `gathering_point_id`) VALUES ('583', '2014-08-23', '10', '07:30:00', '08:15:00', '16:00:00', '3', '2', '7', NULL, '3');
INSERT INTO `www`.`trip` (`trip_number`, `trip_date`, `capacity`, `latest_guest_arrival_time`, `departure_time`, `estimated_return_time`, `destination_code`, `trip_type_code`, `guide_employee_id`, `gear_employee_id`, `gathering_point_id`) VALUES ('584', '2014-08-30', '10', '07:30:00', '08:15:00', '16:00:00', '3', '1', '1', NULL, '3');
INSERT INTO `www`.`trip` (`trip_number`, `trip_date`, `capacity`, `latest_guest_arrival_time`, `departure_time`, `estimated_return_time`, `destination_code`, `trip_type_code`, `guide_employee_id`, `gear_employee_id`, `gathering_point_id`) VALUES ('585', '2014-08-30', '10', '07:30:00', '08:15:00', '16:00:00', '3', '2', '7', NULL, '3');

-- INSERT INTO `www`.`experience` (`experience_code`, `experience_name`) VALUES ('experience_code', 'experience_name');
INSERT INTO `www`.`experience` (`experience_code`, `experience_name`) VALUES ('3', 'Expert');
INSERT INTO `www`.`experience` (`experience_code`, `experience_name`) VALUES ('4', 'Intermediate');
INSERT INTO `www`.`experience` (`experience_code`, `experience_name`) VALUES ('1', 'None');
INSERT INTO `www`.`experience` (`experience_code`, `experience_name`) VALUES ('2', 'Novice');

-- INSERT INTO `www`.`guest` (`guest_id`, `first_name`, `last_name`, `age`, `weight`, `isSwimmer`, `mobile_phone`, `experience_code`) VALUES ('guest_id', 'first_name', 'last_name', 'age', 'weight', 'isSwimmer', 'mobile_phone', 'experience_code');
INSERT INTO `www`.`guest` (`guest_id`, `first_name`, `last_name`, `age`, `weight`, `isSwimmer`, `mobile_phone`, `experience_code`) VALUES ('1', 'Margie', 'Samuels', '31', '130', '1', '847-555-5201', '2');
INSERT INTO `www`.`guest` (`guest_id`, `first_name`, `last_name`, `age`, `weight`, `isSwimmer`, `mobile_phone`, `experience_code`) VALUES ('2', 'Bart', 'Samuels', '44', '195', '1', NULL, '2');
INSERT INTO `www`.`guest` (`guest_id`, `first_name`, `last_name`, `age`, `weight`, `isSwimmer`, `mobile_phone`, `experience_code`) VALUES ('3', 'Lilly', 'Samuels', '18', '101', '1', NULL, '2');
INSERT INTO `www`.`guest` (`guest_id`, `first_name`, `last_name`, `age`, `weight`, `isSwimmer`, `mobile_phone`, `experience_code`) VALUES ('4', 'Bart Jr.', 'Samuels', '6', '60', '0', NULL, '1');
INSERT INTO `www`.`guest` (`guest_id`, `first_name`, `last_name`, `age`, `weight`, `isSwimmer`, `mobile_phone`, `experience_code`) VALUES ('5', 'George', 'Fogerty', '28', '160', '1', '414-555-7654', '3');
INSERT INTO `www`.`guest` (`guest_id`, `first_name`, `last_name`, `age`, `weight`, `isSwimmer`, `mobile_phone`, `experience_code`) VALUES ('6', 'Bruce', 'Simmons', '5', '150', '1', NULL, '3');
INSERT INTO `www`.`guest` (`guest_id`, `first_name`, `last_name`, `age`, `weight`, `isSwimmer`, `mobile_phone`, `experience_code`) VALUES ('9', 'Marion', 'Glaston', '61', '135', '1', '815-555-4453', '2');
INSERT INTO `www`.`guest` (`guest_id`, `first_name`, `last_name`, `age`, `weight`, `isSwimmer`, `mobile_phone`, `experience_code`) VALUES ('10', 'Marie', 'Glaston', '61', '135', '1', NULL, '2');
INSERT INTO `www`.`guest` (`guest_id`, `first_name`, `last_name`, `age`, `weight`, `isSwimmer`, `mobile_phone`, `experience_code`) VALUES ('11', 'Lamar', 'Lincoln', '25', '175', '0', '414-555-9988', '1');
INSERT INTO `www`.`guest` (`guest_id`, `first_name`, `last_name`, `age`, `weight`, `isSwimmer`, `mobile_phone`, `experience_code`) VALUES ('12', 'Fizza', 'Smith', '25', '115', '1', '414-555-9876', '3');
INSERT INTO `www`.`guest` (`guest_id`, `first_name`, `last_name`, `age`, `weight`, `isSwimmer`, `mobile_phone`, `experience_code`) VALUES ('13', 'Kara', 'Dilworth', '23', '110', '0', '312-555-9876', '2');
INSERT INTO `www`.`guest` (`guest_id`, `first_name`, `last_name`, `age`, `weight`, `isSwimmer`, `mobile_phone`, `experience_code`) VALUES ('14', 'Tyler', 'Worth', '24', '145', '1', '217-555-6776', '4');
INSERT INTO `www`.`guest` (`guest_id`, `first_name`, `last_name`, `age`, `weight`, `isSwimmer`, `mobile_phone`, `experience_code`) VALUES ('15', 'Timmy', 'Zodah', '30', '150', '1', NULL, '1');
INSERT INTO `www`.`guest` (`guest_id`, `first_name`, `last_name`, `age`, `weight`, `isSwimmer`, `mobile_phone`, `experience_code`) VALUES ('16', 'Marie', 'Mickelson', '22', '100', '0', '217-555-1500', '2');
INSERT INTO `www`.`guest` (`guest_id`, `first_name`, `last_name`, `age`, `weight`, `isSwimmer`, `mobile_phone`, `experience_code`) VALUES ('17', 'David', 'Sills', '61', '180', '1', '414-555-0002', '4');
INSERT INTO `www`.`guest` (`guest_id`, `first_name`, `last_name`, `age`, `weight`, `isSwimmer`, `mobile_phone`, `experience_code`) VALUES ('18', 'Daniel', 'Divine', '21', '150', '1', '414-555-3223', '1');
INSERT INTO `www`.`guest` (`guest_id`, `first_name`, `last_name`, `age`, `weight`, `isSwimmer`, `mobile_phone`, `experience_code`) VALUES ('19', 'Madison', 'Ahern', '31', '120', '0', NULL, '1');
INSERT INTO `www`.`guest` (`guest_id`, `first_name`, `last_name`, `age`, `weight`, `isSwimmer`, `mobile_phone`, `experience_code`) VALUES ('20', 'Lacey', 'Sills', '35', '125', '1', NULL, '2');

-- INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('trip_number', 'guest_id');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('562', '1');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('563', '1');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('577', '1');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('583', '1');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('562', '2');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('567', '2');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('577', '2');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('581', '2');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('582', '2');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('583', '2');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('562', '3');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('563', '3');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('577', '3');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('581', '3');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('582', '3');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('583', '3');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('562', '4');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('575', '4');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('577', '4');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('582', '4');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('583', '4');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('562', '5');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('563', '5');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('577', '5');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('580', '5');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('582', '5');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('583', '5');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('562', '6');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('566', '6');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('570', '6');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('575', '6');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('583', '6');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('562', '9');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('563', '9');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('573', '9');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('562', '10');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('563', '10');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('564', '10');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('573', '10');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('574', '10');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('579', '10');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('561', '11');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('562', '11');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('563', '11');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('566', '11');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('569', '11');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('571', '11');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('573', '11');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('576', '11');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('577', '11');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('579', '11');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('561', '12');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('564', '12');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('566', '12');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('567', '12');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('569', '12');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('571', '12');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('576', '12');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('577', '12');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('579', '12');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('582', '12');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('561', '13');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('563', '13');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('569', '13');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('571', '13');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('576', '13');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('577', '13');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('578', '13');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('579', '13');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('561', '14');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('564', '14');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('565', '14');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('569', '14');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('571', '14');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('572', '14');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('576', '14');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('577', '14');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('578', '14');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('579', '14');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('561', '15');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('563', '15');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('565', '15');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('571', '15');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('572', '15');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('576', '15');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('577', '15');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('578', '15');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('579', '15');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('580', '15');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('561', '16');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('564', '16');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('565', '16');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('571', '16');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('572', '16');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('576', '16');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('578', '16');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('579', '16');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('581', '16');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('561', '17');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('565', '17');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('571', '17');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('572', '17');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('574', '17');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('576', '17');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('578', '17');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('581', '17');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('583', '17');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('561', '18');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('564', '18');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('565', '18');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('572', '18');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('576', '18');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('578', '18');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('581', '18');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('584', '18');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('561', '19');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('565', '19');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('566', '19');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('572', '19');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('579', '19');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('561', '20');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('564', '20');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('572', '20');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('579', '20');
INSERT INTO `www`.`reservation` (`trip_number`, `guest_id`) VALUES ('582', '20');
