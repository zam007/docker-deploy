CREATE DATABASE IF NOT EXISTS `promotion`;
USE `promotion`;

DROP TABLE IF EXISTS `t_promotion_plan`;
CREATE TABLE `t_promotion_plan`  (
  `id` varchar(32) BINARY NOT NULL COMMENT '推广计划id',
  `type` tinyint NULL  COMMENT '0:推广计划，1:渠道',
  `plateform` tinyint COMMENT '0:ios,1:android,2:windows',
  `custom_id` varchar(128) DEFAULT NULL COMMENT '渠道id：xxx代表渠道id 如ios wandoujia 推广:worldcup',
  `name` varchar(256)  DEFAULT '' COMMENT '推广计划名称或渠道id',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0:正常,1删除',
  `create_time` bigint NOT NULL COMMENT '创建时间',
  `update_time` bigint NOT NULL COMMENT '更新时间',
  `view_counts` bigint  DEFAULT NULL COMMENT '浏览h5数',
  `click_counts` bigint  DEFAULT NULL COMMENT '下载点击数',
  `device_counts` bigint  DEFAULT NULL COMMENT '设备激活数',
  `regist_counts` bigint  DEFAULT NULL COMMENT '注册数',
  `attributes` TEXT COMMENT '扩展属性',
  PRIMARY KEY (`id`,`type`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `t_promotion_activity`;
CREATE TABLE `t_promotion_activity`  (
  `id` varchar(32) BINARY NOT NULL COMMENT '活动id',
  `plan_id` varchar(32) BINARY NOT NULL COMMENT '关联计划id',
  `custom_id` varchar(128) DEFAULT NULL COMMENT '自定义id',
  `name` varchar(256)  DEFAULT '' COMMENT '活动名称',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0:正常,1删除',
  `ac_url` varchar(256)  DEFAULT '' COMMENT '活动h5url地址',
  `qr_url` varchar(256)  DEFAULT '' COMMENT '二维码存储地址',
  `create_time` bigint NOT NULL COMMENT '创建时间',
  `update_time` bigint NOT NULL COMMENT '更新时间',
  `view_counts` bigint  DEFAULT NULL COMMENT '浏览h5数',
  `click_counts` bigint  DEFAULT NULL COMMENT '下载点击数',
  `device_counts` bigint  DEFAULT NULL COMMENT '设备激活数',
  `regist_counts` bigint  DEFAULT NULL COMMENT '注册数',
  `attributes` TEXT COMMENT '扩展属性',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `t_promotion_device_track`;
CREATE TABLE `t_promotion_device_track` (
  `id` varchar(32) BINARY NOT NULL  COMMENT '主键id',
  `ip` varchar(64) DEFAULT NULL COMMENT '访问来源ip',
  `device_type` varchar(32) DEFAULT NULL COMMENT '设备类型：ios，android',
  `device_version` varchar(16) DEFAULT NULL COMMENT '设备版本：8_0_0',
  `plan_id` varchar(32) DEFAULT NULL COMMENT '推广计划id',
  `idfa` varchar(256) DEFAULT '' COMMENT '如果有idfa传idfa',
  `activity_id` varchar(32) DEFAULT NULL COMMENT '推广活动id',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `attributes` text COMMENT '扩展属性',
  `idfa_from` int(11) DEFAULT '0' COMMENT 'idfa来源 1表示多点',
  `callback` varchar(255) DEFAULT NULL COMMENT '多点回调地址',
  `activate` int(11) DEFAULT '0' COMMENT '多点激活状态 1表示激活',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE INDEX idx_device_track_plan_id ON `t_promotion_device_track` (plan_id);
CREATE INDEX idx_device_track_activity_id ON `t_promotion_device_track` (activity_id);

DROP TABLE IF EXISTS `t_promotion_activity_config`;
CREATE TABLE `t_promotion_activity_config` (
  `activity_id` varchar(32) BINARY NOT NULL COMMENT '关联活动id',
  `image_url` varchar(2000) NOT NULL COMMENT '图片地址',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `attributes` text COMMENT '扩展属性',
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;