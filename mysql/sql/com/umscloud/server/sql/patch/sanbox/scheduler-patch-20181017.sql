INSERT INTO `scheduler`.`t_c_job`(`job_id`,`job_name`,`job_desc`,`cron_string`,`start_time`,`end_time`,`run_time`,`create_time`,`update_time`,`enable`,`status`)
VALUES
  (10,'YouLiaoRecommendationTask','网易有料二期任务','0 */10 * * * ?','2018-05-12 10:00:13','2099-08-14 10:41:13','2018-05-12 10:00:00','2018-05-12 10:00:00','2018-10-13 14:03:21','Y','Y'),
  (11,'YouLiaoBatchVideoTask','网易有料视频批处理','0 */10 * * * ?','2018-05-12 10:00:13','2099-08-14 10:41:13','2018-05-12 10:00:00','2018-05-12 10:00:00','2018-10-13 14:03:21','Y','Y');


INSERT INTO `scheduler`.`t_c_task`(`task_id`,`task_name`,`task_desc`,`task_package`,`thread_num`,`create_time`,`enable`,`status`)
VALUES
  (10,'YouLiaoRecommendationTask','网易有料二期任务检查','com.umscloud.scheduler.task.YouLiaoRecommendationTask',1,'2018-05-12 10:50:00','Y','Y'),
  (11,'YouLiaoBatchVideoTask','网易有料视频批处理任务','com.umscloud.scheduler.task.YouLiaoBatchVideoTask',1,'2018-05-12 10:50:00','Y','Y');


INSERT INTO `scheduler`.`t_c_job_tasks`(`job_task_id`,`job_id`,`task_id`,`sequence`,`create_time`,`update_time`,`status`)
VALUES
  (10,10,10,1,'2018-05-12 10:41:38','2018-05-12 10:29:35','Y'),
  (11,11,11,1,'2018-05-12 10:41:38','2018-05-12 10:29:35','Y');