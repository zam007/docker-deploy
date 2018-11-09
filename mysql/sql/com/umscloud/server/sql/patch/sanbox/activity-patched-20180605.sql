CREATE DATABASE IF NOT EXISTS `activity`;
USE `activity`;

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

insert into t_worldcup_activity(activity_name,activity_desc,activity_infact_money,activity_money) values
('小组赛第一轮 (6天) 5万/每天','奖金：5万/每天',500000,5000000),
('小组赛第二轮 (6天) 10万/每天','奖金：10万/每天',1000000,10000000),
('小组赛第三轮 (6天) 10万/每天','奖金：15万/每天',1500000,15000000),
('八分之一决赛 (4天) 25万/每天','奖金：25万/每天',2500000,25000000),
('四分之一决赛 (2天) 40万/每天','奖金：40万/每天',4000000,40000000),
('半决赛      (2天) 50万/每天','奖金：50万/每天',5000000,50000000),
('三四名决赛   (1天) 55万','奖金：55万',5000000,50000000),
('决赛        (1天) 100万','奖金：100万',10000000,100000000)

;

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

insert into t_worldcup_team(team_name) values
('俄罗斯'),('德国'),('巴西'), ('葡萄牙'),('阿根廷'),('比利时'),('波兰'),('法国'),
('西班牙'),('秘鲁'),('瑞士'), ('英格兰'),('哥伦比亚'),('墨西哥'),('乌拉圭'),('克罗地亚'),
('丹麦'),('冰岛'),('哥斯达黎加'), ('瑞典'),('突尼斯'),('埃及'),('塞内加尔'),('伊朗'),
('塞尔维亚'),('尼日利亚'),('澳大利亚'), ('日本'),('摩洛哥'),('巴拿马'),('韩国'),('沙特');

DROP TABLE IF EXISTS `t_worldcup_team_match`;
CREATE TABLE `t_worldcup_team_match` (
    match_id bigint(20) NOT NULL COMMENT ' 主键 ',
    activity_id bigint(20) NOT NULL COMMENT '活动名称',
	  home_team_id bigint(20) NOT NULL COMMENT '主球队名称',
    gust_team_id bigint(20) NOT NULL COMMENT '客球队名称',
    match_date varchar(50) DEFAULT NULL COMMENT '比赛日期',
    match_long_date bigint(20) DEFAULT NULL COMMENT '比赛日期long',
    start_time datetime DEFAULT NULL COMMENT '开始时间',
	  end_time datetime DEFAULT NULL COMMENT '结束时间',
    match_type enum('group','knockout') NOT NULL DEFAULT 'group' COMMENT 'group - 小组赛，knockout - 淘汰撒',
    win_team_id bigint(20) DEFAULT NULL COMMENT '胜利球队id',
    match_result enum('win','equal') DEFAULT null COMMENT 'win - 小组赛，knockout - 淘汰撒',
    match_desc VARCHAR(200) DEFAULT null COMMENT '比分描述',
    guess_person_infactw_count int(11) DEFAULT 0 COMMENT '竞猜实际人数',
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
	create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
	status TINYINT (1) DEFAULT 0 COMMENT '删除标识符 1 - 已删除',
    PRIMARY KEY (uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT '用户竞猜次数';


DROP TABLE IF EXISTS `t_worldcup_guess_channel`;
CREATE TABLE `t_worldcup_guess_channel` (
    channel_code varchar(20) NOT NULL COMMENT '渠道code',
    channel_name varchar(20) NOT NULL COMMENT '渠道名称',
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
    channel_code varchar(20) NOT NULL COMMENT '渠道code',
    chance_date date DEFAULT NULL COMMENT '取得机会日期',
    chance_long_date bigint(20) DEFAULT NULL COMMENT '取得机会中国日期',
    chance_times int(11) DEFAULT 1 COMMENT '竞猜次数',
	  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
	  status TINYINT (1) DEFAULT 0 COMMENT '删除标识符 1 - 已删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT '用户获取竞猜渠道';

