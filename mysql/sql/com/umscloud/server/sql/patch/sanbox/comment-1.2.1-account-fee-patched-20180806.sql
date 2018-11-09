use `comment`;

ALTER TABLE `t_subject_fee_record`
ADD COLUMN `audit_status` ENUM('apply', 'success', 'fail') NOT NULL DEFAULT 'apply' COMMENT '审核状态' AFTER `transid`;

ALTER TABLE `comment`.`t_subject_fee_record`
ADD COLUMN `uid` VARCHAR(45) NULL COMMENT '申请人' AFTER `transid`;

update t_subject_fee_record set audit_status = 'success';

CREATE TABLE `t_subject_fee_record_audit` (
  `audit_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '交易历史id',
  `subjectid` varchar(32) NOT NULL,
  `transid` bigint(20) NOT NULL COMMENT '交易id',
  `create_user` varchar(45) DEFAULT NULL COMMENT '申请人',
  `audit_user` varchar(45) DEFAULT NULL COMMENT '审核人',
  `audit_status` enum('apply','success','fail') NOT NULL DEFAULT 'apply' COMMENT '审核状态',
  `audit_time` bigint(20) DEFAULT NULL COMMENT '审核时间',
  `audit_reason` varchar(100) DEFAULT NULL COMMENT '拒绝理由',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态码',
  PRIMARY KEY (`audit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;