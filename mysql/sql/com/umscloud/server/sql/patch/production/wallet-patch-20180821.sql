use wallet

CREATE TABLE `tb_wallet_channel` (
  `trans_channel` varchar(20) NOT NULL COMMENT ' 交易渠道， '' transfer '' - 财务转账， '' team '' - 栏目转账， '' withdraw '' - 提现， '' redpackage '' - 红包， '' other '' - 其他 ',
  `channel_name` varchar(45) NOT NULL,
  PRIMARY KEY (`trans_channel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `wallet`.`tb_wallet_detail`
CHANGE COLUMN `trans_channel` `trans_channel` ENUM('recharge', 'payment', 'withdraw', 'allowance', 'award', 'other', 'register', 'activity') NOT NULL COMMENT ' 交易渠道，recharge - 财务转账, payment - 稿费，allowance - 补贴, withdraw - 提现, award  - 奖励金解冻, other  - 其他, register - 注册, activity - 活动' ;


INSERT INTO `wallet`.`tb_wallet_channel` (`trans_channel`, `channel_name`) VALUES ('recharge', '充值');
INSERT INTO `wallet`.`tb_wallet_channel` (`trans_channel`, `channel_name`) VALUES ('payment', '稿费');
INSERT INTO `wallet`.`tb_wallet_channel` (`trans_channel`, `channel_name`) VALUES ('withdraw', '提现');
INSERT INTO `wallet`.`tb_wallet_channel` (`trans_channel`, `channel_name`) VALUES ('allowance', '补贴');
INSERT INTO `wallet`.`tb_wallet_channel` (`trans_channel`, `channel_name`) VALUES ('award', '奖励金解冻');
INSERT INTO `wallet`.`tb_wallet_channel` (`trans_channel`, `channel_name`) VALUES ('register', '注册');
INSERT INTO `wallet`.`tb_wallet_channel` (`trans_channel`, `channel_name`) VALUES ('activity', '活动');
INSERT INTO `wallet`.`tb_wallet_channel` (`trans_channel`, `channel_name`) VALUES ('other', '其他');

