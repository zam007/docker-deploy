USE comment;

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
