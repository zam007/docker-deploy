use `wallet`;

ALTER TABLE `tb_wallet_withdraw`
ADD COLUMN `withdraw_apply` INT(11) UNSIGNED NOT NULL COMMENT ' 申请提现原始金额（单位：分） ' AFTER `withdraw_amt`;

update tb_wallet_withdraw set withdraw_apply = withdraw_amt ;

drop table if exists `tb_wallet_withdraw_tax`;
CREATE TABLE `tb_wallet_withdraw_tax` (
  `withdraw_id` bigint(20) unsigned NOT NULL COMMENT '提现id',
  `uid` varchar(20) NOT NULL COMMENT '用户uid',
  `withdraw_tax` int(11) unsigned DEFAULT '0' COMMENT ' 本次申请税费（单位：分） ',
  `withdraw_amt` int(11) unsigned DEFAULT '0' COMMENT ' 本次提现到账金额（单位：分）',
  `withdraw_apply` int(11) unsigned DEFAULT '0' COMMENT ' 本次申请提现金额（单位：分）',
  `month_withdraw_tax_before` int(11) unsigned DEFAULT '0' COMMENT ' 月提现已收税费（单位：分）',
  `month_withdraw_tax` int(11) unsigned DEFAULT '0' COMMENT ' 月提现税费（单位：分）',
  `month_withdraw_apply` int(11) unsigned DEFAULT '0' COMMENT ' 月提现金额（单位：分）',
  `tax_rate` float(6,2) unsigned DEFAULT '0' COMMENT ' 月提现税率 ',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT ' 创建时间 ',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT ' 更新时间 ',
  `status` tinyint(1) DEFAULT '0' COMMENT '删除标识符 1 - 已删除',
  PRIMARY KEY (`withdraw_id`),
  KEY `idx_tax_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
