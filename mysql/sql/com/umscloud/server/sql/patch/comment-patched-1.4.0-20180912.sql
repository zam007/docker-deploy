use comment;

CREATE TABLE `t_group_fee` (
  `group_fee_id` varchar(45) NOT NULL COMMENT '群组奖励金',
  `group_id` varchar(45) NOT NULL COMMENT '群组id',
  `group_name` varchar(60) DEFAULT NULL COMMENT '群名称',
  `region_id` varchar(45) DEFAULT NULL COMMENT '地区id',
  `owner_id` varchar(45) NOT NULL COMMENT '群主',
  `owner_name` varchar(60) DEFAULT NULL COMMENT '花名',
  `owner_phone` varchar(45) DEFAULT NULL COMMENT '手机号',
  `trans_id` bigint(20) DEFAULT NULL COMMENT '主键',
  `trans_amt` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '转账金额',
  `community_id` varchar(45) NOT NULL COMMENT '栏目id',
  `apply_uid` varchar(45) NOT NULL COMMENT '申请人uid',
  `apply_name` varchar(60) DEFAULT NULL COMMENT '申请人',
  `audit_user` varchar(45) DEFAULT NULL COMMENT '审核人',
  `audit_status` enum('apply','success','fail') NOT NULL DEFAULT 'apply' COMMENT '审核状态',
  `audit_time` datetime DEFAULT NULL COMMENT '审核时间',
  `audit_reason` varchar(100) DEFAULT NULL COMMENT '拒绝理由',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '删除标识符',
  PRIMARY KEY (`group_fee_id`),
  KEY `idx_gfee_uid` (`apply_uid`),
  KEY `idx_gfee_communityid` (`community_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

