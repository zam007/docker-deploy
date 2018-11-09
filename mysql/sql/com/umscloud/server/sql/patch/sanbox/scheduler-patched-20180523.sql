use `scheduler`;

ALTER TABLE `scheduler`.`t_l_job_task_run`
ADD INDEX `idx_job_task_run_id` USING BTREE (`job_run_id` ASC);
