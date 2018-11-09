CREATE DATABASE IF NOT EXISTS `scheduler`;
USE `scheduler`;

drop table if exists `t_c_job`;
CREATE TABLE `t_c_job` (
  `job_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '工作ID',
  `job_name` varchar(60) DEFAULT NULL COMMENT '工作名称',
  `job_desc` varchar(200) DEFAULT NULL COMMENT '工作描述',
  `cron_string` varchar(100) DEFAULT NULL COMMENT '执行规则',
  `start_time` datetime DEFAULT NULL COMMENT '开始执行时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束执行时间',
  `run_time` datetime DEFAULT NULL COMMENT '指定执行时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `enable` enum('Y','N') DEFAULT NULL COMMENT '任务开关',
  `status` enum('Y','N') NOT NULL COMMENT '状态',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='工作表';

drop table if exists `t_c_job_tasks`;
CREATE TABLE `t_c_job_tasks` (
  `job_task_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '工作流程ID',
  `job_id` int(11) NOT NULL COMMENT '工作ID',
  `task_id` int(11) NOT NULL COMMENT '任务ID',
  `sequence` int(11) NOT NULL COMMENT '顺序',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` enum('Y','N') NOT NULL COMMENT '状态',
  PRIMARY KEY (`job_task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='工作任务流程表';

drop table if exists `t_c_task`;
CREATE TABLE `t_c_task` (
  `task_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `task_name` varchar(60) DEFAULT NULL COMMENT '任务名称',
  `task_desc` varchar(200) DEFAULT NULL COMMENT '任务描述',
  `task_package` varchar(255) DEFAULT NULL COMMENT '全路径',
  `thread_num` int(11) unsigned DEFAULT NULL COMMENT '处理线程数',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `enable` enum('Y','N') DEFAULT NULL COMMENT '任务开关',
  `status` enum('Y','N') NOT NULL COMMENT '状态',
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='任务表';

drop table if exists `t_l_job_run`;
CREATE TABLE `t_l_job_run` (
  `job_run_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '工作执行ID',
  `job_id` int(11) NOT NULL COMMENT '工作ID',
  `cron_string` varchar(45) DEFAULT NULL,
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `job_result` enum('Y','N') DEFAULT NULL COMMENT 'job执行结果',
  `status` enum('Y','N') DEFAULT 'Y' COMMENT '状态',
  PRIMARY KEY (`job_run_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='工作执行表';

drop table if exists `t_l_job_task_run`;
CREATE TABLE `t_l_job_task_run` (
  `job_run_log_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '工作任务执行日志ID',
  `job_run_id` int(11) NOT NULL COMMENT '工作ID',
  `job_id` int(11) NOT NULL COMMENT '工作ID',
  `task_id` int(11) NOT NULL COMMENT '任务ID',
  `params` varchar(64) DEFAULT NULL,
  `task_result` enum('Y','N') DEFAULT NULL COMMENT '任务执行结果',
  `task_err` mediumtext,
  `start_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `status` enum('Y','N') DEFAULT 'Y' COMMENT '状态',
  PRIMARY KEY (`job_run_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='工作任务执行日志';


insert into `scheduler`.`t_c_job` ( `end_time`, `job_desc`, `cron_string`, `job_name`, `start_time`, `update_time`, `enable`, `create_time`, `run_time`, `status`) values ( '2099-08-14 10:41:13', '管理任务', '0 */1 * * * ?', 'Manage', '2018-05-12 10:00:13', '2018-05-12 10:22:46', 'Y', '2018-05-12 10:00:00', '2018-05-12 10:00:00', 'Y');
insert into `scheduler`.`t_c_job` ( `end_time`, `job_desc`, `cron_string`, `job_name`, `start_time`, `update_time`, `enable`, `create_time`, `run_time`, `status`) values ( '2099-08-30 10:00:00', '支付宝提现任务', '0 */1 * * * ?', 'AlipayWithdraw', '2018-05-12 10:00:00', '2018-05-12 10:22:49', 'Y', '2018-05-12 10:00:00', '2018-05-12 10:00:00', 'Y');
insert into `scheduler`.`t_c_job` ( `end_time`, `job_desc`, `cron_string`, `job_name`, `start_time`, `update_time`, `enable`, `create_time`, `run_time`, `status`) values ( '2099-08-30 10:00:00', '支付宝提现状态同步任务', '0 */1 * * * ?', 'AlipayWithdrawStatusSync', '2018-05-12 10:00:00', '2018-05-12 10:26:23', 'Y', '2018-05-12 10:00:00', '2018-05-12 10:00:00', 'Y');
-- insert into `scheduler`.`t_c_job` ( `end_time`, `job_desc`, `cron_string`, `job_name`, `start_time`, `update_time`, `enable`, `create_time`, `run_time`, `status`) values ( '2099-08-30 10:00:00', '稿费回退任务', '0 10 1 * * ?', 'PaymentRollback', '2018-05-12 10:00:00', '2018-05-12 10:26:23', 'Y', '2018-05-12 10:00:00', '2018-05-12 10:00:00', 'Y');
insert into `scheduler`.`t_c_job` ( `end_time`, `job_desc`, `cron_string`, `job_name`, `start_time`, `update_time`, `enable`, `create_time`, `run_time`, `status`) values ( '2099-08-30 10:00:00', '充值补贴任务', '0 0 1 * * ?', 'RechargeAllowance', '2018-05-12 10:00:00', '2018-05-12 10:26:23', 'Y', '2018-05-12 10:00:00', '2018-05-12 10:00:00', 'Y');

insert into `scheduler`.`t_c_task` ( `task_desc`, `enable`, `task_package`, `status`, `thread_num`, `create_time`, `task_name`) values ( '管理任务', 'Y', 'com.umscloud.scheduler.task.ManageTask', 'Y', '1', '2018-05-12 10:42:25', 'ManageTask');
insert into `scheduler`.`t_c_task` ( `task_desc`, `enable`, `task_package`, `status`, `thread_num`, `create_time`, `task_name`) values ( '支付宝提现任务', 'Y', 'com.umscloud.scheduler.task.AlipayWithdrawTask', 'Y', '1', '2018-05-12 10:50:00', 'AlipayWithdrawTask');
insert into `scheduler`.`t_c_task` ( `task_desc`, `enable`, `task_package`, `status`, `thread_num`, `create_time`, `task_name`) values ( '支付宝提现状态同步任务', 'Y', 'com.umscloud.scheduler.task.AlipayWithdrawStatusSyncTask', 'Y', '1', '2018-05-12 10:50:00', 'AlipayWithdrawStatusSyncTask');
-- insert into `scheduler`.`t_c_task` ( `task_desc`, `enable`, `task_package`, `status`, `thread_num`, `create_time`, `task_name`) values ( '稿费过期回退任务', 'Y', 'com.umscloud.scheduler.task.PaymentRollbackTask', 'Y', '1', '2018-05-12 10:50:00', 'PaymentRollbackTask');
insert into `scheduler`.`t_c_task` ( `task_desc`, `enable`, `task_package`, `status`, `thread_num`, `create_time`, `task_name`) values ( '充值补贴任务', 'Y', 'com.umscloud.scheduler.task.RechargeAllowanceTask', 'Y', '1', '2018-05-12 10:50:00', 'RechargeAllowanceTask');

insert into `scheduler`.`t_c_job_tasks` ( `update_time`, `status`, `sequence`, `job_id`, `task_id`, `create_time`) values ( '2018-05-12 10:29:35', 'Y', '1', '1', '1', '2018-05-12 10:41:38');
insert into `scheduler`.`t_c_job_tasks` ( `update_time`, `status`, `sequence`, `job_id`, `task_id`, `create_time`) values ( '2018-05-12 10:29:37', 'Y', '1', '2', '2', '2018-05-12 10:00:00');
insert into `scheduler`.`t_c_job_tasks` ( `update_time`, `status`, `sequence`, `job_id`, `task_id`, `create_time`) values ( '2018-05-12 10:29:39', 'Y', '1', '3', '3', '2018-05-12 10:00:00');
insert into `scheduler`.`t_c_job_tasks` ( `update_time`, `status`, `sequence`, `job_id`, `task_id`, `create_time`) values ( '2018-05-12 10:29:39', 'Y', '1', '4', '4', '2018-05-12 10:00:00');
-- insert into `scheduler`.`t_c_job_tasks` ( `update_time`, `status`, `sequence`, `job_id`, `task_id`, `create_time`) values ( '2018-05-12 10:47:34', 'Y', '1', '5', '5', '2018-05-12 10:00:00');

-- patch for world cup
insert into `t_c_job` ( job_id, `end_time`, `job_desc`, `cron_string`, `job_name`, `start_time`, `update_time`, `enable`, `create_time`, `run_time`, `status`) values
( 6, '2099-08-14 10:41:13', '世界杯比赛状态检查任务', '0 */1 * * * ?', 'WorldCupMatchResultCheck',      '2018-05-12 10:00:13', '2018-05-12 10:22:46', 'Y', '2018-05-12 10:00:00', '2018-05-12 10:00:00', 'Y'),
( 7, '2099-08-14 10:41:13', '世界杯比赛竞猜结果任务', '0 */2 * * * ?', 'WorldCupMatchGuessResultCheck', '2018-05-12 10:00:13', '2018-05-12 10:22:46', 'Y', '2018-05-12 10:00:00', '2018-05-12 10:00:00', 'Y');

insert into `t_c_task` ( task_id, `task_desc`, `enable`, `task_package`, `status`, `thread_num`, `create_time`, `task_name`) values
( 6, '世界杯比赛状态检查任务', 'Y', 'com.umscloud.scheduler.task.WorldCupMatchResultCheckTask', 'Y', '1', '2018-05-12 10:50:00', 'WorldCupMatchResultCheckTask'),
( 7, '世界杯比赛竞猜结果任务', 'Y', 'com.umscloud.scheduler.task.WorldCupMatchGuessResultCheckTask', 'Y', '1', '2018-05-12 10:50:00', 'WorldCupMatchGuessResultCheckTask');


insert into `t_c_job_tasks` ( `update_time`, `status`, `sequence`, `job_id`, `task_id`, `create_time`) values
( '2018-05-12 10:29:35', 'Y', '1', '6', '6', '2018-05-12 10:41:38'),
( '2018-05-12 10:29:35', 'Y', '1', '7', '7', '2018-05-12 10:41:38');