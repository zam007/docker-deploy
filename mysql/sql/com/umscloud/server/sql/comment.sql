CREATE DATABASE IF NOT EXISTS comment DEFAULT CHARACTER SET utf8mb4;
USE comment;


DROP TABLE IF EXISTS `t_follower`;
CREATE TABLE `t_follower` (
  communityid VARCHAR(128) BINARY NOT NULL COMMENT '自媒体id',
  userid VARCHAR(128) BINARY NOT NULL COMMENT '用户  id',
  `long_create_time` BIGINT DEFAULT 0 COMMENT '创建     时间',
  `long_update_time` BIGINT DEFAULT 0 COMMENT '修改时间',
  PRIMARY KEY (communityid,userid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `t_community`;

CREATE TABLE `t_community` (
  `objectID` VARCHAR(128) BINARY NOT NULL COMMENT '社区   id',
  img TEXT COMMENT '社区图片',
  blogo TEXT COMMENT '大logo',
  slogo TEXT COMMENT '小logo',
  qrcode TEXT COMMENT '二维码',
  name VARCHAR(128) BINARY NOT NULL COMMENT '社区名字',
  description VARCHAR(128) COMMENT '社区描  述',
  long_create_time BIGINT DEFAULT 0 COMMENT '创建时间',
  long_update_time BIGINT DEFAULT 0 COMMENT '修改时间',
  long_followed bigint DEFAULT 0 COMMENT '关注者数量',
  person_name TEXT COMMENT '个 人名字',
  id_card varchar(20) NOT NULL COMMENT '身份证',
  idcardfrontimg VARCHAR(255) NOT NULL COMMENT '身份证正面',
  idcardbackimg VARCHAR(255) NOT NULL COMMENT '身份证 正面',
  idcardfrontbyhandimg VARCHAR(255) NOT NULL COMMENT '身份证正面手持',
  business_license VARCHAR(50) COMMENT '营业执照',
  businesslicenseimg VARCHAR(255) COMMENT '营业执照照片',
  companyname VARCHAR(255) COMMENT '企业名字',
  bool_delete BOOL DEFAULT 0 COMMENT '删除标识符',
  bool_ban BOOL DEFAULT 0 COMMENT '是否被禁 言',
  int_verify INT DEFAULT 0 COMMENT '审核 1 - 通过  0 - 未审核  -1 - 拒绝',
  region_id VARCHAR(32) DEFAULT '0' COMMENT '地区：默认0-全国',
  longitude VARCHAR(10) COMMENT '经度',
  latitude VARCHAR(10) COMMENT '纬度',
  int_type INT DEFAULT 0 COMMENT '类型 0-个人 1-公司',
  int_category INT DEFAULT 0 COMMENT '性质 1-超管 0-普通',
  int_nature INT DEFAULT 0 COMMENT '性质 0-私人 1-公开',
  int_self INT DEFAULT 0 COMMENT '是否是自营 用于推荐到用户发帖子的功能， 0-非自营 1-自营',
  phone VARCHAR(30) COMMENT '手机',
  email VARCHAR(50) COMMENT '邮箱',
  tags VARCHAR(50) NOT NULL DEFAULT '' COMMENT '栏目的标签  region-cover  announce-cover   ',
  coversubjectid VARCHAR(32) DEFAULT NULL COMMENT '',
  invite_code VARCHAR(30) DEFAULT '0' COMMENT '邀请码',
  userid VARCHAR(32) BINARY COMMENT '创建者id',
  invite_user VARCHAR(32) COMMENT '邀 请人',
  attributes TEXT COMMENT '附加字段',
  PRIMARY KEY (objectID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE INDEX idx_community_name ON t_community (name);


DROP TABLE IF EXISTS t_community_apply;
CREATE TABLE `t_community_apply` (
  id VARCHAR(32) NOT NULL COMMENT 'id' PRIMARY KEY ,
  communityid VARCHAR(32) NOT NULL COMMENT '栏目id' ,
  int_apply_type INT NOT NULL COMMENT '申请类别 ',
  long_apply_time BIGINT NOT NULL DEFAULT 0 COMMENT '申请时间',
  long_verify_time BIGINT NOT NULL DEFAULT 0 COMMENT '确认时间',
  apply_text VARCHAR(255) COMMENT '申请内容',
  modify_text TEXT COMMENT '存取的实体json',
  bool_delete BOOL DEFAULT 0 COMMENT '是否删除'
);


DROP TABLE IF EXISTS t_region;
CREATE TABLE `t_region` (
  `region_id` VARCHAR(32) BINARY,
  `region_name` VARCHAR(50),
  `cover` TEXT,
  `gif` TEXT,
  `double_longitude` DOUBLE DEFAULT 0 COMMENT '经度',
  `double_latitude` DOUBLE DEFAULT 0 COMMENT '纬度',
  `geohash` VARCHAR(64) DEFAULT '' COMMENT 'geohash',
  `long_create_time` BIGINT DEFAULT 0 COMMENT '创建时间',
  `long_update_time` BIGINT DEFAULT 0 COMMENT '修改时间',
  `bool_delete` BOOL DEFAULT 0 COMMENT '删除标识',
  `province` VARCHAR(64) DEFAULT '' COMMENT '省份名字',
  `district` VARCHAR(64) DEFAULT '' COMMENT '所属大区',
  `coversubjectid` VARCHAR(64) BINARY DEFAULT NULL COMMENT '',
  `coverpresubjectid` VARCHAR(64) BINARY DEFAULT NULL COMMENT '',
  `attribute` TEXT,
  PRIMARY KEY (region_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO t_region(`region_id`,`region_name`,`cover`,`gif`,`double_latitude`,`double_longitude`,`geohash`,`long_create_time`,`long_update_time`,`bool_delete`,`province`,`district`) VALUES ('0','小宇宙','http://cover.img','http://file.tiejin.cn/public/9eBY3y2dR8/data.json',-999,-999,'','123456789','123456789',FALSE,'','');

DROP TABLE IF EXISTS t_tag;
CREATE TABLE `t_tag` (
  `id` VARCHAR(32) BINARY COMMENT '各类id',
  `tag_name` VARCHAR(100) NOT NULL COMMENT '标签 名字',
  `attribute` VARCHAR(100) DEFAULT '0' COMMENT '附加字段',
  `long_create_time` BIGINT DEFAULT 0 COMMENT '创建',
  `long_update_time` BIGINT DEFAULT 0 COMMENT '修改时间',
  `bool_delete` BOOL DEFAULT 0 COMMENT '删除标识符',
  PRIMARY KEY (id,attribute)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `t_template`;
CREATE TABLE `t_template`(
  `templateid` VARCHAR(32) BINARY NOT NULL COMMENT '模版id',
  `communityid` VARCHAR(32) BINARY DEFAULT '0' COMMENT '社区id',
  `userid` VARCHAR(32) BINARY COMMENT '用户id',
  `title` TEXT COMMENT '标题',
  `content` TEXT NOT NULL COMMENT '内容',
  `cover` TEXT COMMENT '封面图 ',
  `int_type` int NOT NULL COMMENT '帖子的内容类型：0,图片 1,视频 2,长图文',
  `int_category` int NOT NULL COMMENT '帖子性质类型：0,普通 1,征稿',
  `int_post_limit` int DEFAULT 4 COMMENT '默认4-无效 当是投稿的时候此字段有效，为了限制发帖子的类型：0,图片 1,视频 2,长图文 3,无限制',
  `long_create_time` BIGINT DEFAULT 0 COMMENT '创建时间',
  `long_update_time` BIGINT DEFAULT 0 COMMENT '修改时间',
  `long_time_line` BIGINT DEFAULT 0 COMMENT '截止日期',
  `bool_delete` BOOL NOT NULL DEFAULT FALSE COMMENT '删除标示位，默认未删除',
  `attributes` TEXT COMMENT '增加字段',
  PRIMARY KEY (templateid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `t_delete_record`;
CREATE TABLE `t_delete_record`(
  `id` VARCHAR(32) BINARY NOT NULL COMMENT 'id ',
  `subjectid` VARCHAR(32) BINARY NOT NULL COMMENT '帖子id',
  `userid` VARCHAR(32) BINARY NOT NULL COMMENT '用户id',
  `int_type` int NOT NULL COMMENT '帖子的内容类型：0,普通用户删帖 1,管理员删帖 2,超管删帖',
  `long_delete_time` BIGINT DEFAULT 0 COMMENT '修改时间',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `t_region_cover`;
CREATE TABLE `t_region_cover`(
  regionid VARCHAR(32) BINARY NOT NULL COMMENT '地区id',
  communityid VARCHAR(32) BINARY COMMENT '栏目的id',
  subjectid VARCHAR(32) BINARY COMMENT '帖子id',
  presubjectid VARCHAR(32) BINARY COMMENT '上一张帖子的id',
  long_update_time BIGINT DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (regionid)
);

DROP TABLE IF EXISTS `t_material`;
CREATE TABLE `t_material` (
  `id` varchar(40) NOT NULL COMMENT '素材id',
  `user_id` varchar(40) NOT NULL COMMENT '素材创建用户id',
  `community_id` varchar(32) DEFAULT NULL COMMENT '栏目id',
  `material_type` int(11) NOT NULL COMMENT '素材类型 1表示图片，2表示视频',
  `name` varchar(200) NOT NULL COMMENT '素材名称(关键词搜索使用)',
  `url` varchar(200) NOT NULL COMMENT '视频封面图地址、图片地址',
  `fid` varchar(100) DEFAULT NULL COMMENT '视频文件id、图片文件id',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  `update_time` bigint(20) NOT NULL COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态，默认0未删除',
  `attributes` varchar(1000) DEFAULT NULL COMMENT '扩展字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `t_community_cover`;
CREATE TABLE `t_community_cover`(
  communityid VARCHAR(32) BINARY NOT NULL COMMENT '栏目id',
  subjectid VARCHAR(32) BINARY COMMENT '帖子id',
  presubjectid VARCHAR(32) BINARY COMMENT '上一张帖子的id',
  long_update_time BIGINT DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (communityid)
);

DROP TABLE IF EXISTS `t_read_announce_record`;
CREATE TABLE `t_read_announce_record`(
  subjectid VARCHAR(32) BINARY NOT NULL COMMENT '帖子id',
  userid VARCHAR(32) BINARY NOT NULL COMMENT '读者id',
  long_read_time BIGINT DEFAULT 0 COMMENT '阅读时间',
  PRIMARY KEY (subjectid,userid)
);

DROP TABLE IF EXISTS `announce_pre_publish`;
CREATE TABLE `announce_pre_publish` (
  `id` varchar(40) NOT NULL COMMENT '待发布公告id',
  `community_id` varchar(40) NOT NULL COMMENT '栏目id',
  `start_time` bigint(20) NOT NULL COMMENT '公告预发布时间',
  `end_time` bigint(20) NOT NULL COMMENT '公告结束时间',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `announcement` TEXT COMMENT '公告',
  `operator` varchar(40) DEFAULT NULL COMMENT '编辑群组公告的栏目人员',
  `attributes` varchar(200) DEFAULT NULL COMMENT '扩展字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `t_subject_fee_record`;
CREATE TABLE `t_subject_fee_record` (
  `subjectid` VARCHAR(32) PRIMARY KEY,
  `transid` BIGINT NOT NULL COMMENT '交易id',
  `create_time` BIGINT NOT NULL COMMENT '创建时间',
  `update_time` BIGINT NOT NULL COMMENT '修改时间',
  `status` INT NOT NULL COMMENT '状态码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `t_subject_2018_05`;
CREATE TABLE `t_subject_2018_05`(
  `subjectid` VARCHAR(32) BINARY NOT NULL COMMENT '帖子id',
  `communityid` VARCHAR(32) BINARY DEFAULT '0' COMMENT '投稿的 社区id',
  `classid` VARCHAR(32) BINARY DEFAULT '0' COMMENT '投稿的班级id',
  `userid` VARCHAR(32) BINARY NOT NULL COMMENT '用户id',
  `region_id` VARCHAR(32) BINARY DEFAULT '0' COMMENT '地区id',
  `title` TEXT COMMENT '标题',
  `content` TEXT NOT NULL COMMENT '内容',
  `cover` TEXT COMMENT '封面图',
  `bigcover` TEXT COMMENT '大封面图',
  `int_read` INT NOT NULL DEFAULT 0 COMMENT '超管审核表示位',
  `int_type` int NOT NULL COMMENT '帖子的内容类型：0,图片 1,视频 2,长图文',
  `int_category` int NOT NULL COMMENT '帖子性质类型：0,普通 1,征稿 3,投稿 4,模版',
  `int_release_type` int NOT NULL COMMENT '帖子发布类型：0,自媒体 1,班级',
  `release_subjectid` VARCHAR(32) BINARY DEFAULT '0' COMMENT '征稿类型原id ，非征稿类型则默认为0',
  `int_post_limit` int DEFAULT 4 COMMENT '默认4-无效 当是投稿的时候此字段有效，为了限制发帖子的类型：0,图片 1,视频 2,长图文 3,无限制',
  `long_time_line` BIGINT DEFAULT 0 COMMENT '截止时间',
  `long_like` BIGINT DEFAULT 0 COMMENT '点赞数',
  `long_view` BIGINT DEFAULT 0 COMMENT '浏览数',
  `long_share` BIGINT DEFAULT 0 COMMENT '分享数',
  `long_create_time` BIGINT DEFAULT 0 COMMENT '创建时间',
  `long_update_time` BIGINT DEFAULT 0 COMMENT '修改时间',
  `long_publish_time` BIGINT DEFAULT 0 COMMENT '发布时间',
  `long_modify_time` BIGINT DEFAULT 0 COMMENT '修改帖子正文时间',
  `tags` VARCHAR(70) COMMENT '标签',
  `bool_delete` BOOL NOT NULL DEFAULT FALSE COMMENT '删除标示位，默认未删除',
  `int_verify` int DEFAULT 0 COMMENT '上墙标示位 1，默认未上墙 -1 拒绝上墙 -1',
  `double_longitude` DOUBLE NOT NULL DEFAULT 0 COMMENT '经度',
  `double_latitude` DOUBLE NOT NULL DEFAULT 0 COMMENT '纬度',
  `bool_tip` BOOL DEFAULT 0 COMMENT '是否被举报，用于超管排序',
  `verify_user` VARCHAR(32) DEFAULT '' COMMENT '审核人员id',
  `drop_reason` VARCHAR(255) COMMENT '下架原因',
  `bool_task` int DEFAULT '0' COMMENT '是否定时发布',
  `attributes` TEXT COMMENT '增加字段',
  `int_cover_mode` INT NOT NULL COMMENT '封面的模式 0-普通 1-新闻小图 2-封面模式',
  `nickname` VARCHAR(32) NOT NULL COMMENT '小编昵称',
  `templates` TEXT COMMENT '素材列表',
  `authors` TEXT COMMENT '作者列表',
  PRIMARY KEY (subjectid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE INDEX 2018_05_subject_communityid_index ON `t_subject_2018_05`(`communityid`);
CREATE INDEX 2018_05_subject_regionid_index ON `t_subject_2018_05`(`region_id`);
CREATE INDEX 2018_05_subject_longitude_index ON `t_subject_2018_05`(`double_longitude`);
CREATE INDEX 2018_05_subject_latitude_index ON `t_subject_2018_05`(`double_latitude`);


DROP TABLE IF EXISTS `t_comment_2018_05`;
CREATE TABLE `t_comment_2018_05` (
  commentid VARCHAR(32) BINARY NOT NULL COMMENT '评论id',
  subjectid VARCHAR(128) BINARY NOT NULL COMMENT '帖子id',
  userid VARCHAR(128) BINARY NOT NULL COMMENT '操作用户id',
  content TEXT NOT NULL COMMENT '内容',
  long_create_time bigint COMMENT '发布时间',
  long_update_time bigint COMMENT '修改时间',
  replyid VARCHAR(32) BINARY DEFAULT '0' COMMENT '所属父评论id，若是帖子则为-1，若是父评论则为0',
  lastid VARCHAR(32) BINARY DEFAULT '0' COMMENT '被回复的评论id',
  long_like bigint DEFAULT 0 COMMENT '点赞数量',
  tags TEXT COMMENT '标签',
  bool_delete BOOL DEFAULT 0 COMMENT '删除标识符',
  attributes TEXT COMMENT '额外附加字段',
  PRIMARY KEY (commentid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS  `t_like_record_2018_05`;
CREATE TABLE `t_like_record_2018_05`(
  subjectid VARCHAR(32) BINARY NOT NULL COMMENT '帖子id',
  userid VARCHAR(32) BINARY NOT NULL COMMENT '用户id',
  `long_create_time` BIGINT DEFAULT 0 COMMENT '时间',
  PRIMARY KEY (subjectid,userid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;






DROP TABLE IF EXISTS `t_subject_2018_06`;
CREATE TABLE `t_subject_2018_06`(
  `subjectid` VARCHAR(32) BINARY NOT NULL COMMENT '帖子id',
  `communityid` VARCHAR(32) BINARY DEFAULT '0' COMMENT '投稿的 社区id',
  `classid` VARCHAR(32) BINARY DEFAULT '0' COMMENT '投稿的班级id',
  `userid` VARCHAR(32) BINARY NOT NULL COMMENT '用户id',
  `region_id` VARCHAR(32) BINARY DEFAULT '0' COMMENT '地区id',
  `title` TEXT COMMENT '标题',
  `content` TEXT NOT NULL COMMENT '内容',
  `cover` TEXT COMMENT '封面图',
  `bigcover` TEXT COMMENT '大封面图',
  `int_read` INT NOT NULL DEFAULT 0 COMMENT '超管审核表示位',
  `int_type` int NOT NULL COMMENT '帖子的内容类型：0,图片 1,视频 2,长图文',
  `int_category` int NOT NULL COMMENT '帖子性质类型：0,普通 1,征稿 3,投稿 4,模版',
  `int_release_type` int NOT NULL COMMENT '帖子发布类型：0,自媒体 1,班级',
  `release_subjectid` VARCHAR(32) BINARY DEFAULT '0' COMMENT '征稿类型原id ，非征稿类型则默认为0',
  `int_post_limit` int DEFAULT 4 COMMENT '默认4-无效 当是投稿的时候此字段有效，为了限制发帖子的类型：0,图片 1,视频 2,长图文 3,无限制',
  `long_time_line` BIGINT DEFAULT 0 COMMENT '截止时间',
  `long_like` BIGINT DEFAULT 0 COMMENT '点赞数',
  `long_view` BIGINT DEFAULT 0 COMMENT '浏览数',
  `long_share` BIGINT DEFAULT 0 COMMENT '分享数',
  `long_create_time` BIGINT DEFAULT 0 COMMENT '创建时间',
  `long_update_time` BIGINT DEFAULT 0 COMMENT '修改时间',
  `long_publish_time` BIGINT DEFAULT 0 COMMENT '发布时间',
  `long_modify_time` BIGINT DEFAULT 0 COMMENT '修改帖子正文时间',
  `tags` VARCHAR(70) COMMENT '标签',
  `bool_delete` BOOL NOT NULL DEFAULT FALSE COMMENT '删除标示位，默认未删除',
  `int_verify` int DEFAULT 0 COMMENT '上墙标示位 1，默认未上墙 -1 拒绝上墙 -1',
  `double_longitude` DOUBLE NOT NULL DEFAULT 0 COMMENT '经度',
  `double_latitude` DOUBLE NOT NULL DEFAULT 0 COMMENT '纬度',
  `bool_tip` BOOL DEFAULT 0 COMMENT '是否被举报，用于超管排序',
  `verify_user` VARCHAR(32) DEFAULT '' COMMENT '审核人员id',
  `drop_reason` VARCHAR(255) COMMENT '下架原因',
  `bool_task` int DEFAULT '0' COMMENT '是否定时发布',
  `attributes` TEXT COMMENT '增加字段',
  `int_cover_mode` INT NOT NULL COMMENT '封面的模式 0-普通 1-新闻小图 2-封面模式',
  `nickname` VARCHAR(32) NOT NULL COMMENT '小编昵称',
  `templates` TEXT COMMENT '素材列表',
  `authors` TEXT COMMENT '作者列表',
  PRIMARY KEY (subjectid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE INDEX 2018_06_subject_communityid_index ON `t_subject_2018_06`(`communityid`);
CREATE INDEX 2018_06_subject_regionid_index ON `t_subject_2018_06`(`region_id`);
CREATE INDEX 2018_06_subject_longitude_index ON `t_subject_2018_06`(`double_longitude`);
CREATE INDEX 2018_06_subject_latitude_index ON `t_subject_2018_06`(`double_latitude`);



DROP TABLE IF EXISTS `t_comment_2018_06`;
CREATE TABLE `t_comment_2018_06` (
  commentid VARCHAR(32) BINARY NOT NULL COMMENT '评论id',
  subjectid VARCHAR(128) BINARY NOT NULL COMMENT '帖子id',
  userid VARCHAR(128) BINARY NOT NULL COMMENT '操作用户id',
  content TEXT NOT NULL COMMENT '内容',
  long_create_time bigint COMMENT '发布时间',
  long_update_time bigint COMMENT '修改时间',
  replyid VARCHAR(32) BINARY DEFAULT '0' COMMENT '所属父评论id，若是帖子则为-1，若是父评论则为0',
  lastid VARCHAR(32) BINARY DEFAULT '0' COMMENT '被回复的评论id',
  long_like bigint DEFAULT 0 COMMENT '点赞数量',
  tags TEXT COMMENT '标签',
  bool_delete BOOL DEFAULT 0 COMMENT '删除标识符',
  attributes TEXT COMMENT '额外附加字段',
  PRIMARY KEY (commentid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `t_subject_2018_07`;
CREATE TABLE `t_subject_2018_07`(
  `subjectid` VARCHAR(32) BINARY NOT NULL COMMENT '帖子id',
  `communityid` VARCHAR(32) BINARY DEFAULT '0' COMMENT '投稿的 社区id',
  `classid` VARCHAR(32) BINARY DEFAULT '0' COMMENT '投稿的班级id',
  `userid` VARCHAR(32) BINARY NOT NULL COMMENT '用户id',
  `region_id` VARCHAR(32) BINARY DEFAULT '0' COMMENT '地区id',
  `title` TEXT COMMENT '标题',
  `content` TEXT NOT NULL COMMENT '内容',
  `cover` TEXT COMMENT '封面图',
  `bigcover` TEXT COMMENT '大封面图',
  `int_read` INT NOT NULL DEFAULT 0 COMMENT '超管审核表示位',
  `int_type` int NOT NULL COMMENT '帖子的内容类型：0,图片 1,视频 2,长图文',
  `int_category` int NOT NULL COMMENT '帖子性质类型：0,普通 1,征稿 3,投稿 4,模版',
  `int_release_type` int NOT NULL COMMENT '帖子发布类型：0,自媒体 1,班级',
  `release_subjectid` VARCHAR(32) BINARY DEFAULT '0' COMMENT '征稿类型原id ，非征稿类型则默认为0',
  `int_post_limit` int DEFAULT 4 COMMENT '默认4-无效 当是投稿的时候此字段有效，为了限制发帖子的类型：0,图片 1,视频 2,长图文 3,无限制',
  `long_time_line` BIGINT DEFAULT 0 COMMENT '截止时间',
  `long_like` BIGINT DEFAULT 0 COMMENT '点赞数',
  `long_view` BIGINT DEFAULT 0 COMMENT '浏览数',
  `long_share` BIGINT DEFAULT 0 COMMENT '分享数',
  `long_create_time` BIGINT DEFAULT 0 COMMENT '创建时间',
  `long_update_time` BIGINT DEFAULT 0 COMMENT '修改时间',
  `long_publish_time` BIGINT DEFAULT 0 COMMENT '发布时间',
  `long_modify_time` BIGINT DEFAULT 0 COMMENT '修改帖子正文时间',
  `tags` VARCHAR(70) COMMENT '标签',
  `bool_delete` BOOL NOT NULL DEFAULT FALSE COMMENT '删除标示位，默认未删除',
  `int_verify` int DEFAULT 0 COMMENT '上墙标示位 1，默认未上墙 -1 拒绝上墙 -1  已采用',
  `double_longitude` DOUBLE NOT NULL DEFAULT 0 COMMENT '经度',
  `double_latitude` DOUBLE NOT NULL DEFAULT 0 COMMENT '纬度',
  `bool_tip` BOOL DEFAULT 0 COMMENT '是否被举报，用于超管排序',
  `verify_user` VARCHAR(32) DEFAULT '' COMMENT '审核人员id',
  `drop_reason` VARCHAR(255) COMMENT '下架原因',
  `bool_task` int DEFAULT '0' COMMENT '是否定时发布',
  `attributes` TEXT COMMENT '增加字段',
  `int_cover_mode` INT NOT NULL COMMENT '封面的模式 0-普通 1-新闻小图 2-封面模式',
  `nickname` VARCHAR(32) NOT NULL COMMENT '小编昵称',
  `templates` TEXT COMMENT '素材列表',
  `authors` TEXT COMMENT '作者列表',
  PRIMARY KEY (subjectid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE INDEX 2018_07_subject_communityid_index ON `t_subject_2018_07`(`communityid`);
CREATE INDEX 2018_07_subject_regionid_index ON `t_subject_2018_07`(`region_id`);
CREATE INDEX 2018_07_subject_longitude_index ON `t_subject_2018_07`(`double_longitude`);
CREATE INDEX 2018_07_subject_latitude_index ON `t_subject_2018_07`(`double_latitude`);



DROP TABLE IF EXISTS `t_comment_2018_08`;
CREATE TABLE `t_comment_2018_08` (
  commentid VARCHAR(32) BINARY NOT NULL COMMENT '评论id',
  subjectid VARCHAR(128) BINARY NOT NULL COMMENT '帖子id',
  userid VARCHAR(128) BINARY NOT NULL COMMENT '操作用户id',
  content TEXT NOT NULL COMMENT '内容',
  long_create_time bigint COMMENT '发布时间',
  long_update_time bigint COMMENT '修改时间',
  replyid VARCHAR(32) BINARY DEFAULT '0' COMMENT '所属父评论id，若是帖子则为-1，若是父评论则为0',
  lastid VARCHAR(32) BINARY DEFAULT '0' COMMENT '被回复的评论id',
  long_like bigint DEFAULT 0 COMMENT '点赞数量',
  tags TEXT COMMENT '标签',
  bool_delete BOOL DEFAULT 0 COMMENT '删除标识符',
  attributes TEXT COMMENT '额外附加字段',
  PRIMARY KEY (commentid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `t_draft`;
CREATE TABLE `t_draft` (
  `draftid` VARCHAR(32) BINARY NOT NULL COMMENT '草稿id',
  `userid` VARCHAR(32) BINARY NOT NULL COMMENT '用户id',
  `title` TEXT COMMENT '标题',
  `content` TEXT NOT NULL COMMENT '内容',
  `cover` TEXT COMMENT '封面图',
  `type` int NOT NULL COMMENT '帖子的内容类型：0,图片 1,视频 2,长图文',
  `create_time` BIGINT DEFAULT 0 COMMENT '创建时间',
  `update_time` BIGINT DEFAULT 0 COMMENT '修改时间',
  `attributes` TEXT COMMENT '增加字段',
  `cover_mode` INT NOT NULL COMMENT '封面的模式 0-普通 1-新闻小图 2-封面模式',
  `status` INT NOT NULL DEFAULT 0 COMMENT '0 - edit-编辑 ， 1 - delete-删除',
  PRIMARY KEY (draftid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



DROP TABLE IF EXISTS `t_subject_2018_08`;
CREATE TABLE `t_subject_2018_08`(
  `subjectid` VARCHAR(32) BINARY NOT NULL COMMENT '帖子id',
  `communityid` VARCHAR(32) BINARY DEFAULT '0' COMMENT '投稿的 社区id',
  `classid` VARCHAR(32) BINARY DEFAULT '0' COMMENT '投稿的班级id',
  `userid` VARCHAR(32) BINARY NOT NULL COMMENT '用户id',
  `region_id` VARCHAR(32) BINARY DEFAULT '0' COMMENT '地区id',
  `title` TEXT COMMENT '标题',
  `content` TEXT NOT NULL COMMENT '内容',
  `cover` TEXT COMMENT '封面图',
  `bigcover` TEXT COMMENT '大封面图',
  `int_read` INT NOT NULL DEFAULT 0 COMMENT '超管审核表示位',
  `int_type` int NOT NULL COMMENT '帖子的内容类型：0,图片 1,视频 2,长图文',
  `int_category` int NOT NULL COMMENT '帖子性质类型：0,普通 1,征稿 3,投稿 4,模版',
  `int_release_type` int NOT NULL COMMENT '帖子发布类型：0,自媒体 1,班级',
  `release_subjectid` VARCHAR(32) BINARY DEFAULT '0' COMMENT '征稿类型原id ，非征稿类型则默认为0',
  `int_post_limit` int DEFAULT 4 COMMENT '默认4-无效 当是投稿的时候此字段有效，为了限制发帖子的类型：0,图片 1,视频 2,长图文 3,无限制',
  `long_time_line` BIGINT DEFAULT 0 COMMENT '截止时间',
  `long_like` BIGINT DEFAULT 0 COMMENT '点赞数',
  `long_view` BIGINT DEFAULT 0 COMMENT '浏览数',
  `long_share` BIGINT DEFAULT 0 COMMENT '分享数',
  `long_create_time` BIGINT DEFAULT 0 COMMENT '创建时间',
  `long_update_time` BIGINT DEFAULT 0 COMMENT '修改时间',
  `long_publish_time` BIGINT DEFAULT 0 COMMENT '发布时间',
  `long_modify_time` BIGINT DEFAULT 0 COMMENT '修改帖子正文时间',
  `tags` VARCHAR(70) COMMENT '标签',
  `bool_delete` BOOL NOT NULL DEFAULT FALSE COMMENT '删除标示位，默认未删除',
  `int_verify` int DEFAULT 0 COMMENT '上墙标示位 1，默认未上墙 -1 拒绝上墙 -1  已采用',
  `double_longitude` DOUBLE NOT NULL DEFAULT 0 COMMENT '经度',
  `double_latitude` DOUBLE NOT NULL DEFAULT 0 COMMENT '纬度',
  `bool_tip` BOOL DEFAULT 0 COMMENT '是否被举报，用于超管排序',
  `verify_user` VARCHAR(32) DEFAULT '' COMMENT '审核人员id',
  `drop_reason` VARCHAR(255) COMMENT '下架原因',
  `bool_task` int DEFAULT '0' COMMENT '是否定时发布',
  `attributes` TEXT COMMENT '增加字段',
  `int_cover_mode` INT DEFAULT 0 COMMENT '封面的模式 0-普通 1-新闻小图 2-封面模式',
  `int_use` INT DEFAULT 0,
  `nickname` TEXT COMMENT '小编昵称',
  `templates` TEXT COMMENT '素材列表',
  `authors` TEXT COMMENT '作者列表',
  PRIMARY KEY (subjectid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE INDEX 2018_08_subject_communityid_index ON `t_subject_2018_08`(`communityid`);
CREATE INDEX 2018_08_subject_regionid_index ON `t_subject_2018_08`(`region_id`);
CREATE INDEX 2018_08_subject_longitude_index ON `t_subject_2018_08`(`double_longitude`);
CREATE INDEX 2018_08_subject_latitude_index ON `t_subject_2018_08`(`double_latitude`);


DROP TABLE IF EXISTS  `t_like_record_2018_08`;
CREATE TABLE `t_like_record_2018_08`(
  subjectid VARCHAR(32) BINARY NOT NULL COMMENT '帖子id',
  userid VARCHAR(32) BINARY NOT NULL COMMENT '用户id',
  `long_create_time` BIGINT DEFAULT 0 COMMENT '时间',
  PRIMARY KEY (subjectid,userid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;