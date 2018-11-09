ALTER TABLE `comment`.`t_subject_2018_03`
  DROP COLUMN `video_style`;

ALTER TABLE `comment`.`t_subject_2018_04`
  DROP COLUMN `video_style`;

ALTER TABLE `comment`.`t_subject_2018_05`
  DROP COLUMN `video_style`;

ALTER TABLE `comment`.`t_subject_2018_06`
  DROP COLUMN `video_style`;

ALTER TABLE `comment`.`t_subject_2018_07`
  DROP COLUMN `video_style`;

ALTER TABLE `comment`.`t_subject_2018_08`
  DROP COLUMN `video_style`;

ALTER TABLE `comment`.`t_subject_2018_09`
  DROP COLUMN `video_style`;

ALTER TABLE `comment`.`t_subject_2018_10`
  DROP COLUMN `video_style`;

ALTER TABLE `comment`.`t_subject_2018_11`
  DROP COLUMN `video_style`;

ALTER TABLE `comment`.`t_subject_2018_12`
  DROP COLUMN `video_style`;

ALTER TABLE `comment`.`t_subject_2019_01`
  DROP COLUMN `video_style`;

ALTER TABLE `comment`.`t_subject_2019_02`
  DROP COLUMN `video_style`;

ALTER TABLE `comment`.`t_subject_2019_03`
  DROP COLUMN `video_style`;

ALTER TABLE `comment`.`t_subject_2019_04`
  DROP COLUMN `video_style`;

ALTER TABLE `comment`.`t_subject_2019_05`
  DROP COLUMN `video_style`;

ALTER TABLE `comment`.`t_subject_2019_06`
  DROP COLUMN `video_style`;


DELETE FROM `scheduler`.`t_c_job` WHERE `job_id`='10';

DELETE FROM `scheduler`.`t_c_task` WHERE `task_id`='10';

DELETE FROM `scheduler`.`t_c_job_tasks` WHERE `job_task_id`='10';

DELETE FROM `scheduler`.`t_c_job` WHERE `job_id`='11';

DELETE FROM `scheduler`.`t_c_task` WHERE `task_id`='11';

DELETE FROM `scheduler`.`t_c_job_tasks` WHERE `job_task_id`='11';