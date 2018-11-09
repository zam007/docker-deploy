
use `comment`;

CREATE TABLE `t_push_subject` (

  `objectid` VARCHAR(32) PRIMARY KEY,

`subjectid` VARCHAR(32) NOT NULL COMMENT '帖子id',

`subjecturl` VARCHAR(100) NOT NULL COMMENT '帖子url',

`regionid` VARCHAR(32) NOT NULL COMMENT '区域id',

`regionname` VARCHAR(32) NOT NULL COMMENT '区域名称',

`pushuserid` VARCHAR(32) NOT NULL COMMENT '推送人id',

`pushusername` VARCHAR(32) NOT NULL COMMENT '推送人名称',

 `create_time` BIGINT NOT NULL COMMENT '创建时间',

 `update_time` BIGINT NOT NULL COMMENT '修改时间',

`status` INT NOT NULL COMMENT '是否已推送0:否，1:是',

 `bool_delete` INT NOT NULL COMMENT '是否删除0:否，1:是'

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE INDEX push_subject_regionid_index ON `t_push_subject`(`regionid`);

CREATE INDEX push_subject_updatetime_index ON `t_push_subject`(`update_time`);

use `upms`;


alter table `sys_user` add  column`push_manage_city` varchar(255) COMMENT '推送管理城市';


insert into sys_menu (id,name,permissions,type,order_no) values('wuMykZ4Kw39D','管理','push_manager','subject','63');

