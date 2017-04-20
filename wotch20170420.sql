-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.6.31 - MySQL Community Server (GPL)
-- ОС Сервера:                   Win64
-- HeidiSQL Версия:              9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Дамп структуры для таблица wotch.modx_active_users
DROP TABLE IF EXISTS `modx_active_users`;
CREATE TABLE IF NOT EXISTS `modx_active_users` (
  `sid` varchar(32) NOT NULL DEFAULT '',
  `internalKey` int(9) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL DEFAULT '',
  `lasthit` int(20) NOT NULL DEFAULT '0',
  `action` varchar(10) NOT NULL DEFAULT '',
  `id` int(10) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=68 COMMENT='Contains data about last user action.';

-- Дамп данных таблицы wotch.modx_active_users: 2 rows
/*!40000 ALTER TABLE `modx_active_users` DISABLE KEYS */;
INSERT INTO `modx_active_users` (`sid`, `internalKey`, `username`, `lasthit`, `action`, `id`) VALUES
	('2v3oth5hmsf3i7ehjamiagjg43', 1, 'admin', 1492717427, '78', 8),
	('mcjdrv7r7kd0bdka55tllfuin5', 1, 'admin', 1492511422, '67', 6);
/*!40000 ALTER TABLE `modx_active_users` ENABLE KEYS */;


-- Дамп структуры для таблица wotch.modx_active_user_locks
DROP TABLE IF EXISTS `modx_active_user_locks`;
CREATE TABLE IF NOT EXISTS `modx_active_user_locks` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sid` varchar(32) NOT NULL DEFAULT '',
  `internalKey` int(9) NOT NULL DEFAULT '0',
  `elementType` int(1) NOT NULL DEFAULT '0',
  `elementId` int(10) NOT NULL DEFAULT '0',
  `lasthit` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_element_id` (`elementType`,`elementId`,`sid`)
) ENGINE=MyISAM AUTO_INCREMENT=361 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=64 COMMENT='Contains data about locked elements.';

-- Дамп данных таблицы wotch.modx_active_user_locks: 3 rows
/*!40000 ALTER TABLE `modx_active_user_locks` DISABLE KEYS */;
INSERT INTO `modx_active_user_locks` (`id`, `sid`, `internalKey`, `elementType`, `elementId`, `lasthit`) VALUES
	(283, '2v3oth5hmsf3i7ehjamiagjg43', 1, 4, 12, 1492581286),
	(359, '2v3oth5hmsf3i7ehjamiagjg43', 1, 1, 6, 1492717424),
	(360, '2v3oth5hmsf3i7ehjamiagjg43', 1, 3, 8, 1492717427);
/*!40000 ALTER TABLE `modx_active_user_locks` ENABLE KEYS */;


-- Дамп структуры для таблица wotch.modx_active_user_sessions
DROP TABLE IF EXISTS `modx_active_user_sessions`;
CREATE TABLE IF NOT EXISTS `modx_active_user_sessions` (
  `sid` varchar(32) NOT NULL DEFAULT '',
  `internalKey` int(9) NOT NULL DEFAULT '0',
  `lasthit` int(20) NOT NULL DEFAULT '0',
  `ip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=52 COMMENT='Contains data about valid user sessions.';

-- Дамп данных таблицы wotch.modx_active_user_sessions: 1 rows
/*!40000 ALTER TABLE `modx_active_user_sessions` DISABLE KEYS */;
INSERT INTO `modx_active_user_sessions` (`sid`, `internalKey`, `lasthit`, `ip`) VALUES
	('2v3oth5hmsf3i7ehjamiagjg43', 1, 1492717428, '127.0.0.1');
/*!40000 ALTER TABLE `modx_active_user_sessions` ENABLE KEYS */;


-- Дамп структуры для таблица wotch.modx_categories
DROP TABLE IF EXISTS `modx_categories`;
CREATE TABLE IF NOT EXISTS `modx_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=21 COMMENT='Categories to be used snippets,tv,chunks, etc';

-- Дамп данных таблицы wotch.modx_categories: 10 rows
/*!40000 ALTER TABLE `modx_categories` DISABLE KEYS */;
INSERT INTO `modx_categories` (`id`, `category`) VALUES
	(1, 'Demo Content'),
	(2, 'SEO'),
	(3, 'Forms'),
	(4, 'Templates'),
	(5, 'Js'),
	(6, 'Manager and Admin'),
	(7, 'add'),
	(8, 'Navigation'),
	(9, 'Content'),
	(10, 'Login');
/*!40000 ALTER TABLE `modx_categories` ENABLE KEYS */;


-- Дамп структуры для таблица wotch.modx_documentgroup_names
DROP TABLE IF EXISTS `modx_documentgroup_names`;
CREATE TABLE IF NOT EXISTS `modx_documentgroup_names` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(245) NOT NULL DEFAULT '',
  `private_memgroup` tinyint(4) DEFAULT '0' COMMENT 'determine whether the document group is private to manager users',
  `private_webgroup` tinyint(4) DEFAULT '0' COMMENT 'determines whether the document is private to web users',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=20 COMMENT='Contains data used for access permissions.';

-- Дамп данных таблицы wotch.modx_documentgroup_names: 1 rows
/*!40000 ALTER TABLE `modx_documentgroup_names` DISABLE KEYS */;
INSERT INTO `modx_documentgroup_names` (`id`, `name`, `private_memgroup`, `private_webgroup`) VALUES
	(2, 'webusers', 0, 1);
/*!40000 ALTER TABLE `modx_documentgroup_names` ENABLE KEYS */;


-- Дамп структуры для таблица wotch.modx_document_groups
DROP TABLE IF EXISTS `modx_document_groups`;
CREATE TABLE IF NOT EXISTS `modx_document_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `document_group` int(10) NOT NULL DEFAULT '0',
  `document` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `document` (`document`),
  KEY `document_group` (`document_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.';

-- Дамп данных таблицы wotch.modx_document_groups: 0 rows
/*!40000 ALTER TABLE `modx_document_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_document_groups` ENABLE KEYS */;


-- Дамп структуры для таблица wotch.modx_event_log
DROP TABLE IF EXISTS `modx_event_log`;
CREATE TABLE IF NOT EXISTS `modx_event_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventid` int(11) DEFAULT '0',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1- information, 2 - warning, 3- error',
  `user` int(11) NOT NULL DEFAULT '0' COMMENT 'link to user table',
  `usertype` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 - manager, 1 - web',
  `source` varchar(50) NOT NULL DEFAULT '',
  `description` text,
  PRIMARY KEY (`id`),
  KEY `user` (`user`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=881 COMMENT='Stores event and error logs';

-- Дамп данных таблицы wotch.modx_event_log: 10 rows
/*!40000 ALTER TABLE `modx_event_log` DISABLE KEYS */;
INSERT INTO `modx_event_log` (`id`, `eventid`, `createdon`, `type`, `user`, `usertype`, `source`, `description`) VALUES
	(1, 0, 1492324115, 3, 1, 0, 'Файл конфигурации все еще доступен для записи', 'Злоумышленники потенциально могут нанести вред вашему сайту. <strong>Серьёзно.</strong> Пожалуйста, установите права доступа к файлу конфигурации (/manager/includes/config.inc.php) в режим \'Только для чтения\''),
	(2, 0, 1492344026, 3, 1, 0, 'Файл конфигурации все еще доступен для записи', 'Злоумышленники потенциально могут нанести вред вашему сайту. <strong>Серьёзно.</strong> Пожалуйста, установите права доступа к файлу конфигурации (/manager/includes/config.inc.php) в режим \'Только для чтения\''),
	(3, 0, 1492344083, 3, 1, 0, 'Файл конфигурации все еще доступен для записи', 'Злоумышленники потенциально могут нанести вред вашему сайту. <strong>Серьёзно.</strong> Пожалуйста, установите права доступа к файлу конфигурации (/manager/includes/config.inc.php) в режим \'Только для чтения\''),
	(4, 0, 1492344157, 3, 1, 0, 'Файл конфигурации все еще доступен для записи', 'Злоумышленники потенциально могут нанести вред вашему сайту. <strong>Серьёзно.</strong> Пожалуйста, установите права доступа к файлу конфигурации (/manager/includes/config.inc.php) в режим \'Только для чтения\''),
	(5, 0, 1492344325, 3, 1, 0, 'Файл конфигурации все еще доступен для записи', 'Злоумышленники потенциально могут нанести вред вашему сайту. <strong>Серьёзно.</strong> Пожалуйста, установите права доступа к файлу конфигурации (/manager/includes/config.inc.php) в режим \'Только для чтения\''),
	(6, 0, 1492435919, 3, 1, 0, 'Файл конфигурации все еще доступен для записи', 'Злоумышленники потенциально могут нанести вред вашему сайту. <strong>Серьёзно.</strong> Пожалуйста, установите права доступа к файлу конфигурации (/manager/includes/config.inc.php) в режим \'Только для чтения\''),
	(7, 0, 1492444099, 3, 0, 1, 'Snippet - loginza / PHP Parse Error', '<b>Trying to get property of non-object</b><br />\n<h2 style="color:red">&laquo; MODX Parse Error &raquo;</h2><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;">Error : include_once(C:\\OpenServer\\domains\\modx.ua\\assets\\snippets\\modxloginza\\profiletpl.php): failed to open stream: No such file or directory</div>\n<table class="grid">\n	<thead>\n	<tr class="">\n		<th width="100px" >Error information</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class="gridItem">\n		<td>ErrorType[num]</td>\n		<td>WARNING[2]</td>\n	</tr>\n	<tr class="gridAltItem">\n		<td>File</td>\n		<td>C:\\OpenServer\\domains\\modx.ua\\assets\\snippets\\modxloginza\\snippet.loginza.php</td>\n	</tr>\n	<tr class="gridItem">\n		<td>Line</td>\n		<td>8</td>\n	</tr>\n	<tr class="gridAltItem">\n		<td>Source</td>\n		<td>include_once MODX_BASE_PATH.\'assets/snippets/modxloginza/profiletpl.php\'; //шаблон профиля\n</td>\n	</tr>\n	<tr class="gridItem">\n		<td>Current Snippet</td>\n		<td>loginza</td>\n	</tr>\n</table>\n<br />\n<table class="grid">\n	<thead>\n	<tr class="">\n		<th width="100px" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class="gridItem">\n		<td>REQUEST_URI</td>\n		<td>http://modx.ua/login.html</td>\n	</tr>\n	<tr class="gridAltItem">\n		<td>Resource</td>\n		<td>[4] <a href="http://modx.ua/login.html" target="_blank">Вход</a></td>\n	</tr>\n	<tr class="gridItem">\n		<td>Referer</td>\n		<td>http://modx.ua/</td>\n	</tr>\n	<tr class="gridAltItem">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36</td>\n	</tr>\n	<tr class="gridItem">\n		<td>IP</td>\n		<td>127.0.0.1</td>\n	</tr>\n	<tr class="gridAltItem">\n		<td>Current time</td>\n		<td>2017-04-17 18:48:19</td>\n	</tr>\n</table>\n<br />\n<table class="grid">\n	<thead>\n	<tr class="">\n		<th width="100px" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class="gridItem">\n		<td>MySQL</td>\n		<td>0.0022 s (3 Requests)</td>\n	</tr>\n	<tr class="gridAltItem">\n		<td>PHP</td>\n		<td>0.1063 s</td>\n	</tr>\n	<tr class="gridItem">\n		<td>Total</td>\n		<td>0.1086 s</td>\n	</tr>\n	<tr class="gridAltItem">\n		<td>Memory</td>\n		<td>1.6446914672852 mb</td>\n	</tr>\n</table>\n<br />\n<table class="grid">\n	<thead>\n	<tr class="">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class="gridItem">\n		<td><strong>DocumentParser->executeParser</strong>()<br />index.php on line 128</td>\n	</tr>\n	<tr class="gridAltItem">\n		<td><strong>DocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2141</td>\n	</tr>\n	<tr class="gridItem">\n		<td><strong>DocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2234</td>\n	</tr>\n	<tr class="gridAltItem">\n		<td><strong>DocumentParser->parseDocumentSource</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 668</td>\n	</tr>\n	<tr class="gridItem">\n		<td><strong>DocumentParser->evalSnippets</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 2003</td>\n	</tr>\n	<tr class="gridAltItem">\n		<td><strong>DocumentParser->_get_snip_result</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 1408</td>\n	</tr>\n	<tr class="gridItem">\n		<td><strong>DocumentParser->evalSnippet</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 1466</td>\n	</tr>\n	<tr class="gridAltItem">\n		<td><strong>eval</strong>()<br />manager/includes/document.parser.class.inc.php on line 1360</td>\n	</tr>\n	<tr class="gridItem">\n		<td><strong>require</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php(1360) : eval()\'d code on line 1</td>\n	</tr>\n	<tr class="gridAltItem">\n		<td><strong>include_once</strong>()<br />assets/snippets/modxloginza/snippet.loginza.php on line 8</td>\n	</tr>\n</table>\n'),
	(8, 0, 1492444399, 3, 1, 0, 'Файл конфигурации все еще доступен для записи', 'Злоумышленники потенциально могут нанести вред вашему сайту. <strong>Серьёзно.</strong> Пожалуйста, установите права доступа к файлу конфигурации (/manager/includes/config.inc.php) в режим \'Только для чтения\''),
	(9, 0, 1492512078, 3, 1, 0, 'Системные файлы были изменены.', 'Вы включили проверку системных файлов на наличие изменений, характерных для взломанных сайтов. Это не значит, что сайт был взломан, но желательно просмотреть измененные файлы.(index.php, .htaccess, manager/index.php, manager/includes/config.inc.php) index.php, .htaccess, manager/index.php, manager/includes/config.inc.php'),
	(10, 0, 1492512078, 3, 1, 0, 'Файл конфигурации все еще доступен для записи', 'Злоумышленники потенциально могут нанести вред вашему сайту. <strong>Серьёзно.</strong> Пожалуйста, установите права доступа к файлу конфигурации (/manager/includes/config.inc.php) в режим \'Только для чтения\'');
/*!40000 ALTER TABLE `modx_event_log` ENABLE KEYS */;


-- Дамп структуры для таблица wotch.modx_keyword_xref
DROP TABLE IF EXISTS `modx_keyword_xref`;
CREATE TABLE IF NOT EXISTS `modx_keyword_xref` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `keyword_id` int(11) NOT NULL DEFAULT '0',
  KEY `content_id` (`content_id`),
  KEY `keyword_id` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Cross reference bewteen keywords and content';

-- Дамп данных таблицы wotch.modx_keyword_xref: 0 rows
/*!40000 ALTER TABLE `modx_keyword_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_keyword_xref` ENABLE KEYS */;


-- Дамп структуры для таблица wotch.modx_log_history
DROP TABLE IF EXISTS `modx_log_history`;
CREATE TABLE IF NOT EXISTS `modx_log_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) NOT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `stamp` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384;

-- Дамп данных таблицы wotch.modx_log_history: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `modx_log_history` DISABLE KEYS */;
INSERT INTO `modx_log_history` (`id`, `user_name`, `ip`, `stamp`) VALUES
	(1, '', '127.0.0.1', 1492444195);
/*!40000 ALTER TABLE `modx_log_history` ENABLE KEYS */;


-- Дамп структуры для таблица wotch.modx_manager_log
DROP TABLE IF EXISTS `modx_manager_log`;
CREATE TABLE IF NOT EXISTS `modx_manager_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `timestamp` int(20) NOT NULL DEFAULT '0',
  `internalKey` int(10) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `action` int(10) NOT NULL DEFAULT '0',
  `itemid` varchar(10) DEFAULT '0',
  `itemname` varchar(255) DEFAULT NULL,
  `message` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=985 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=46 COMMENT='Contains a record of user interaction.';

-- Дамп данных таблицы wotch.modx_manager_log: 984 rows
/*!40000 ALTER TABLE `modx_manager_log` DISABLE KEYS */;
INSERT INTO `modx_manager_log` (`id`, `timestamp`, `internalKey`, `username`, `action`, `itemid`, `itemname`, `message`) VALUES
	(1, 1491595120, 1, 'admin', 58, '-', 'MODX', 'Logged in'),
	(2, 1491595121, 1, 'admin', 17, '-', '-', 'Editing settings'),
	(3, 1492280137, 1, 'admin', 58, '-', 'MODX', 'Logged in'),
	(4, 1492280143, 1, 'admin', 17, '-', '-', 'Editing settings'),
	(5, 1492280505, 1, 'admin', 27, '1', 'Home', 'Editing resource'),
	(6, 1492280523, 1, 'admin', 106, '-', '-', 'Viewing Modules'),
	(7, 1492280526, 1, 'admin', 76, '-', '-', 'Element management'),
	(8, 1492280533, 1, 'admin', 78, '5', 'header', 'Editing Chunk (HTML Snippet)'),
	(9, 1492280592, 1, 'admin', 79, '5', 'header', 'Saving Chunk (HTML Snippet)'),
	(10, 1492280592, 1, 'admin', 76, '-', '-', 'Element management'),
	(11, 1492280597, 1, 'admin', 78, '5', 'header', 'Editing Chunk (HTML Snippet)'),
	(12, 1492280939, 1, 'admin', 79, '5', 'header', 'Saving Chunk (HTML Snippet)'),
	(13, 1492280939, 1, 'admin', 76, '-', '-', 'Element management'),
	(14, 1492280969, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
	(15, 1492281019, 1, 'admin', 79, '-', 'NAV', 'Saving Chunk (HTML Snippet)'),
	(16, 1492281019, 1, 'admin', 76, '-', '-', 'Element management'),
	(17, 1492281043, 1, 'admin', 78, '4', 'footer', 'Editing Chunk (HTML Snippet)'),
	(18, 1492281076, 1, 'admin', 76, '-', '-', 'Element management'),
	(19, 1492281078, 1, 'admin', 78, '5', 'header', 'Editing Chunk (HTML Snippet)'),
	(20, 1492281089, 1, 'admin', 79, '5', 'header', 'Saving Chunk (HTML Snippet)'),
	(21, 1492281089, 1, 'admin', 76, '-', '-', 'Element management'),
	(22, 1492281095, 1, 'admin', 78, '4', 'footer', 'Editing Chunk (HTML Snippet)'),
	(23, 1492281206, 1, 'admin', 79, '4', 'footer', 'Saving Chunk (HTML Snippet)'),
	(24, 1492281206, 1, 'admin', 76, '-', '-', 'Element management'),
	(25, 1492281209, 1, 'admin', 16, '3', 'Home', 'Editing template'),
	(26, 1492281322, 1, 'admin', 20, '3', 'Home', 'Saving template'),
	(27, 1492281322, 1, 'admin', 76, '-', '-', 'Element management'),
	(28, 1492281338, 1, 'admin', 16, '3', 'Home', 'Editing template'),
	(29, 1492281360, 1, 'admin', 20, '3', 'Home', 'Saving template'),
	(30, 1492281360, 1, 'admin', 76, '-', '-', 'Element management'),
	(31, 1492281374, 1, 'admin', 16, '3', 'Home', 'Editing template'),
	(32, 1492281411, 1, 'admin', 76, '-', '-', 'Element management'),
	(33, 1492281419, 1, 'admin', 78, '4', 'footer', 'Editing Chunk (HTML Snippet)'),
	(34, 1492281428, 1, 'admin', 79, '4', 'footer', 'Saving Chunk (HTML Snippet)'),
	(35, 1492281428, 1, 'admin', 76, '-', '-', 'Element management'),
	(36, 1492281464, 1, 'admin', 78, '5', 'header', 'Editing Chunk (HTML Snippet)'),
	(37, 1492281469, 1, 'admin', 79, '5', 'header', 'Saving Chunk (HTML Snippet)'),
	(38, 1492281469, 1, 'admin', 76, '-', '-', 'Element management'),
	(39, 1492281481, 1, 'admin', 78, '5', 'header', 'Editing Chunk (HTML Snippet)'),
	(40, 1492281488, 1, 'admin', 76, '-', '-', 'Element management'),
	(41, 1492281493, 1, 'admin', 16, '3', 'Home', 'Editing template'),
	(42, 1492281519, 1, 'admin', 20, '3', 'Home', 'Saving template'),
	(43, 1492281519, 1, 'admin', 76, '-', '-', 'Element management'),
	(44, 1492281531, 1, 'admin', 78, '5', 'header', 'Editing Chunk (HTML Snippet)'),
	(45, 1492281541, 1, 'admin', 76, '-', '-', 'Element management'),
	(46, 1492281543, 1, 'admin', 78, '5', 'header', 'Editing Chunk (HTML Snippet)'),
	(47, 1492281545, 1, 'admin', 76, '-', '-', 'Element management'),
	(48, 1492281546, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(49, 1492281560, 1, 'admin', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
	(50, 1492281560, 1, 'admin', 76, '-', '-', 'Element management'),
	(51, 1492281583, 1, 'admin', 16, '3', 'Home', 'Editing template'),
	(52, 1492281594, 1, 'admin', 20, '3', 'Home', 'Saving template'),
	(53, 1492281594, 1, 'admin', 76, '-', '-', 'Element management'),
	(54, 1492281606, 1, 'admin', 16, '3', 'Home', 'Editing template'),
	(55, 1492281613, 1, 'admin', 20, '3', 'Home', 'Saving template'),
	(56, 1492281613, 1, 'admin', 76, '-', '-', 'Element management'),
	(57, 1492281639, 1, 'admin', 16, '3', 'Home', 'Editing template'),
	(58, 1492281762, 1, 'admin', 20, '3', 'Home', 'Saving template'),
	(59, 1492281762, 1, 'admin', 76, '-', '-', 'Element management'),
	(60, 1492281793, 1, 'admin', 16, '3', 'Home', 'Editing template'),
	(61, 1492281796, 1, 'admin', 20, '3', 'Home', 'Saving template'),
	(62, 1492281796, 1, 'admin', 76, '-', '-', 'Element management'),
	(63, 1492281823, 1, 'admin', 78, '4', 'footer', 'Editing Chunk (HTML Snippet)'),
	(64, 1492281976, 1, 'admin', 79, '4', 'footer', 'Saving Chunk (HTML Snippet)'),
	(65, 1492281976, 1, 'admin', 76, '-', '-', 'Element management'),
	(66, 1492282010, 1, 'admin', 78, '4', 'footer', 'Editing Chunk (HTML Snippet)'),
	(67, 1492282027, 1, 'admin', 79, '4', 'footer', 'Saving Chunk (HTML Snippet)'),
	(68, 1492282027, 1, 'admin', 76, '-', '-', 'Element management'),
	(69, 1492282070, 1, 'admin', 78, '4', 'footer', 'Editing Chunk (HTML Snippet)'),
	(70, 1492282370, 1, 'admin', 76, '-', '-', 'Element management'),
	(71, 1492282372, 1, 'admin', 76, '-', '-', 'Element management'),
	(72, 1492282396, 1, 'admin', 16, '3', 'Home', 'Editing template'),
	(73, 1492282478, 1, 'admin', 20, '3', 'Home', 'Saving template'),
	(74, 1492282478, 1, 'admin', 76, '-', '-', 'Element management'),
	(75, 1492282484, 1, 'admin', 16, '3', 'Home', 'Editing template'),
	(76, 1492282555, 1, 'admin', 20, '3', 'Home', 'Saving template'),
	(77, 1492282555, 1, 'admin', 76, '-', '-', 'Element management'),
	(78, 1492282578, 1, 'admin', 16, '3', 'Home', 'Editing template'),
	(79, 1492282878, 1, 'admin', 20, '3', 'Home', 'Saving template'),
	(80, 1492282878, 1, 'admin', 76, '-', '-', 'Element management'),
	(81, 1492282878, 1, 'admin', 76, '-', '-', 'Element management'),
	(82, 1492282903, 1, 'admin', 78, '5', 'header', 'Editing Chunk (HTML Snippet)'),
	(83, 1492282952, 1, 'admin', 76, '-', '-', 'Element management'),
	(84, 1492282957, 1, 'admin', 16, '3', 'Home', 'Editing template'),
	(85, 1492282987, 1, 'admin', 20, '3', 'Home', 'Saving template'),
	(86, 1492282987, 1, 'admin', 76, '-', '-', 'Element management'),
	(87, 1492283009, 1, 'admin', 16, '3', 'Home', 'Editing template'),
	(88, 1492283025, 1, 'admin', 20, '3', 'Home', 'Saving template'),
	(89, 1492283025, 1, 'admin', 76, '-', '-', 'Element management'),
	(90, 1492283137, 1, 'admin', 16, '3', 'Home', 'Editing template'),
	(91, 1492283167, 1, 'admin', 20, '3', 'Home', 'Saving template'),
	(92, 1492283167, 1, 'admin', 76, '-', '-', 'Element management'),
	(93, 1492283182, 1, 'admin', 16, '3', 'Home', 'Editing template'),
	(94, 1492283226, 1, 'admin', 20, '3', 'Home', 'Saving template'),
	(95, 1492283226, 1, 'admin', 76, '-', '-', 'Element management'),
	(96, 1492283235, 1, 'admin', 16, '3', 'Home', 'Editing template'),
	(97, 1492283246, 1, 'admin', 20, '3', 'Home', 'Saving template'),
	(98, 1492283246, 1, 'admin', 76, '-', '-', 'Element management'),
	(99, 1492283275, 1, 'admin', 16, '3', 'Home', 'Editing template'),
	(100, 1492283307, 1, 'admin', 20, '3', 'Home', 'Saving template'),
	(101, 1492283307, 1, 'admin', 76, '-', '-', 'Element management'),
	(102, 1492283382, 1, 'admin', 16, '3', 'Home', 'Editing template'),
	(103, 1492283402, 1, 'admin', 20, '3', 'Home', 'Saving template'),
	(104, 1492283402, 1, 'admin', 76, '-', '-', 'Element management'),
	(105, 1492283485, 1, 'admin', 16, '3', 'Home', 'Editing template'),
	(106, 1492283510, 1, 'admin', 20, '3', 'Home', 'Saving template'),
	(107, 1492283510, 1, 'admin', 76, '-', '-', 'Element management'),
	(108, 1492283536, 1, 'admin', 16, '3', 'Home', 'Editing template'),
	(109, 1492283562, 1, 'admin', 20, '3', 'Home', 'Saving template'),
	(110, 1492283562, 1, 'admin', 76, '-', '-', 'Element management'),
	(111, 1492324057, 1, 'admin', 58, '-', 'MODX', 'Logged in'),
	(112, 1492324064, 1, 'admin', 17, '-', '-', 'Editing settings'),
	(113, 1492324091, 1, 'admin', 17, '-', '-', 'Editing settings'),
	(114, 1492324114, 1, 'admin', 30, '-', '-', 'Saving settings'),
	(115, 1492324202, 1, 'admin', 76, '-', '-', 'Element management'),
	(116, 1492324204, 1, 'admin', 16, '3', 'Home', 'Editing template'),
	(117, 1492324670, 1, 'admin', 76, '-', '-', 'Element management'),
	(118, 1492324680, 1, 'admin', 78, '4', 'footer', 'Editing Chunk (HTML Snippet)'),
	(119, 1492324940, 1, 'admin', 79, '4', 'footer', 'Saving Chunk (HTML Snippet)'),
	(120, 1492324940, 1, 'admin', 76, '-', '-', 'Element management'),
	(121, 1492324952, 1, 'admin', 78, '4', 'footer', 'Editing Chunk (HTML Snippet)'),
	(122, 1492325012, 1, 'admin', 79, '4', 'footer', 'Saving Chunk (HTML Snippet)'),
	(123, 1492325012, 1, 'admin', 76, '-', '-', 'Element management'),
	(124, 1492325029, 1, 'admin', 78, '4', 'footer', 'Editing Chunk (HTML Snippet)'),
	(125, 1492325054, 1, 'admin', 79, '4', 'footer', 'Saving Chunk (HTML Snippet)'),
	(126, 1492325054, 1, 'admin', 76, '-', '-', 'Element management'),
	(127, 1492325062, 1, 'admin', 78, '4', 'footer', 'Editing Chunk (HTML Snippet)'),
	(128, 1492325077, 1, 'admin', 79, '4', 'footer', 'Saving Chunk (HTML Snippet)'),
	(129, 1492325077, 1, 'admin', 76, '-', '-', 'Element management'),
	(130, 1492325118, 1, 'admin', 16, '3', 'Home', 'Editing template'),
	(131, 1492325579, 1, 'admin', 20, '3', 'Home', 'Saving template'),
	(132, 1492325579, 1, 'admin', 76, '-', '-', 'Element management'),
	(133, 1492325584, 1, 'admin', 27, '1', 'Home', 'Editing resource'),
	(134, 1492325589, 1, 'admin', 5, '1', 'Home', 'Saving resource'),
	(135, 1492325591, 1, 'admin', 3, '1', 'Home', 'Viewing data for resource'),
	(136, 1492325602, 1, 'admin', 106, '-', '-', 'Viewing Modules'),
	(137, 1492325603, 1, 'admin', 76, '-', '-', 'Element management'),
	(138, 1492325610, 1, 'admin', 16, '3', 'Home', 'Editing template'),
	(139, 1492325630, 1, 'admin', 20, '3', 'Home', 'Saving template'),
	(140, 1492325630, 1, 'admin', 76, '-', '-', 'Element management'),
	(141, 1492325637, 1, 'admin', 27, '1', 'Home', 'Editing resource'),
	(142, 1492325641, 1, 'admin', 5, '1', 'Home', 'Saving resource'),
	(143, 1492325643, 1, 'admin', 3, '1', 'Home', 'Viewing data for resource'),
	(144, 1492325668, 1, 'admin', 76, '-', '-', 'Element management'),
	(145, 1492325670, 1, 'admin', 16, '3', 'Home', 'Editing template'),
	(146, 1492325674, 1, 'admin', 20, '3', 'Home', 'Saving template'),
	(147, 1492325674, 1, 'admin', 76, '-', '-', 'Element management'),
	(148, 1492325683, 1, 'admin', 16, '3', 'Home', 'Editing template'),
	(149, 1492325688, 1, 'admin', 20, '3', 'Home', 'Saving template'),
	(150, 1492325688, 1, 'admin', 76, '-', '-', 'Element management'),
	(151, 1492325696, 1, 'admin', 27, '1', 'Home', 'Editing resource'),
	(152, 1492325726, 1, 'admin', 5, '1', 'Home', 'Saving resource'),
	(153, 1492325726, 1, 'admin', 27, '1', 'Home', 'Editing resource'),
	(154, 1492325750, 1, 'admin', 5, '1', 'Home', 'Saving resource'),
	(155, 1492325750, 1, 'admin', 27, '1', 'Home', 'Editing resource'),
	(156, 1492325760, 1, 'admin', 5, '1', 'Home', 'Saving resource'),
	(157, 1492325760, 1, 'admin', 27, '1', 'Home', 'Editing resource'),
	(158, 1492326002, 1, 'admin', 76, '-', '-', 'Element management'),
	(159, 1492326005, 1, 'admin', 16, '3', 'Home', 'Editing template'),
	(160, 1492326031, 1, 'admin', 20, '3', 'Home', 'Saving template'),
	(161, 1492326031, 1, 'admin', 76, '-', '-', 'Element management'),
	(162, 1492326044, 1, 'admin', 16, '3', 'Home', 'Editing template'),
	(163, 1492326081, 1, 'admin', 20, '3', 'Home', 'Saving template'),
	(164, 1492326081, 1, 'admin', 76, '-', '-', 'Element management'),
	(165, 1492326232, 1, 'admin', 16, '3', 'Home', 'Editing template'),
	(166, 1492326268, 1, 'admin', 20, '3', 'Home', 'Saving template'),
	(167, 1492326268, 1, 'admin', 76, '-', '-', 'Element management'),
	(168, 1492326432, 1, 'admin', 16, '3', 'Home', 'Editing template'),
	(169, 1492326447, 1, 'admin', 20, '3', 'Home', 'Saving template'),
	(170, 1492326447, 1, 'admin', 76, '-', '-', 'Element management'),
	(171, 1492326460, 1, 'admin', 16, '3', 'Home', 'Editing template'),
	(172, 1492326473, 1, 'admin', 20, '3', 'Home', 'Saving template'),
	(173, 1492326473, 1, 'admin', 76, '-', '-', 'Element management'),
	(174, 1492327907, 1, 'admin', 19, '-', 'Новый шаблон', 'Creating a new template'),
	(175, 1492328003, 1, 'admin', 20, '-', 'Авторизация', 'Saving template'),
	(176, 1492328003, 1, 'admin', 76, '-', '-', 'Element management'),
	(177, 1492328008, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(178, 1492328030, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(179, 1492328030, 1, 'admin', 76, '-', '-', 'Element management'),
	(180, 1492328051, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource'),
	(181, 1492328055, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource'),
	(182, 1492328065, 1, 'admin', 5, '-', 'Вход', 'Saving resource'),
	(183, 1492328066, 1, 'admin', 3, '2', 'Вход', 'Viewing data for resource'),
	(184, 1492328078, 1, 'admin', 27, '2', 'Вход', 'Editing resource'),
	(185, 1492328086, 1, 'admin', 5, '2', 'Вход', 'Saving resource'),
	(186, 1492328087, 1, 'admin', 3, '2', 'Вход', 'Viewing data for resource'),
	(187, 1492328099, 1, 'admin', 27, '2', 'Вход', 'Editing resource'),
	(188, 1492328111, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource'),
	(189, 1492328112, 1, 'admin', 5, '-', 'Новый ресурс', 'Saving resource'),
	(190, 1492328113, 1, 'admin', 3, '3', 'Новый ресурс', 'Viewing data for resource'),
	(191, 1492328120, 1, 'admin', 6, '3', 'Новый ресурс', 'Deleting resource'),
	(192, 1492328121, 1, 'admin', 3, '3', 'Новый ресурс', 'Viewing data for resource'),
	(193, 1492328123, 1, 'admin', 6, '2', 'Вход', 'Deleting resource'),
	(194, 1492328124, 1, 'admin', 3, '1', 'Home', 'Viewing data for resource'),
	(195, 1492328126, 1, 'admin', 64, '-', '-', 'Removing deleted content'),
	(196, 1492328130, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource'),
	(197, 1492328148, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource'),
	(198, 1492328160, 1, 'admin', 5, '-', 'Вход', 'Saving resource'),
	(199, 1492328162, 1, 'admin', 3, '4', 'Вход', 'Viewing data for resource'),
	(200, 1492328172, 1, 'admin', 27, '4', 'Вход', 'Editing resource'),
	(201, 1492328177, 1, 'admin', 5, '4', 'Вход', 'Saving resource'),
	(202, 1492328178, 1, 'admin', 3, '4', 'Вход', 'Viewing data for resource'),
	(203, 1492328271, 1, 'admin', 76, '-', '-', 'Element management'),
	(204, 1492328274, 1, 'admin', 78, '4', 'footer', 'Editing Chunk (HTML Snippet)'),
	(205, 1492328294, 1, 'admin', 79, '4', 'footer', 'Saving Chunk (HTML Snippet)'),
	(206, 1492328294, 1, 'admin', 76, '-', '-', 'Element management'),
	(207, 1492328992, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(208, 1492329009, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(209, 1492329009, 1, 'admin', 76, '-', '-', 'Element management'),
	(210, 1492329026, 1, 'admin', 76, '-', '-', 'Element management'),
	(211, 1492329030, 1, 'admin', 16, '3', 'Home', 'Editing template'),
	(212, 1492329047, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(213, 1492329089, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(214, 1492329089, 1, 'admin', 76, '-', '-', 'Element management'),
	(215, 1492329103, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(216, 1492329108, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(217, 1492329108, 1, 'admin', 76, '-', '-', 'Element management'),
	(218, 1492329146, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(219, 1492329438, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(220, 1492329438, 1, 'admin', 76, '-', '-', 'Element management'),
	(221, 1492329445, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(222, 1492329456, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(223, 1492329456, 1, 'admin', 76, '-', '-', 'Element management'),
	(224, 1492329470, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(225, 1492329508, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(226, 1492329508, 1, 'admin', 76, '-', '-', 'Element management'),
	(227, 1492329629, 1, 'admin', 20, '3', 'Home', 'Saving template'),
	(228, 1492329629, 1, 'admin', 76, '-', '-', 'Element management'),
	(229, 1492329635, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(230, 1492329638, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(231, 1492329638, 1, 'admin', 76, '-', '-', 'Element management'),
	(232, 1492329648, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(233, 1492329655, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(234, 1492329655, 1, 'admin', 76, '-', '-', 'Element management'),
	(235, 1492329672, 1, 'admin', 16, '3', 'Home', 'Editing template'),
	(236, 1492329676, 1, 'admin', 76, '-', '-', 'Element management'),
	(237, 1492329680, 1, 'admin', 78, '4', 'footer', 'Editing Chunk (HTML Snippet)'),
	(238, 1492329686, 1, 'admin', 76, '-', '-', 'Element management'),
	(239, 1492329704, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(240, 1492329794, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(241, 1492329799, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(242, 1492329799, 1, 'admin', 76, '-', '-', 'Element management'),
	(243, 1492329800, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(244, 1492329805, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(245, 1492329805, 1, 'admin', 76, '-', '-', 'Element management'),
	(246, 1492329817, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(247, 1492329841, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(248, 1492329841, 1, 'admin', 76, '-', '-', 'Element management'),
	(249, 1492329893, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(250, 1492329893, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(251, 1492329906, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(252, 1492329934, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(253, 1492329934, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(254, 1492329947, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(255, 1492329947, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(256, 1492330007, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(257, 1492330007, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(258, 1492330049, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(259, 1492330049, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(260, 1492330131, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(261, 1492330131, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(262, 1492330168, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(263, 1492330168, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(264, 1492330252, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(265, 1492330253, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(266, 1492330297, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(267, 1492330297, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(268, 1492330351, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(269, 1492330351, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(270, 1492330369, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(271, 1492330369, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(272, 1492330413, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(273, 1492330413, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(274, 1492330584, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(275, 1492330586, 1, 'admin', 76, '-', '-', 'Element management'),
	(276, 1492330590, 1, 'admin', 78, '5', 'header', 'Editing Chunk (HTML Snippet)'),
	(277, 1492330606, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(278, 1492330606, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(279, 1492330872, 1, 'admin', 76, '-', '-', 'Element management'),
	(280, 1492330880, 1, 'admin', 16, '3', 'Home', 'Editing template'),
	(281, 1492330923, 1, 'admin', 76, '-', '-', 'Element management'),
	(282, 1492330926, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(283, 1492330930, 1, 'admin', 76, '-', '-', 'Element management'),
	(284, 1492330934, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(285, 1492330950, 1, 'admin', 76, '-', '-', 'Element management'),
	(286, 1492330954, 1, 'admin', 16, '3', 'Home', 'Editing template'),
	(287, 1492330982, 1, 'admin', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
	(288, 1492330982, 1, 'admin', 76, '-', '-', 'Element management'),
	(289, 1492331016, 1, 'admin', 76, '-', '-', 'Element management'),
	(290, 1492331020, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(291, 1492331031, 1, 'admin', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
	(292, 1492331031, 1, 'admin', 76, '-', '-', 'Element management'),
	(293, 1492338689, 1, 'admin', 78, '4', 'footer', 'Editing Chunk (HTML Snippet)'),
	(294, 1492338747, 1, 'admin', 79, '4', 'footer', 'Saving Chunk (HTML Snippet)'),
	(295, 1492338747, 1, 'admin', 78, '4', 'footer', 'Editing Chunk (HTML Snippet)'),
	(296, 1492338757, 1, 'admin', 79, '4', 'footer', 'Saving Chunk (HTML Snippet)'),
	(297, 1492338757, 1, 'admin', 78, '4', 'footer', 'Editing Chunk (HTML Snippet)'),
	(298, 1492339128, 1, 'admin', 76, '-', '-', 'Element management'),
	(299, 1492339130, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(300, 1492339188, 1, 'admin', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
	(301, 1492339188, 1, 'admin', 76, '-', '-', 'Element management'),
	(302, 1492339223, 1, 'admin', 78, '5', 'header', 'Editing Chunk (HTML Snippet)'),
	(303, 1492339262, 1, 'admin', 79, '5', 'header', 'Saving Chunk (HTML Snippet)'),
	(304, 1492339262, 1, 'admin', 76, '-', '-', 'Element management'),
	(305, 1492339315, 1, 'admin', 78, '5', 'header', 'Editing Chunk (HTML Snippet)'),
	(306, 1492339325, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(307, 1492339347, 1, 'admin', 79, '5', 'header', 'Saving Chunk (HTML Snippet)'),
	(308, 1492339347, 1, 'admin', 76, '-', '-', 'Element management'),
	(309, 1492339365, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(310, 1492339369, 1, 'admin', 76, '-', '-', 'Element management'),
	(311, 1492339374, 1, 'admin', 78, '5', 'header', 'Editing Chunk (HTML Snippet)'),
	(312, 1492339391, 1, 'admin', 79, '5', 'header', 'Saving Chunk (HTML Snippet)'),
	(313, 1492339391, 1, 'admin', 78, '5', 'header', 'Editing Chunk (HTML Snippet)'),
	(314, 1492339461, 1, 'admin', 79, '5', 'header', 'Saving Chunk (HTML Snippet)'),
	(315, 1492339461, 1, 'admin', 78, '5', 'header', 'Editing Chunk (HTML Snippet)'),
	(316, 1492339473, 1, 'admin', 79, '5', 'header', 'Saving Chunk (HTML Snippet)'),
	(317, 1492339473, 1, 'admin', 78, '5', 'header', 'Editing Chunk (HTML Snippet)'),
	(318, 1492339549, 1, 'admin', 79, '5', 'header', 'Saving Chunk (HTML Snippet)'),
	(319, 1492339549, 1, 'admin', 78, '5', 'header', 'Editing Chunk (HTML Snippet)'),
	(320, 1492339561, 1, 'admin', 76, '-', '-', 'Element management'),
	(321, 1492339564, 1, 'admin', 78, '4', 'footer', 'Editing Chunk (HTML Snippet)'),
	(322, 1492339591, 1, 'admin', 79, '4', 'footer', 'Saving Chunk (HTML Snippet)'),
	(323, 1492339591, 1, 'admin', 78, '4', 'footer', 'Editing Chunk (HTML Snippet)'),
	(324, 1492339618, 1, 'admin', 78, '5', 'header', 'Editing Chunk (HTML Snippet)'),
	(325, 1492339622, 1, 'admin', 76, '-', '-', 'Element management'),
	(326, 1492339627, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(327, 1492339660, 1, 'admin', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
	(328, 1492339660, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(329, 1492339663, 1, 'admin', 79, '4', 'footer', 'Saving Chunk (HTML Snippet)'),
	(330, 1492339663, 1, 'admin', 78, '4', 'footer', 'Editing Chunk (HTML Snippet)'),
	(331, 1492339797, 1, 'admin', 79, '4', 'footer', 'Saving Chunk (HTML Snippet)'),
	(332, 1492339797, 1, 'admin', 78, '4', 'footer', 'Editing Chunk (HTML Snippet)'),
	(333, 1492339803, 1, 'admin', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
	(334, 1492339803, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(335, 1492339808, 1, 'admin', 76, '-', '-', 'Element management'),
	(336, 1492339812, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(337, 1492339817, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(338, 1492339817, 1, 'admin', 76, '-', '-', 'Element management'),
	(339, 1492339936, 1, 'admin', 79, '4', 'footer', 'Saving Chunk (HTML Snippet)'),
	(340, 1492339936, 1, 'admin', 78, '4', 'footer', 'Editing Chunk (HTML Snippet)'),
	(341, 1492339940, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(342, 1492339990, 1, 'admin', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
	(343, 1492339990, 1, 'admin', 76, '-', '-', 'Element management'),
	(344, 1492340029, 1, 'admin', 79, '4', 'footer', 'Saving Chunk (HTML Snippet)'),
	(345, 1492340029, 1, 'admin', 78, '4', 'footer', 'Editing Chunk (HTML Snippet)'),
	(346, 1492340058, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(347, 1492340067, 1, 'admin', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
	(348, 1492340067, 1, 'admin', 76, '-', '-', 'Element management'),
	(349, 1492340075, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(350, 1492340123, 1, 'admin', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
	(351, 1492340123, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(352, 1492340160, 1, 'admin', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
	(353, 1492340160, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(354, 1492340272, 1, 'admin', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
	(355, 1492340272, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(356, 1492340288, 1, 'admin', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
	(357, 1492340288, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(358, 1492340336, 1, 'admin', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
	(359, 1492340336, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(360, 1492340554, 1, 'admin', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
	(361, 1492340554, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(362, 1492340576, 1, 'admin', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
	(363, 1492340576, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(364, 1492340736, 1, 'admin', 76, '-', '-', 'Element management'),
	(365, 1492340741, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(366, 1492340770, 1, 'admin', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
	(367, 1492340770, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(368, 1492340801, 1, 'admin', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
	(369, 1492340801, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(370, 1492340879, 1, 'admin', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
	(371, 1492340879, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(372, 1492340980, 1, 'admin', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
	(373, 1492340980, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(374, 1492341011, 1, 'admin', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
	(375, 1492341011, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(376, 1492341031, 1, 'admin', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
	(377, 1492341031, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(378, 1492341075, 1, 'admin', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
	(379, 1492341075, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(380, 1492341094, 1, 'admin', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
	(381, 1492341094, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(382, 1492341122, 1, 'admin', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
	(383, 1492341122, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(384, 1492341297, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(385, 1492341297, 1, 'admin', 76, '-', '-', 'Element management'),
	(386, 1492341308, 1, 'admin', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
	(387, 1492341308, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(388, 1492341341, 1, 'admin', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
	(389, 1492341341, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(390, 1492342832, 1, 'admin', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
	(391, 1492342832, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(392, 1492342927, 1, 'admin', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
	(393, 1492342927, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(394, 1492343242, 1, 'admin', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
	(395, 1492343242, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(396, 1492343265, 1, 'admin', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
	(397, 1492343265, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(398, 1492343279, 1, 'admin', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
	(399, 1492343279, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(400, 1492343502, 1, 'admin', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
	(401, 1492343502, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(402, 1492343586, 1, 'admin', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
	(403, 1492343586, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(404, 1492343682, 1, 'admin', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
	(405, 1492343682, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(406, 1492343741, 1, 'admin', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
	(407, 1492343741, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(408, 1492343774, 1, 'admin', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
	(409, 1492343774, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(410, 1492344026, 1, 'admin', 58, '-', 'MODX', 'Logged in'),
	(411, 1492344032, 1, 'admin', 76, '-', '-', 'Element management'),
	(412, 1492344048, 1, 'admin', 76, '-', '-', 'Element management'),
	(413, 1492344053, 1, 'admin', 106, '-', '-', 'Viewing Modules'),
	(414, 1492344055, 1, 'admin', 76, '-', '-', 'Element management'),
	(415, 1492344058, 1, 'admin', 76, '-', '-', 'Element management'),
	(416, 1492344083, 1, 'admin', 58, '-', 'MODX', 'Logged in'),
	(417, 1492344085, 1, 'admin', 76, '-', '-', 'Element management'),
	(418, 1492344090, 1, 'admin', 76, '-', '-', 'Element management'),
	(419, 1492344093, 1, 'admin', 31, '-', '-', 'Using file manager'),
	(420, 1492344095, 1, 'admin', 76, '-', '-', 'Element management'),
	(421, 1492344157, 1, 'admin', 58, '-', 'MODX', 'Logged in'),
	(422, 1492344162, 1, 'admin', 76, '-', '-', 'Element management'),
	(423, 1492344178, 1, 'admin', 76, '-', '-', 'Element management'),
	(424, 1492344203, 1, 'admin', 75, '-', '-', 'User/ role management'),
	(425, 1492344206, 1, 'admin', 99, '-', '-', 'Manage Web Users'),
	(426, 1492344207, 1, 'admin', 86, '-', '-', 'Role management'),
	(427, 1492344209, 1, 'admin', 40, '-', '-', 'Editing Access Permissions'),
	(428, 1492344211, 1, 'admin', 91, '-', '-', 'Editing Web Access Permissions'),
	(429, 1492344215, 1, 'admin', 26, '-', '-', 'Refreshing site'),
	(430, 1492344219, 1, 'admin', 76, '-', '-', 'Element management'),
	(431, 1492344223, 1, 'admin', 76, '-', '-', 'Element management'),
	(432, 1492344225, 1, 'admin', 76, '-', '-', 'Element management'),
	(433, 1492344297, 1, 'admin', 27, '1', 'Home', 'Editing resource'),
	(434, 1492344302, 1, 'admin', 76, '-', '-', 'Element management'),
	(435, 1492344324, 1, 'admin', 58, '-', 'MODX', 'Logged in'),
	(436, 1492344338, 1, 'admin', 76, '-', '-', 'Element management'),
	(437, 1492344396, 1, 'admin', 76, '-', '-', 'Element management'),
	(438, 1492344402, 1, 'admin', 301, '4', 'Мета тайтл', 'Edit Template Variable'),
	(439, 1492344404, 1, 'admin', 76, '-', '-', 'Element management'),
	(440, 1492344467, 1, 'admin', 76, '-', '-', 'Element management'),
	(441, 1492344514, 1, 'admin', 76, '-', '-', 'Element management'),
	(442, 1492344592, 1, 'admin', 93, '-', '-', 'Backup Manager'),
	(443, 1492344595, 1, 'admin', 95, '-', '-', 'Importing resources from HTML'),
	(444, 1492344605, 1, 'admin', 17, '-', '-', 'Editing settings'),
	(445, 1492344608, 1, 'admin', 83, '-', '-', 'Exporting a resource to HTML'),
	(446, 1492344610, 1, 'admin', 95, '-', '-', 'Importing resources from HTML'),
	(447, 1492344613, 1, 'admin', 93, '-', '-', 'Backup Manager'),
	(448, 1492344619, 1, 'admin', 93, '-', '-', 'Backup Manager'),
	(449, 1492344622, 1, 'admin', 76, '-', '-', 'Element management'),
	(450, 1492344624, 1, 'admin', 76, '-', '-', 'Element management'),
	(451, 1492344625, 1, 'admin', 76, '-', '-', 'Element management'),
	(452, 1492344626, 1, 'admin', 76, '-', '-', 'Element management'),
	(453, 1492344626, 1, 'admin', 76, '-', '-', 'Element management'),
	(454, 1492344627, 1, 'admin', 76, '-', '-', 'Element management'),
	(455, 1492344628, 1, 'admin', 76, '-', '-', 'Element management'),
	(456, 1492344629, 1, 'admin', 76, '-', '-', 'Element management'),
	(457, 1492345114, 1, 'admin', 76, '-', '-', 'Element management'),
	(458, 1492345116, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(459, 1492346819, 1, 'admin', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
	(460, 1492346819, 1, 'admin', 76, '-', '-', 'Element management'),
	(461, 1492346830, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(462, 1492346835, 1, 'admin', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
	(463, 1492346835, 1, 'admin', 76, '-', '-', 'Element management'),
	(464, 1492435918, 1, 'admin', 58, '-', 'MODX', 'Logged in'),
	(465, 1492435927, 1, 'admin', 93, '-', '-', 'Backup Manager'),
	(466, 1492435986, 1, 'admin', 26, '-', '-', 'Refreshing site'),
	(467, 1492435987, 1, 'admin', 71, '-', '-', 'Searching'),
	(468, 1492435990, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource'),
	(469, 1492435991, 1, 'admin', 72, '-', 'Новый ресурс', 'Adding a weblink'),
	(470, 1492435997, 1, 'admin', 112, '2', 'Extras', 'Execute module'),
	(471, 1492437879, 1, 'admin', 76, '-', 'Extras', 'Element management'),
	(472, 1492437882, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(473, 1492437976, 1, 'admin', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
	(474, 1492437976, 1, 'admin', 76, '-', '-', 'Element management'),
	(475, 1492438009, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(476, 1492438022, 1, 'admin', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
	(477, 1492438022, 1, 'admin', 76, '-', '-', 'Element management'),
	(478, 1492438038, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(479, 1492438044, 1, 'admin', 27, '4', 'Вход', 'Editing resource'),
	(480, 1492438049, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(481, 1492438068, 1, 'admin', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
	(482, 1492438068, 1, 'admin', 76, '-', '-', 'Element management'),
	(483, 1492438075, 1, 'admin', 27, '4', 'Вход', 'Editing resource'),
	(484, 1492438079, 1, 'admin', 76, '-', '-', 'Element management'),
	(485, 1492438085, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(486, 1492438100, 1, 'admin', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
	(487, 1492438100, 1, 'admin', 76, '-', '-', 'Element management'),
	(488, 1492438112, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(489, 1492438115, 1, 'admin', 76, '-', '-', 'Element management'),
	(490, 1492438119, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(491, 1492438127, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(492, 1492438127, 1, 'admin', 76, '-', '-', 'Element management'),
	(493, 1492438182, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(494, 1492438197, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(495, 1492438197, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(496, 1492438211, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(497, 1492438211, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(498, 1492438222, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(499, 1492438222, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(500, 1492438294, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(501, 1492438294, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(502, 1492438324, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(503, 1492438324, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(504, 1492438351, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(505, 1492438351, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(506, 1492438360, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(507, 1492438360, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(508, 1492438419, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(509, 1492438419, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(510, 1492438448, 1, 'admin', 106, '-', '-', 'Viewing Modules'),
	(511, 1492438449, 1, 'admin', 76, '-', '-', 'Element management'),
	(512, 1492438451, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(513, 1492438469, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(514, 1492438480, 1, 'admin', 76, '-', '-', 'Element management'),
	(515, 1492438485, 1, 'admin', 78, '4', 'footer', 'Editing Chunk (HTML Snippet)'),
	(516, 1492438744, 1, 'admin', 27, '4', 'Вход', 'Editing resource'),
	(517, 1492438747, 1, 'admin', 76, '-', '-', 'Element management'),
	(518, 1492438750, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(519, 1492438818, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(520, 1492438818, 1, 'admin', 76, '-', '-', 'Element management'),
	(521, 1492438835, 1, 'admin', 78, '5', 'header', 'Editing Chunk (HTML Snippet)'),
	(522, 1492438840, 1, 'admin', 76, '-', '-', 'Element management'),
	(523, 1492438841, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(524, 1492438858, 1, 'admin', 76, '-', '-', 'Element management'),
	(525, 1492438861, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(526, 1492438868, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(527, 1492438868, 1, 'admin', 76, '-', '-', 'Element management'),
	(528, 1492438903, 1, 'admin', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
	(529, 1492438903, 1, 'admin', 76, '-', '-', 'Element management'),
	(530, 1492438907, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(531, 1492438912, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(532, 1492438912, 1, 'admin', 76, '-', '-', 'Element management'),
	(533, 1492438930, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(534, 1492438943, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(535, 1492438943, 1, 'admin', 76, '-', '-', 'Element management'),
	(536, 1492438984, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(537, 1492439000, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(538, 1492439000, 1, 'admin', 76, '-', '-', 'Element management'),
	(539, 1492439041, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(540, 1492439047, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(541, 1492439047, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(542, 1492439299, 1, 'admin', 76, '-', '-', 'Element management'),
	(543, 1492439302, 1, 'admin', 78, '4', 'footer', 'Editing Chunk (HTML Snippet)'),
	(544, 1492439315, 1, 'admin', 79, '4', 'footer', 'Saving Chunk (HTML Snippet)'),
	(545, 1492439315, 1, 'admin', 78, '4', 'footer', 'Editing Chunk (HTML Snippet)'),
	(546, 1492439332, 1, 'admin', 79, '4', 'footer', 'Saving Chunk (HTML Snippet)'),
	(547, 1492439333, 1, 'admin', 78, '4', 'footer', 'Editing Chunk (HTML Snippet)'),
	(548, 1492439619, 1, 'admin', 72, '-', 'Новый ресурс', 'Adding a weblink'),
	(549, 1492439623, 1, 'admin', 83, '-', '-', 'Exporting a resource to HTML'),
	(550, 1492439624, 1, 'admin', 71, '-', '-', 'Searching'),
	(551, 1492439625, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource'),
	(552, 1492439626, 1, 'admin', 72, '-', 'Новый ресурс', 'Adding a weblink'),
	(553, 1492439627, 1, 'admin', 26, '-', '-', 'Refreshing site'),
	(554, 1492439634, 1, 'admin', 76, '-', '-', 'Element management'),
	(555, 1492439634, 1, 'admin', 31, '-', '-', 'Using file manager'),
	(556, 1492439636, 1, 'admin', 112, '1', 'Doc Manager', 'Execute module'),
	(557, 1492439637, 1, 'admin', 112, '2', 'Extras', 'Execute module'),
	(558, 1492439638, 1, 'admin', 106, '-', '-', 'Viewing Modules'),
	(559, 1492439639, 1, 'admin', 75, '-', '-', 'User/ role management'),
	(560, 1492439640, 1, 'admin', 106, '-', '-', 'Viewing Modules'),
	(561, 1492439642, 1, 'admin', 112, '1', 'Doc Manager', 'Execute module'),
	(562, 1492439642, 1, 'admin', 112, '2', 'Extras', 'Execute module'),
	(563, 1492439644, 1, 'admin', 99, '-', '-', 'Manage Web Users'),
	(564, 1492439645, 1, 'admin', 112, '2', 'Extras', 'Execute module'),
	(565, 1492439773, 1, 'admin', 76, '-', '-', 'Element management'),
	(566, 1492439783, 1, 'admin', 22, '12', 'loginza', 'Editing Snippet'),
	(567, 1492439881, 1, 'admin', 76, '-', '-', 'Element management'),
	(568, 1492439886, 1, 'admin', 22, '14', 'WebLogin', 'Editing Snippet'),
	(569, 1492439888, 1, 'admin', 76, '-', '-', 'Element management'),
	(570, 1492439994, 1, 'admin', 76, '-', '-', 'Element management'),
	(571, 1492439995, 1, 'admin', 106, '-', '-', 'Viewing Modules'),
	(572, 1492439997, 1, 'admin', 76, '-', '-', 'Element management'),
	(573, 1492439999, 1, 'admin', 31, '-', '-', 'Using file manager'),
	(574, 1492439999, 1, 'admin', 76, '-', '-', 'Element management'),
	(575, 1492440002, 1, 'admin', 75, '-', '-', 'User/ role management'),
	(576, 1492440003, 1, 'admin', 106, '-', '-', 'Viewing Modules'),
	(577, 1492440004, 1, 'admin', 112, '1', 'Doc Manager', 'Execute module'),
	(578, 1492440005, 1, 'admin', 112, '2', 'Extras', 'Execute module'),
	(579, 1492440085, 1, 'admin', 76, '-', '-', 'Element management'),
	(580, 1492440175, 1, 'admin', 91, '-', '-', 'Editing Web Access Permissions'),
	(581, 1492440189, 1, 'admin', 92, '-', '-', 'Editing Access Permissions'),
	(582, 1492440189, 1, 'admin', 91, '-', '-', 'Editing Web Access Permissions'),
	(583, 1492440209, 1, 'admin', 92, '-', '-', 'Editing Access Permissions'),
	(584, 1492440209, 1, 'admin', 91, '-', '-', 'Editing Web Access Permissions'),
	(585, 1492440218, 1, 'admin', 92, '-', '-', 'Editing Access Permissions'),
	(586, 1492440218, 1, 'admin', 91, '-', '-', 'Editing Web Access Permissions'),
	(587, 1492440278, 1, 'admin', 92, '-', '-', 'Editing Access Permissions'),
	(588, 1492440278, 1, 'admin', 91, '-', '-', 'Editing Web Access Permissions'),
	(589, 1492440283, 1, 'admin', 92, '-', '-', 'Editing Access Permissions'),
	(590, 1492440283, 1, 'admin', 91, '-', '-', 'Editing Web Access Permissions'),
	(591, 1492440285, 1, 'admin', 92, '-', '-', 'Editing Access Permissions'),
	(592, 1492440285, 1, 'admin', 91, '-', '-', 'Editing Web Access Permissions'),
	(593, 1492440564, 1, 'admin', 92, '-', '-', 'Editing Access Permissions'),
	(594, 1492440564, 1, 'admin', 91, '-', '-', 'Editing Web Access Permissions'),
	(595, 1492440566, 1, 'admin', 92, '-', '-', 'Editing Access Permissions'),
	(596, 1492440566, 1, 'admin', 91, '-', '-', 'Editing Web Access Permissions'),
	(597, 1492440567, 1, 'admin', 92, '-', '-', 'Editing Access Permissions'),
	(598, 1492440567, 1, 'admin', 91, '-', '-', 'Editing Web Access Permissions'),
	(599, 1492440840, 1, 'admin', 76, '-', '-', 'Element management'),
	(600, 1492440842, 1, 'admin', 106, '-', '-', 'Viewing Modules'),
	(601, 1492440843, 1, 'admin', 112, '2', 'Extras', 'Execute module'),
	(602, 1492441308, 1, 'admin', 76, '-', '-', 'Element management'),
	(603, 1492441310, 1, 'admin', 23, '-', 'Новый сниппет', 'Creating a new Snippet'),
	(604, 1492441353, 1, 'admin', 23, '-', 'Новый сниппет', 'Creating a new Snippet'),
	(605, 1492441356, 1, 'admin', 76, '-', '-', 'Element management'),
	(606, 1492441362, 1, 'admin', 22, '12', 'loginza', 'Editing Snippet'),
	(607, 1492441440, 1, 'admin', 24, '12', 'loginza', 'Saving Snippet'),
	(608, 1492441440, 1, 'admin', 76, '-', '-', 'Element management'),
	(609, 1492441613, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(610, 1492441617, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(611, 1492441617, 1, 'admin', 76, '-', '-', 'Element management'),
	(612, 1492441693, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(613, 1492441696, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(614, 1492441696, 1, 'admin', 76, '-', '-', 'Element management'),
	(615, 1492441724, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(616, 1492441733, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(617, 1492441733, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(618, 1492443138, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(619, 1492443158, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(620, 1492443158, 1, 'admin', 76, '-', '-', 'Element management'),
	(621, 1492443161, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(622, 1492443341, 1, 'admin', 76, '-', '-', 'Element management'),
	(623, 1492443343, 1, 'admin', 112, '2', 'Extras', 'Execute module'),
	(624, 1492443405, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(625, 1492443405, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(626, 1492443621, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(627, 1492443621, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(628, 1492443673, 1, 'admin', 76, '-', '-', 'Element management'),
	(629, 1492443677, 1, 'admin', 22, '12', 'loginza', 'Editing Snippet'),
	(630, 1492444399, 1, 'admin', 58, '-', 'MODX', 'Logged in'),
	(631, 1492444404, 1, 'admin', 76, '-', '-', 'Element management'),
	(632, 1492444411, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(633, 1492444439, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(634, 1492444440, 1, 'admin', 76, '-', '-', 'Element management'),
	(635, 1492444625, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(636, 1492444634, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(637, 1492444634, 1, 'admin', 76, '-', '-', 'Element management'),
	(638, 1492444663, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(639, 1492444670, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(640, 1492444670, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(641, 1492444737, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(642, 1492444737, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(643, 1492444771, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(644, 1492444771, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(645, 1492444799, 1, 'admin', 20, '5', 'Авторизация', 'Saving template'),
	(646, 1492444799, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(647, 1492508411, 1, 'admin', 76, '-', '-', 'Element management'),
	(648, 1492508424, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(649, 1492508446, 1, 'admin', 27, '4', 'Вход', 'Editing resource'),
	(650, 1492508476, 1, 'admin', 27, '1', 'Home', 'Editing resource'),
	(651, 1492508486, 1, 'admin', 76, '-', '-', 'Element management'),
	(652, 1492508489, 1, 'admin', 16, '3', 'Home', 'Editing template'),
	(653, 1492508511, 1, 'admin', 27, '4', 'Вход', 'Editing resource'),
	(654, 1492508545, 1, 'admin', 76, '-', '-', 'Element management'),
	(655, 1492508555, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(656, 1492508584, 1, 'admin', 76, '-', '-', 'Element management'),
	(657, 1492508600, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(658, 1492508632, 1, 'admin', 76, '-', '-', 'Element management'),
	(659, 1492508641, 1, 'admin', 22, '12', 'loginza', 'Editing Snippet'),
	(660, 1492508654, 1, 'admin', 112, '2', 'Extras', 'Execute module'),
	(661, 1492508669, 1, 'admin', 76, '-', '-', 'Element management'),
	(662, 1492510748, 1, 'admin', 76, '-', '-', 'Element management'),
	(663, 1492510753, 1, 'admin', 19, '-', 'Новый шаблон', 'Creating a new template'),
	(664, 1492510932, 1, 'admin', 20, '-', 'registration', 'Saving template'),
	(665, 1492510932, 1, 'admin', 76, '-', '-', 'Element management'),
	(666, 1492510945, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(667, 1492510957, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(668, 1492510983, 1, 'admin', 20, '6', 'registration', 'Saving template'),
	(669, 1492510983, 1, 'admin', 76, '-', '-', 'Element management'),
	(670, 1492511004, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource'),
	(671, 1492511047, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource'),
	(672, 1492511052, 1, 'admin', 5, '-', 'Регистрация', 'Saving resource'),
	(673, 1492511054, 1, 'admin', 3, '5', 'Регистрация', 'Viewing data for resource'),
	(674, 1492511107, 1, 'admin', 76, '-', '-', 'Element management'),
	(675, 1492511111, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(676, 1492511144, 1, 'admin', 20, '6', 'registration', 'Saving template'),
	(677, 1492511144, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(678, 1492511317, 1, 'admin', 20, '6', 'registration', 'Saving template'),
	(679, 1492511317, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(680, 1492511404, 1, 'admin', 20, '6', 'registration', 'Saving template'),
	(681, 1492511404, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(682, 1492512075, 1, 'admin', 58, '-', 'MODX', 'Logged in'),
	(683, 1492512132, 1, 'admin', 76, '-', '-', 'Element management'),
	(684, 1492512136, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(685, 1492512170, 1, 'admin', 20, '6', 'registration', 'Saving template'),
	(686, 1492512170, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(687, 1492512266, 1, 'admin', 20, '6', 'registration', 'Saving template'),
	(688, 1492512266, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(689, 1492512294, 1, 'admin', 76, '-', '-', 'Element management'),
	(690, 1492512303, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(691, 1492512350, 1, 'admin', 20, '6', 'registration', 'Saving template'),
	(692, 1492512350, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(693, 1492512405, 1, 'admin', 20, '6', 'registration', 'Saving template'),
	(694, 1492512405, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(695, 1492512489, 1, 'admin', 20, '6', 'registration', 'Saving template'),
	(696, 1492512489, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(697, 1492512648, 1, 'admin', 20, '6', 'registration', 'Saving template'),
	(698, 1492512649, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(699, 1492512687, 1, 'admin', 76, '-', '-', 'Element management'),
	(700, 1492512849, 1, 'admin', 20, '6', 'registration', 'Saving template'),
	(701, 1492512849, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(702, 1492512875, 1, 'admin', 20, '6', 'registration', 'Saving template'),
	(703, 1492512875, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(704, 1492512957, 1, 'admin', 20, '6', 'registration', 'Saving template'),
	(705, 1492512957, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(706, 1492513007, 1, 'admin', 16, '3', 'Home', 'Editing template'),
	(707, 1492513093, 1, 'admin', 20, '6', 'registration', 'Saving template'),
	(708, 1492513093, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(709, 1492513190, 1, 'admin', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
	(710, 1492513206, 1, 'admin', 76, '-', '-', 'Element management'),
	(711, 1492513260, 1, 'admin', 20, '6', 'registration', 'Saving template'),
	(712, 1492513260, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(713, 1492513301, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
	(714, 1492513848, 1, 'admin', 79, '-', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(715, 1492513848, 1, 'admin', 76, '-', '-', 'Element management'),
	(716, 1492513879, 1, 'admin', 20, '6', 'registration', 'Saving template'),
	(717, 1492513879, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(718, 1492513910, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(719, 1492513950, 1, 'admin', 20, '6', 'registration', 'Saving template'),
	(720, 1492513951, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(721, 1492513960, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(722, 1492513960, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(723, 1492513989, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(724, 1492513990, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(725, 1492514120, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(726, 1492514120, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(727, 1492514168, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(728, 1492514168, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(729, 1492514235, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(730, 1492514235, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(731, 1492514316, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(732, 1492514331, 1, 'admin', 20, '6', 'registration', 'Saving template'),
	(733, 1492514331, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(734, 1492514439, 1, 'admin', 76, '-', '-', 'Element management'),
	(735, 1492514477, 1, 'admin', 112, '2', 'Extras', 'Execute module'),
	(736, 1492514808, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(737, 1492514808, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(738, 1492514825, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(739, 1492514826, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(740, 1492515281, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(741, 1492515281, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(742, 1492515311, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(743, 1492515312, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(744, 1492515339, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(745, 1492515339, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(746, 1492515422, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(747, 1492515422, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(748, 1492515473, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(749, 1492515473, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(750, 1492515562, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(751, 1492515562, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(752, 1492515658, 1, 'admin', 76, '-', '-', 'Element management'),
	(753, 1492515667, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(754, 1492515677, 1, 'admin', 76, '-', '-', 'Element management'),
	(755, 1492515680, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(756, 1492515719, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(757, 1492515719, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(758, 1492515939, 1, 'admin', 20, '6', 'registration', 'Saving template'),
	(759, 1492515939, 1, 'admin', 76, '-', '-', 'Element management'),
	(760, 1492515967, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(761, 1492515978, 1, 'admin', 20, '6', 'registration', 'Saving template'),
	(762, 1492515978, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(763, 1492516045, 1, 'admin', 20, '6', 'registration', 'Saving template'),
	(764, 1492516045, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(765, 1492516076, 1, 'admin', 20, '6', 'registration', 'Saving template'),
	(766, 1492516076, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(767, 1492516202, 1, 'admin', 20, '6', 'registration', 'Saving template'),
	(768, 1492516202, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(769, 1492516259, 1, 'admin', 20, '6', 'registration', 'Saving template'),
	(770, 1492516259, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(771, 1492516496, 1, 'admin', 20, '6', 'registration', 'Saving template'),
	(772, 1492516496, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(773, 1492539420, 1, 'admin', 76, '-', '-', 'Element management'),
	(774, 1492539425, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(775, 1492539441, 1, 'admin', 76, '-', '-', 'Element management'),
	(776, 1492539457, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(777, 1492539473, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(778, 1492539492, 1, 'admin', 76, '-', '-', 'Element management'),
	(779, 1492539508, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(780, 1492540096, 1, 'admin', 20, '6', 'registration', 'Saving template'),
	(781, 1492540096, 1, 'admin', 76, '-', '-', 'Element management'),
	(782, 1492540819, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(783, 1492541391, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(784, 1492541391, 1, 'admin', 76, '-', '-', 'Element management'),
	(785, 1492541438, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(786, 1492541485, 1, 'admin', 76, '-', '-', 'Element management'),
	(787, 1492541493, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(788, 1492541599, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(789, 1492541599, 1, 'admin', 76, '-', '-', 'Element management'),
	(790, 1492541602, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(791, 1492541724, 1, 'admin', 20, '6', 'registration', 'Saving template'),
	(792, 1492541724, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(793, 1492541817, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(794, 1492541818, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(795, 1492542221, 1, 'admin', 301, '3', 'Индексировать страницу', 'Edit Template Variable'),
	(796, 1492542226, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(797, 1492542241, 1, 'admin', 20, '6', 'registration', 'Saving template'),
	(798, 1492542241, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(799, 1492542388, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(800, 1492542388, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(801, 1492581179, 1, 'admin', 76, '-', '-', 'Element management'),
	(802, 1492581186, 1, 'admin', 76, '-', '-', 'Element management'),
	(803, 1492581224, 1, 'admin', 22, '5', 'DocLister', 'Editing Snippet'),
	(804, 1492581243, 1, 'admin', 76, '-', '-', 'Element management'),
	(805, 1492581248, 1, 'admin', 23, '-', 'Новый сниппет', 'Creating a new Snippet'),
	(806, 1492581276, 1, 'admin', 76, '-', '-', 'Element management'),
	(807, 1492581286, 1, 'admin', 22, '12', 'loginza', 'Editing Snippet'),
	(808, 1492589332, 1, 'admin', 75, '-', '-', 'User/ role management'),
	(809, 1492589335, 1, 'admin', 99, '-', '-', 'Manage Web Users'),
	(810, 1492589351, 1, 'admin', 88, '1', '109141084637326271700@plus.google.com', 'Editing web user'),
	(811, 1492589361, 1, 'admin', 99, '-', '-', 'Manage Web Users'),
	(812, 1492591022, 1, 'admin', 87, '-', 'Новый веб-пользователь', 'Create new web user'),
	(813, 1492591177, 1, 'admin', 89, '-', 'igor', 'Saving web user'),
	(814, 1492591190, 1, 'admin', 99, '-', '-', 'Manage Web Users'),
	(815, 1492592544, 1, 'admin', 99, '-', '-', 'Manage Web Users'),
	(816, 1492592560, 1, 'admin', 76, '-', '-', 'Element management'),
	(817, 1492592593, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(818, 1492592617, 1, 'admin', 76, '-', '-', 'Element management'),
	(819, 1492592624, 1, 'admin', 22, '6', 'eForm', 'Editing Snippet'),
	(820, 1492592700, 1, 'admin', 76, '-', '-', 'Element management'),
	(821, 1492592716, 1, 'admin', 22, '14', 'WebLogin', 'Editing Snippet'),
	(822, 1492592735, 1, 'admin', 76, '-', '-', 'Element management'),
	(823, 1492592741, 1, 'admin', 23, '-', 'Новый сниппет', 'Creating a new Snippet'),
	(824, 1492592948, 1, 'admin', 24, '-', 'exist_orAdd_user', 'Saving Snippet'),
	(825, 1492592948, 1, 'admin', 76, '-', '-', 'Element management'),
	(826, 1492592960, 1, 'admin', 22, '16', 'exist_orAdd_user', 'Editing Snippet'),
	(827, 1492592983, 1, 'admin', 76, '-', '-', 'Element management'),
	(828, 1492592989, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(829, 1492593004, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(830, 1492593004, 1, 'admin', 76, '-', '-', 'Element management'),
	(831, 1492593040, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(832, 1492593054, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(833, 1492593054, 1, 'admin', 76, '-', '-', 'Element management'),
	(834, 1492593346, 1, 'admin', 76, '-', '-', 'Element management'),
	(835, 1492593365, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(836, 1492593478, 1, 'admin', 76, '-', '-', 'Element management'),
	(837, 1492593491, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(838, 1492593499, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(839, 1492593614, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(840, 1492593614, 1, 'admin', 76, '-', '-', 'Element management'),
	(841, 1492593618, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(842, 1492593668, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(843, 1492593668, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(844, 1492595311, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(845, 1492595379, 1, 'admin', 76, '-', '-', 'Element management'),
	(846, 1492595393, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(847, 1492595425, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(848, 1492595425, 1, 'admin', 76, '-', '-', 'Element management'),
	(849, 1492595452, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
	(850, 1492595463, 1, 'admin', 76, '-', '-', 'Element management'),
	(851, 1492595472, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(852, 1492676084, 1, 'admin', 99, '-', '-', 'Manage Web Users'),
	(853, 1492676103, 1, 'admin', 76, '-', '-', 'Element management'),
	(854, 1492676150, 1, 'admin', 99, '-', '-', 'Manage Web Users'),
	(855, 1492676242, 1, 'admin', 76, '-', '-', 'Element management'),
	(856, 1492676256, 1, 'admin', 22, '16', 'exist_orAdd_user', 'Editing Snippet'),
	(857, 1492676392, 1, 'admin', 24, '16', 'exist_orAdd_user', 'Saving Snippet'),
	(858, 1492676392, 1, 'admin', 76, '-', '-', 'Element management'),
	(859, 1492676398, 1, 'admin', 22, '6', 'eForm', 'Editing Snippet'),
	(860, 1492676556, 1, 'admin', 76, '-', '-', 'Element management'),
	(861, 1492680347, 1, 'admin', 76, '-', '-', 'Element management'),
	(862, 1492680348, 1, 'admin', 76, '-', '-', 'Element management'),
	(863, 1492680354, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(864, 1492680391, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(865, 1492680397, 1, 'admin', 76, '-', '-', 'Element management'),
	(866, 1492680403, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(867, 1492680482, 1, 'admin', 76, '-', '-', 'Element management'),
	(868, 1492681790, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(869, 1492681898, 1, 'admin', 20, '6', 'registration', 'Saving template'),
	(870, 1492681898, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(871, 1492681975, 1, 'admin', 20, '6', 'registration', 'Saving template'),
	(872, 1492681976, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(873, 1492683199, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(874, 1492683208, 1, 'admin', 76, '-', '-', 'Element management'),
	(875, 1492683221, 1, 'admin', 78, '5', 'header', 'Editing Chunk (HTML Snippet)'),
	(876, 1492683275, 1, 'admin', 76, '-', '-', 'Element management'),
	(877, 1492683279, 1, 'admin', 78, '4', 'footer', 'Editing Chunk (HTML Snippet)'),
	(878, 1492683377, 1, 'admin', 79, '4', 'footer', 'Saving Chunk (HTML Snippet)'),
	(879, 1492683377, 1, 'admin', 76, '-', '-', 'Element management'),
	(880, 1492683514, 1, 'admin', 78, '4', 'footer', 'Editing Chunk (HTML Snippet)'),
	(881, 1492683527, 1, 'admin', 79, '4', 'footer', 'Saving Chunk (HTML Snippet)'),
	(882, 1492683528, 1, 'admin', 76, '-', '-', 'Element management'),
	(883, 1492683553, 1, 'admin', 20, '6', 'registration', 'Saving template'),
	(884, 1492683553, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(885, 1492683646, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(886, 1492683646, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(887, 1492683713, 1, 'admin', 20, '6', 'registration', 'Saving template'),
	(888, 1492683713, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(889, 1492683718, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(890, 1492683718, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(891, 1492707332, 1, 'admin', 76, '-', '-', 'Element management'),
	(892, 1492707336, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(893, 1492707353, 1, 'admin', 76, '-', '-', 'Element management'),
	(894, 1492707365, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(895, 1492707597, 1, 'admin', 20, '6', 'registration', 'Saving template'),
	(896, 1492707597, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(897, 1492707675, 1, 'admin', 20, '6', 'registration', 'Saving template'),
	(898, 1492707675, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(899, 1492708014, 1, 'admin', 20, '6', 'registration', 'Saving template'),
	(900, 1492708014, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(901, 1492708204, 1, 'admin', 20, '6', 'registration', 'Saving template'),
	(902, 1492708204, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(903, 1492708235, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(904, 1492708235, 1, 'admin', 76, '-', '-', 'Element management'),
	(905, 1492708240, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(906, 1492708321, 1, 'admin', 20, '6', 'registration', 'Saving template'),
	(907, 1492708321, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(908, 1492708420, 1, 'admin', 20, '6', 'registration', 'Saving template'),
	(909, 1492708420, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(910, 1492708463, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(911, 1492708463, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(912, 1492708560, 1, 'admin', 20, '6', 'registration', 'Saving template'),
	(913, 1492708560, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(914, 1492708562, 1, 'admin', 20, '6', 'registration', 'Saving template'),
	(915, 1492708562, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(916, 1492708578, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(917, 1492708578, 1, 'admin', 76, '-', '-', 'Element management'),
	(918, 1492708581, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(919, 1492708590, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(920, 1492708590, 1, 'admin', 76, '-', '-', 'Element management'),
	(921, 1492708708, 1, 'admin', 20, '6', 'registration', 'Saving template'),
	(922, 1492708708, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(923, 1492708712, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(924, 1492708753, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(925, 1492708754, 1, 'admin', 76, '-', '-', 'Element management'),
	(926, 1492708825, 1, 'admin', 20, '6', 'registration', 'Saving template'),
	(927, 1492708825, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(928, 1492709023, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(929, 1492709122, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(930, 1492709123, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(931, 1492710582, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(932, 1492710582, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(933, 1492714510, 1, 'admin', 20, '6', 'registration', 'Saving template'),
	(934, 1492714510, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(935, 1492714546, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(936, 1492714546, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(937, 1492714888, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(938, 1492714895, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(939, 1492714900, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(940, 1492714900, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(941, 1492715383, 1, 'admin', 20, '6', 'registration', 'Saving template'),
	(942, 1492715383, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(943, 1492715867, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(944, 1492715867, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(945, 1492715961, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(946, 1492715961, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(947, 1492716078, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(948, 1492716078, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(949, 1492716113, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(950, 1492716113, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(951, 1492716143, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(952, 1492716143, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(953, 1492716215, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(954, 1492716215, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(955, 1492716252, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(956, 1492716252, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(957, 1492716430, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(958, 1492716430, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(959, 1492716472, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(960, 1492716472, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(961, 1492716531, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(962, 1492716531, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(963, 1492716612, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(964, 1492716612, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(965, 1492716663, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(966, 1492716664, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(967, 1492717058, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(968, 1492717058, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(969, 1492717125, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(970, 1492717125, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(971, 1492717189, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(972, 1492717189, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(973, 1492717231, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(974, 1492717231, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(975, 1492717284, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(976, 1492717284, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(977, 1492717339, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(978, 1492717339, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(979, 1492717360, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(980, 1492717360, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
	(981, 1492717424, 1, 'admin', 20, '6', 'registration', 'Saving template'),
	(982, 1492717424, 1, 'admin', 16, '6', 'registration', 'Editing template'),
	(983, 1492717427, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
	(984, 1492717428, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)');
/*!40000 ALTER TABLE `modx_manager_log` ENABLE KEYS */;


-- Дамп структуры для таблица wotch.modx_manager_users
DROP TABLE IF EXISTS `modx_manager_users`;
CREATE TABLE IF NOT EXISTS `modx_manager_users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=68 COMMENT='Contains login information for backend users.';

-- Дамп данных таблицы wotch.modx_manager_users: 1 rows
/*!40000 ALTER TABLE `modx_manager_users` DISABLE KEYS */;
INSERT INTO `modx_manager_users` (`id`, `username`, `password`) VALUES
	(1, 'admin', '$P$ByDOIeYHccHhXgSGXyjcQHkO.LwqNN.');
/*!40000 ALTER TABLE `modx_manager_users` ENABLE KEYS */;


-- Дамп структуры для таблица wotch.modx_membergroup_access
DROP TABLE IF EXISTS `modx_membergroup_access`;
CREATE TABLE IF NOT EXISTS `modx_membergroup_access` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `membergroup` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.';

-- Дамп данных таблицы wotch.modx_membergroup_access: 0 rows
/*!40000 ALTER TABLE `modx_membergroup_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_membergroup_access` ENABLE KEYS */;


-- Дамп структуры для таблица wotch.modx_membergroup_names
DROP TABLE IF EXISTS `modx_membergroup_names`;
CREATE TABLE IF NOT EXISTS `modx_membergroup_names` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(245) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.';

-- Дамп данных таблицы wotch.modx_membergroup_names: 0 rows
/*!40000 ALTER TABLE `modx_membergroup_names` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_membergroup_names` ENABLE KEYS */;


-- Дамп структуры для таблица wotch.modx_member_groups
DROP TABLE IF EXISTS `modx_member_groups`;
CREATE TABLE IF NOT EXISTS `modx_member_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_group` int(10) NOT NULL DEFAULT '0',
  `member` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_group_member` (`user_group`,`member`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.';

-- Дамп данных таблицы wotch.modx_member_groups: 0 rows
/*!40000 ALTER TABLE `modx_member_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_member_groups` ENABLE KEYS */;


-- Дамп структуры для таблица wotch.modx_site_content
DROP TABLE IF EXISTS `modx_site_content`;
CREATE TABLE IF NOT EXISTS `modx_site_content` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL DEFAULT 'document',
  `contentType` varchar(50) NOT NULL DEFAULT 'text/html',
  `pagetitle` varchar(255) NOT NULL DEFAULT '',
  `longtitle` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(245) DEFAULT '',
  `link_attributes` varchar(255) NOT NULL DEFAULT '' COMMENT 'Link attriubtes',
  `published` int(1) NOT NULL DEFAULT '0',
  `pub_date` int(20) NOT NULL DEFAULT '0',
  `unpub_date` int(20) NOT NULL DEFAULT '0',
  `parent` int(10) NOT NULL DEFAULT '0',
  `isfolder` int(1) NOT NULL DEFAULT '0',
  `introtext` text COMMENT 'Used to provide quick summary of the document',
  `content` mediumtext,
  `richtext` tinyint(1) NOT NULL DEFAULT '1',
  `template` int(10) NOT NULL DEFAULT '0',
  `menuindex` int(10) NOT NULL DEFAULT '0',
  `searchable` int(1) NOT NULL DEFAULT '1',
  `cacheable` int(1) NOT NULL DEFAULT '1',
  `createdby` int(10) NOT NULL DEFAULT '0',
  `createdon` int(20) NOT NULL DEFAULT '0',
  `editedby` int(10) NOT NULL DEFAULT '0',
  `editedon` int(20) NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0',
  `deletedon` int(20) NOT NULL DEFAULT '0',
  `deletedby` int(10) NOT NULL DEFAULT '0',
  `publishedon` int(20) NOT NULL DEFAULT '0' COMMENT 'Date the document was published',
  `publishedby` int(10) NOT NULL DEFAULT '0' COMMENT 'ID of user who published the document',
  `menutitle` varchar(255) NOT NULL DEFAULT '' COMMENT 'Menu title',
  `donthit` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Disable page hit count',
  `haskeywords` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'has links to keywords',
  `hasmetatags` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'has links to meta tags',
  `privateweb` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Private web document',
  `privatemgr` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Private manager document',
  `content_dispo` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-inline, 1-attachment',
  `hidemenu` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Hide document from menu',
  `alias_visible` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `aliasidx` (`alias`),
  KEY `id` (`id`),
  KEY `parent` (`parent`),
  KEY `typeidx` (`type`),
  FULLTEXT KEY `content_ft_idx` (`pagetitle`,`description`,`content`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=92 COMMENT='Contains the site document tree.';

-- Дамп данных таблицы wotch.modx_site_content: 3 rows
/*!40000 ALTER TABLE `modx_site_content` DISABLE KEYS */;
INSERT INTO `modx_site_content` (`id`, `type`, `contentType`, `pagetitle`, `longtitle`, `description`, `alias`, `link_attributes`, `published`, `pub_date`, `unpub_date`, `parent`, `isfolder`, `introtext`, `content`, `richtext`, `template`, `menuindex`, `searchable`, `cacheable`, `createdby`, `createdon`, `editedby`, `editedon`, `deleted`, `deletedon`, `deletedby`, `publishedon`, `publishedby`, `menutitle`, `donthit`, `haskeywords`, `hasmetatags`, `privateweb`, `privatemgr`, `content_dispo`, `hidemenu`, `alias_visible`) VALUES
	(1, 'document', 'text/html', 'Home', '', '', 'index', '', 1, 0, 0, 0, 1, '', '<p>Главной особенностью сайта является возможность следить за товаром пока вы заняты. Мы предоставляем вам возможность установить надзирателя за товаром (или группой товаров). Особенностью является <span id="orfo-misgrammed-1" class="orfo-misgrammed">то</span> что вам не нужно заходить на страницу товара и смотреть не упала на него ли цена, а просто ждать оповещения от нас на вашу почту. Но это еще не всё<span id="orfo-misgrammed-2" class="orfo-misgrammed">!. </span>Вы так же можете написать название товара и желаемую сумму, а мы вас <span id="orfo-misgrammed-3" class="orfo-misgrammed">предупредим</span> когда такой товар появиться.</p>', 1, 3, 0, 1, 1, 1, 1130304721, 1, 1492325760, 0, 0, 0, 1130304721, 1, '', 0, 0, 0, 0, 0, 0, 0, 1),
	(4, 'document', 'text/html', 'Вход', '', '', 'login', 'login', 1, 0, 0, 0, 0, '', '', 1, 5, 1, 1, 1, 1, 1492328160, 1, 1492328177, 0, 0, 0, 1492328160, 1, '', 0, 0, 0, 0, 0, 0, 0, 1),
	(5, 'document', 'text/html', 'Регистрация', '', '', 'registration', '', 1, 0, 0, 0, 0, '', '', 1, 6, 2, 1, 1, 1, 1492511052, 1, 1492511052, 0, 0, 0, 1492511052, 1, '', 0, 0, 0, 0, 0, 0, 0, 1);
/*!40000 ALTER TABLE `modx_site_content` ENABLE KEYS */;


-- Дамп структуры для таблица wotch.modx_site_content_metatags
DROP TABLE IF EXISTS `modx_site_content_metatags`;
CREATE TABLE IF NOT EXISTS `modx_site_content_metatags` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `metatag_id` int(11) NOT NULL DEFAULT '0',
  KEY `content_id` (`content_id`),
  KEY `metatag_id` (`metatag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Reference table between meta tags and content';

-- Дамп данных таблицы wotch.modx_site_content_metatags: 0 rows
/*!40000 ALTER TABLE `modx_site_content_metatags` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_site_content_metatags` ENABLE KEYS */;


-- Дамп структуры для таблица wotch.modx_site_htmlsnippets
DROP TABLE IF EXISTS `modx_site_htmlsnippets`;
CREATE TABLE IF NOT EXISTS `modx_site_htmlsnippets` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Chunk',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `editor_name` varchar(50) NOT NULL DEFAULT 'none',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `snippet` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=645 COMMENT='Contains the site chunks.';

-- Дамп данных таблицы wotch.modx_site_htmlsnippets: 8 rows
/*!40000 ALTER TABLE `modx_site_htmlsnippets` DISABLE KEYS */;
INSERT INTO `modx_site_htmlsnippets` (`id`, `name`, `description`, `editor_type`, `editor_name`, `category`, `cache_type`, `snippet`, `locked`) VALUES
	(1, 'eFeedbackForm', 'eFeedbackForm Шаблон формы обратной связи', 0, 'none', 3, 0, '<p><span style="color:#900;">[+validationmessage+]</span></p>\r\n\r\n<form  class="eform" method="post" action="[~[*id*]~]">\r\n\r\n<input type="hidden" name="formid" value="feedbackForm" />\r\n<input value="" name="special" class="special" type="text" eform="Спец:date:0"  style="display:none;" />\r\n<p>\r\n    <input type="text" name="name" id="name" class="grid_3" value=""  eform="Имя:string:1"/>\r\n    <label for="name">Ваше имя</label>\r\n</p>\r\n            \r\n<p>\r\n    <input type="text" name="email" id="email" class="grid_3" value="" eform="E-mail:email:1" />\r\n    <label for="email">Ваш E-mail</label>\r\n</p>\r\n            \r\n<p>\r\n    <input type="text" name="phone" id="subject" class="grid_3" value="" eform="Номер телефона:string:1"/>\r\n    <label for="subject">Номер телефона</label>\r\n</p>\r\n            \r\n<p>\r\n    <textarea name="comments" id="message" class="grid_6" cols="50" rows="10" eform="Текст сообщения:string:1"></textarea>\r\n</p>\r\n<p>Введите код с картинки: <br />\r\n    <input type="text" class="ver" name="vericode" /><img class="feed" src="[+verimageurl+]" alt="Введите код" />\r\n</p>            \r\n<p>\r\n    <input type="submit" name="submit" class="subeform grid_2" value="Отправить сообщение"/>\r\n </p>\r\n\r\n</form>\r\n\r\n\r\n \r\n\r\n', 0),
	(2, 'eFeedbackReport', 'eFeedbackReport  шаблон отправки на почту', 0, 'none', 3, 0, '<p>Прислано человеком, с именем: [+name+] . Подробности ниже:</p>\r\n<table>\r\n<tr valign="top"><td>Имя:</td><td>[+name+]</td></tr>\r\n<tr valign="top"><td>E-mail:</td><td>[+email+]</td></tr>\r\n<tr valign="top"><td>Номер телефона:</td><td>[+phone+]</td></tr>\r\n<tr valign="top"><td>Текст сообщения:</td><td>[+comments+]</td></tr>\r\n</table>\r\n<p>Можно использовать ссылку для ответа: <a href="mailto:[+email+]?subject=RE:[+subject+]">[+email+]</a></p>\r\n\r\n', 0),
	(3, 'feedback', 'форма обратной связи', 0, 'none', 3, 0, '[!eForm? &formid=`feedbackForm` &subject=`Сообщение с сайта` &tpl=`eFeedbackForm` &report=`eFeedbackReport` &gotoid=`[*id*]` &vericode=`1` !] \r\n\r\n', 0),
	(4, 'footer', 'низ сайта', 2, 'none', 4, 0, '<footer class="page-footer orange">\r\n    <div class="container">\r\n      <div class="row">\r\n        <div class="col l6 s12">\r\n          <h5 class="white-text">Поддержка сайта</h5>\r\n          <p class="grey-text text-lighten-4">2017</p>\r\n        </div>\r\n        <div class="col l3 s12">\r\n          <h5 class="white-text">Капков Илья</h5>\r\n          <ul>\r\n            <li><p class="grey-text text-lighten-4">Главный программист по обработке содержимого поддерживаемых сервисов</p></li>\r\n          </ul>\r\n        </div>\r\n        <div class="col l3 s12">\r\n          <h5 class="white-text">Диденко Игорь</h5>\r\n          <ul>\r\n            <li><p class="grey-text text-lighten-4">Гланый программист по герерации запросов к поддерживаемым сервисам</p></li>\r\n          </ul>\r\n        </div>\r\n      </div>\r\n    </div>\r\n    <div class="footer-copyright">\r\n      <div class="container">\r\n      Курсовая работа 2017\r\n      </div>\r\n    </div>\r\n  </footer>\r\n\r\n\r\n  <!--  Scripts-->\r\n  <script src="/assets/js/jquery/jquery.min.js"></script>\r\n  <script src="/assets/js/wotch/materialize.js"></script>\r\n  <script src="/assets/js/wotch/init.js"></script>\r\n  <script src="/assets/js/wotch/login.js"></script>\r\n\r\n  </body>\r\n</html>', 0),
	(5, 'header', 'шапка', 2, 'none', 4, 0, '<!DOCTYPE html>\r\n	<html lang="ru">\r\n	<head>\r\n	<meta http-equiv="Content-Type" content="text/html; charset=[(modx_charset)]" /> \r\n	<title>Главная</title>\r\n	[*noIndex*]\r\n	<meta name="keywords" content="[*keyw*]" />\r\n	<meta name="description" content="[*desc*]" />\r\n	<base href="[(site_url)]"/>\r\n	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">\r\n	<link href="/assets/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>\r\n  	<link href="/assets/css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>\r\n</head>\r\n<body>', 0),
	(6, 'mm_rules', 'Default ManagerManager rules.', 0, 'none', 5, 0, '// more example rules are in assets/plugins/managermanager/example_mm_rules.inc.php\r\n// example of how PHP is allowed - check that a TV named documentTags exists before creating rule\r\n\r\nmm_widget_showimagetvs(); // Показываем превью ТВ\r\n\r\nmm_createTab(\'Для SEO\', \'seo\', \'\', \'\', \'\', \'\');\r\nmm_moveFieldsToTab(\'titl,keyw,desc,seoOverride,noIndex,sitemap_changefreq,sitemap_priority,sitemap_exclude\', \'seo\', \'\', \'\');\r\nmm_widget_tags(\'keyw\',\',\'); // Give blog tag editing capabilities to the \'documentTags (3)\' TV\r\n\r\n\r\n//mm_createTab(\'Изображения\', \'photos\', \'\', \'\', \'\', \'850\');\r\n//mm_moveFieldsToTab(\'images,photos\', \'photos\', \'\', \'\');\r\n\r\n//mm_hideFields(\'longtitle,description,link_attributes,menutitle,content\', \'\', \'6,7\');\r\n\r\n//mm_hideTemplates(\'0,5,8,9,11,12\', \'2,3\');\r\n\r\n//mm_hideTabs(\'settings, access\', \'2\');\r\n\r\n//mm_widget_evogallery(1, Галерея, \'1,2,3\', 3);   // подключаем галерею \r\n//mm_galleryLink($fields, $roles, $templates, $moduleid);\r\n//mm_widget_evogallery($moduleid, $title, $roles, $templates);\r\n', 0),
	(7, 'NAV', 'навбар', 2, 'none', 0, 0, '<nav class="light-blue lighten-1" role="navigation">\r\n    <div class="nav-wrapper container"><a id="logo-container" href="#" class="brand-logo"><img src="/assets/images/logo2.png"></a>\r\n      <ul class="right hide-on-med-and-down">\r\n        <li><a href="[(site_url)]">Главная</a></li>\r\n        <li><a href="#">Надзератель</a></li>\r\n        <li><a href="#">Принцип работы</a></li>\r\n        <li><a href="#">О нас</a></li>\r\n        <li><a class="waves-effect waves-light btn light-green" href="[(site_url)]login.html">Вход</a></li>\r\n      </ul>\r\n\r\n      <ul id="nav-mobile" class="side-nav">\r\n		<li><a href="[(site_url)]">Главная</a></li>\r\n        <li><a href="#">Надзератель</a></li>\r\n        <li><a href="#">Принцип работы</a></li>\r\n        <li><a href="#">О нас</a></li>\r\n        <li><a class="waves-effect waves-light btn light-green" href="[(site_url)]login.html">Вход</a></li>\r\n      </ul>\r\n      <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>\r\n    </div>\r\n</nav>', 0),
	(8, 'exist_login', 'Проверка существования логина emaila', 2, 'none', 0, 0, '<script>\r\n	\r\n	$(document).ready(function(){\r\n        $("#password1").pwdMeter();\r\n    });\r\n	\r\n	$(document).ready(function(){\r\n        $("#password2").pwdCompare();\r\n    });\r\n	\r\n	$(\'#email\').focusout(function() {\r\n		$.post(\r\n		  "/exist_login.php",\r\n		  {\r\n			email: $(\'#email\').val()\r\n		  },\r\n		  onAjaxSuccess\r\n		);\r\n	});\r\n	\r\n	function onAjaxSuccess(data) {\r\n		\r\n		// Здесь мы получаем данные, отправленные сервером.\r\n		if(data == \'yes\') {\r\n			document.getElementById(\'emailex\').style.visibility = "hidden";\r\n		}\r\n		else if(data == \'no\'){\r\n			document.getElementById(\'emailex\').style.visibility = "visible";\r\n		}\r\n	}\r\n	\r\n	$(\'#password1\').focusout(function() {\r\n		\r\n		if($(\'#password1\').val() == \'\') {\r\n			document.getElementById(\'pwdMeter\').style.visibility = "hidden";\r\n			$(\'#pwdMeter\').text(\'\');\r\n		}\r\n	});\r\n	\r\n	$(\'#password1\').focusin(function() {\r\n		document.getElementById(\'pwdMeter\').style.visibility = "visible";\r\n	});\r\n	\r\n	$(\'#password2\').focusout(function() {\r\n		\r\n		if($(\'#password2\').val() == \'\') {\r\n			document.getElementById(\'pwdCompare\').style.visibility = "hidden";\r\n			$(\'#pwdCompare\').text(\'\');\r\n		}\r\n	});\r\n	\r\n	$(\'#password2\').focusin(function() {\r\n		document.getElementById(\'pwdCompare\').style.visibility = "visible";\r\n	});\r\n	\r\n</script>', 0);
/*!40000 ALTER TABLE `modx_site_htmlsnippets` ENABLE KEYS */;


-- Дамп структуры для таблица wotch.modx_site_keywords
DROP TABLE IF EXISTS `modx_site_keywords`;
CREATE TABLE IF NOT EXISTS `modx_site_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `keyword` (`keyword`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Site keyword list';

-- Дамп данных таблицы wotch.modx_site_keywords: 0 rows
/*!40000 ALTER TABLE `modx_site_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_site_keywords` ENABLE KEYS */;


-- Дамп структуры для таблица wotch.modx_site_metatags
DROP TABLE IF EXISTS `modx_site_metatags`;
CREATE TABLE IF NOT EXISTS `modx_site_metatags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `tag` varchar(50) NOT NULL DEFAULT '' COMMENT 'tag name',
  `tagvalue` varchar(255) NOT NULL DEFAULT '',
  `http_equiv` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1 - use http_equiv tag style, 0 - use name',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Site meta tags';

-- Дамп данных таблицы wotch.modx_site_metatags: 0 rows
/*!40000 ALTER TABLE `modx_site_metatags` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_site_metatags` ENABLE KEYS */;


-- Дамп структуры для таблица wotch.modx_site_modules
DROP TABLE IF EXISTS `modx_site_modules`;
CREATE TABLE IF NOT EXISTS `modx_site_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '0',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `disabled` tinyint(4) NOT NULL DEFAULT '0',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `wrap` tinyint(4) NOT NULL DEFAULT '0',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT 'url to module icon',
  `enable_resource` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'enables the resource file feature',
  `resourcefile` varchar(255) NOT NULL DEFAULT '' COMMENT 'a physical link to a resource file',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  `guid` varchar(32) NOT NULL DEFAULT '' COMMENT 'globally unique identifier',
  `enable_sharedparams` tinyint(4) NOT NULL DEFAULT '0',
  `properties` text,
  `modulecode` mediumtext COMMENT 'module boot up code',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1068 COMMENT='Site Modules';

-- Дамп данных таблицы wotch.modx_site_modules: 2 rows
/*!40000 ALTER TABLE `modx_site_modules` DISABLE KEYS */;
INSERT INTO `modx_site_modules` (`id`, `name`, `description`, `editor_type`, `disabled`, `category`, `wrap`, `locked`, `icon`, `enable_resource`, `resourcefile`, `createdon`, `editedon`, `guid`, `enable_sharedparams`, `properties`, `modulecode`) VALUES
	(1, 'Doc Manager', '<strong>1.1</strong> Quickly perform bulk updates to the Documents in your site including templates, publishing details, and permissions', 0, 0, 6, 0, 0, '', 0, '', 0, 0, 'docman435243542tf542t5t', 1, '', ' \n/**\n * Doc Manager\n * \n * Quickly perform bulk updates to the Documents in your site including templates, publishing details, and permissions\n * \n * @category	module\n * @version 	1.1\n * @license 	http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)\n * @internal	@properties\n * @internal	@guid docman435243542tf542t5t	\n * @internal	@shareparams 1\n * @internal	@dependencies requires files located at /assets/modules/docmanager/\n * @internal	@modx_category Manager and Admin\n * @internal    @installset base, sample\n * @lastupdate  09/04/2016\n */\n\ninclude_once(MODX_BASE_PATH.\'assets/modules/docmanager/classes/docmanager.class.php\');\ninclude_once(MODX_BASE_PATH.\'assets/modules/docmanager/classes/dm_frontend.class.php\');\ninclude_once(MODX_BASE_PATH.\'assets/modules/docmanager/classes/dm_backend.class.php\');\n\n$dm = new DocManager($modx);\n$dmf = new DocManagerFrontend($dm, $modx);\n$dmb = new DocManagerBackend($dm, $modx);\n\n$dm->ph = $dm->getLang();\n$dm->ph[\'theme\'] = $dm->getTheme();\n$dm->ph[\'ajax.endpoint\'] = MODX_SITE_URL.\'assets/modules/docmanager/tv.ajax.php\';\n$dm->ph[\'datepicker.offset\'] = $modx->config[\'datepicker_offset\'];\n$dm->ph[\'datetime.format\'] = $modx->config[\'datetime_format\'];\n\nif (isset($_POST[\'tabAction\'])) {\n    $dmb->handlePostback();\n} else {\n    $dmf->getViews();\n    echo $dm->parseTemplate(\'main.tpl\', $dm->ph);\n}'),
	(2, 'Extras', '<strong>0.1.3</strong> first repository for MODX EVO', 0, 0, 6, 0, 0, '', 0, '', 0, 0, 'store435243542tf542t5t', 1, '', ' \r\n/**\r\n * Extras\r\n * \r\n * first repository for MODX EVO\r\n * \r\n * @category	module\r\n * @version 	0.1.3\r\n * @internal	@properties\r\n * @internal	@guid store435243542tf542t5t	\r\n * @internal	@shareparams 1\r\n * @internal	@dependencies requires files located at /assets/modules/store/\r\n * @internal	@modx_category Manager and Admin\r\n * @internal    @installset base, sample\r\n * @lastupdate  25/11/2016\r\n */\r\n\r\n//AUTHORS: Bumkaka & Dmi3yy \r\ninclude_once(\'../assets/modules/store/core.php\');');
/*!40000 ALTER TABLE `modx_site_modules` ENABLE KEYS */;


-- Дамп структуры для таблица wotch.modx_site_module_access
DROP TABLE IF EXISTS `modx_site_module_access`;
CREATE TABLE IF NOT EXISTS `modx_site_module_access` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` int(11) NOT NULL DEFAULT '0',
  `usergroup` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Module users group access permission';

-- Дамп данных таблицы wotch.modx_site_module_access: 0 rows
/*!40000 ALTER TABLE `modx_site_module_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_site_module_access` ENABLE KEYS */;


-- Дамп структуры для таблица wotch.modx_site_module_depobj
DROP TABLE IF EXISTS `modx_site_module_depobj`;
CREATE TABLE IF NOT EXISTS `modx_site_module_depobj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` int(11) NOT NULL DEFAULT '0',
  `resource` int(11) NOT NULL DEFAULT '0',
  `type` int(2) NOT NULL DEFAULT '0' COMMENT '10-chunks, 20-docs, 30-plugins, 40-snips, 50-tpls, 60-tvs',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Module Dependencies';

-- Дамп данных таблицы wotch.modx_site_module_depobj: 0 rows
/*!40000 ALTER TABLE `modx_site_module_depobj` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_site_module_depobj` ENABLE KEYS */;


-- Дамп структуры для таблица wotch.modx_site_plugins
DROP TABLE IF EXISTS `modx_site_plugins`;
CREATE TABLE IF NOT EXISTS `modx_site_plugins` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Plugin',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `plugincode` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `properties` text COMMENT 'Default Properties',
  `disabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Disables the plugin',
  `moduleguid` varchar(32) NOT NULL DEFAULT '' COMMENT 'GUID of module from which to import shared parameters',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1459 COMMENT='Contains the site plugins.';

-- Дамп данных таблицы wotch.modx_site_plugins: 8 rows
/*!40000 ALTER TABLE `modx_site_plugins` DISABLE KEYS */;
INSERT INTO `modx_site_plugins` (`id`, `name`, `description`, `editor_type`, `category`, `cache_type`, `plugincode`, `locked`, `properties`, `disabled`, `moduleguid`) VALUES
	(1, 'CodeMirror', '<strong>1.4</strong> JavaScript library that can be used to create a relatively pleasant editor interface based on CodeMirror 5.12', 0, 6, 0, '\r\n/**\r\n * CodeMirror\r\n *\r\n * JavaScript library that can be used to create a relatively pleasant editor interface based on CodeMirror 5.12\r\n *\r\n * @category    plugin\r\n * @version     1.4\r\n * @license     http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)\r\n * @package     modx\r\n * @internal    @events OnDocFormRender,OnChunkFormRender,OnModFormRender,OnPluginFormRender,OnSnipFormRender,OnTempFormRender,OnRichTextEditorInit\r\n * @internal    @modx_category Manager and Admin\r\n * @internal    @properties &theme=Theme;list;default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light;default &indentUnit=Indent unit;int;4 &tabSize=The width of a tab character;int;4 &lineWrapping=lineWrapping;list;true,false;true &matchBrackets=matchBrackets;list;true,false;true &activeLine=activeLine;list;true,false;false &emmet=emmet;list;true,false;true &search=search;list;true,false;false &indentWithTabs=indentWithTabs;list;true,false;true &undoDepth=undoDepth;int;200 &historyEventDelay=historyEventDelay;int;1250\r\n * @internal    @installset base\r\n * @reportissues https://github.com/modxcms/evolution\r\n * @documentation Official docs https://codemirror.net/doc/manual.html\r\n * @author      hansek from http://www.modxcms.cz\r\n * @author      update Mihanik71\r\n * @author      update Deesen\r\n * @lastupdate  11/04/2016\r\n */\r\n\r\n$_CM_BASE = \'assets/plugins/codemirror/\';\r\n\r\n$_CM_URL = $modx->config[\'site_url\'] . $_CM_BASE;\r\n\r\nrequire(MODX_BASE_PATH. $_CM_BASE .\'codemirror.plugin.php\');', 0, '&theme=Theme;list;default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light;default &indentUnit=Indent unit;int;4 &tabSize=The width of a tab character;int;4 &lineWrapping=lineWrapping;list;true,false;true &matchBrackets=matchBrackets;list;true,false;true &activeLine=activeLine;list;true,false;false &emmet=emmet;list;true,false;true &search=search;list;true,false;false &indentWithTabs=indentWithTabs;list;true,false;true &undoDepth=undoDepth;int;200 &historyEventDelay=historyEventDelay;int;1250', 0, ''),
	(2, 'ElementsInTree', '<strong>1.5.7</strong> Get access to all Elements and Modules inside Manager sidebar', 0, 6, 0, 'require MODX_BASE_PATH.\'assets/plugins/elementsintree/plugin.elementsintree.php\';\n', 0, '&tabTreeTitle=Tree Tab Title;text;Site Tree;;Custom title of Site Tree tab. &useIcons=Use icons in tabs;list;yes,no;yes;;Icons available in MODX version 1.2 or newer. &treeButtonsInTab=Tree Buttons in tab;list;yes,no;yes;;Move Tree Buttons into Site Tree tab. &unifyFrames=Unify Frames;list;yes,no;yes;;Unify Tree and Main frame style. Right now supports MODxRE2 theme only.', 1, ''),
	(3, 'FileSource', '<strong>0.1</strong> Save snippet and plugins to file', 0, 6, 0, 'require MODX_BASE_PATH.\'assets/plugins/filesource/plugin.filesource.php\';', 0, '', 0, ''),
	(4, 'Forgot Manager Login', '<strong>1.1.6</strong> Resets your manager login when you forget your password via email confirmation', 0, 6, 0, 'require MODX_BASE_PATH.\'assets/plugins/forgotmanagerlogin/plugin.forgotmanagerlogin.php\';', 0, '', 0, ''),
	(5, 'ManagerManager', '<strong>0.6.2</strong> Customize the MODX Manager to offer bespoke admin functions for end users or manipulate the display of document fields in the manager.', 0, 6, 0, '\n/**\n * ManagerManager\n *\n * Customize the MODX Manager to offer bespoke admin functions for end users or manipulate the display of document fields in the manager.\n *\n * @category plugin\n * @version 0.6.2\n * @license http://creativecommons.org/licenses/GPL/2.0/ GNU Public License (GPL v2)\n * @internal @properties &remove_deprecated_tv_types_pref=Remove deprecated TV types;list;yes,no;yes &config_chunk=Configuration Chunk;text;mm_rules\n * @internal @events OnDocFormRender,OnDocFormPrerender,OnBeforeDocFormSave,OnDocFormSave,OnDocDuplicate,OnPluginFormRender,OnTVFormRender\n * @internal @modx_category Manager and Admin\n * @internal @installset base\n * @internal @legacy_names Image TV Preview, Show Image TVs\n * @reportissues https://github.com/DivanDesign/MODXEvo.plugin.ManagerManager/\n * @documentation README [+site_url+]assets/plugins/managermanager/readme.html\n * @documentation Official docs http://code.divandesign.biz/modx/managermanager\n * @link        Latest version http://code.divandesign.biz/modx/managermanager\n * @link        Additional tools http://code.divandesign.biz/modx\n * @link        Full changelog http://code.divandesign.biz/modx/managermanager/changelog\n * @author      Inspired by: HideEditor plugin by Timon Reinhard and Gildas; HideManagerFields by Brett @ The Man Can!\n * @author      DivanDesign studio http://www.DivanDesign.biz\n * @author      Nick Crossland http://www.rckt.co.uk\n * @author      Many others\n * @lastupdate  06/03/2016\n */\n\n// Run the main code\ninclude($modx->config[\'base_path\'].\'assets/plugins/managermanager/mm.inc.php\');', 0, '&remove_deprecated_tv_types_pref=Remove deprecated TV types;list;yes,no;yes &config_chunk=Configuration Chunk;text;mm_rules', 0, ''),
	(6, 'Quick Manager+', '<strong>1.5.6</strong> Enables QuickManager+ front end content editing support', 0, 6, 0, '\n/**\n * Quick Manager+\n * \n * Enables QuickManager+ front end content editing support\n *\n * @category 	plugin\n * @version 	1.5.6\n * @license 	http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL v3)\n * @internal    @properties &jqpath=Path to jQuery;text;assets/js/jquery.min.js &loadmanagerjq=Load jQuery in manager;list;true,false;false &loadfrontendjq=Load jQuery in front-end;list;true,false;true &noconflictjq=jQuery noConflict mode in front-end;list;true,false;true &loadtb=Load modal box in front-end;list;true,false;true &tbwidth=Modal box window width;text;80% &tbheight=Modal box window height;text;90% &hidefields=Hide document fields from front-end editors;text;parent &hidetabs=Hide document tabs from front-end editors;text; &hidesections=Hide document sections from front-end editors;text; &addbutton=Show add document here button;list;true,false;true &tpltype=New document template type;list;parent,id,selected;parent &tplid=New document template id;int;3 &custombutton=Custom buttons;textarea; &managerbutton=Show go to manager button;list;true,false;true &logout=Logout to;list;manager,front-end;manager &disabled=Plugin disabled on documents;text; &autohide=Autohide toolbar;list;true,false;true &editbuttons=Inline edit buttons;list;true,false;false &editbclass=Edit button CSS class;text;qm-edit &newbuttons=Inline new resource buttons;list;true,false;false &newbclass=New resource button CSS class;text;qm-new &tvbuttons=Inline template variable buttons;list;true,false;false &tvbclass=Template variable button CSS class;text;qm-tv\n * @internal	@events OnParseDocument,OnWebPagePrerender,OnDocFormPrerender,OnDocFormSave,OnManagerLogout \n * @internal	@modx_category Manager and Admin\n * @internal    @legacy_names QM+,QuickEdit\n * @internal    @installset base, sample\n * @internal    @disabled 1\n * @reportissues https://github.com/modxcms/evolution\n * @documentation Official docs [+site_url+]assets/plugins/qm/readme.html\n * @link        http://www.maagit.fi/modx/quickmanager-plus\n * @author      Mikko Lammi\n * @author      Since 2011: yama, dmi3yy, segr\n * @lastupdate  31/03/2014\n */\n\n// In manager\nif (!$modx->checkSession()) return;\n\n$show = TRUE;\n\nif ($disabled  != \'\') {\n    $arr = array_filter(array_map(\'intval\', explode(\',\', $disabled)));\n    if (in_array($modx->documentIdentifier, $arr)) {\n        $show = FALSE;\n    }\n}\n\nif ($show) {\n    // Replace [*#tv*] with QM+ edit TV button placeholders\n    if ($tvbuttons == \'true\') {\n        if ($modx->event->name == \'OnParseDocument\') {\n             $output = &$modx->documentOutput;\n             $output = preg_replace(\'~\\[\\*#(.*?)\\*\\]~\', \'<!-- \'.$tvbclass.\' $1 -->[*$1*]\', $output);\n             $modx->documentOutput = $output;\n         }\n     }\n    include_once($modx->config[\'base_path\'].\'assets/plugins/qm/qm.inc.php\');\n    $qm = new Qm($modx, $jqpath, $loadmanagerjq, $loadfrontendjq, $noconflictjq, $loadtb, $tbwidth, $tbheight, $hidefields, $hidetabs, $hidesections, $addbutton, $tpltype, $tplid, $custombutton, $managerbutton, $logout, $autohide, $editbuttons, $editbclass, $newbuttons, $newbclass, $tvbuttons, $tvbclass);\n}\n', 0, '&jqpath=Path to jQuery;text;assets/js/jquery.min.js &loadmanagerjq=Load jQuery in manager;list;true,false;false &loadfrontendjq=Load jQuery in front-end;list;true,false;true &noconflictjq=jQuery noConflict mode in front-end;list;true,false;true &loadtb=Load modal box in front-end;list;true,false;true &tbwidth=Modal box window width;text;80% &tbheight=Modal box window height;text;90% &hidefields=Hide document fields from front-end editors;text;parent &hidetabs=Hide document tabs from front-end editors;text; &hidesections=Hide document sections from front-end editors;text; &addbutton=Show add document here button;list;true,false;true &tpltype=New document template type;list;parent,id,selected;parent &tplid=New document template id;int;3 &custombutton=Custom buttons;textarea; &managerbutton=Show go to manager button;list;true,false;true &logout=Logout to;list;manager,front-end;manager &disabled=Plugin disabled on documents;text; &autohide=Autohide toolbar;list;true,false;true &editbuttons=Inline edit buttons;list;true,false;false &editbclass=Edit button CSS class;text;qm-edit &newbuttons=Inline new resource buttons;list;true,false;false &newbclass=New resource button CSS class;text;qm-new &tvbuttons=Inline template variable buttons;list;true,false;false &tvbclass=Template variable button CSS class;text;qm-tv', 1, ''),
	(7, 'TinyMCE4', '<strong>4.3.7.2</strong> Javascript WYSIWYG editor', 0, 6, 0, 'require MODX_BASE_PATH.\'assets/plugins/tinymce4/plugin.tinymce.php\';', 0, '&styleFormats=Custom Style Formats;textarea;Title,cssClass|Title2,cssClass &customParams=Custom Parameters <b>(Be careful or leave empty!)</b>;textarea; &entityEncoding=Entity Encoding;list;named,numeric,raw;named &entities=Entities;text; &pathOptions=Path Options;list;Site config,Absolute path,Root relative,URL,No convert;Site config &resizing=Advanced Resizing;list;true,false;false &disabledButtons=Disabled Buttons;text; &webTheme=Web Theme;test;webuser &webPlugins=Web Plugins;text; &webButtons1=Web Buttons 1;text;bold italic underline strikethrough removeformat alignleft aligncenter alignright &webButtons2=Web Buttons 2;text;link unlink image undo redo &webButtons3=Web Buttons 3;text; &webButtons4=Web Buttons 4;text; &webAlign=Web Toolbar Alignment;list;ltr,rtl;ltr &width=Width;text;100% &height=Height;text;400px &introtextRte=<b>Introtext RTE</b><br/>add richtext-features to "introtext";list;enabled,disabled;disabled &inlineMode=<b>Inline-Mode</b>;list;enabled,disabled;disabled &inlineTheme=<b>Inline-Mode</b><br/>Theme;text;inline &browser_spellcheck=<b>Browser Spellcheck</b><br/>At least one dictionary must be installed inside your browser;list;enabled,disabled;disabled', 0, ''),
	(8, 'TransAlias', '<strong>1.0.4</strong> Human readible URL translation supporting multiple languages and overrides', 0, 6, 0, 'require MODX_BASE_PATH.\'assets/plugins/transalias/plugin.transalias.php\';', 0, '&table_name=Trans table;list;common,russian,dutch,german,czech,utf8,utf8lowercase;russian &char_restrict=Restrict alias to;list;lowercase alphanumeric,alphanumeric,legal characters;lowercase alphanumeric &remove_periods=Remove Periods;list;Yes,No;No &word_separator=Word Separator;list;dash,underscore,none;dash &override_tv=Override TV name;string;', 0, '');
/*!40000 ALTER TABLE `modx_site_plugins` ENABLE KEYS */;


-- Дамп структуры для таблица wotch.modx_site_plugin_events
DROP TABLE IF EXISTS `modx_site_plugin_events`;
CREATE TABLE IF NOT EXISTS `modx_site_plugin_events` (
  `pluginid` int(10) NOT NULL,
  `evtid` int(10) NOT NULL DEFAULT '0',
  `priority` int(10) NOT NULL DEFAULT '0' COMMENT 'determines plugin run order',
  PRIMARY KEY (`pluginid`,`evtid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=13 COMMENT='Links to system events';

-- Дамп данных таблицы wotch.modx_site_plugin_events: 51 rows
/*!40000 ALTER TABLE `modx_site_plugin_events` DISABLE KEYS */;
INSERT INTO `modx_site_plugin_events` (`pluginid`, `evtid`, `priority`) VALUES
	(1, 23, 0),
	(1, 29, 0),
	(1, 35, 0),
	(1, 41, 0),
	(1, 47, 0),
	(1, 73, 0),
	(1, 88, 0),
	(2, 25, 0),
	(2, 27, 0),
	(2, 37, 0),
	(2, 39, 0),
	(2, 43, 0),
	(2, 45, 0),
	(2, 49, 0),
	(2, 51, 0),
	(2, 55, 0),
	(2, 57, 0),
	(2, 75, 0),
	(2, 77, 0),
	(2, 206, 0),
	(2, 210, 0),
	(2, 211, 0),
	(3, 34, 0),
	(3, 35, 0),
	(3, 36, 0),
	(3, 40, 0),
	(3, 41, 0),
	(3, 42, 0),
	(4, 80, 0),
	(4, 81, 0),
	(4, 93, 0),
	(5, 28, 0),
	(5, 29, 0),
	(5, 30, 0),
	(5, 31, 0),
	(5, 35, 0),
	(5, 53, 0),
	(5, 205, 0),
	(6, 3, 0),
	(6, 13, 0),
	(6, 28, 0),
	(6, 31, 0),
	(6, 92, 0),
	(7, 3, 0),
	(7, 20, 0),
	(7, 85, 0),
	(7, 87, 0),
	(7, 88, 0),
	(7, 91, 0),
	(7, 92, 0),
	(8, 100, 0);
/*!40000 ALTER TABLE `modx_site_plugin_events` ENABLE KEYS */;


-- Дамп структуры для таблица wotch.modx_site_snippets
DROP TABLE IF EXISTS `modx_site_snippets`;
CREATE TABLE IF NOT EXISTS `modx_site_snippets` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Snippet',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `snippet` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `properties` text COMMENT 'Default Properties',
  `moduleguid` varchar(32) NOT NULL DEFAULT '' COMMENT 'GUID of module from which to import shared parameters',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=249 COMMENT='Contains the site snippets.';

-- Дамп данных таблицы wotch.modx_site_snippets: 16 rows
/*!40000 ALTER TABLE `modx_site_snippets` DISABLE KEYS */;
INSERT INTO `modx_site_snippets` (`id`, `name`, `description`, `editor_type`, `category`, `cache_type`, `snippet`, `locked`, `properties`, `moduleguid`) VALUES
	(1, 'alterTitle', '<strong>1</strong> Pagetitle если Longtitle пуст', 0, 7, 0, '\r\n//[[alterTitle? &id = `[+id+]`]] к примеру для вывода в Ditto\r\n$id = isset($id) ? (int) $id : 0;\r\nif ($id) {\r\n	$arr = $modx->getPageInfo($id,1,\'pagetitle,longtitle\');\r\n} else {\r\n	$arr[\'pagetitle\'] = $modx->documentObject[\'pagetitle\'];\r\n	$arr[\'longtitle\'] = $modx->documentObject[\'longtitle\'];\r\n}\r\n$title = strip_tags(strlen($arr[\'longtitle\']) ? $arr[\'longtitle\'] : $arr[\'pagetitle\']); \r\nreturn $title;\r\n?>\r\n', 0, '', ''),
	(2, 'Breadcrumbs', '<strong>1.0.5</strong> Configurable breadcrumb page-trail navigation', 0, 8, 0, 'return require MODX_BASE_PATH.\'assets/snippets/breadcrumbs/snippet.breadcrumbs.php\';', 0, '', ''),
	(3, 'Ditto', '<strong>2.1.2</strong> Summarizes and lists pages to create blogs, catalogs, PR archives, bio listings and more', 0, 9, 0, 'return require MODX_BASE_PATH.\'assets/snippets/ditto/snippet.ditto.php\';', 0, '', ''),
	(4, 'DocInfo', '<strong>1</strong> Берем любое поле из любого документа (меньше запросов по сравнению с GetField)', 0, 7, 0, 'return require MODX_BASE_PATH.\'assets/snippets/docinfo/snippet.docinfo.php\';', 0, '', ''),
	(5, 'DocLister', '<strong>2.3.0</strong> Snippet to display the information of the tables by the description rules. The main goal - replacing Ditto and CatalogView', 0, 9, 0, 'return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DocLister.php\';', 0, '', ''),
	(6, 'eForm', '<strong>1.4.8</strong> Robust form parser/processor with validation, multiple sending options, chunk/page support for forms and reports, and file uploads', 0, 3, 0, 'return require MODX_BASE_PATH.\'assets/snippets/eform/snippet.eform.php\';', 0, '', ''),
	(7, 'FirstChildRedirect', '<strong>2.0</strong> Automatically redirects to the first child of a Container Resource', 0, 8, 0, 'return require MODX_BASE_PATH.\'assets/snippets/firstchildredirect/snippet.firstchildredirect.php\';', 0, '', ''),
	(8, 'if', '<strong>1.3</strong> A simple conditional snippet. Allows for eq/neq/lt/gt/etc logic within templates, resources, chunks, etc.', 0, 8, 0, 'return require MODX_BASE_PATH.\'assets/snippets/if/snippet.if.php\';', 0, '', ''),
	(9, 'phpthumb', '<strong>1.3</strong> PHPThumb creates thumbnails and altered images on the fly and caches them', 0, 9, 0, 'return require MODX_BASE_PATH.\'assets/snippets/phpthumb/snippet.phpthumb.php\';\r\n', 0, '', ''),
	(10, 'UltimateParent', '<strong>2.0</strong> Travels up the document tree from a specified document and returns its "ultimate" non-root parent', 0, 8, 0, 'return require MODX_BASE_PATH.\'assets/snippets/ultimateparent/snippet.ultimateparent.php\';', 0, '', ''),
	(11, 'Wayfinder', '<strong>2.0.5</strong> Completely template-driven and highly flexible menu builder', 0, 8, 0, 'return require MODX_BASE_PATH.\'assets/snippets/wayfinder/snippet.wayfinder.php\';\n', 0, '', ''),
	(12, 'loginza', '<strong>0.5</strong> Log in via social networks. Uses in his work and snippet WebLogin', 0, 3, 0, 'return require MODX_BASE_PATH.\'assets/snippets/modxloginza/snippet.loginza.php\';', 0, '{}', ' '),
	(13, 'WebChangePwd', '<strong>1.0</strong> Allows Web User to change their password from the front-end of the website', 0, 10, 0, 'return require MODX_BASE_PATH.\'assets/snippets/weblogin/snippet.webchangepwd.php\';', 0, '', ''),
	(14, 'WebLogin', '<strong>1.1</strong> Allows webusers to login to protected pages in the website, supporting multiple user groups', 0, 10, 0, 'return require MODX_BASE_PATH.\'assets/snippets/weblogin/snippet.weblogin.php\';', 0, '&loginhomeid=Login Home Id;string; &logouthomeid=Logout Home Id;string; &logintext=Login Button Text;string; &logouttext=Logout Button Text;string; &tpl=Template;string;', ''),
	(15, 'WebSignup', '<strong>1.1</strong> Basic Web User account creation/signup system', 0, 10, 0, 'return require MODX_BASE_PATH.\'assets/snippets/weblogin/snippet.websignup.php\';', 0, '&tpl=Template;string;', ''),
	(16, 'exist_orAdd_user', 'Проверяет существование или добавление пользователя', 0, 0, 0, 'return require MODX_BASE_PATH.\'assets/snippets/index.php\';', 0, '{}', ' ');
/*!40000 ALTER TABLE `modx_site_snippets` ENABLE KEYS */;


-- Дамп структуры для таблица wotch.modx_site_templates
DROP TABLE IF EXISTS `modx_site_templates`;
CREATE TABLE IF NOT EXISTS `modx_site_templates` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `templatename` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Template',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT 'url to icon file',
  `template_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-page,1-content',
  `content` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `selectable` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4742 COMMENT='Contains the site templates.';

-- Дамп данных таблицы wotch.modx_site_templates: 4 rows
/*!40000 ALTER TABLE `modx_site_templates` DISABLE KEYS */;
INSERT INTO `modx_site_templates` (`id`, `templatename`, `description`, `editor_type`, `category`, `icon`, `template_type`, `content`, `locked`, `selectable`) VALUES
	(3, 'Home', '', 0, 0, '', 0, '{{header}}\r\n{{NAV}}\r\n<div id="index-banner" class="parallax-container">\r\n    <div class="section no-pad-bot">\r\n      <div class="center">\r\n        <div class="row center">\r\n          <a href="#" id="download-button" class="btn-large waves-effect waves-light teal lighten-1 buttonf">БЫТЬ ПЕРВЫМ</a>\r\n        </div>\r\n        <br><br>\r\n\r\n      </div>\r\n    </div>\r\n    <div class="parallax"><img src="[(site_url)]assets/images/1.png" alt="Unsplashed background img 1"></div>\r\n  </div>\r\n  \r\n  <div class="section no-pad-bot" id="index-banner">\r\n    <div class="container">\r\n      <br><br>\r\n      <h1 class="header center orange-text">Как это работает?</h1>\r\n      <div class="row center">\r\n        <h5 class="header col s12 light">[*content*]</h5>\r\n      </div>\r\n      <br><br>\r\n\r\n    </div>\r\n  </div>\r\n\r\n\r\n  <div class="container">\r\n    <div class="section">\r\n\r\n      <!--   Icon Section   -->\r\n      \r\n<div class="row">\r\n        \r\n	\r\n        <div class="col s12 m4">\r\n          <div class="icon-block">\r\n            <h2 class="center light-blue-text"><i class="material-icons">supervisor_account</i></h2>\r\n            <h5 class="center">Пользователи</h5>\r\n\r\n            <p class="light"><b>Нас уже (...)</b></p>\r\n            <p class="light"><b>Количество надзерателей (...)</b></p>\r\n          </div>\r\n        </div>\r\n\r\n        <div class="col s12 m4">\r\n          <div class="icon-block">\r\n            <h2 class="center light-blue-text"><i class="material-icons">settings</i></h2>\r\n            <h5 class="center">Планы на будущее</h5>\r\n\r\n            <p class="light"><b>Сделать сайт!</b></p>\r\n          </div>\r\n        </div>\r\n\r\n		<div class="col s12 m4">\r\n			  <div class="icon-block">\r\n				<h2 class="center light-blue-text"><i class="material-icons">visibility</i></h2>\r\n				<h5 class="center">Поддерживаемые сайты</h5>\r\n				  <div class="chip">\r\n					<img src="assets/images/olx.png" alt="Contact Person">\r\n					OLX - на стадии разработки\r\n  				</div>\r\n			  </div>\r\n			</div>\r\n		  </div>\r\n\r\n    </div>\r\n    <br><br>\r\n\r\n    <div class="section">\r\n\r\n    </div>\r\n  </div>\r\n{{footer}}', 0, 1),
	(4, 'MODX startup - Bootstrap', '<strong>1.0</strong> Sample template in Bootstrap', 0, 1, '', 0, '<!DOCTYPE html>\n<html lang="[(lang_code)]">\n<head>	\n	<base href="[(site_url)]" />\n	<meta charset="[(modx_charset)]" />\n	<meta name="viewport" content="width=device-width, initial-scale=1">\n	<meta http-equiv="X-UA-Compatible" content="IE=edge">\n	<title>[*pagetitle*] / [(site_name)]</title>\n	<@IF:[*description:isntEmpty*]><meta name="description" content="[*description*]"><@ENDIF>\n	\n	<link href="[(site_url)]<@IF:[*id:isnt(1)*]>[~[*id*]~]<@ENDIF>" rel="canonical">\n	<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet" type="text/css">	\n	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">\n	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">\n	\n	<style> \n	html, body{background:#eee; font-family:\'Open Sans\',sans-serif; line-height:1.8; font-size:14px;}\n	a:focus{outline:none; outline-offset:0;}\n	h1{margin-top:15px;}\n\n	.logo{float:left;}\n	.logo img{max-width:200px; margin:10px 0; display:block; height:50px; width:auto;}\n	.dropdown-menu{border-radius:0; border:0;}\n	.dropdown-menu > li > a{padding-top:5px; padding-bottom:5px;}\n\n	.navbar-collapse.collapse.in{border-bottom:10px solid #eee;}\n	.navbar{min-height:0; background:#fff; margin-bottom:0;}\n	.navbar.nav{margin-left:0;}\n	.navbar.nav ul{padding-left:0;}\n	.navbar-nav{margin:0;}\n	.navbar-toggle{background:#fff; border:2px solid #eee; border-radius:0; position:fixed; z-index:99; right:0; top:7px; padding:12px 10px; margin-right:10px;}\n	.navbar .navbar-toggle .icon-bar{background-color:#333;}\n\n	.nav li a{text-transform:uppercase; color:#333; font-weight:500; font-size:110%;}\n	.nav li li a{text-transform:none; font-weight:normal; font-size:100%;}\n\n	.navbar{border:none; border-radius:0;}\n	#navbar{padding:0;}\n	ul.nav > li > a:hover{background-color:#f5f5f5;}\n\n	.affix{top:0px; width:100%; z-index:1000; background-color:#eee;}\n	.affix + .affspacer{display:block; height:50px;}\n\n	.box-shadow{-webkit-box-shadow:0 6px 12px rgba(0,0,0,.175); box-shadow:0 6px 12px rgba(0,0,0,.175);}\n\n	.container {max-width:970px; margin:0 12px;}\n	.top .col-sm-12{padding-left:0; padding-right:0;}\n\n	#ajaxSearch_input,\n	#username,\n	#password{width:100%!important;}\n	#forgotpsswd{clear:both;}\n	input.button[type="submit"]{display:block;}\n	label.checkbox{display:inline-block; margin-left:10px;}\n	label, legend{font-weight:400;}\n	#ajaxSearch_form { position:relative; }\n	#searchClose { display:none !important; }\n    #indicator { position:absolute; top:9px; right:12px; z-index:10; opacity:.75; }\n\n	h2{font-size:22px;}\n	.bread{padding:1em 0 0 0;}\n	.mem{color:#aaa; text-align:center; padding:1em 0 2em;}\n\n	section.main .container{background-color:#fff; padding-bottom:20px;}\n	footer.footer .container{background-color:#000; color:#fff; line-height:40px;}\n\n	section.main ul{list-style:none; margin:0 0 1em 0; padding:0;}\n	section.main ul li{padding-left:1em;}\n	section.main ul li:before{content:\'\\2022\'; position:absolute; line-height:1.85em; margin-left:-1em;}\n\n	.footer{text-align:center;}\n	.footer .text-right{text-align:center;}\n\n	/* JOT */\n	.jot-comment{padding:5px 10px;}\n	.jot-row-author{background-color:#dddddd;}\n	.jot-row-alt{background-color:#f9f9f9;}\n	.jot-row{background-color:#eeeeee;}\n	.jot-row-up{border:1px solid #333!important;}\n	.jot-row-up.panel-primary > .panel-heading{background-color:#333!important; border-color:#333!important;}\n	.jot-extra{font-size:75%;}\n	.jot-poster{font-size:inherit!important;}\n\n	.ditto_summaryPost img{max-width:100%; height:auto; margin:10px 0 5px; display:block;}\n	.ditto_summaryPost{padding-top:10px; padding-bottom:15px; border-bottom:1px solid #eee;}\n\n	/* Larger than mobile */\n	@media (min-width:320px) {\n\n	}\n\n	/* Larger than phablet */\n	@media (min-width:480px) {\n\n	}\n\n	/* Larger than tablet */\n	@media (min-width:768px) {\n\n		.container{margin:0 auto;}\n		.logo{padding-left:15px;}\n		.logo img{ max-width:240px; margin:0; display:block; height:100px;}\n\n		.navbar{background:transparent;}\n		.navbar.affix{background:#eee;}\n		.navbar-collapse.collapse.in{border-bottom:0;}\n\n		.footer{text-align:left;}\n		.footer .text-right{text-align:right;}\n\n		.col-lg-1, .col-lg-10, .col-lg-11, .col-lg-12, .col-lg-2, .col-lg-3, .col-lg-4, .col-lg-5, .col-lg-6, .col-lg-7, .col-lg-8, .col-lg-9, .col-md-1, .col-md-10, .col-md-11, .col-md-12, .col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9, .col-sm-1, .col-sm-10, .col-sm-11, .col-sm-12, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9, .col-xs-1, .col-xs-10, .col-xs-11, .col-xs-12, .col-xs-2, .col-xs-3, .col-xs-4, .col-xs-5, .col-xs-6, .col-xs-7, .col-xs-8, .col-xs-9 {padding-left:35px; padding-right:35px;}\n\n	}\n	</style>\n	\n	<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>\n</head>\n<body>\n	<section class="top">\n		<div class="container">\n			<div class="row">\n				<div class="col-sm-12" itemscope itemtype="http://schema.org/Organization">\n\n					<a class="logo" href="[~[(site_start)]~]" title="[(site_name)]" itemprop="url">\n						<img src="[(site_url)]assets/images/modx-logo.png" itemprop="logo" width="240" height="100" alt="[(site_name)]" />\n					</a>\n\n					<div class="clearfix"></div>\n\n					<nav class="navbar" role="navigation" data-spy="affix" data-offset-top="100">\n\n						<div class="navbar-header">\n							<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">\n								<span class="sr-only">Toggle navigation</span>\n								<span class="icon-bar"></span>\n								<span class="icon-bar"></span>\n								<span class="icon-bar"></span>\n							</button>\n						</div>\n						<div id="navbar" class="navbar-collapse collapse">\n							[[Wayfinder? \n							&startId=`0` \n							&level=`2` \n							&removeNewLines=`1`\n							&outerTpl=`@CODE:<ul class="nav navbar-nav">[+wf.wrapper+]</ul>`\n							&rowTpl=`@CODE:<li[+wf.classes+]><a href="[+wf.link+]" [+wf.attributes+]>[+wf.linktext+]</a>[+wf.wrapper+]</li>`\n							&innerTpl=`@CODE:<ul class="dropdown-menu">[+wf.wrapper+]</ul>`\n							&innerRowTpl=`@CODE:<li[+wf.classes+]><a href="[+wf.link+]">[+wf.linktext+]</a></li>`\n							&parentRowTpl=`@CODE:<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" title="[+wf.title+]">[+wf.linktext+] <b class="caret"></b></a>[+wf.wrapper+]</li>`\n							&activeParentRowTpl=`@CODE:<li class="dropdown active"><a class="dropdown-toggle" data-toggle="dropdown" href="#" title="[+wf.title+]">[+wf.linktext+] <b class="caret"></b></a>[+wf.wrapper+]</li>`\n							]]\n						</div>\n\n					</nav>\n					<div class="affspacer"></div>\n\n				</div>\n			</div>\n		</div>\n		</section>\n\n		<section class="main">\n			<div class="container">\n\n				<div class="row">\n					<div class="col-sm-12">\n						<div class="bread">\n							[[Breadcrumbs]]\n						</div>\n					</div>\n				</div>\n\n				<div class="row">\n\n					<div class="col-sm-8">\n						<h1>[*#longtitle*]</h1>\n						[*#content*]\n					</div>\n\n					<aside class="col-sm-4">\n						<div class="search">\n							<h2>Search</h2>\n							[!AjaxSearch? \n							&ajaxSearch=`1` \n							&addJscript=`0` \n							&showIntro=`0` \n							&ajaxMax=`5` \n							&extract=`1`\n							&jscript=`jquery`\n							&tplInput=`AjaxSearch_tplInput`\n							&tplAjaxGrpResult=`AjaxSearch_tplAjaxGrpResult`\n							&tplAjaxResults=`AjaxSearch_tplAjaxResults`\n							&tplAjaxResult=`AjaxSearch_tplAjaxResult`\n							&showResults=`1`\n							&liveSearch=`0`\n							!]\n						</div>\n\n						<h2>News:</h2>\n						[[DocLister? \n						&parents=`2` \n						&display=`2`\n						&total=`20` \n						&removeChunk=`Comments` \n						&tpl=`nl_sidebar`\n						]]\n\n						<div>\n							<h2>Most Recent:</h2>\n\n							<ul>\n								[[DocLister? \n								&showInMenuOnly=`1` \n								&parents=`0`\n								&display=`5`\n								&tpl=`@CODE:<li><a href="[+url+]" title="[+pagetitle+]">[+pagetitle+]</a> <span class="date">[+date+]</span></li>`\n								]]\n							</ul>\n\n						</div>\n						<br/>\n						<h2>Login:</h2>\n						<div>\n							[!WebLogin? \n							&tpl=`WebLogin_tplForm` \n							&loginhomeid=`[(site_start)]`\n							&focusInput=`0`\n							!]\n						</div>\n\n					</aside>\n				</div>\n			</div>\n\n		</section>\n\n		<footer class="footer">\n			<div class="container">\n				<div class="row">\n					<div class="col-sm-6">\n						<a href="https://modx.com" title="Learn more about MODX">MODX</a> Starter-Template &copy;2006-[[$_SERVER[\'REQUEST_TIME\']:dateFormat=`Y` ]]\n					</div>\n					<div class="col-sm-6 text-right">\n						Built with <a href="http://www.getbootstrap.com" target="_blank">Bootstrap</a> framework.\n					</div>\n				</div>\n			</div>\n		</footer>\n\n		<div class="container mem">\n			<small>Memory: [^m^], MySQL: [^qt^], [^q^] request(s), PHP: [^p^], total: [^t^], document retrieved from [^s^]. </small>\n	</div>\n\n	<!-- Scripts\n	–––––––––––––––––––––––––––––––––––––––––––––––––– -->	\n\n	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>\n	<!--[if lt IE 9]>\n		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>\n		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>\n	<![endif]-->\n	\n</body>\n</html>', 0, 1),
	(5, 'Авторизация', ' login', 0, 0, '', 0, '{{header}}\r\n{{NAV}}\r\n<div>\r\n	<div class="container_login">\r\n			<div class="row">\r\n				<form class="col s12">\r\n				  <div class="row">\r\n					<div class="input-field col s12">\r\n					  <i class="material-icons prefix">account_circle</i>\r\n					  <input id="icon_prefix" type="text" class="validate">\r\n					  <label for="icon_prefix">Email</label>\r\n					</div>\r\n					<div class="input-field col s12">\r\n					  <i class="material-icons prefix">lock</i>\r\n					  <input id="icon_telephone" type="tel" class="validate">\r\n					  <label for="icon_telephone">Пароль</label>\r\n					</div>\r\n				  </div>\r\n					<div>\r\n						<input class="waves-effect waves-light btn light-green" type="submit" value="Войти">\r\n					</div>\r\n					<div>\r\n						[!loginza? &type=`profile`!]\r\n					</div>\r\n				</form>\r\n			</div>\r\n		</div>\r\n	</div>\r\n{{footer}}', 0, 1),
	(6, 'registration', 'Форма регистрации', 0, 0, '', 0, '{{header}}\r\n{{NAV}}\r\n<div class="container_login">\r\n<div class="row">\r\n    <form class="col s12">\r\n      <div class="row">\r\n        <div class="input-field col s6">\r\n		  <i class="material-icons prefix light-blue-text">account_circle</i>\r\n          <input id="first_name" type="text" class="validate">\r\n          <label for="first_name">Имя</label>\r\n        </div>\r\n        <div class="input-field col s6">\r\n          <input id="last_name" type="text" class="validate">\r\n          <label for="last_name">Фамилия</label>\r\n        </div>\r\n      </div>\r\n      <div class="row">\r\n        <div class="input-field col s12">\r\n		  <i class="material-icons prefix light-blue-text">email</i>\r\n          <input id="email" type="email" class="validate">\r\n		  <label for="email">Email <span id="emailex" style="color: red;">Пользователь с таким Email уже зарегестрирован!</span></label>\r\n        </div>\r\n      </div>\r\n      <div class="row">\r\n        <div class="input-field col s12">\r\n		  <i class="material-icons prefix light-blue-text">lock</i>\r\n          <input id="password1" type="password" class="validate">\r\n		  <label for="password1">Пароль <span id="pwdMeter" class="neutral"></span></label>\r\n        </div>\r\n      </div>\r\n		<div class="row">\r\n        <div class="input-field col s12">\r\n		  <i class="material-icons prefix light-blue-text">lock</i>\r\n          <input id="password2" type="password" class="validate">\r\n          <label for="password2">Повторите пароль <span id="pwdCompare" class="neutral"></span></label>\r\n        </div>\r\n      </div>\r\n		<div class="right-align">\r\n			<input class="waves-effect waves-light btn light-green" type="submit" value="Регистрация">\r\n		</div>\r\n    </form>\r\n  </div>\r\n</div>\r\n{{footer}}\r\n<script src="/assets/js/jquery.pwdMeter.js"></script>\r\n{{exist_login}}', 0, 1);
/*!40000 ALTER TABLE `modx_site_templates` ENABLE KEYS */;


-- Дамп структуры для таблица wotch.modx_site_tmplvars
DROP TABLE IF EXISTS `modx_site_tmplvars`;
CREATE TABLE IF NOT EXISTS `modx_site_tmplvars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `caption` varchar(80) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `elements` text,
  `rank` int(11) NOT NULL DEFAULT '0',
  `display` varchar(20) NOT NULL DEFAULT '' COMMENT 'Display Control',
  `display_params` text COMMENT 'Display Control Properties',
  `default_text` text,
  PRIMARY KEY (`id`),
  KEY `indx_rank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=114 COMMENT='Site Template Variables';

-- Дамп данных таблицы wotch.modx_site_tmplvars: 4 rows
/*!40000 ALTER TABLE `modx_site_tmplvars` DISABLE KEYS */;
INSERT INTO `modx_site_tmplvars` (`id`, `type`, `name`, `caption`, `description`, `editor_type`, `category`, `locked`, `elements`, `rank`, `display`, `display_params`, `default_text`) VALUES
	(1, 'textarea', 'desc', 'Мета дескрипшин', 'Мета дескрипшин', 0, 2, 0, '', 0, '', '', '[*introtext*]'),
	(2, 'text', 'keyw', 'Ключевые слова', 'Ключевые слова', 0, 2, 0, '', 0, '', '', '[*pagetitle*]'),
	(3, 'checkbox', 'noIndex', 'Индексировать страницу', 'Управление URL', 0, 2, 0, 'Нет==<meta name="robots" content="noindex, nofollow">', 0, '', '', ''),
	(4, 'text', 'titl', 'Мета тайтл', 'Мета тайтл', 0, 2, 0, '', 0, '', '', '[*pagetitle*] - [(site_name)]');
/*!40000 ALTER TABLE `modx_site_tmplvars` ENABLE KEYS */;


-- Дамп структуры для таблица wotch.modx_site_tmplvar_access
DROP TABLE IF EXISTS `modx_site_tmplvar_access`;
CREATE TABLE IF NOT EXISTS `modx_site_tmplvar_access` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tmplvarid` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for template variable access permissions.';

-- Дамп данных таблицы wotch.modx_site_tmplvar_access: 0 rows
/*!40000 ALTER TABLE `modx_site_tmplvar_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_site_tmplvar_access` ENABLE KEYS */;


-- Дамп структуры для таблица wotch.modx_site_tmplvar_contentvalues
DROP TABLE IF EXISTS `modx_site_tmplvar_contentvalues`;
CREATE TABLE IF NOT EXISTS `modx_site_tmplvar_contentvalues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tmplvarid` int(10) NOT NULL DEFAULT '0' COMMENT 'Template Variable id',
  `contentid` int(10) NOT NULL DEFAULT '0' COMMENT 'Site Content Id',
  `value` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_tvid_contentid` (`tmplvarid`,`contentid`),
  KEY `idx_id` (`contentid`),
  KEY `idx_tmplvarid` (`tmplvarid`),
  FULLTEXT KEY `value_ft_idx` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Site Template Variables Content Values Link Table';

-- Дамп данных таблицы wotch.modx_site_tmplvar_contentvalues: 0 rows
/*!40000 ALTER TABLE `modx_site_tmplvar_contentvalues` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_site_tmplvar_contentvalues` ENABLE KEYS */;


-- Дамп структуры для таблица wotch.modx_site_tmplvar_templates
DROP TABLE IF EXISTS `modx_site_tmplvar_templates`;
CREATE TABLE IF NOT EXISTS `modx_site_tmplvar_templates` (
  `tmplvarid` int(10) NOT NULL DEFAULT '0' COMMENT 'Template Variable id',
  `templateid` int(11) NOT NULL DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tmplvarid`,`templateid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=13 COMMENT='Site Template Variables Templates Link Table';

-- Дамп данных таблицы wotch.modx_site_tmplvar_templates: 4 rows
/*!40000 ALTER TABLE `modx_site_tmplvar_templates` DISABLE KEYS */;
INSERT INTO `modx_site_tmplvar_templates` (`tmplvarid`, `templateid`, `rank`) VALUES
	(4, 3, 0),
	(1, 3, 0),
	(2, 3, 0),
	(3, 3, 0);
/*!40000 ALTER TABLE `modx_site_tmplvar_templates` ENABLE KEYS */;


-- Дамп структуры для таблица wotch.modx_system_eventnames
DROP TABLE IF EXISTS `modx_system_eventnames`;
CREATE TABLE IF NOT EXISTS `modx_system_eventnames` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `service` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'System Service number',
  `groupname` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1036 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=35 COMMENT='System Event Names.';

-- Дамп данных таблицы wotch.modx_system_eventnames: 131 rows
/*!40000 ALTER TABLE `modx_system_eventnames` DISABLE KEYS */;
INSERT INTO `modx_system_eventnames` (`id`, `name`, `service`, `groupname`) VALUES
	(1, 'OnDocPublished', 5, ''),
	(2, 'OnDocUnPublished', 5, ''),
	(3, 'OnWebPagePrerender', 5, ''),
	(4, 'OnWebLogin', 3, ''),
	(5, 'OnBeforeWebLogout', 3, ''),
	(6, 'OnWebLogout', 3, ''),
	(7, 'OnWebSaveUser', 3, ''),
	(8, 'OnWebDeleteUser', 3, ''),
	(9, 'OnWebChangePassword', 3, ''),
	(10, 'OnWebCreateGroup', 3, ''),
	(11, 'OnManagerLogin', 2, ''),
	(12, 'OnBeforeManagerLogout', 2, ''),
	(13, 'OnManagerLogout', 2, ''),
	(14, 'OnManagerSaveUser', 2, ''),
	(15, 'OnManagerDeleteUser', 2, ''),
	(16, 'OnManagerChangePassword', 2, ''),
	(17, 'OnManagerCreateGroup', 2, ''),
	(18, 'OnBeforeCacheUpdate', 4, ''),
	(19, 'OnCacheUpdate', 4, ''),
	(107, 'OnMakePageCacheKey', 4, ''),
	(20, 'OnLoadWebPageCache', 4, ''),
	(21, 'OnBeforeSaveWebPageCache', 4, ''),
	(22, 'OnChunkFormPrerender', 1, 'Chunks'),
	(23, 'OnChunkFormRender', 1, 'Chunks'),
	(24, 'OnBeforeChunkFormSave', 1, 'Chunks'),
	(25, 'OnChunkFormSave', 1, 'Chunks'),
	(26, 'OnBeforeChunkFormDelete', 1, 'Chunks'),
	(27, 'OnChunkFormDelete', 1, 'Chunks'),
	(28, 'OnDocFormPrerender', 1, 'Documents'),
	(29, 'OnDocFormRender', 1, 'Documents'),
	(30, 'OnBeforeDocFormSave', 1, 'Documents'),
	(31, 'OnDocFormSave', 1, 'Documents'),
	(32, 'OnBeforeDocFormDelete', 1, 'Documents'),
	(33, 'OnDocFormDelete', 1, 'Documents'),
	(1033, 'OnDocFormUnDelete', 1, 'Documents'),
	(1034, 'onBeforeMoveDocument', 1, 'Documents'),
	(1035, 'onAfterMoveDocument', 1, 'Documents'),
	(34, 'OnPluginFormPrerender', 1, 'Plugins'),
	(35, 'OnPluginFormRender', 1, 'Plugins'),
	(36, 'OnBeforePluginFormSave', 1, 'Plugins'),
	(37, 'OnPluginFormSave', 1, 'Plugins'),
	(38, 'OnBeforePluginFormDelete', 1, 'Plugins'),
	(39, 'OnPluginFormDelete', 1, 'Plugins'),
	(40, 'OnSnipFormPrerender', 1, 'Snippets'),
	(41, 'OnSnipFormRender', 1, 'Snippets'),
	(42, 'OnBeforeSnipFormSave', 1, 'Snippets'),
	(43, 'OnSnipFormSave', 1, 'Snippets'),
	(44, 'OnBeforeSnipFormDelete', 1, 'Snippets'),
	(45, 'OnSnipFormDelete', 1, 'Snippets'),
	(46, 'OnTempFormPrerender', 1, 'Templates'),
	(47, 'OnTempFormRender', 1, 'Templates'),
	(48, 'OnBeforeTempFormSave', 1, 'Templates'),
	(49, 'OnTempFormSave', 1, 'Templates'),
	(50, 'OnBeforeTempFormDelete', 1, 'Templates'),
	(51, 'OnTempFormDelete', 1, 'Templates'),
	(52, 'OnTVFormPrerender', 1, 'Template Variables'),
	(53, 'OnTVFormRender', 1, 'Template Variables'),
	(54, 'OnBeforeTVFormSave', 1, 'Template Variables'),
	(55, 'OnTVFormSave', 1, 'Template Variables'),
	(56, 'OnBeforeTVFormDelete', 1, 'Template Variables'),
	(57, 'OnTVFormDelete', 1, 'Template Variables'),
	(58, 'OnUserFormPrerender', 1, 'Users'),
	(59, 'OnUserFormRender', 1, 'Users'),
	(60, 'OnBeforeUserFormSave', 1, 'Users'),
	(61, 'OnUserFormSave', 1, 'Users'),
	(62, 'OnBeforeUserFormDelete', 1, 'Users'),
	(63, 'OnUserFormDelete', 1, 'Users'),
	(64, 'OnWUsrFormPrerender', 1, 'Web Users'),
	(65, 'OnWUsrFormRender', 1, 'Web Users'),
	(66, 'OnBeforeWUsrFormSave', 1, 'Web Users'),
	(67, 'OnWUsrFormSave', 1, 'Web Users'),
	(68, 'OnBeforeWUsrFormDelete', 1, 'Web Users'),
	(69, 'OnWUsrFormDelete', 1, 'Web Users'),
	(70, 'OnSiteRefresh', 1, ''),
	(71, 'OnFileManagerUpload', 1, ''),
	(72, 'OnModFormPrerender', 1, 'Modules'),
	(73, 'OnModFormRender', 1, 'Modules'),
	(74, 'OnBeforeModFormDelete', 1, 'Modules'),
	(75, 'OnModFormDelete', 1, 'Modules'),
	(76, 'OnBeforeModFormSave', 1, 'Modules'),
	(77, 'OnModFormSave', 1, 'Modules'),
	(78, 'OnBeforeWebLogin', 3, ''),
	(79, 'OnWebAuthentication', 3, ''),
	(80, 'OnBeforeManagerLogin', 2, ''),
	(81, 'OnManagerAuthentication', 2, ''),
	(82, 'OnSiteSettingsRender', 1, 'System Settings'),
	(83, 'OnFriendlyURLSettingsRender', 1, 'System Settings'),
	(84, 'OnUserSettingsRender', 1, 'System Settings'),
	(85, 'OnInterfaceSettingsRender', 1, 'System Settings'),
	(86, 'OnMiscSettingsRender', 1, 'System Settings'),
	(87, 'OnRichTextEditorRegister', 1, 'RichText Editor'),
	(88, 'OnRichTextEditorInit', 1, 'RichText Editor'),
	(89, 'OnManagerPageInit', 2, ''),
	(90, 'OnWebPageInit', 5, ''),
	(101, 'OnLoadDocumentObject', 5, ''),
	(104, 'OnBeforeLoadDocumentObject', 5, ''),
	(105, 'OnAfterLoadDocumentObject', 5, ''),
	(91, 'OnLoadWebDocument', 5, ''),
	(92, 'OnParseDocument', 5, ''),
	(106, 'OnParseProperties', 5, ''),
	(108, 'OnBeforeParseParams', 5, ''),
	(93, 'OnManagerLoginFormRender', 2, ''),
	(94, 'OnWebPageComplete', 5, ''),
	(95, 'OnLogPageHit', 5, ''),
	(96, 'OnBeforeManagerPageInit', 2, ''),
	(97, 'OnBeforeEmptyTrash', 1, 'Documents'),
	(98, 'OnEmptyTrash', 1, 'Documents'),
	(99, 'OnManagerLoginFormPrerender', 2, ''),
	(100, 'OnStripAlias', 1, 'Documents'),
	(102, 'OnMakeDocUrl', 5, ''),
	(103, 'OnBeforeLoadExtension', 5, ''),
	(200, 'OnCreateDocGroup', 1, 'Documents'),
	(201, 'OnManagerWelcomePrerender', 2, ''),
	(202, 'OnManagerWelcomeHome', 2, ''),
	(203, 'OnManagerWelcomeRender', 2, ''),
	(204, 'OnBeforeDocDuplicate', 1, 'Documents'),
	(205, 'OnDocDuplicate', 1, 'Documents'),
	(206, 'OnManagerMainFrameHeaderHTMLBlock', 2, ''),
	(207, 'OnManagerPreFrameLoader', 2, ''),
	(208, 'OnManagerFrameLoader', 2, ''),
	(209, 'OnManagerTreeInit', 2, ''),
	(210, 'OnManagerTreePrerender', 2, ''),
	(211, 'OnManagerTreeRender', 2, ''),
	(212, 'OnManagerNodePrerender', 2, ''),
	(213, 'OnManagerNodeRender', 2, ''),
	(214, 'OnManagerMenuPrerender', 2, ''),
	(215, 'OnManagerTopPrerender', 2, ''),
	(224, 'OnDocFormTemplateRender', 1, 'Documents'),
	(999, 'OnPageUnauthorized', 1, ''),
	(1000, 'OnPageNotFound', 1, ''),
	(1001, 'OnFileBrowserUpload', 1, 'File Browser Events');
/*!40000 ALTER TABLE `modx_system_eventnames` ENABLE KEYS */;


-- Дамп структуры для таблица wotch.modx_system_settings
DROP TABLE IF EXISTS `modx_system_settings`;
CREATE TABLE IF NOT EXISTS `modx_system_settings` (
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text,
  PRIMARY KEY (`setting_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=32 COMMENT='Contains Content Manager settings.';

-- Дамп данных таблицы wotch.modx_system_settings: 142 rows
/*!40000 ALTER TABLE `modx_system_settings` DISABLE KEYS */;
INSERT INTO `modx_system_settings` (`setting_name`, `setting_value`) VALUES
	('settings_version', '1.2.1-d9.1.0'),
	('manager_theme', 'MODxRE2'),
	('show_meta', '0'),
	('server_offset_time', '0'),
	('server_protocol', 'http'),
	('manager_language', 'russian-UTF8'),
	('modx_charset', 'UTF-8'),
	('site_name', 'MODX Site By Dmi3yy'),
	('site_start', '1'),
	('error_page', '1'),
	('unauthorized_page', '1'),
	('site_status', '1'),
	('site_unavailable_message', 'The site is currently unavailable'),
	('track_visitors', '0'),
	('top_howmany', '10'),
	('auto_template_logic', 'parent'),
	('default_template', '3'),
	('old_template', '3'),
	('publish_default', '1'),
	('cache_default', '1'),
	('search_default', '1'),
	('friendly_urls', '1'),
	('friendly_url_prefix', ''),
	('friendly_url_suffix', '.html'),
	('friendly_alias_urls', '1'),
	('use_alias_path', '1'),
	('use_udperms', '1'),
	('udperms_allowroot', '0'),
	('failed_login_attempts', '3'),
	('blocked_minutes', '60'),
	('use_captcha', '0'),
	('captcha_words', '0,1,2,3,4,5,6,7,8,9'),
	('emailsender', 'ipra-8@mail.ru'),
	('email_method', 'mail'),
	('smtp_auth', '0'),
	('smtp_host', ''),
	('smtp_port', '25'),
	('smtp_username', ''),
	('emailsubject', 'Your login details'),
	('number_of_logs', '100'),
	('number_of_messages', '30'),
	('number_of_results', '20'),
	('use_editor', '1'),
	('use_browser', '1'),
	('which_browser', 'mcpuk'),
	('rb_base_dir', 'C:/OpenServer/domains/modx.ua/assets/'),
	('rb_base_url', '/'),
	('which_editor', 'TinyMCE4'),
	('fe_editor_lang', 'russian-UTF8'),
	('fck_editor_toolbar', 'standard'),
	('fck_editor_autolang', '0'),
	('editor_css_path', ''),
	('editor_css_selectors', ''),
	('strip_image_paths', '1'),
	('upload_images', 'bmp,ico,gif,jpeg,jpg,png,psd,tif,tiff,svg'),
	('upload_media', 'au,avi,mp3,mp4,mpeg,mpg,wav,wmv'),
	('upload_flash', 'fla,flv,swf'),
	('upload_files', 'bmp,ico,gif,jpeg,jpg,png,psd,tif,tiff,fla,flv,swf,aac,au,avi,css,cache,doc,docx,gz,gzip,htaccess,htm,html,js,mp3,mp4,mpeg,mpg,ods,odp,odt,pdf,ppt,pptx,rar,tar,tgz,txt,wav,wmv,xls,xlsx,xml,z,zip,JPG,JPEG,PNG,GIF,svg'),
	('upload_maxsize', '10485760'),
	('new_file_permissions', '0644'),
	('new_folder_permissions', '0755'),
	('filemanager_path', 'C:/OpenServer/domains/modx.ua/'),
	('theme_refresher', ''),
	('manager_layout', '4'),
	('custom_contenttype', 'application/rss+xml,application/pdf,application/vnd.ms-word,application/vnd.ms-excel,text/html,text/css,text/xml,text/javascript,text/plain,application/json'),
	('auto_menuindex', '1'),
	('session.cookie.lifetime', '604800'),
	('mail_check_timeperiod', '600'),
	('manager_direction', 'ltr'),
	('tinymce4_theme', 'custom'),
	('tree_show_protected', '0'),
	('rss_url_news', 'http://feeds.feedburner.com/modx-announce'),
	('rss_url_security', 'http://feeds.feedburner.com/modxsecurity'),
	('validate_referer', '1'),
	('datepicker_offset', '-10'),
	('xhtml_urls', '0'),
	('allow_duplicate_alias', '0'),
	('automatic_alias', '1'),
	('datetime_format', 'dd-mm-YYYY'),
	('warning_visibility', '0'),
	('remember_last_tab', '1'),
	('enable_bindings', '1'),
	('seostrict', '1'),
	('cache_type', '2'),
	('maxImageWidth', '1600'),
	('maxImageHeight', '1200'),
	('thumbWidth', '150'),
	('thumbHeight', '150'),
	('thumbsDir', '.thumbs'),
	('jpegQuality', '90'),
	('denyZipDownload', '0'),
	('denyExtensionRename', '0'),
	('showHiddenFiles', '0'),
	('docid_incrmnt_method', '0'),
	('make_folders', '0'),
	('tree_page_click', '27'),
	('clean_uploaded_filename', '1'),
	('site_id', '58e7ef63778bf'),
	('site_unavailable_page', ''),
	('reload_site_unavailable', ''),
	('siteunavailable_message_default', 'В настоящее время сайт недоступен.'),
	('enable_filter', '0'),
	('minifyphp_incache', '0'),
	('aliaslistingfolder', '0'),
	('smtp_secure', 'none'),
	('reload_emailsubject', ''),
	('emailsubject_default', 'Данные для авторизации'),
	('reload_signupemail_message', ''),
	('signupemail_message', 'Здравствуйте, [+uid+]!\r\n\r\nВаши данные для авторизации в системе управления сайтом [+sname+]:\r\n\r\nИмя пользователя: [+uid+]\r\nПароль: [+pwd+]\r\n\r\nПосле успешной авторизации в системе управления сайтом ([+surl+]), вы сможете изменить свой пароль.\r\n\r\nС уважением, Администрация'),
	('system_email_signup_default', 'Здравствуйте, [+uid+]!\r\n\r\nВаши данные для авторизации в системе управления сайтом [+sname+]:\r\n\r\nИмя пользователя: [+uid+]\r\nПароль: [+pwd+]\r\n\r\nПосле успешной авторизации в системе управления сайтом ([+surl+]), вы сможете изменить свой пароль.\r\n\r\nС уважением, Администрация'),
	('reload_websignupemail_message', ''),
	('websignupemail_message', 'Здравствуйте, [+uid+]!\r\n\r\nВаши данные для авторизации на [+sname+]:\r\n\r\nИмя пользователя: [+uid+]\r\nПароль: [+pwd+]\r\n\r\nПосле успешной авторизации на [+sname+] ([+surl+]), вы сможете изменить свой пароль.\r\n\r\nС уважением, Администрация'),
	('system_email_websignup_default', 'Здравствуйте, [+uid+]!\r\n\r\nВаши данные для авторизации на [+sname+]:\r\n\r\nИмя пользователя: [+uid+]\r\nПароль: [+pwd+]\r\n\r\nПосле успешной авторизации на [+sname+] ([+surl+]), вы сможете изменить свой пароль.\r\n\r\nС уважением, Администрация'),
	('reload_system_email_webreminder_message', ''),
	('webpwdreminder_message', 'Здравствуйте, [+uid+]!\r\n\r\nЧтобы активировать ваш новый пароль, перейдите по следующей ссылке:\r\n\r\n[+surl+]\r\n\r\nПозже вы сможете использовать следующий пароль для авторизации: [+pwd+]\r\n\r\nЕсли это письмо пришло к вам по ошибке, пожалуйста, проигнорируйте его.\r\n\r\nС уважением, Администрация'),
	('system_email_webreminder_default', 'Здравствуйте, [+uid+]!\r\n\r\nЧтобы активировать ваш новый пароль, перейдите по следующей ссылке:\r\n\r\n[+surl+]\r\n\r\nПозже вы сможете использовать следующий пароль для авторизации: [+pwd+]\r\n\r\nЕсли это письмо пришло к вам по ошибке, пожалуйста, проигнорируйте его.\r\n\r\nС уважением, Администрация'),
	('use_breadcrumbs', '0'),
	('resource_tree_node_name', 'pagetitle'),
	('session_timeout', '15'),
	('tinymce4_skin', 'lightgray'),
	('tinymce4_template_docs', ''),
	('tinymce4_template_chunks', ''),
	('tinymce4_entermode', 'p'),
	('tinymce4_element_format', 'xhtml'),
	('tinymce4_schema', 'html5'),
	('tinymce4_custom_plugins', 'advlist autolink lists link image charmap print preview hr anchor pagebreak searchreplace wordcount visualblocks visualchars code fullscreen spellchecker insertdatetime media nonbreaking save table contextmenu directionality emoticons template paste textcolor codesample colorpicker textpattern imagetools paste modxlink youtube'),
	('tinymce4_custom_buttons1', 'undo redo | cut copy paste | searchreplace | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent blockquote | styleselect'),
	('tinymce4_custom_buttons2', 'link unlink anchor image media codesample table | hr removeformat | subscript superscript charmap | nonbreaking | visualchars visualblocks print preview fullscreen code'),
	('tinymce4_custom_buttons3', ''),
	('tinymce4_custom_buttons4', ''),
	('tinymce4_blockFormats', 'Paragraph=p;Header 1=h1;Header 2=h2;Header 3=h3'),
	('allow_eval', 'with_scan'),
	('safe_functions_at_eval', 'time,date,strtotime,strftime'),
	('check_files_onlogin', 'index.php\r\n.htaccess\r\nmanager/index.php\r\nmanager/includes/config.inc.php'),
	('error_reporting', '1'),
	('send_errormail', '0'),
	('pwd_hash_algo', 'UNCRYPT'),
	('reload_captcha_words', ''),
	('captcha_words_default', 'MODX,Access,Better,BitCode,Chunk,Cache,Desc,Design,Excell,Enjoy,URLs,TechView,Gerald,Griff,Humphrey,Holiday,Intel,Integration,Joystick,Join(),Oscope,Genetic,Light,Likeness,Marit,Maaike,Niche,Netherlands,Ordinance,Oscillo,Parser,Phusion,Query,Question,Regalia,Righteous,Snippet,Sentinel,Template,Thespian,Unity,Enterprise,Verily,Tattoo,Veri,Website,WideWeb,Yap,Yellow,Zebra,Zygote'),
	('rb_webuser', '0'),
	('lang_code', 'ru'),
	('sys_files_checksum', 'a:4:{s:36:"C:/OpenServer/domains/modx/index.php";s:32:"c16a5692a22a2b08c6def0c52c9f5616";s:36:"C:/OpenServer/domains/modx/.htaccess";s:32:"bc36bc59752f0852a763c5b50be6dc1e";s:44:"C:/OpenServer/domains/modx/manager/index.php";s:32:"236f68dad4d8ac0166aa78290b107f1f";s:58:"C:/OpenServer/domains/modx/manager/includes/config.inc.php";s:32:"127a1b7fbe321f5ac11277f581b0d74c";}');
/*!40000 ALTER TABLE `modx_system_settings` ENABLE KEYS */;


-- Дамп структуры для таблица wotch.modx_user_attributes
DROP TABLE IF EXISTS `modx_user_attributes`;
CREATE TABLE IF NOT EXISTS `modx_user_attributes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `internalKey` int(10) NOT NULL DEFAULT '0',
  `fullname` varchar(100) NOT NULL DEFAULT '',
  `role` int(10) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(100) NOT NULL DEFAULT '',
  `mobilephone` varchar(100) NOT NULL DEFAULT '',
  `blocked` int(1) NOT NULL DEFAULT '0',
  `blockeduntil` int(11) NOT NULL DEFAULT '0',
  `blockedafter` int(11) NOT NULL DEFAULT '0',
  `logincount` int(11) NOT NULL DEFAULT '0',
  `lastlogin` int(11) NOT NULL DEFAULT '0',
  `thislogin` int(11) NOT NULL DEFAULT '0',
  `failedlogincount` int(10) NOT NULL DEFAULT '0',
  `sessionid` varchar(100) NOT NULL DEFAULT '',
  `dob` int(10) NOT NULL DEFAULT '0',
  `gender` int(1) NOT NULL DEFAULT '0' COMMENT '0 - unknown, 1 - Male 2 - female',
  `country` varchar(5) NOT NULL DEFAULT '',
  `street` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(25) NOT NULL DEFAULT '',
  `zip` varchar(25) NOT NULL DEFAULT '',
  `fax` varchar(100) NOT NULL DEFAULT '',
  `photo` varchar(255) NOT NULL DEFAULT '' COMMENT 'link to photo',
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `userid` (`internalKey`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=84 COMMENT='Contains information about the backend users.';

-- Дамп данных таблицы wotch.modx_user_attributes: 1 rows
/*!40000 ALTER TABLE `modx_user_attributes` DISABLE KEYS */;
INSERT INTO `modx_user_attributes` (`id`, `internalKey`, `fullname`, `role`, `email`, `phone`, `mobilephone`, `blocked`, `blockeduntil`, `blockedafter`, `logincount`, `lastlogin`, `thislogin`, `failedlogincount`, `sessionid`, `dob`, `gender`, `country`, `street`, `city`, `state`, `zip`, `fax`, `photo`, `comment`) VALUES
	(1, 1, 'Admin', 1, 'ipra-8@mail.ru', '', '', 0, 0, 0, 10, 1492444399, 1492512075, 0, '2v3oth5hmsf3i7ehjamiagjg43', 0, 0, '', '', '', '', '', '', '', '');
/*!40000 ALTER TABLE `modx_user_attributes` ENABLE KEYS */;


-- Дамп структуры для таблица wotch.modx_user_messages
DROP TABLE IF EXISTS `modx_user_messages`;
CREATE TABLE IF NOT EXISTS `modx_user_messages` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(15) NOT NULL DEFAULT '',
  `subject` varchar(60) NOT NULL DEFAULT '',
  `message` text,
  `sender` int(10) NOT NULL DEFAULT '0',
  `recipient` int(10) NOT NULL DEFAULT '0',
  `private` tinyint(4) NOT NULL DEFAULT '0',
  `postdate` int(20) NOT NULL DEFAULT '0',
  `messageread` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains messages for the Content Manager messaging system.';

-- Дамп данных таблицы wotch.modx_user_messages: 0 rows
/*!40000 ALTER TABLE `modx_user_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_user_messages` ENABLE KEYS */;


-- Дамп структуры для таблица wotch.modx_user_roles
DROP TABLE IF EXISTS `modx_user_roles`;
CREATE TABLE IF NOT EXISTS `modx_user_roles` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `frames` int(1) NOT NULL DEFAULT '0',
  `home` int(1) NOT NULL DEFAULT '0',
  `view_document` int(1) NOT NULL DEFAULT '0',
  `new_document` int(1) NOT NULL DEFAULT '0',
  `save_document` int(1) NOT NULL DEFAULT '0',
  `publish_document` int(1) NOT NULL DEFAULT '0',
  `delete_document` int(1) NOT NULL DEFAULT '0',
  `empty_trash` int(1) NOT NULL DEFAULT '0',
  `action_ok` int(1) NOT NULL DEFAULT '0',
  `logout` int(1) NOT NULL DEFAULT '0',
  `help` int(1) NOT NULL DEFAULT '0',
  `messages` int(1) NOT NULL DEFAULT '0',
  `new_user` int(1) NOT NULL DEFAULT '0',
  `edit_user` int(1) NOT NULL DEFAULT '0',
  `logs` int(1) NOT NULL DEFAULT '0',
  `edit_parser` int(1) NOT NULL DEFAULT '0',
  `save_parser` int(1) NOT NULL DEFAULT '0',
  `edit_template` int(1) NOT NULL DEFAULT '0',
  `settings` int(1) NOT NULL DEFAULT '0',
  `credits` int(1) NOT NULL DEFAULT '0',
  `new_template` int(1) NOT NULL DEFAULT '0',
  `save_template` int(1) NOT NULL DEFAULT '0',
  `delete_template` int(1) NOT NULL DEFAULT '0',
  `edit_snippet` int(1) NOT NULL DEFAULT '0',
  `new_snippet` int(1) NOT NULL DEFAULT '0',
  `save_snippet` int(1) NOT NULL DEFAULT '0',
  `delete_snippet` int(1) NOT NULL DEFAULT '0',
  `edit_chunk` int(1) NOT NULL DEFAULT '0',
  `new_chunk` int(1) NOT NULL DEFAULT '0',
  `save_chunk` int(1) NOT NULL DEFAULT '0',
  `delete_chunk` int(1) NOT NULL DEFAULT '0',
  `empty_cache` int(1) NOT NULL DEFAULT '0',
  `edit_document` int(1) NOT NULL DEFAULT '0',
  `change_password` int(1) NOT NULL DEFAULT '0',
  `error_dialog` int(1) NOT NULL DEFAULT '0',
  `about` int(1) NOT NULL DEFAULT '0',
  `file_manager` int(1) NOT NULL DEFAULT '0',
  `assets_files` int(1) NOT NULL DEFAULT '0',
  `assets_images` int(1) NOT NULL DEFAULT '0',
  `save_user` int(1) NOT NULL DEFAULT '0',
  `delete_user` int(1) NOT NULL DEFAULT '0',
  `save_password` int(11) NOT NULL DEFAULT '0',
  `edit_role` int(1) NOT NULL DEFAULT '0',
  `save_role` int(1) NOT NULL DEFAULT '0',
  `delete_role` int(1) NOT NULL DEFAULT '0',
  `new_role` int(1) NOT NULL DEFAULT '0',
  `access_permissions` int(1) NOT NULL DEFAULT '0',
  `bk_manager` int(1) NOT NULL DEFAULT '0',
  `new_plugin` int(1) NOT NULL DEFAULT '0',
  `edit_plugin` int(1) NOT NULL DEFAULT '0',
  `save_plugin` int(1) NOT NULL DEFAULT '0',
  `delete_plugin` int(1) NOT NULL DEFAULT '0',
  `new_module` int(1) NOT NULL DEFAULT '0',
  `edit_module` int(1) NOT NULL DEFAULT '0',
  `save_module` int(1) NOT NULL DEFAULT '0',
  `delete_module` int(1) NOT NULL DEFAULT '0',
  `exec_module` int(1) NOT NULL DEFAULT '0',
  `view_eventlog` int(1) NOT NULL DEFAULT '0',
  `delete_eventlog` int(1) NOT NULL DEFAULT '0',
  `manage_metatags` int(1) NOT NULL DEFAULT '0' COMMENT 'manage site meta tags and keywords',
  `edit_doc_metatags` int(1) NOT NULL DEFAULT '0' COMMENT 'edit document meta tags and keywords',
  `new_web_user` int(1) NOT NULL DEFAULT '0',
  `edit_web_user` int(1) NOT NULL DEFAULT '0',
  `save_web_user` int(1) NOT NULL DEFAULT '0',
  `delete_web_user` int(1) NOT NULL DEFAULT '0',
  `web_access_permissions` int(1) NOT NULL DEFAULT '0',
  `view_unpublished` int(1) NOT NULL DEFAULT '0',
  `import_static` int(1) NOT NULL DEFAULT '0',
  `export_static` int(1) NOT NULL DEFAULT '0',
  `remove_locks` int(1) NOT NULL DEFAULT '0',
  `display_locks` int(1) NOT NULL DEFAULT '0',
  `change_resourcetype` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=278 COMMENT='Contains information describing the user roles.';

-- Дамп данных таблицы wotch.modx_user_roles: 3 rows
/*!40000 ALTER TABLE `modx_user_roles` DISABLE KEYS */;
INSERT INTO `modx_user_roles` (`id`, `name`, `description`, `frames`, `home`, `view_document`, `new_document`, `save_document`, `publish_document`, `delete_document`, `empty_trash`, `action_ok`, `logout`, `help`, `messages`, `new_user`, `edit_user`, `logs`, `edit_parser`, `save_parser`, `edit_template`, `settings`, `credits`, `new_template`, `save_template`, `delete_template`, `edit_snippet`, `new_snippet`, `save_snippet`, `delete_snippet`, `edit_chunk`, `new_chunk`, `save_chunk`, `delete_chunk`, `empty_cache`, `edit_document`, `change_password`, `error_dialog`, `about`, `file_manager`, `assets_files`, `assets_images`, `save_user`, `delete_user`, `save_password`, `edit_role`, `save_role`, `delete_role`, `new_role`, `access_permissions`, `bk_manager`, `new_plugin`, `edit_plugin`, `save_plugin`, `delete_plugin`, `new_module`, `edit_module`, `save_module`, `delete_module`, `exec_module`, `view_eventlog`, `delete_eventlog`, `manage_metatags`, `edit_doc_metatags`, `new_web_user`, `edit_web_user`, `save_web_user`, `delete_web_user`, `web_access_permissions`, `view_unpublished`, `import_static`, `export_static`, `remove_locks`, `display_locks`, `change_resourcetype`) VALUES
	(2, 'Editor', 'Limited to managing content', 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1),
	(3, 'Publisher', 'Editor with expanded permissions including manage users, update Elements and site settings', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1),
	(1, 'Administrator', 'Site administrators have full access to all functions', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
/*!40000 ALTER TABLE `modx_user_roles` ENABLE KEYS */;


-- Дамп структуры для таблица wotch.modx_user_settings
DROP TABLE IF EXISTS `modx_user_settings`;
CREATE TABLE IF NOT EXISTS `modx_user_settings` (
  `user` int(11) NOT NULL,
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text,
  PRIMARY KEY (`user`,`setting_name`),
  KEY `setting_name` (`setting_name`),
  KEY `user` (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains backend user settings.';

-- Дамп данных таблицы wotch.modx_user_settings: 0 rows
/*!40000 ALTER TABLE `modx_user_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_user_settings` ENABLE KEYS */;


-- Дамп структуры для таблица wotch.modx_webgroup_access
DROP TABLE IF EXISTS `modx_webgroup_access`;
CREATE TABLE IF NOT EXISTS `modx_webgroup_access` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `webgroup` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=13 COMMENT='Contains data used for web access permissions.';

-- Дамп данных таблицы wotch.modx_webgroup_access: 1 rows
/*!40000 ALTER TABLE `modx_webgroup_access` DISABLE KEYS */;
INSERT INTO `modx_webgroup_access` (`id`, `webgroup`, `documentgroup`) VALUES
	(2, 2, 2);
/*!40000 ALTER TABLE `modx_webgroup_access` ENABLE KEYS */;


-- Дамп структуры для таблица wotch.modx_webgroup_names
DROP TABLE IF EXISTS `modx_webgroup_names`;
CREATE TABLE IF NOT EXISTS `modx_webgroup_names` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(245) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=20 COMMENT='Contains data used for web access permissions.';

-- Дамп данных таблицы wotch.modx_webgroup_names: 1 rows
/*!40000 ALTER TABLE `modx_webgroup_names` DISABLE KEYS */;
INSERT INTO `modx_webgroup_names` (`id`, `name`) VALUES
	(2, 'webusers');
/*!40000 ALTER TABLE `modx_webgroup_names` ENABLE KEYS */;


-- Дамп структуры для таблица wotch.modx_web_groups
DROP TABLE IF EXISTS `modx_web_groups`;
CREATE TABLE IF NOT EXISTS `modx_web_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `webgroup` int(10) NOT NULL DEFAULT '0',
  `webuser` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_group_user` (`webgroup`,`webuser`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for web access permissions.';

-- Дамп данных таблицы wotch.modx_web_groups: 0 rows
/*!40000 ALTER TABLE `modx_web_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_web_groups` ENABLE KEYS */;


-- Дамп структуры для таблица wotch.modx_web_users
DROP TABLE IF EXISTS `modx_web_users`;
CREATE TABLE IF NOT EXISTS `modx_web_users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `cachepwd` varchar(100) NOT NULL DEFAULT '' COMMENT 'Store new unconfirmed password',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=60;

-- Дамп данных таблицы wotch.modx_web_users: 2 rows
/*!40000 ALTER TABLE `modx_web_users` DISABLE KEYS */;
INSERT INTO `modx_web_users` (`id`, `username`, `password`, `cachepwd`) VALUES
	(1, '109141084637326271700@plus.google.com', '0f9d94709990', ''),
	(2, 'igor', '781f6c7a5ae16e9c324c2b8e2123e7b9', '');
/*!40000 ALTER TABLE `modx_web_users` ENABLE KEYS */;


-- Дамп структуры для таблица wotch.modx_web_user_attributes
DROP TABLE IF EXISTS `modx_web_user_attributes`;
CREATE TABLE IF NOT EXISTS `modx_web_user_attributes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `internalKey` int(10) NOT NULL DEFAULT '0',
  `fullname` varchar(100) NOT NULL DEFAULT '',
  `role` int(10) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(100) NOT NULL DEFAULT '',
  `mobilephone` varchar(100) NOT NULL DEFAULT '',
  `blocked` int(1) NOT NULL DEFAULT '0',
  `blockeduntil` int(11) NOT NULL DEFAULT '0',
  `blockedafter` int(11) NOT NULL DEFAULT '0',
  `logincount` int(11) NOT NULL DEFAULT '0',
  `lastlogin` int(11) NOT NULL DEFAULT '0',
  `thislogin` int(11) NOT NULL DEFAULT '0',
  `failedlogincount` int(10) NOT NULL DEFAULT '0',
  `sessionid` varchar(100) NOT NULL DEFAULT '',
  `dob` int(10) NOT NULL DEFAULT '0',
  `gender` int(1) NOT NULL DEFAULT '0' COMMENT '0 - unknown, 1 - Male 2 - female',
  `country` varchar(25) NOT NULL DEFAULT '',
  `street` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(25) NOT NULL DEFAULT '',
  `zip` varchar(25) NOT NULL DEFAULT '',
  `fax` varchar(100) NOT NULL DEFAULT '',
  `photo` varchar(255) NOT NULL DEFAULT '' COMMENT 'link to photo',
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `userid` (`internalKey`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=188 COMMENT='Contains information for web users.';

-- Дамп данных таблицы wotch.modx_web_user_attributes: 2 rows
/*!40000 ALTER TABLE `modx_web_user_attributes` DISABLE KEYS */;
INSERT INTO `modx_web_user_attributes` (`id`, `internalKey`, `fullname`, `role`, `email`, `phone`, `mobilephone`, `blocked`, `blockeduntil`, `blockedafter`, `logincount`, `lastlogin`, `thislogin`, `failedlogincount`, `sessionid`, `dob`, `gender`, `country`, `street`, `city`, `state`, `zip`, `fax`, `photo`, `comment`) VALUES
	(1, 1, 'ipra ipra', 0, 'iprahtc2@gmail.com', '', '', 0, 0, 0, 1, 0, 1492444194, 0, 'tb41qb0rih3ucs5p6qo1rv8773', 0, 0, '', '', '', '', '', '', 'https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg?sz=50', ''),
	(2, 2, 'Igor Didenko', 0, 'igorded1991@yandex.ru', '+380969063656', '+380969063656', 0, 0, 0, 0, 0, 0, 0, '', 680734800, 1, '81', 'Meleshkina bla bla bla', 'Berlin', 'Sachsen', '500505', '', '', '');
/*!40000 ALTER TABLE `modx_web_user_attributes` ENABLE KEYS */;


-- Дамп структуры для таблица wotch.modx_web_user_settings
DROP TABLE IF EXISTS `modx_web_user_settings`;
CREATE TABLE IF NOT EXISTS `modx_web_user_settings` (
  `webuser` int(11) NOT NULL,
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text,
  PRIMARY KEY (`webuser`,`setting_name`),
  KEY `setting_name` (`setting_name`),
  KEY `webuserid` (`webuser`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains web user settings.';

-- Дамп данных таблицы wotch.modx_web_user_settings: 0 rows
/*!40000 ALTER TABLE `modx_web_user_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `modx_web_user_settings` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
