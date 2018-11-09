CREATE DATABASE IF NOT EXISTS `app`;

USE `app`;

DROP TABLE IF EXISTS `client`;

CREATE TABLE `client` (
  `app_id` int(20) NOT NULL,
  `client_id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `intra` varchar(500) DEFAULT NULL,
  `status` int(4) NOT NULL,
  `client_secret` varchar(255) NOT NULL,
  `access_token_validity_seconds` int(11) NOT NULL,
  `refresh_token_validity_seconds` int(11) NOT NULL,
  `additional_info` varchar(500) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


insert into client (app_id,client_id,name,intra,status,client_secret,access_token_validity_seconds,refresh_token_validity_seconds,additional_info,create_time,update_time) values(1,'1_1_8eda6533c616a1ffdf57154550e87c83','test','test app',1,'{"CLIENT":"test_secret"}',604800,2592000,'{}',now(),now());

DROP TABLE IF EXISTS `certificates`;

CREATE TABLE `certificates`(
  `appid` int(20) NOT NULL ,
  `platform` varchar(10) NOT NULL ,
  `password` varchar(20) NOT NULL ,
  `connum` int(11),
  `data` blob NOT NUll,
  PRIMARY key (`appid`,`platform`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;