

USE app;
DROP TABLE IF EXISTS `app_channel`;
CREATE TABLE `app_channel` (
  `channel_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '渠道编号',
  `channel_name` varchar(100) NOT NULL COMMENT '渠道名称',
  `channel_icon` varchar(1000) DEFAULT NULL COMMENT '渠道图标',
  `channel_num` varchar(100) NOT NULL COMMENT '渠道 号',
  `sort` int(255) DEFAULT NULL,
  `create_time` bigint(20) DEFAULT NULL,
  `status` int(1) NOT NULL COMMENT '状态 1:正常 0：删除',
  PRIMARY KEY (`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;



DROP TABLE IF EXISTS `app_channel_version`;
CREATE TABLE `app_channel_version` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `channel_num` varchar(20) DEFAULT NULL COMMENT '渠道号',
  `version_code` int(20) DEFAULT NULL COMMENT '版本编号',
  `dowload_url` varchar(200) DEFAULT NULL,
  `system_type` varchar(20) DEFAULT NULL COMMENT '系统类型',
  `package_name` varchar(100) DEFAULT NULL COMMENT '包名',
  `status` varchar(1) DEFAULT NULL COMMENT '状态 0 删除 1正常',
  `file_md5` varchar(100) DEFAULT NULL COMMENT '文件md5',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `creater` varchar(20) DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `app_update`;
CREATE TABLE `app_update` (
  `version_id` int(10) NOT NULL AUTO_INCREMENT,
  `version_name` varchar(50) NOT NULL COMMENT '版本名称',
  `version_code` int(20) NOT NULL COMMENT '版本号',
  `version_description` varchar(1000) DEFAULT NULL COMMENT '版本说明',
  `product_name` varchar(50) DEFAULT NULL COMMENT '产品名称',
  `package_name` varchar(50) DEFAULT NULL COMMENT '包名',
  `is_update_version` varchar(1) DEFAULT '0' COMMENT '是否更新 0： 不更新   1：更新',
  `is_force_update_version` varchar(1) DEFAULT NULL COMMENT '是否强制更新     0： 不更新   1：更新',
  `dowload_url` varchar(200) DEFAULT NULL COMMENT '下载基准包地址',
  `md5` varchar(100) CHARACTER SET latin1 DEFAULT NULL COMMENT '文件md5',
  `file_size` bigint(20) DEFAULT NULL,
  `update_type` varchar(20) DEFAULT NULL COMMENT '更新类型 1、强制更新  2、非强制更新',
  `system_type` varchar(10) DEFAULT NULL COMMENT '系统类型（ios，安卓）',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  `creater` varchar(20) DEFAULT NULL COMMENT '创建人',
  `modifier_time` bigint(20) DEFAULT NULL COMMENT '修改时间',
  `modifier` varchar(20) CHARACTER SET latin1 DEFAULT NULL COMMENT '修改人',
  `effect` varchar(1) DEFAULT NULL COMMENT '状态 1:生效 0:未生效',
  `status` varchar(1) NOT NULL COMMENT '状态。1:正常。0:删除',
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;



--回滚sql
USE app;
DROP TABLE IF EXISTS `app_update`;
DROP TABLE IF EXISTS `app_channel_version`;
DROP TABLE IF EXISTS `app_channel`;
​

