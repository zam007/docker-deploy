USE `wallet`;

CREATE TABLE `tb_wallet_recharge_settings` (
  `uid` VARCHAR(20) NOT NULL COMMENT '用户uid',
  `trans_max_amt` INT(11) UNSIGNED  DEFAULT 0 COMMENT '单比转账额度 单位:分',
  `daily_allowance_amt` INT(11) UNSIGNED DEFAULT 0 COMMENT '每天补贴金额 单位:分',
  `audit_status` enum('apply','success','fail') NOT NULL DEFAULT 'apply' COMMENT ' 审核状态， success- 通过,  fail  - 失败, apply - 申请 ',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT ' 创建时间 ',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT ' 更新时间 ',
  `status` tinyint(1) DEFAULT 0 COMMENT ' 删除标识符 1 - 已删除 ',
  PRIMARY KEY (uid)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COMMENT='栏目配置表';

CREATE TABLE `tb_wallet_recharge_settings_his` (
  `settings_his_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT ' 主键 ',
  `uid` VARCHAR(20) NOT NULL COMMENT '用户uid',
  `trans_max_amt` INT(11) UNSIGNED  DEFAULT 0 COMMENT '单比转账额度 单位:分',
  `daily_allowance_amt` INT(11) UNSIGNED DEFAULT 0 COMMENT '每天补贴金额 单位:分',
  `audit_uid` varchar(20) DEFAULT NULL COMMENT '审核用户Id',
  `audit_user` varchar(20) DEFAULT NULL COMMENT '审核经手人',
  `audit_time` datetime DEFAULT NULL COMMENT '审核时间',
  `audit_status` enum('apply','success','fail') NOT NULL DEFAULT 'apply' COMMENT ' 审核状态， success- 通过,  fail  - 失败, apply - 申请 ',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT ' 创建时间 ',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT ' 更新时间 ',
  `status` tinyint(1) DEFAULT 0 COMMENT ' 删除标识符 1 - 已删除 ',
  PRIMARY KEY (settings_his_id)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COMMENT='栏目配置表审核历史表';