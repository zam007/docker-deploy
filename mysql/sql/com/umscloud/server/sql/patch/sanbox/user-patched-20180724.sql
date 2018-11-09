use `user`;
ALTER TABLE `user`.`tb_invite_record`
ADD COLUMN `remind_time` BIGINT(20) DEFAULT NULL COMMENT '提醒登陆时间' AFTER `create_time`  ;


CREATE TABLE `tb_user_statistic` (
  `uid` varchar(20) NOT NULL,
  `last_check_time` datetime DEFAULT NULL COMMENT '昨日现金收入检查时间',
  `activity_date` datetime DEFAULT NULL,
  `activity_type` varchar(20) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '删除标识符 1 - 已删除',
  PRIMARY KEY (`uid`)
)ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COMMENT='用户统计信息表';