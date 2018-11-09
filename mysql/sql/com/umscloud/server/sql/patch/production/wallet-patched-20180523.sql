USE `wallet`;
ALTER TABLE tb_wallet_recharge_settings  ADD from_user_name varchar(80) DEFAULT NULL AFTER uid;
