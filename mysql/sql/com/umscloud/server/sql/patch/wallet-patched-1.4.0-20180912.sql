use wallet;

INSERT INTO `wallet`.`tb_wallet_channel` (`trans_channel`, `channel_name`) VALUES ('group', '群主奖励金');

ALTER TABLE `wallet`.`tb_wallet_detail`
CHANGE COLUMN `trans_channel` `trans_channel` ENUM('recharge', 'payment', 'withdraw', 'allowance', 'award', 'other', 'register', 'activity', 'group') NOT NULL COMMENT ' 交易渠道，recharge - 财务转账, payment - 稿费，allowance - 补贴, withdraw - 提现, award  - 奖励金解冻, other  - 其他, register - 注册, activity - 活动, group - 群组奖励' ;
