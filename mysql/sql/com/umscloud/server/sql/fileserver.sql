CREATE DATABASE IF NOT EXISTS fileserver;

USE fileserver;

DROP TABLE IF EXISTS `fileinfo`;
CREATE TABLE `fileinfo` (
  id varchar(32),
  file_name varchar(255),
  file_suffix varchar(32),
  content_type varchar(128) NOT NULL,
  file_size bigint,
  team_id varchar(20),
  creator varchar(20),
  create_time bigint NOT NULL,
  update_time bigint NOT NULL,
  etag varchar(64) DEFAULT NULL,
  attributes varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
