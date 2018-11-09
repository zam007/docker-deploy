USE `wallet`;


CREATE TABLE `tb_wallet_identity` (
	uid VARCHAR(20) BINARY NOT NULL COMMENT '用户uid',
	cert_name VARCHAR(20) DEFAULT NULL COMMENT '用户名',
	cert_no VARCHAR(50) DEFAULT NULL COMMENT '身份证号',
	audit_channel VARCHAR(50) DEFAULT 'alipay' COMMENT '审核渠道, alipay - 支付宝',
	transaction_id VARCHAR(100) DEFAULT NULL COMMENT '系统交易号',
	biz_no VARCHAR(100) DEFAULT NULL COMMENT '支付宝交易号',
	audit_status enum('apply','success','fail') NOT NULL DEFAULT 'apply' COMMENT '审核状态， success- 通过,  fail  - 失败, apply - 申请',
	create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
	status TINYINT (1) DEFAULT 0 COMMENT '删除标识符 1 - 已删除',
	PRIMARY KEY (uid)
) ENGINE = INNODB DEFAULT CHARSET = utf8mb4 COMMENT = '用户身份信息';
