CREATE DATABASE IF NOT EXISTS `wallet`;
USE `wallet`;

DROP TABLE IF EXISTS `tb_wallet`;
CREATE TABLE `tb_wallet` (
  uid varchar(20) BINARY NOT NULL COMMENT '用户uid',
  money DECIMAL(20,2) DEFAULT 0.00 COMMENT '金额',
  pay_password VARCHAR(128) COMMENT '支付密码',
  attributes TEXT COMMENT '附加字段',
  PRIMARY KEY (uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `tb_wallet_record`;
CREATE TABLE `tb_wallet_record` (
  record_id varchar(20) BINARY NOT NULL COMMENT '交易id',
  record_sn varchar(100) BINARY COMMENT '交易流水单号sn',
  uid varchar(20) BINARY COMMENT '用户uid',
  source INT NOT NULL COMMENT '来源 1-提现/2-充值/3 -红包',
  type INT NOT NULL COMMENT '交易类型 0-支出/1-收入',
  amount DECIMAL(20,2) COMMENT '交易金额 ',
  pay_time bigint NOT NULL COMMENT '交易时间',
  rest_money DECIMAL(20,2) NOT NULL COMMENT '剩余金额 ',
  attributes TEXT COMMENT '附加字段',
  PRIMARY KEY (record_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `tb_bonus`;
CREATE TABLE `tb_bonus` (
  id varchar(20) BINARY NOT NULL COMMENT '红包id',
  type INT  COMMENT '红包类型，0-随机红包/1-等额红包',
  record_sn varchar(100) BINARY COMMENT '交易流水单号sn',
  from_uid VARCHAR(20) NOT NULL COMMENT '红包发起者id',
  from_msg TEXT COMMENT '红包发起者的附加字段',
  amount DECIMAL(20,2) NOT NULL COMMENT '红包金额',
  num INT NOT NULL COMMENT '红包个数',
  create_time bigint NOT NULL COMMENT '红包创建时间',
  to_users TEXT COMMENT '红包拆开者抢红包的详细(用户ID、金额、运气王)',
  balance DECIMAL(20,2) DEFAULT 0.00 NOT NULL COMMENT '红包剩余金额',
  status int DEFAULT 1 NOT NULL COMMENT '红包状态1-未过期/0-过期',
  attributes TEXT COMMENT '附加字段',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



DROP TABLE IF EXISTS `tb_wallet`;
CREATE TABLE `tb_wallet` (
  uid VARCHAR(20) NOT NULL COMMENT '用户uid',
  user_type VARCHAR(20) DEFAULT 'user' COMMENT '账户类型，user 普通用户, community 栏目, finance 财务,  admin 管理员平台审核',
  pay_password VARCHAR(128) default null COMMENT '支付密码',
  wallet_balance bigint DEFAULT 0 COMMENT '钱包余额 单位:分',
  wallet_lock_balance bigint DEFAULT 0 COMMENT '钱包锁定金额 单位:分',
  is_lock VARCHAR(20) DEFAULT 'unlock' COMMENT '账户是否有锁定，unlock-未锁定，balance-余额锁定，lock-锁定',
  create_time bigint  COMMENT '创建时间',
  update_time bigint  COMMENT '更新时间',
  status TINYINT(1) DEFAULT 0 COMMENT '删除标识符 1 - 已删除',
  PRIMARY KEY (uid)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 ;

DROP TABLE IF EXISTS `tb_wallet_recharge_summary`;
CREATE TABLE `tb_wallet_recharge_summary` (
  uid VARCHAR(20) NOT NULL COMMENT '用户uid',
  total_recharge_amt bigint  DEFAULT 0 COMMENT '充值总金额 单位:分',
  total_allowance_amt bigint  DEFAULT 0 COMMENT '补贴金额 单位:分',
  total_allowanced_amt bigint  DEFAULT 0 COMMENT '已补贴金额 单位:分',
  total_award_amt bigint  DEFAULT 0 COMMENT '奖励金额 单位:分',
  total_awarded_amt bigint  DEFAULT 0 COMMENT '已奖励金额 单位:分',
  total_lock_amt bigint  DEFAULT 0 COMMENT '冻结总金额 单位:分',
  total_unlock_amt bigint  DEFAULT 0 COMMENT '为解冻总金额 单位:分',
  trans_max_amt bigint  DEFAULT 0 COMMENT '单比转账额度 单位:分',
  daily_allowance_amt bigint DEFAULT 0 COMMENT '每天补贴金额 单位:分',
  create_time bigint  COMMENT '创建时间',
  update_time bigint  COMMENT '更新时间',
  status TINYINT (1) DEFAULT 0 COMMENT '删除标识符 1 - 已删除',
  PRIMARY KEY (uid)
) ENGINE=INNODB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `tb_wallet_recharge`;
CREATE TABLE `tb_wallet_recharge` (
  recharge_id bigint  NOT NULL COMMENT '充值ID',
  from_uid VARCHAR(20) BINARY NOT NULL COMMENT '发起充值用户uid',
  from_user_type VARCHAR(20) BINARY DEFAULT 'finance' COMMENT '发起充值账户类型，user 普通用户, community 栏目, finance 财务,  admin 管理员平台审核',
  from_user_name VARCHAR(20) BINARY NOT NULL COMMENT '发起充值用户名称',
  to_uid VARCHAR(20) BINARY NOT NULL COMMENT '被充值用户uid',
  to_user_type VARCHAR(20) BINARY DEFAULT 'community' COMMENT '账户类型，user 普通用户, community 栏目, finance 财务,  admin 管理员平台审核',
  to_user_name VARCHAR(200) DEFAULT NULL COMMENT '充值用户名称',
  recharge_amt bigint  DEFAULT 0 COMMENT '充值金额 单位:分',
  trans_type VARCHAR(3) BINARY NOT NULL DEFAULT 'in' COMMENT '交易类型，''in''-收入,''out''-支出',
  total_allowance_amt bigint  DEFAULT 0 COMMENT '补贴金额 单位:分',
  total_allowanced_amt bigint  DEFAULT 0 COMMENT '已补贴金额 单位:分',
  daily_allowance_amt bigint  DEFAULT 0 COMMENT '补贴金额 单位:分',
  number_time bigint  DEFAULT NULL COMMENT '需要次数',
  allowanced_time bigint  DEFAULT NULL COMMENT '已补贴次数',
  audit_uid varchar(20) DEFAULT NULL COMMENT ' 审核用户Id ',
  audit_user varchar(20) DEFAULT NULL COMMENT ' 审核经手人 ',
  audit_time bigint DEFAULT NULL COMMENT ' 审核时间 ',
  audit_status varchar(20) NOT NULL DEFAULT 'apply' COMMENT ' 审核状态， success- 通过,  fail  - 失败, apply - 申请 ',
  create_time bigint NOT NULL  COMMENT '创建时间',
  update_time bigint NOT NULL  COMMENT '更新时间',
  status TINYINT (1) DEFAULT 0 COMMENT '删除标识符 1 - 已删除',
  PRIMARY KEY (recharge_id)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `tb_wallet_recharge_allowance_detail`;
CREATE TABLE `tb_wallet_recharge_allowance_detail` (
  allowance_detail_id bigint  NOT NULL AUTO_INCREMENT COMMENT '补贴详情ID',
  recharge_id bigint  NOT NULL COMMENT '充值ID',
  allowance_amt bigint  DEFAULT 0 COMMENT '补贴金额 单位:分',
  total_allowance_amt bigint  DEFAULT 0 COMMENT '补贴金额快照 单位:分',
  total_allowanced_amt bigint  DEFAULT 0 COMMENT '已补贴金额快照 单位:分',
  daily_feedback_amt bigint  DEFAULT 0 COMMENT '补贴金额 单位:分',
  create_time bigint NOT NULL COMMENT '创建时间',
  update_time bigint NOT NULL  COMMENT '更新时间',
  status TINYINT (1) DEFAULT 0 COMMENT '删除标识符 1 - 已删除',
  PRIMARY KEY (allowance_detail_id)
) ENGINE=INNODB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `tb_wallet_account`;
CREATE TABLE `tb_wallet_account` (
  wallet_account_id bigint  NOT NULL COMMENT '钱包账户ID',
  uid VARCHAR(20) BINARY NOT NULL COMMENT '用户uid',
  account_type VARCHAR(20) BINARY DEFAULT 'alipay' COMMENT '支付账户类型, alipay-支付宝，wechat-微信',
  payee_type VARCHAR (50) BINARY DEFAULT NULL COMMENT '收款方账户类型',
  payee_account VARCHAR (200) BINARY NOT NULL COMMENT '收款账户',
  attributes VARCHAR (200) BINARY DEFAULT NULL COMMENT '账户属性',
  is_default TINYINT (1) DEFAULT 0 COMMENT '是否为默认账户 1 - 是',
  create_time bigint NOT NULL  COMMENT '创建时间',
  update_time bigint NOT NULL  COMMENT '更新时间',
  status TINYINT (1) DEFAULT 0 COMMENT '删除标识符 1 - 已删除',
  PRIMARY KEY (wallet_account_id)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `tb_wallet_detail`;
CREATE TABLE `tb_wallet_detail` (
  wallet_detail_id bigint  NOT NULL COMMENT '账户流水ID',
  uid VARCHAR(20) NOT NULL COMMENT '用户uid',
  trans_amt bigint  NOT NULL COMMENT '交易金额（单位：分）',
  trans_type VARCHAR(3) NOT NULL DEFAULT 'in' COMMENT '交易类型，''in''-收入,''out''-支出',
  trans_channel varchar(20) NOT NULL COMMENT ' 交易渠道， '' transfer '' - 财务转账， '' team '' - 栏目转账， '' withdraw '' - 提现， '' redpackage '' - 红包， '' other '' - 其他 ',
  trans_id bigint  DEFAULT NULL COMMENT '交易渠道主键Id（对应具体交易渠道的ID）',
  trans_remark varchar(500) DEFAULT NULL COMMENT ' 交易备注 ',
  wallet_balance bigint  DEFAULT NULL COMMENT ' 钱包余额快照 单位 : 分 ',
  wallet_lock_balance bigint  DEFAULT NULL  COMMENT ' 钱包锁定金额快照 单位 : 分 ',
  trans_status VARCHAR(5) DEFAULT 'n' COMMENT '交易状态，''n''-未入账，''y''-已入账',
  trans_process_time bigint DEFAULT NULL COMMENT ' 交易处理时间 ',
  create_time bigint NOT NULL COMMENT '创建时间',
  update_time bigint NOT NULL  COMMENT '更新时间',
  status tinyint(1) DEFAULT 0 COMMENT ' 删除标识符 1 - 已删除 ',
  PRIMARY KEY (`wallet_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `tb_wallet_lock`;
CREATE TABLE `tb_wallet_lock` (
  `wallet_lock_id` bigint  NOT NULL AUTO_INCREMENT COMMENT ' 主键 ',
  `uid` VARCHAR(20) BINARY NOT NULL COMMENT '用户uid',
  `lock_amt` bigint  DEFAULT NULL COMMENT ' 钱包锁定金额（单位：分） ',
  `lock_type` varchar(10) NOT NULL COMMENT ' 钱包锁类型，‘unlock’ - 解锁，‘lock’ - 加锁 ',
  `lock_remark` varchar(200) DEFAULT NULL COMMENT ' 账户锁定原因 ',
  `lock_oper` varchar(18) DEFAULT NULL COMMENT ' 锁操作人 ',
  `withdraw_id` bigint  DEFAULT NULL COMMENT ' 申请提现ID ',
  `create_time` bigint NOT NULL COMMENT '创建时间',
  `update_time` bigint NOT NULL  COMMENT '更新时间',
  `status` tinyint(1) DEFAULT 0 COMMENT ' 删除标识符 1 - 已删除 ',
  PRIMARY KEY (`wallet_lock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `tb_wallet_withdraw`;
CREATE TABLE `tb_wallet_withdraw` (
  `withdraw_id` bigint  NOT NULL AUTO_INCREMENT COMMENT ' 主键 ',
  `uid` varchar(20) NOT NULL COMMENT '用户uid',
  `user_name` varchar(50) DEFAULT NULL COMMENT ' 申请提现主体名称 ',
  `wallet_balance` bigint  DEFAULT NULL COMMENT ' 钱包余额快照 单位 : 分 ',
  `wallet_lock_balance` bigint  DEFAULT NULL  COMMENT ' 钱包锁定金额快照 单位 : 分 ',
  `withdraw_amt` bigint  NOT NULL COMMENT ' 申请提现金额（单位：分） ',
  `withdraw_apply` bigint NOT NULL COMMENT ' 申请提现原始金额（单位：分） ',
  `wallet_account_id` bigint  NOT NULL COMMENT ' 申请提现账户ID ',
  `account_type` varchar(20) DEFAULT 'alipay' COMMENT ' 支付账户类型, alipay - 支付宝，wechat - 微信 ',
  `payee_type` varchar(50) DEFAULT NULL COMMENT ' 收款方账户类型 ',
  `payee_account` varchar(200) NOT NULL COMMENT ' 收款账户 ',
  `audit_uid` varchar(20) DEFAULT NULL COMMENT ' 审核用户Id ',
  `audit_user` varchar(20) DEFAULT NULL COMMENT ' 审核经手人 ',
  `audit_time` bigint DEFAULT NULL COMMENT ' 审核时间 ',
  `audit_status` varchar(20) NOT NULL DEFAULT 'apply' COMMENT ' 审核状态， success- 通过,  fail  - 失败, apply - 申请 ',
  `pay_status` varchar(20) NOT NULL DEFAULT 'forexec' COMMENT ' 平台支付状态， success - 成功,  exec - 执行中,  forexec - 待执行,  fail - 失败, call_success - 调用成功,  call_fail - 调用失败 enum('' forexec '', '' exec '','' call_success '','' call_fail '','' success '','' fail '') ',
  `pay_time` bigint DEFAULT NULL COMMENT ' 支付时间 ',
  `pay_trade_no` varchar(25) DEFAULT NULL COMMENT ' 打款流水号 ',
  `bank_trade_no` varchar(30) DEFAULT NULL COMMENT ' 银行交易流水 ',
  `service_fee` int(10)  DEFAULT 0 COMMENT ' 提现手续费 ',
  `pay_remark` varchar(300) DEFAULT NULL COMMENT ' 支付备注 ',
  `wallet_lock_id` bigint  DEFAULT NULL COMMENT ' 账户锁信息ID ',
  `wallet_detail_id` bigint  DEFAULT NULL COMMENT ' 账户流水ID ',
  `withdraw_remark` varchar(200) DEFAULT NULL COMMENT ' 提现申请备注 ',
  `create_time` bigint NOT NULL COMMENT ' 创建时间 ',
  `update_time` bigint NOT NULL  COMMENT ' 更新时间 ',
  status tinyint(1) DEFAULT 0 COMMENT ' 删除标识符 1 - 已删除 ',
  PRIMARY KEY (`withdraw_id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `tb_wallet_transaction`;
CREATE TABLE `tb_wallet_transaction` (
  `trans_id` bigint  NOT NULL COMMENT '主键',
  `trans_status` VARCHAR(20) NOT NULL DEFAULT 'apply' COMMENT '交易状态，''success''-通过,''fail''-失败,''apply''-申请',
  `from_uid` VARCHAR(20) BINARY NOT NULL COMMENT '用户uid',
  `from_user_type` VARCHAR(20) BINARY DEFAULT 'user' COMMENT '账户类型，user 普通用户, group 栏目, finance 财务,  admin 管理员平台审核',
  `from_user_name` VARCHAR(50) DEFAULT null COMMENT '充值用户名',
  `trans_total_amt` bigint  NOT NULL COMMENT '转账金额（单位：分）',
  `trans_remark` VARCHAR(200) DEFAULT NULL COMMENT '交易备注',
  `wallet_balance` bigint  DEFAULT NULL COMMENT '钱包余额快照 单位:分',
  `wallet_lock_balance` bigint  DEFAULT NULL COMMENT '钱包锁定金额快照 单位:分',
  `create_time` bigint NOT NULL COMMENT ' 创建时间 ',
  `update_time` bigint NOT NULL  COMMENT ' 更新时间 ',
  `status` tinyint(1) DEFAULT 0 COMMENT ' 删除标识符 1 - 已删除 ',
  PRIMARY KEY (`trans_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `tb_wallet_transaction_detail`;
CREATE TABLE `tb_wallet_transaction_detail` (
  `trans_detail_id` bigint  NOT NULL COMMENT '主键',
  `trans_id` bigint  NOT NULL COMMENT '转出纪录主键id',
  `to_uid` VARCHAR(20) BINARY NOT NULL COMMENT '用户uid',
  `to_user_type` VARCHAR(20) BINARY DEFAULT 'user' COMMENT '账户类型，user 普通用户, group 栏目, finance 财务,  admin 管理员平台审核',
  `to_user_name` VARCHAR(50) BINARY DEFAULT null COMMENT '被充值用户名',
  `trans_amt` int  NOT NULL COMMENT '转入金额（单位：分）',
  `trans_status` VARCHAR(5) DEFAULT 'n' COMMENT '交易状态，''exp''- 已过期，''n''-未入账，''y''-已入账',
  `expire_time` bigint DEFAULT NULL COMMENT ' 过期时间 ',
  `create_time` bigint NOT NULL COMMENT ' 创建时间 ',
  `update_time` bigint NOT NULL  COMMENT ' 更新时间 ',
  `status` tinyint(1) DEFAULT 0 COMMENT ' 删除标识符 1 - 已删除 ',
  PRIMARY KEY (`trans_detail_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `tb_wallet_recharge_settings`;
CREATE TABLE `tb_wallet_recharge_settings` (
  uid VARCHAR(20) NOT NULL COMMENT '用户uid',
  from_user_name VARCHAR(80) DEFAULT NULL COMMENT '申请人',
  trans_max_amt bigint  DEFAULT 0 COMMENT '单比转账额度 单位:分',
  daily_allowance_amt bigint DEFAULT 0 COMMENT '每天补贴金额 单位:分',
  audit_uid varchar(20) DEFAULT NULL COMMENT '审核用户Id',
  audit_user varchar(20) DEFAULT NULL COMMENT '审核经手人',
  audit_time bigint DEFAULT NULL COMMENT '审核时间',
  audit_status varchar(20) NOT NULL DEFAULT 'apply' COMMENT ' 审核状态， success- 通过,  fail  - 失败, apply - 申请 ',
  create_time bigint NOT NULL  COMMENT '创建时间',
  update_time bigint NOT NULL  COMMENT '更新时间',
  status TINYINT (1) DEFAULT 0 COMMENT '删除标识符 1 - 已删除',
  PRIMARY KEY (uid)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `t_h_wallet_recharge_settings`;
CREATE TABLE `t_h_wallet_recharge_settings` (
  settings_his_id bigint NOT NULL AUTO_INCREMENT COMMENT ' 主键 ',
  uid VARCHAR(20) NOT NULL COMMENT '用户uid',
  trans_max_amt bigint  DEFAULT 0 COMMENT '单比转账额度 单位:分',
  daily_allowance_amt bigint DEFAULT 0 COMMENT '每天补贴金额 单位:分',
  audit_uid varchar(20) DEFAULT NULL COMMENT '审核用户Id',
  audit_user varchar(20) DEFAULT NULL COMMENT '审核经手人',
  audit_time bigint DEFAULT NULL COMMENT '审核时间',
  audit_status varchar(20) NOT NULL DEFAULT 'apply' COMMENT ' 审核状态， success- 通过,  fail  - 失败, apply - 申请 ',
  create_time bigint NOT NULL  COMMENT '创建时间',
  update_time bigint NOT NULL  COMMENT '更新时间',
  status TINYINT (1) DEFAULT 0 COMMENT '删除标识符 1 - 已删除',
  PRIMARY KEY (settings_his_id)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `tb_wallet_identity`;

CREATE TABLE `tb_wallet_identity` (
	uid VARCHAR(20) NOT NULL COMMENT '用户uid',
	cert_name VARCHAR(20) DEFAULT NULL COMMENT '用户名',
	cert_no VARCHAR(50) DEFAULT NULL COMMENT '身份证号',
	audit_channel VARCHAR(50) DEFAULT 'alipay' COMMENT '审核渠道, alipay - 支付宝',
	transaction_id VARCHAR(100) DEFAULT NULL COMMENT '系统交易号',
	biz_no VARCHAR(100) DEFAULT NULL COMMENT '支付宝交易号',
	audit_status varchar(20) NOT NULL DEFAULT 'apply' COMMENT ' 审核状态， success- 通过,  fail  - 失败, apply - 申请 ',
	create_time bigint NOT NULL  COMMENT '创建时间',
  update_time bigint NOT NULL  COMMENT '更新时间',
  status TINYINT (1) DEFAULT 0 COMMENT '删除标识符 1 - 已删除',
	PRIMARY KEY (uid)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;
