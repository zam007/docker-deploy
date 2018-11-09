CREATE DATABASE IF NOT EXISTS user;

USE user;

DROP TABLE IF EXISTS `team`;
CREATE TABLE team (
  id varchar(20),
  domain varchar(32) NOT NULL,
  name varchar(32),
  description varchar(255),
  create_time bigint NOT NULL,
  update_time bigint NOT NULL,
  attributes varchar(4096),
  settings varchar(2048),
  members int NOT NULL,
  type int DEFAULT 0,
  logo varchar(255),
  custom_menus varchar(4096),
  PRIMARY KEY (id),
  UNIQUE KEY (domain)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
alter table `team` convert to character set utf8mb4;

DROP TABLE IF EXISTS `account`;
CREATE TABLE account (
  id varchar(20),
  password varchar(255),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `usersetting`;
CREATE TABLE `usersetting` (
  id varchar(20),
  basic varchar(2048),
  desktop varchar(2048),
  mobile varchar(2048),
  extra varchar(2048),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS user;
CREATE TABLE user (
  id varchar(20),
  username varchar(32),
  team_id varchar(20),
  email varchar(64),
  full_name varchar(32),
  gender tinyint NOT NULL,
  phones varchar(45),
  avatar varchar(255),
  role tinyint NOT NULL,
  status tinyint NOT NULL,
  create_time bigint NOT NULL,
  update_time bigint NOT NULL,
  bot boolean,
  security_signal varchar(32) DEFAULT '' COMMENT '暗号,11位: 4位地区号+8位随机数 如035212345678,默认空为小宇宙',
  attributes varchar(4096),
  PRIMARY KEY (id),
  UNIQUE KEY (username,team_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
insert into user values('h32','groukbot','GCA','groukbot@grouk.com','GroukBot',0,null,'/avatar/u/h32',0,1,unix_timestamp() * 1000,unix_timestamp() * 1000,1,'0','{}');
insert into user values('h33','emailbot','GCA','emailbot@grouk.com','EmailBot',0,null,'/avatar/u/h33',0,1,unix_timestamp() * 1000,unix_timestamp() * 1000,1,'1','{}');
create index  security_signal on `user` (security_signal);

DROP TABLE IF EXISTS `pre_user_email`;
CREATE TABLE pre_user_email (
  email varchar(64),
  count int NOT NULL DEFAULT 0,
  update_time TIMESTAMP NOT NULL,
  PRIMARY KEY (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `token`;
CREATE TABLE `token`(
  owner_id varchar(20) NOT NULL,
  grant_type tinyint,
  token varchar(255) NOT NULL,
  PRIMARY KEY (owner_id,grant_type)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `phone_team_index`;
CREATE TABLE `phone_team_index`(
  phone bigint,
  code int,
  team_id varchar(20),
  uid varchar(20),
  PRIMARY KEY (phone,code,team_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `ldap_index`;
CREATE TABLE `ldap_index`(
    domain varchar(32) NOT NULL,
    host varchar(32) NOT NULL,
    port int,
    use_ssl tinyint,
    root_dn varchar(255) NOT NULL,
    search_base varchar(255),
    search_filter varchar(255),
    manage_dn varchar(255),
    password varchar(255),
    ldap_attribute_mapping varchar(4096),
    PRIMARY KEY(domain)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `user_mailbox_idx`;
CREATE TABLE `user_mailbox_idx`(
  uid varchar(20),
  host varchar(32) NOT NULL,
  port int,
  use_ssl boolean,
  email varchar(64),
  token varchar(255),
  auth_type tinyint,
  PRIMARY KEY (uid,email)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `tb_closer_account`;
CREATE TABLE tb_closer_account (
  id VARCHAR(20) BINARY NOT NULL COMMENT '账户id',
  uid VARCHAR(20) NOT NULL COMMENT '对应closer用户id',
  identity_type int COMMENT '登录类型：手机号 邮箱 用户名 微信 微博等',
  identifier varchar(64) COMMENT '标识:具体的 手机号 邮箱，或第三方应用的唯一标识',
  credential VARCHAR (255) COMMENT '密码凭证:站内的密码，站外的不保存或保存token',
  attributes varchar(4096),
  PRIMARY KEY (id),
  UNIQUE KEY (uid,identity_type),
  UNIQUE KEY (identifier)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `tb_closer_roster`;
CREATE TABLE tb_closer_roster (
  id VARCHAR(20) BINARY NOT NULL COMMENT '花名册id',
  uid VARCHAR(20) BINARY NOT NULL COMMENT '对应closer用户id',
  community VARCHAR(128) BINARY NOT NULL COMMENT '所属栏目id',
  avatar VARCHAR(255) COMMENT '头像',
  gender tinyint NOT NULL COMMENT '性别 0未知 1男 2女',
  name VARCHAR (255) COMMENT '花名',
  attributes varchar(4096),
  PRIMARY KEY (id),
  UNIQUE KEY (uid,community)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `tb_invite_record`;
CREATE TABLE `tb_invite_record` (
  id VARCHAR(20) BINARY NOT NULL COMMENT '邀请者uid',
  inviter VARCHAR(20) BINARY NOT NULL COMMENT '邀请者uid',
  invitee VARCHAR(20) BINARY NOT NULL COMMENT '被邀请者uid',
  amount VARCHAR(20) BINARY NOT NULL COMMENT '此次邀请应发金额到未解冻金额',
  create_time bigint NOT NULL COMMENT '被邀请人第一次登陆时间',
  remind_time bigint default null COMMENT '提醒登陆时间',
  attributes varchar(4096),
  PRIMARY KEY (inviter,invitee)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `tb_award_record`;
CREATE TABLE `tb_award_record` (
  id VARCHAR(20) BINARY NOT NULL COMMENT '奖励金交易记录id',
  uid VARCHAR(20) BINARY NOT NULL COMMENT '用户id',
  invite_id VARCHAR(20) BINARY NOT NULL COMMENT 'tb_invite_record 外键',
  trans_type tinyint COMMENT '交易类型 1:发放奖励金 2:解冻奖励金',
  amount bigint  DEFAULT 0 COMMENT '已补贴金额 单位:分',
  `desc` VARCHAR(256) DEFAULT '' COMMENT '奖励金来源说明,解冻,发放',
  create_time bigint NOT NULL COMMENT '记录创建时间',
  attributes varchar(4096),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `tb_community_admins`;
CREATE TABLE `tb_community_admins` (
  community_id VARCHAR(20) BINARY NOT NULL COMMENT '栏目id',
  uid VARCHAR(20) BINARY NOT NULL COMMENT '栏目管理员id',
  create_time bigint NOT NULL COMMENT '用户创建时间',
  update_time bigint NOT NULL COMMENT '用户创建时间',
  attributes varchar(4096),
  PRIMARY KEY (community_id,uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `tb_user_statistic`;
CREATE TABLE `tb_user_statistic` (
  `uid` varchar(20) NOT NULL,
  `last_check_time` datetime DEFAULT NULL COMMENT '昨日现金收入检查时间',
  `activity_date` datetime DEFAULT NULL,
  `activity_type` varchar(20) DEFAULT NULL,
  `create_time` bigint NOT NULL COMMENT '用户创建时间',
  `update_time` bigint NOT NULL COMMENT '用户创建时间',
  `status` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '删除标识符 1 - 已删除',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;