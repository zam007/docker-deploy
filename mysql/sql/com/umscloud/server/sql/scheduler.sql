CREATE DATABASE IF NOT EXISTS `scheduler`;
USE `scheduler`;

drop table if exists t_c_job;
CREATE TABLE `t_c_job` (
  `job_id` int(11)  NOT NULL AUTO_INCREMENT COMMENT '工作ID',
  `job_name` varchar(60) DEFAULT NULL COMMENT '工作名称',
  `job_desc` varchar(200) DEFAULT NULL COMMENT '工作描述',
  `cron_string` varchar(100) DEFAULT NULL COMMENT '执行规则',
  `start_time` bigint  DEFAULT NULL COMMENT '开始执行时间',
  `end_time` bigint  DEFAULT NULL COMMENT '结束执行时  间',
  `run_time` bigint  DEFAULT NULL COMMENT '指定执行时间',
  `create_time` bigint COMMENT '创建时间',
  `update_time` bigint  COMMENT '更新时间',
  `enable` varchar(10) DEFAULT 'Y' COMMENT '任务开关',
  `status` varchar(10) DEFAULT 'Y'  COMMENT '状态',
  PRIMARY KEY (`job_id`)
) ;

drop table if exists t_c_job_tasks;
CREATE TABLE `t_c_job_tasks` (
  `job_task_id` int(11)  NOT NULL AUTO_INCREMENT COMMENT '工作流程ID',
  `job_id` int(11) NOT NULL COMMENT '工作ID',
  `task_id` int(11) NOT NULL COMMENT '任务ID',
  `sequence` int(11) NOT NULL COMMENT '顺序',
  `create_time` bigint COMMENT '创建时间',
  `update_time` bigint  COMMENT '更新时间',
  `status` varchar(10) DEFAULT 'Y'  COMMENT '状态',
  PRIMARY KEY (`job_task_id`)
);

drop table if exists t_c_task;
CREATE TABLE `t_c_task` (
  `task_id` int(11)  NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `task_name` varchar(60) DEFAULT NULL COMMENT '任务名称',
  `task_desc` varchar(200) DEFAULT NULL COMMENT '任务描述',
  `task_package` varchar(255) DEFAULT NULL COMMENT '全路径',
  `thread_num` int(11)  DEFAULT NULL COMMENT '处理线程数',
  `create_time` bigint COMMENT '创建时间',
  `enable` varchar(10) DEFAULT 'Y' COMMENT '任务开关',
  `status` varchar(10) DEFAULT 'Y'  COMMENT '状态',
  PRIMARY KEY (`task_id`)
) ;

drop table if exists t_l_job_run;
CREATE TABLE `t_l_job_run` (
  `job_run_id` int(11)  NOT NULL AUTO_INCREMENT COMMENT '工作执行ID',
  `job_id` int(11) NOT NULL COMMENT '工作ID',
  `cron_string` varchar(45) DEFAULT NULL,
  `start_time` bigint COMMENT '开始时间',
  `end_time` bigint  DEFAULT NULL COMMENT '结束时间',
  `job_result` varchar(10) DEFAULT NULL COMMENT 'job执行结果',
  `status` varchar(10) DEFAULT 'Y'  COMMENT '状态',
  PRIMARY KEY (`job_run_id`)
) ;

drop table if exists t_l_job_task_run;
CREATE TABLE `t_l_job_task_run` (
  `job_run_log_id` int(11)  NOT NULL AUTO_INCREMENT COMMENT '工作任务执行日志ID',
  `job_run_id` int(11) NOT NULL COMMENT '工作ID',
  `job_id` int(11) NOT NULL COMMENT '工作ID',
  `task_id` int(11) NOT NULL COMMENT '任务ID',
  `params` varchar(64) DEFAULT NULL,
  `task_result` varchar(10) DEFAULT NULL COMMENT '任务执行结果',
  `task_err` mediumtext,
  `start_time` bigint DEFAULT NULL  COMMENT '开始时间',
  `end_time` bigint  DEFAULT NULL COMMENT '结束时间',
  `status` varchar(10) DEFAULT 'Y' COMMENT '状态',
  PRIMARY KEY (`job_run_log_id`)
) ;


insert into `t_c_job` ( `end_time`, `job_desc`, `cron_string`, `job_name`, `start_time`, `update_time`, `enable`, `create_time`, `run_time`, `status`) values
( 4090358473000, '管理任务', '0 */1 * * * ?', 'Manage', 1526090413000, 1526090413000, 'Y', 1526090413000, 1526090413000, 'Y');
