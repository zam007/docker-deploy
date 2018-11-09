ALTER TABLE `wallet`.`tb_wallet_identity`
ADD UNIQUE INDEX `idx_wallet_id_certno` (`cert_no` ASC);
