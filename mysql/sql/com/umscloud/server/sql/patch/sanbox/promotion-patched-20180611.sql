USE `promotion`;

DROP TABLE IF EXISTS `t_promotion_activity_config`;
CREATE TABLE `t_promotion_activity_config` (
  `activity_id` varchar(32) NOT NULL COMMENT '关联活动id',
  `image_url` varchar(2000) NOT NULL COMMENT '图片地址',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `attributes` text COMMENT '扩展属性',
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
