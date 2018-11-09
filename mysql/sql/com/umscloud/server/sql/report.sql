CREATE DATABASE IF NOT EXISTS report DEFAULT CHARACTER SET utf8mb4;
USE report;

DROP TABLE IF EXISTS `t_report_type`;
CREATE TABLE `t_report_type` (
  `report_type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '举报类型id',
  `report_type` varchar(30) NOT NULL COMMENT '举报类型 subject - 帖子， group - 群组',
  `report_code` varchar(30) NOT NULL COMMENT '举报类型代码',
  `report_contents` varchar(300) NOT NULL COMMENT '举报内容',
  `bool_delete` tinyint(1) DEFAULT 0 COMMENT '删除标识符',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`report_type_id`),
  UNIQUE KEY `i_un_report_code` (`report_code`)
) ;

INSERT INTO t_report_type (report_type, report_code, report_contents, create_time) VALUES
('subject','subject_marketing', '垃圾营销',1),
('subject','subject_infact', '不实信息',2),
('subject','subject_sex', '淫秽色情',3),
('subject','subject_attack', '人身攻击',4),
('subject','subject_copyright', '抄袭我的内容',5),
('subject','subject_award', '违规有奖活动',6),
('subject','subject_harmful', '有害信息',7),
('subject','subject_illegal', '违法信息',8)
;



DROP TABLE IF EXISTS `t_report`;
CREATE TABLE `t_report` (
  `report_id` varchar(32) NOT NULL COMMENT '举报id',
  `report_type` varchar(30) NOT NULL DEFAULT 'subject' COMMENT '举报类型 subject - 帖子， group - 群组',
  `report_code` varchar(30) DEFAULT NULL COMMENT '举报类型代码',
  `object_type` varchar(20) NOT NULL COMMENT '举报类型type',
  `object_id` varchar(128) NOT NULL COMMENT '举报类型Id',
  `userid` varchar(128)  NOT NULL COMMENT '举报用户id',
  `comments` varchar(200) DEFAULT NULL COMMENT '用户说明',
  `attributes` varchar(300) DEFAULT NULL COMMENT '额外属性',
  `bool_delete` tinyint(1) DEFAULT 0 COMMENT '删除标识符',
  `create_time` bigint(20) DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`report_id`)
) ;