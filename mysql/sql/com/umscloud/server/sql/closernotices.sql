CREATE DATABASE IF NOT EXISTS `closernotices`;
USE `closernotices`;

DROP TABLE IF EXISTS `tb_announce`;
CREATE TABLE `tb_announce` (
  id varchar(32) BINARY COMMENT '主键',
  uid VARCHAR(32) COMMENT '公告发送者id',
  content TEXT BINARY COMMENT '公告内容',
  create_time BIGINT NOT NULL,
  attributes VARCHAR(4096),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `tb_notify`;
CREATE TABLE `tb_notify` (
  id varchar(32) BINARY COMMENT '主键',
  object_type INT COMMENT '接收消息中心用户类型,栏目，超管',
  objectid VARCHAR(128) COMMENT '接收消息的对象id,栏目id ,超管栏目id',
  status INT COMMENT '未读，已读，删除',
  notice_type INT COMMENT '类型:1.开通栏目,2.修改名字,3.修改地区,4.后台到栏目通知',
  notice_content TEXT  COMMENT '通知内容',
  create_time BIGINT NOT NULL,
  update_time BIGINT NOT NULL,
  attributes VARCHAR(4096),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


