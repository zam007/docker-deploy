CREATE DATABASE IF NOT EXISTS `message`;

USE `message`;

DROP TABLE IF EXISTS `team_index_0`;

CREATE TABLE `team_index_0`(
    `team_id` varchar(40) NOT NULL,
    `object_id` varchar(16) NOT NULL,
    `msg_type` int(2) NOT NULL,
    `attachment` int(10) DEFAULT 0,
    `update_time` bigint,
    `create_time` bigint,
    PRIMARY KEY (`object_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `team_index_1`;

CREATE TABLE `team_index_1`(
    `team_id` varchar(40) NOT NULL,
    `object_id` varchar(16) NOT NULL,
    `msg_type` int(2) NOT NULL,
    `attachment` int(10) DEFAULT 0,
    `update_time` bigint,
    `create_time` bigint,
    PRIMARY KEY (`object_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `team_index_2`;

CREATE TABLE `team_index_2`(
    `team_id` varchar(40) NOT NULL,
    `object_id` varchar(16) NOT NULL,
    `msg_type` int(2) NOT NULL,
    `attachment` int(10) DEFAULT 0,
    `update_time` bigint,
    `create_time` bigint,
    PRIMARY KEY (`object_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `team_index_3`;

CREATE TABLE `team_index_3`(
    `team_id` varchar(40) NOT NULL,
    `object_id` varchar(16) NOT NULL,
    `msg_type` int(2) NOT NULL,
    `attachment` int(10) DEFAULT 0,
    `update_time` bigint,
    `create_time` bigint,
    PRIMARY KEY (`object_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `content_1801`;
CREATE TABLE `content_1801` (
  `id` varchar(16) BINARY NOT NULL,
  `content` blob DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `content_1802`;
CREATE TABLE `content_1802` (
  `id` varchar(16) BINARY NOT NULL,
  `content` blob DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `content_1803`;
CREATE TABLE `content_1803` (
  `id` varchar(16) BINARY NOT NULL,
  `content` blob DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `content_1804`;
CREATE TABLE `content_1804` (
  `id` varchar(16) BINARY NOT NULL,
  `content` blob DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `content_1805`;
CREATE TABLE `content_1805` (
  `id` varchar(16) BINARY NOT NULL,
  `content` blob DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `content_1806`;
CREATE TABLE `content_1806` (
  `id` varchar(16) BINARY NOT NULL,
  `content` blob DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `content_1807`;
CREATE TABLE `content_1807` (
  `id` varchar(16) BINARY NOT NULL,
  `content` blob DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `content_1808`;
CREATE TABLE `content_1808` (
  `id` varchar(16) BINARY NOT NULL,
  `content` blob DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `content_1809`;
CREATE TABLE `content_1809` (
  `id` varchar(16) BINARY NOT NULL,
  `content` blob DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `content_1810`;
CREATE TABLE `content_1810` (
  `id` varchar(16) BINARY NOT NULL,
  `content` blob DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `content_1811`;
CREATE TABLE `content_1811` (
  `id` varchar(16) BINARY NOT NULL,
  `content` blob DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `content_1812`;
CREATE TABLE `content_1812` (
  `id` varchar(16) BINARY  NOT NULL,
  `content` blob DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `reply_18`;
CREATE TABLE `reply_18`(
    `id` varchar(16) BINARY NOT NULL,
    `replyID` varchar(16) NOT NULL,
    `create_time` timestamp,
    PRIMARY KEY(`id`,`replyID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `content_1901`;
CREATE TABLE `content_1901` (
  `id` varchar(16) NOT NULL,
  `content` blob DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `content_1902`;
CREATE TABLE `content_1902` (
  `id` varchar(16) NOT NULL,
  `content` blob DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `content_1903`;
CREATE TABLE `content_1903` (
  `id` varchar(16) NOT NULL,
  `content` blob DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `content_1904`;
CREATE TABLE `content_1904` (
  `id` varchar(16) NOT NULL,
  `content` blob DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `content_1905`;
CREATE TABLE `content_1905` (
  `id` varchar(16) NOT NULL,
  `content` blob DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `content_1906`;
CREATE TABLE `content_1906` (
  `id` varchar(16) NOT NULL,
  `content` blob DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `content_1907`;
CREATE TABLE `content_1907` (
  `id` varchar(16) NOT NULL,
  `content` blob DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `content_1908`;
CREATE TABLE `content_1908` (
  `id` varchar(16) NOT NULL,
  `content` blob DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `content_1909`;
CREATE TABLE `content_1909` (
  `id` varchar(16) NOT NULL,
  `content` blob DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `content_1910`;
CREATE TABLE `content_1910` (
  `id` varchar(16) NOT NULL,
  `content` blob DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `content_1911`;
CREATE TABLE `content_1911` (
  `id` varchar(16) NOT NULL,
  `content` blob DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `content_1912`;
CREATE TABLE `content_1912` (
  `id` varchar(16) NOT NULL,
  `content` blob DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `reply_19`;
CREATE TABLE `reply_19`(
    `id` varchar(16) NOT NULL,
    `replyID` varchar(16) NOT NULL,
    `create_time` timestamp,
    PRIMARY KEY(`id`,`replyID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `reply_index`;
CREATE TABLE `reply_index`(
    `id` varchar(16) NOT NULL,
    `replyID` varchar(16) NOT NULL,
    `create_time` timestamp,
    PRIMARY KEY(`id`,`replyID`)
    ,INDEX create_time_idx (`create_time`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `message_type`;
CREATE TABLE `message_type`(
    `id` varchar(16) NOT NULL,
    `from` varchar(20) NOT NULL,
    `to` varchar(20) NOT NULL,
    `type` varchar(16) NOT NULL DEFAULT 'text',
    PRIMARY KEY(`id`,`type`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `senstive_word`;
CREATE TABLE `senstive_word`(
    `word` varchar(128) NOT NULL,
    PRIMARY KEY(`word`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;