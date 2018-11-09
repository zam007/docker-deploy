CREATE DATABASE IF NOT EXISTS `sync`;

USE `sync`;

DROP TABLE IF EXISTS `contact`;

CREATE TABLE `contact`(
    `target_id` varchar(50) BINARY  NOT NULL,
    `item_id` int(20) NOT NULL,
    `object_id` varchar(35) BINARY  NOT NULL,
    `attributes` varchar(2048) DEFAULT NULL,
    PRIMARY KEY(`target_id`,`object_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `group_list`;

CREATE TABLE `group_list`(
    `target_id` varchar(50) BINARY  NOT NULL,
    `item_id` int(20) NOT NULL,
    `object_id` varchar(35) BINARY  NOT NULL,
    `attributes` varchar(2048) DEFAULT NULL,
    PRIMARY KEY(`target_id`,`object_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `group_users`;

CREATE TABLE `group_users`(
    `target_id` varchar(50) BINARY  NOT NULL,
    `item_id` int(20) NOT NULL,
    `object_id` varchar(35) BINARY  NOT NULL,
    `attributes` varchar(2048) DEFAULT NULL,
    PRIMARY KEY(`target_id`,`object_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `conversation`;

CREATE TABLE `conversation`(
    `target_id` varchar(50)  BINARY  NOT NULL,
    `item_id` int(20) NOT NULL,
    `object_id` varchar(35)  BINARY  NOT NULL,
    `attributes` varchar(2048) DEFAULT NULL,
    PRIMARY KEY(`target_id`,`object_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `conv_list`;

CREATE TABLE `conv_list`(
    `target_id` varchar(50) BINARY  NOT NULL,
    `item_id` int(20) NOT NULL,
    `object_id` varchar(35) BINARY  NOT NULL,
    `attributes` varchar(2048) DEFAULT NULL,
    PRIMARY KEY(`target_id`,`object_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `favorite_list`;

CREATE TABLE `favorite_list`(
    `target_id` varchar(50) BINARY  NOT NULL,
    `item_id` int(20) NOT NULL,
    `object_id` varchar(35) BINARY  NOT NULL,
    `attributes` varchar(2048) DEFAULT NULL,
    PRIMARY KEY(`target_id`,`object_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
