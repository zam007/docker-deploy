use `activity`;

ALTER TABLE `t_activity`
ADD COLUMN `region_id` VARCHAR(32) NOT NULL DEFAULT 'china' AFTER `build_ver`,
ADD COLUMN `region_name` VARCHAR(50) NOT NULL DEFAULT '全国' AFTER `region_id`;

