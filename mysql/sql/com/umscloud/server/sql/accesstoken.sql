CREATE DATABASE IF NOT EXISTS access_token;

USE access_token;

DROP TABLE IF EXISTS `access_token`;
CREATE TABLE access_token (
  uid varchar(20) NOT NULL,
  app_uid varchar(46) NOT NULL,
  app_id varchar(35) NOT NULL,
  access_token varchar(64),
  refresh_token varchar(64),
  screen_name varchar(50),
  PRIMARY KEY (uid,app_uid,app_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;