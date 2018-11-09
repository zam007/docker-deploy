use `scheduler`;

insert into `t_c_job` ( job_id, `end_time`, `job_desc`, `cron_string`, `job_name`, `start_time`, `update_time`, `enable`, `create_time`, `run_time`, `status`) values
( 6, '2099-08-14 10:41:13', '世界杯比赛状态检查任务', '0 */1 * * * ?', 'WorldCupMatchResultCheck',      '2018-05-12 10:00:13', '2018-05-12 10:22:46', 'Y', '2018-05-12 10:00:00', '2018-05-12 10:00:00', 'Y'),
( 7, '2099-08-14 10:41:13', '世界杯比赛竞猜结果任务', '0 */2 * * * ?', 'WorldCupMatchGuessResultCheck', '2018-05-12 10:00:13', '2018-05-12 10:22:46', 'Y', '2018-05-12 10:00:00', '2018-05-12 10:00:00', 'Y');

insert into `t_c_task` ( task_id, `task_desc`, `enable`, `task_package`, `status`, `thread_num`, `create_time`, `task_name`) values
( 6, '世界杯比赛状态检查任务', 'Y', 'com.umscloud.scheduler.task.WorldCupMatchResultCheckTask', 'Y', '1', '2018-05-12 10:50:00', 'WorldCupMatchResultCheckTask'),
( 7, '世界杯比赛竞猜结果任务', 'Y', 'com.umscloud.scheduler.task.WorldCupMatchGuessResultCheckTask', 'Y', '1', '2018-05-12 10:50:00', 'WorldCupMatchGuessResultCheckTask');


insert into `t_c_job_tasks` ( `update_time`, `status`, `sequence`, `job_id`, `task_id`, `create_time`) values
( '2018-05-12 10:29:35', 'Y', '1', '6', '6', '2018-05-12 10:41:38'),
( '2018-05-12 10:29:35', 'Y', '1', '7', '7', '2018-05-12 10:41:38');
