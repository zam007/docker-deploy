DROP TABLE IF EXISTS `t_tuzhu_answer`;
CREATE TABLE `t_tuzhu_answer` (
  `answer_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `question_id` bigint(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `bingo` enum('Y','N') NOT NULL DEFAULT 'N',
  `seq` int(11) NOT NULL COMMENT '编码',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '删除标识符 N - 已删除',
  PRIMARY KEY (`answer_id`),
  UNIQUE KEY `idx_unq_answer_seq` (`answer_id`,`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `t_tuzhu_question`;
CREATE TABLE `t_tuzhu_question` (
  `question_id` bigint(20) NOT NULL ,
  `activity_id` bigint(20) NOT NULL COMMENT '活动id',
  `title` varchar(300) NOT NULL COMMENT '题目',
  `level` enum('H','E') NOT NULL DEFAULT 'E' COMMENT '难度 H - hard, E - easy',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '删除标识符 N - 已删除',
  PRIMARY KEY (`question_id`),
  KEY `idx_question_activity` (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `t_tuzhu_user_answer`;
CREATE TABLE `t_tuzhu_user_answer` (
  `user_answer_id` bigint(20) NOT NULL,
  `activity_id` bigint(20) NOT NULL COMMENT '活动id',
  `uid` varchar(45) NOT NULL,
  `score` float unsigned NOT NULL DEFAULT '0' COMMENT '得分',
  `complete` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT '是否回答完成',
  `award_amt` int(11) unsigned DEFAULT NULL COMMENT '获取金额',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '删除标识符 N - 已删除',
  PRIMARY KEY (`user_answer_id`),
  KEY `idx_user_answer_uid` (`uid`),
  KEY `idx_user_answer_activity` (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `t_tuzhu_user_answer_detail`;
CREATE TABLE `t_tuzhu_user_answer_detail` (
  `answer_detail_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_answer_id` bigint(20) NOT NULL,
  `question_id` bigint(20) NOT NULL,
  `answer_id` bigint(20) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL,
  `score` float DEFAULT NULL,
  `answer_result` enum('Y','N') DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '删除标识符 N - 已删除',
  PRIMARY KEY (`answer_detail_id`),
  KEY `idx_answer_detail` (`user_answer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `t_tuzhu_user_chance`;
CREATE TABLE `t_tuzhu_user_chance` (
  `chance_id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` bigint(20) NOT NULL COMMENT '活动id',
  `uid` varchar(45) NOT NULL,
  `channel` varchar(45) NOT NULL DEFAULT 'login',
  `chance_count` int(10) unsigned NOT NULL DEFAULT '1',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '删除标识符 N - 已删除',
  PRIMARY KEY (`chance_id`),
  KEY `idx_chance_uid` (`uid`),
  KEY `idx_chance_activity` (`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `t_tuzhu_user_invite`;
CREATE TABLE `t_tuzhu_user_invite` (
  `inviter` varchar(45) NOT NULL,
  `invitee` varchar(45) NOT NULL,
  `activity_id` bigint(20) NOT NULL COMMENT '活动id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '删除标识符 N - 已删除',
  PRIMARY KEY (`inviter`,`invitee`,`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `t_tuzhu_user_statistic`;
CREATE TABLE `t_tuzhu_user_statistic` (
  `uid` varchar(45) NOT NULL,
  `activity_id` bigint(20) NOT NULL COMMENT '活动id',
  `chance` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '机会',
  `total_award_amt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '总金额',
  `max_score` float NOT NULL DEFAULT '0',
  `salt` varchar(4) NOT NULL COMMENT '盐巴，加密',
  `qrcode` varchar(100) DEFAULT NULL COMMENT '二维码地址',
  `attributes` varchar(500) DEFAULT '{}',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '删除标识符 N - 已删除',
  PRIMARY KEY (`uid`,`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


