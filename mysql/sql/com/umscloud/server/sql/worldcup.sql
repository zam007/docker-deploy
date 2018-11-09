CREATE DATABASE IF NOT EXISTS `activity`;
USE `activity`;

DROP TABLE IF EXISTS `t_activity`;
CREATE TABLE `t_activity` (
    activity_id bigint(20) NOT NULL AUTO_INCREMENT COMMENT ' 主键 ',
	  activity_name VARCHAR(200) DEFAULT NULL COMMENT '活动名称',
    activity_desc VARCHAR(200) DEFAULT NULL COMMENT '描述',
    size VARCHAR(20) DEFAULT NULL COMMENT '尺寸',
    logo VARCHAR(200) DEFAULT NULL  COMMENT 'logo',
    url VARCHAR(200) DEFAULT NULL  COMMENT 'url',
	  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
	  status TINYINT (1) DEFAULT 0 COMMENT '删除标识符 1 - 已删除',
    PRIMARY KEY (activity_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT '活动名称';


DROP TABLE IF EXISTS `t_worldcup_activity`;
CREATE TABLE `t_worldcup_activity` (
    activity_id bigint(20) NOT NULL AUTO_INCREMENT COMMENT ' 主键 ',
	  activity_name VARCHAR(200) DEFAULT NULL COMMENT '活动名称',
    activity_desc VARCHAR(200) DEFAULT NULL COMMENT '描述',
	  start_time datetime DEFAULT NULL COMMENT '开始时间',
	  end_time datetime DEFAULT NULL COMMENT '结束时间',
    person_infact_count int(11) DEFAULT 0 COMMENT '实际参与人数',
    person_count int(11) DEFAULT 0 COMMENT '参与人数',
    activity_infact_money int(11) DEFAULT 0 COMMENT '实际活动经费',
    activity_money int(11) DEFAULT 0 COMMENT '活动经费',
    activity_result VARCHAR(200) DEFAULT NULL  COMMENT '活动结果',
	  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
	  status TINYINT (1) DEFAULT 0 COMMENT '删除标识符 1 - 已删除',
    PRIMARY KEY (activity_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT '活动名称';

DROP TABLE IF EXISTS `t_worldcup_activity`;
CREATE TABLE `t_worldcup_activity` (
    activity_id bigint(20) NOT NULL AUTO_INCREMENT COMMENT ' 主键 ',
	  activity_name VARCHAR(200) DEFAULT NULL COMMENT '活动名称',
    activity_desc VARCHAR(200) DEFAULT NULL COMMENT '描述',
	  start_time datetime DEFAULT NULL COMMENT '开始时间',
	  end_time datetime DEFAULT NULL COMMENT '结束时间',
    person_infact_count int(11) DEFAULT 0 COMMENT '实际参与人数',
    person_count int(11) DEFAULT 0 COMMENT '参与人数',
    activity_infact_money int(11) DEFAULT 0 COMMENT '实际活动经费',
    activity_money int(11) DEFAULT 0 COMMENT '活动经费',
    activity_result VARCHAR(200) DEFAULT NULL  COMMENT '活动结果',
	  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
	  status TINYINT (1) DEFAULT 0 COMMENT '删除标识符 1 - 已删除',
    PRIMARY KEY (activity_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT '活动名称';

insert into t_worldcup_activity(activity_name,activity_desc,activity_infact_money,activity_money,start_time,end_time) values
('小组赛 4万/场 (18天)','奖金：4万/场',200000,4000000),
('八分之一决赛 10万/场 (4天)','奖金：10万/场',500000,10000000),
('四分之一决赛 20万/场 (2天)','奖金：20万/场',1000000,20000000),
('半决赛 50万/场 (2天)','奖金：50万/场',2500000,50000000),
('三四名决赛 50万','奖金：50万',2500000,50000000),
('决赛 100万','奖金：100万',5000000,100000000);

DROP TABLE IF EXISTS `t_worldcup_team`;
CREATE TABLE `t_worldcup_team` (
    team_id bigint(20) NOT NULL AUTO_INCREMENT COMMENT ' 主键 ',
	  team_name VARCHAR(20) DEFAULT NULL COMMENT '球队名称',
    team_desc VARCHAR(200) DEFAULT NULL COMMENT '描述',
    logo VARCHAR(200) DEFAULT NULL  COMMENT 'logo',
    team_status enum('pending','knockout') NOT NULL DEFAULT 'pending' COMMENT 'pending - 未淘汰，knockout - 被淘汰',
	  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
	  status TINYINT (1) DEFAULT 0 COMMENT '删除标识符 1 - 已删除',
    PRIMARY KEY (team_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT '球队';

insert into t_worldcup_team(team_name,team_desc) values
('俄罗斯','A'),('沙特','A'),('埃及','A'),('乌拉圭','A'),
('葡萄牙','B'),('西班牙','B'),('摩洛哥','B'),('伊朗','B'),
('法国','C'),('澳大利亚','C'),('秘鲁','C'),('丹麦','C'),
('阿根廷','D'),('冰岛','D'),('克罗地亚','D'),('尼日利亚','D'),
('巴西','E'),('瑞士','E'),('哥斯达黎加','E'),('塞尔维亚','E'),
('德国','F'),('墨西哥','F'),('瑞典','F'),('韩国','F'),
('比利时','G'),('巴拿马','G'),('突尼斯','G'),('英格兰','G'),
('波兰','H'),('塞内加尔','H'),('哥伦比亚','H'),('日本','H');

DROP TABLE IF EXISTS `t_worldcup_team_match`;
CREATE TABLE `t_worldcup_team_match` (
    match_id bigint(20) NOT NULL COMMENT ' 主键 ',
    activity_id bigint(20) NOT NULL COMMENT '活动名称',
	  home_team_id bigint(20) NOT NULL COMMENT '主球队名称',
    gust_team_id bigint(20) NOT NULL COMMENT '客球队名称',
    match_date date DEFAULT NULL COMMENT '比赛日期',
    match_long_date bigint(20) DEFAULT NULL COMMENT '比赛日期long',
    start_time datetime DEFAULT NULL COMMENT '开始时间',
	  end_time datetime DEFAULT NULL COMMENT '结束时间',
    match_type enum('group','knockout') NOT NULL DEFAULT 'group' COMMENT 'group - 小组赛，knockout - 淘汰撒',
    win_team_id bigint(20) DEFAULT NULL COMMENT '胜利球队id',
    match_result enum('win','equal') DEFAULT null COMMENT 'win - 小组赛，knockout - 淘汰撒',
    match_desc VARCHAR(200) DEFAULT null COMMENT '比分描述',
    guess_person_infact_count int(11) DEFAULT 0 COMMENT '竞猜实际人数',
    guess_person_count int(11) DEFAULT 0 COMMENT '竞猜人数',
    guess_result_desc VARCHAR(200) DEFAULT null COMMENT '竞猜结果说明',
    settle_status enum('pending','settled') NOT NULL DEFAULT 'pending' COMMENT 'pending - 未结算，settled - 已结算',
	  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
	  status TINYINT (1) DEFAULT 0 COMMENT '删除标识符 1 - 已删除',
    PRIMARY KEY (match_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT '比赛';


DROP TABLE IF EXISTS `t_worldcup_team_match_guess`;
CREATE TABLE `t_worldcup_team_match_guess` (
    guess_id bigint(20) NOT NULL AUTO_INCREMENT COMMENT ' 主键 ',
	  uid varchar(20) binary NOT NULL COMMENT '用户uid',
    user_name varchar(100) binary NOT NULL COMMENT '用户名称',
    phone varchar(20) binary NOT NULL COMMENT '用户手机号',
    match_id bigint(20) NOT NULL COMMENT '比赛id',
    match_type enum('group','knockout') NOT NULL DEFAULT 'group' COMMENT 'group - 小组赛，knockout - 淘汰撒',
    win_team_id bigint(20) DEFAULT NULL COMMENT '胜利球队id',
    match_result enum('win','equal') DEFAULT null COMMENT 'win - 小组赛，knockout - 淘汰撒',
    guess_remark VARCHAR(200) DEFAULT null COMMENT '竞猜说明',
    guess_times int(11) DEFAULT 1 COMMENT '竞猜倍数',
    guess_result enum('bingo','fail') DEFAULT null COMMENT 'bingo - 猜中，fail - 失败',
    award_amt int(11) DEFAULT null COMMENT '奖励金额',
	  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
	  status TINYINT (1) DEFAULT 0 COMMENT '删除标识符 1 - 已删除',
    PRIMARY KEY (guess_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT '比赛结果猜测';


DROP TABLE IF EXISTS `t_worldcup_guess_chance`;
CREATE TABLE `t_worldcup_guess_chance` (
	uid varchar(20) binary NOT NULL COMMENT '用户uid',
    chance_times int(11) DEFAULT 1 COMMENT '竞猜次数',
     last_match_id bigint(20) DEFAULT NULL COMMENT '最后投注比赛id',
    total_award_amt int(11) DEFAULT 0 COMMENT '竞猜总金额',
	create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
	status TINYINT (1) DEFAULT 0 COMMENT '删除标识符 1 - 已删除',
    PRIMARY KEY (uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT '用户竞猜次数';


DROP TABLE IF EXISTS `t_worldcup_guess_channel`;
CREATE TABLE `t_worldcup_guess_channel` (
    channel_code varchar(128) NOT NULL COMMENT '渠道code',
    channel_name varchar(256) NOT NULL COMMENT '渠道名称',
    channel_url varchar(200) NOT NULL COMMENT '渠道url',
    chance_times int(11) DEFAULT 1 COMMENT '竞猜次数',
	  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
	  status TINYINT (1) DEFAULT 0 COMMENT '删除标识符 1 - 已删除',
    PRIMARY KEY (channel_code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT '竞猜渠道';


DROP TABLE IF EXISTS `t_worldcup_guess_chance_detail`;
CREATE TABLE `t_worldcup_guess_chance_detail` (
	  uid varchar(20) binary NOT NULL COMMENT '用户uid',
    channel_code varchar(128) NOT NULL COMMENT '渠道code',
    chance_date date DEFAULT NULL COMMENT '取得机会日期',
    chance_long_date bigint(20) DEFAULT NULL COMMENT '取得机会中国日期',
    chance_times int(11) DEFAULT 1 COMMENT '竞猜次数',
	  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
	  status TINYINT (1) DEFAULT 0 COMMENT '删除标识符 1 - 已删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT '用户获取竞猜渠道';

DROP TABLE IF EXISTS `t_water_record`;
CREATE TABLE `t_water_record` (
  `id` varchar(40) COLLATE utf8mb4_bin NOT NULL COMMENT '记录ID',
  `user_id` varchar(40) COLLATE utf8mb4_bin NOT NULL COMMENT '用户ID',
  `phone` varchar(20) COLLATE utf8mb4_bin NOT NULL COMMENT '手机号',
  `name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '姓名',
  `address` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '收获地址',
  `status` enum('-1','0','1','2') COLLATE utf8mb4_bin NOT NULL DEFAULT '0' COMMENT '状态: 0 等待提交个人信息, 1等待发货,2 已经发货, -1 由于某些原因不予发货',
  `is_new` tinyint(4) NOT NULL COMMENT '是否是新用户 1 是 0 不是',
  `remark` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注说明',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `attributes` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_idx` (`user_id`) USING BTREE,
  UNIQUE KEY `phone_idx` (`phone`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='送饮水机活动用户参与记录';
