ALTER TABLE `activity`.`t_activity`
ADD COLUMN `build_ver` VARCHAR(20) NULL DEFAULT NULL COMMENT 'IOS 编译版本' AFTER `url`;
