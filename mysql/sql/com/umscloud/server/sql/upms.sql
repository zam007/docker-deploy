CREATE DATABASE IF NOT EXISTS `upms`;

USE `upms`;

DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(40) NOT NULL,
  `auto_id` bigint(20) DEFAULT NULL,
  `phone` varchar(20) NOT NULL COMMENT '手机号码，同时也是登录账号',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `username` varchar(50) DEFAULT NULL COMMENT '用户姓名',
  `nickname` varchar(50) DEFAULT NULL COMMENT '昵称',
  `sex` tinyint(4) DEFAULT '2' COMMENT '性别 1男 2女',
  `salt` varchar(64) DEFAULT NULL COMMENT '盐',
  `portrait` varchar(200) DEFAULT NULL COMMENT '头像',
  `last_login_time` bigint(20) DEFAULT NULL COMMENT '上次在线时间',
  `last_login_ip` varchar(30) DEFAULT NULL COMMENT '上次在线ip',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '账号状态 是否禁用 1禁用 0未禁用',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `attributes` varchar(200) DEFAULT NULL COMMENT '扩展属性',
  `column_city` varchar(255) DEFAULT NULL COMMENT '栏目城市',
  `type` tinyint(4) DEFAULT '0' COMMENT '是否是超级管理员账号1 是 0 不是',
  `new_user` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否是新员工 默认注册时是，被授权就不是',
  `own_city` varchar(255) DEFAULT NULL COMMENT '拥有审核权的城市',
  `online` int  default 0 COMMENT '是否在线；1：在线，0：不在线',
  `push_manage_city` varchar(255) DEFAULT NULL COMMENT '推送理管城市',
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SET FOREIGN_KEY_CHECKS = 1;

DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(40) NOT NULL COMMENT '记录ID',
  `name` varchar(50) NOT NULL COMMENT '菜单[资源]名称',
  `permissions` varchar(80) NOT NULL COMMENT '权限',
  `type` varchar(40) NOT NULL COMMENT '资源[菜单]分类',
  `order_no` int(11) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Records of `sys_menu`
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES ('weeYpn7sf5Gp', '查看', 'permission_add', 'permission', '1'), ('wef7KQFRczUl', '修改', 'permission_update_view', 'permission', '4'), ('wefbbMvbkxAl', '修改', 'city_update', 'city', '12'), ('wefbpPAEVNfz', '审核', 'content_view', 'content', '16'), ('wefeL8YZCsgh', '工作量查看', 'content_view_work', 'content', '20'), ('weffbZJhC0kF', '查看', 'log_view', 'log', '50'), ('wfNFMKCzuOhr', '财务审核', 'finance_audit', 'finance', '22'), ('wfNFUfcyKxPP', '财务申请', 'finance_apply', 'finance', '23'), ('wiKR2N7qmwlr', '修改', 'data_update', 'data', '48'), ('wiKRellzxRux', '查看', 'data_view', 'data', '49'), ('wj5VF4rOeK1X', '查看', 'activity_view', 'activity', '26'), ('wj5VvHIPazAt', '修改', 'activity_update', 'activity', '25'), ('wjGsPK7wQAox', '提现审核', 'withdraw_audit', 'finance', '24'), ('wltN1tsFRD0Z', '修改', 'activity_data_update', 'activity_data', '27'), ('wltN8Y2F7mzn', '查看', 'activity_data_view', 'activity_data', '28');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

DROP TABLE IF EXISTS `sys_user_menu`;
CREATE TABLE `sys_user_menu` (
  `id` varchar(40) NOT NULL COMMENT '记录ID',
  `user_id` varchar(40) NOT NULL COMMENT '用户ID',
  `menu_id` varchar(40) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_id_menu_id` (`user_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SET FOREIGN_KEY_CHECKS = 1;



DROP TABLE IF EXISTS `notify_user`;
CREATE TABLE notify_user (
  id  int  NOT NULL auto_increment COMMENT '被通知人id',
  name  varchar(32) NOT NULL COMMENT '被通知人姓名',
  phone varchar(32) COMMENT '被通知人电话',
  mail  varchar(32) COMMENT '被通知人邮箱',
  create_time bigint  DEFAULT NULL COMMENT '创建时间',
  update_time bigint  DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `manage_notify`;
CREATE TABLE manage_notify (
  money bigint(20) DEFAULT 80000 COMMENT '提现最大总金额（每天）',
  frequency int DEFAULT 8  COMMENT '提现最大次数（每天）',
  by_mail int DEFAULT 0 COMMENT '是否邮件通知；0：否，1：是',
  by_message int DEFAULT 0 COMMENT '是否短信通知；0：否，1：是',
  money_msg    varchar(128)   DEFAULT '提现金额已经达到你设置的预警界限' COMMENT '金额通知文案',
  frequency_msg  varchar(128)  DEFAULT '提现次数已经达到你设置的预警界限' COMMENT '次数通知文案',
  create_time bigint DEFAULT NULL COMMENT '创建时间',
  update_time bigint DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (money,frequency)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `sys_log`;

CREATE TABLE `sys_log` (
  `id` varchar(40) NOT NULL COMMENT '记录ID',
  `username` varchar(50) DEFAULT NULL COMMENT '用户姓名',
  `phone` varchar(20) DEFAULT NULL COMMENT '用户手机号',
  `description` varchar(200) DEFAULT NULL COMMENT '操作描述',
  `params` varchar(200) DEFAULT NULL COMMENT '请求参数',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SET FOREIGN_KEY_CHECKS = 1;

insert into `sys_user` ( `id`, `last_login_ip`, `update_time`, `phone`, `sex`, `auto_id`, `column_city`, `new_user`, `type`, `password`, `portrait`, `salt`, `username`, `attributes`, `nickname`, `last_login_time`, `status`, `create_time`) values ( 'weu1AOiRdZRe', null, null, '13500000001', '2', '0', '', '1', '1', null, null, null, 'root', null, null, null, '0', '1525519650182');

COMMIT ;