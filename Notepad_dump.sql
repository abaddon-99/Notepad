DROP TABLE IF EXISTS `notepad`;
CREATE TABLE `notepad` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `show_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` int(3) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(60) NOT NULL DEFAULT '',
  `text` text,
  `aid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `status_st` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subject_text` (`subject`,`aid`,`status`),
  KEY `aid` (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='Notepad';

ALTER TABLE `notepad` 
ADD COLUMN `status_st` TINYINT(3) NOT NULL AFTER `aid`;

DROP TABLE IF EXISTS `notepad_checklist_rows`;
CREATE TABLE `notepad_checklist_rows` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `note_id` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `state` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `note_id` (`note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Notepad checklists rows';
DROP TABLE IF EXISTS `notepad_reminders`;
CREATE TABLE `notepad_reminders` (
  `id` int(11) unsigned NOT NULL,
  `rule_id` smallint(3) NOT NULL DEFAULT '0',
  `minute` smallint(2) NOT NULL DEFAULT '0',
  `hour` smallint(2) NOT NULL DEFAULT '0',
  `week_day` text,
  `month_day` text,
  `month` smallint(2) NOT NULL DEFAULT '0',
  `year` smallint(6) NOT NULL DEFAULT '0',
  `holidays` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Periodic reminders';
