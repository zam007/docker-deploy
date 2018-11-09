ALTER TABLE `activity`.`t_worldcup_activity`
ADD COLUMN `person_multiple` INT(11) NOT NULL DEFAULT '1' COMMENT '参与人数' AFTER `person_count`;

UPDATE `activity`.`t_worldcup_activity` SET `person_multiple`='14' WHERE `activity_id`='6';
UPDATE `activity`.`t_worldcup_activity` SET `person_multiple`='6' WHERE `activity_id`='2';
UPDATE `activity`.`t_worldcup_activity` SET `person_multiple`='8' WHERE `activity_id`='3';
UPDATE `activity`.`t_worldcup_activity` SET `person_multiple`='10' WHERE `activity_id`='4';
UPDATE `activity`.`t_worldcup_activity` SET `person_multiple`='10' WHERE `activity_id`='5';

UPDATE `activity`.`t_worldcup_activity` SET `activity_infact_money`='300000' WHERE `activity_id`='2';
UPDATE `activity`.`t_worldcup_activity` SET `activity_infact_money`='375000' WHERE `activity_id`='3';
UPDATE `activity`.`t_worldcup_activity` SET `activity_infact_money`='600000' WHERE `activity_id`='4';
UPDATE `activity`.`t_worldcup_activity` SET `activity_infact_money`='600000' WHERE `activity_id`='5';
UPDATE `activity`.`t_worldcup_activity` SET `activity_infact_money`='780000' WHERE `activity_id`='6';


