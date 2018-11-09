
SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `app`
-- ----------------------------
DROP TABLE IF EXISTS `app`;
CREATE TABLE `app` (
  `id` varchar(40) NOT NULL COMMENT '记录ID',
  `community_id` varchar(40) NOT NULL COMMENT '贴近号ID',
  `app_id` varchar(80) NOT NULL COMMENT '应用id',
  `app_secret` varchar(100) NOT NULL COMMENT '应用密钥',
  `access_token` varchar(100) DEFAULT NULL COMMENT 'api访问token',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否禁用 ',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `attributes` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='应用配置信息';

-- ----------------------------
--  Table structure for `app_open_api`
-- ----------------------------
DROP TABLE IF EXISTS `app_open_api`;
CREATE TABLE `app_open_api` (
  `app_id` varchar(40) NOT NULL COMMENT '贴近号的应用ID',
  `open_api_id` varchar(40) NOT NULL COMMENT '开放api ID',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否被禁用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `attributes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`app_id`,`open_api_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='贴近号应用开通的api服务';

-- ----------------------------
--  Table structure for `open_api`
-- ----------------------------
DROP TABLE IF EXISTS `open_api`;
CREATE TABLE `open_api` (
  `id` varchar(40) NOT NULL COMMENT '记录ID',
  `url` varchar(100) NOT NULL COMMENT '开放api url',
  `description` varchar(50) DEFAULT NULL COMMENT '说明',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `attributes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='开放服务列表';

SET FOREIGN_KEY_CHECKS = 1;
