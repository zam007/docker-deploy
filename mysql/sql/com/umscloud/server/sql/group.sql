CREATE DATABASE IF NOT EXISTS `group`;

USE `group`;

DROP TABLE IF EXISTS `group` ;

CREATE TABLE `group` (
  id varchar(20),
  name varchar(32) NULL,
  team_id varchar(20) NOT NULL,
  type tinyint NOT NULL,
  avatar varchar(255),
  description TEXT,
  status tinyint DEFAULT '0',
  create_time bigint NOT NULL,
  update_time bigint NOT NULL,
  `custom_id` varchar(20) DEFAULT NULL ,
  attributes varchar(4096),
  settings varchar(2048),
  members int(10) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY (team_id,`custom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `t_class`;
CREATE TABLE `t_class` (
  id varchar(20) BINARY NOT NULL COMMENT 'group群组id',
  name varchar(32) NOT NULL COMMENT '班级名称',
  communityid VARCHAR(128) NOT NULL COMMENT '班级所属自媒体id',
  regionid varchar(32) NOT NULL COMMENT '所属地区id',
  region_name varchar(50) NOT NULL DEFAULT '' COMMENT '所属地区id',
  home_page  tinyint NOT NULL DEFAULT '1' COMMENT '是否能上首页 0 不能，1能',
  announcement TEXT COMMENT '公告',
  ann_end_time bigint COMMENT '班长可修改公告的时间点',
  watchword VARCHAR(128) COMMENT '班级口令',
  tag_id VARCHAR (32) COMMENT'标签库id',
  qr_code VARCHAR (128) COMMENT '二维码地址',
  longitude DOUBLE COMMENT '精度',
  latitude DOUBLE COMMENT '纬度',
  geohash  VARCHAR (32) ,
  allow_join  boolean NOT NULL DEFAULT true COMMENT '允许加入 此字段废弃,由join_limit 替代',
  join_limit  tinyint NOT NULL DEFAULT '0' COMMENT '限制加入类型: 0直接加入,1群主审核,2拒绝加入',
  attributes TEXT COMMENT '附加字段',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE INDEX idx_location ON t_class (longitude,latitude);
CREATE INDEX idx_geo ON t_class (geohash);
CREATE INDEX idex_community ON t_class (communityid);

DROP TABLE IF EXISTS `group_approval`;
CREATE TABLE `group_approval` (
  `id` varchar(40) NOT NULL COMMENT '申请记录ID',
  `user_id` varchar(40) NOT NULL COMMENT '申请人(群主)',
  `group_id` varchar(40) NOT NULL COMMENT '申请的群组ID',
  `old_city` varchar(30) NOT NULL COMMENT '群组目前所属城市',
  `new_city` varchar(30) NOT NULL COMMENT '申请修改的城市',
  `region_id` varchar(40) NOT NULL COMMENT '申请修改的城市id',
  `longitude` double NOT NULL COMMENT '经度',
  `latitude` double NOT NULL COMMENT '纬度',
  `status` int(11) NOT NULL COMMENT '申请状态 -1未审批 0审批不通过 1审批通过 ',
  `community_id` varchar(40) NOT NULL COMMENT '栏目ID',
  `create_time` bigint(20) NOT NULL COMMENT '申请的时间',
  `deal_time` bigint(20) DEFAULT NULL COMMENT '处理时间',
  `deal_user_id` varchar(40) DEFAULT NULL COMMENT '审批人id',
  `attributes` varchar(200) DEFAULT NULL COMMENT '扩展字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
