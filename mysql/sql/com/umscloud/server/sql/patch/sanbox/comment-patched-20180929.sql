CREATE TABLE if not exists `t_subject_post_2019_02`(
  subjectid VARCHAR(32) BINARY NOT NULL COMMENT '帖子id',
  communityid VARCHAR(32) BINARY NOT NULL COMMENT '栏目id',
  `status` VARCHAR(10) NOT NULL DEFAULT 'unuse' COMMENT '状态 use - 已采用  unuse - 未采用  confuse - 拒绝',
  reason VARCHAR(255) COMMENT '理由',
  create_time BIGINT COMMENT '创建时间',
  update_time BIGINT COMMENT '更新时间',
  PRIMARY KEY (subjectid,communityid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE if not exists `t_subject_post_2019_03`(
  subjectid VARCHAR(32) BINARY NOT NULL COMMENT '帖子id',
  communityid VARCHAR(32) BINARY NOT NULL COMMENT '栏目id',
  `status` VARCHAR(10) NOT NULL DEFAULT 'unuse' COMMENT '状态 use - 已采用  unuse - 未采用  confuse - 拒绝',
  reason VARCHAR(255) COMMENT '理由',
  create_time BIGINT COMMENT '创建时间',
  update_time BIGINT COMMENT '更新时间',
  PRIMARY KEY (subjectid,communityid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE if not exists `t_subject_post_2019_04`(
  subjectid VARCHAR(32) BINARY NOT NULL COMMENT '帖子id',
  communityid VARCHAR(32) BINARY NOT NULL COMMENT '栏目id',
  `status` VARCHAR(10) NOT NULL DEFAULT 'unuse' COMMENT '状态 use - 已采用  unuse - 未采用  confuse - 拒绝',
  reason VARCHAR(255) COMMENT '理由',
  create_time BIGINT COMMENT '创建时间',
  update_time BIGINT COMMENT '更新时间',
  PRIMARY KEY (subjectid,communityid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE if not exists `t_subject_post_2019_05`(
  subjectid VARCHAR(32) BINARY NOT NULL COMMENT '帖子id',
  communityid VARCHAR(32) BINARY NOT NULL COMMENT '栏目id',
  `status` VARCHAR(10) NOT NULL DEFAULT 'unuse' COMMENT '状态 use - 已采用  unuse - 未采用  confuse - 拒绝',
  reason VARCHAR(255) COMMENT '理由',
  create_time BIGINT COMMENT '创建时间',
  update_time BIGINT COMMENT '更新时间',
  PRIMARY KEY (subjectid,communityid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE if not exists `t_subject_post_2019_06`(
  subjectid VARCHAR(32) BINARY NOT NULL COMMENT '帖子id',
  communityid VARCHAR(32) BINARY NOT NULL COMMENT '栏目id',
  `status` VARCHAR(10) NOT NULL DEFAULT 'unuse' COMMENT '状态 use - 已采用  unuse - 未采用  confuse - 拒绝',
  reason VARCHAR(255) COMMENT '理由',
  create_time BIGINT COMMENT '创建时间',
  update_time BIGINT COMMENT '更新时间',
  PRIMARY KEY (subjectid,communityid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


