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
