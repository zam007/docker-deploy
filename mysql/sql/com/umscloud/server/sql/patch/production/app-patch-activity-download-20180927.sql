

use app;

DROP TABLE IF EXISTS `app_activity`;
CREATE TABLE `app_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `adid` varchar(100) DEFAULT NULL COMMENT '活动编号',
  `version_code` int(10) DEFAULT NULL COMMENT '版本号',
  `download_url` varchar(300) DEFAULT NULL COMMENT '下载地址',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `status` int(1) DEFAULT NULL COMMENT '状态 0 删除 1正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

