--
-- Скрипт сгенерирован Devart dbForge Studio for MySQL, Версия 7.2.58.0
-- Домашняя страница продукта: http://www.devart.com/ru/dbforge/mysql/studio
-- Дата скрипта: 09.05.2017 18:55:42
-- Версия сервера: 5.5.52-MariaDB-cll-lve
-- Версия клиента: 4.1
--


-- 
-- Отключение внешних ключей
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Установить режим SQL (SQL mode)
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Установка кодировки, с использованием которой клиент будет посылать запросы на сервер
--
SET NAMES 'utf8';

-- 
-- Установка базы данных по умолчанию
--
USE ibase_woch;

--
-- Описание для таблицы modx_active_user_locks
--
DROP TABLE IF EXISTS modx_active_user_locks;
CREATE TABLE modx_active_user_locks (
  id INT(10) NOT NULL AUTO_INCREMENT,
  sid VARCHAR(32) NOT NULL DEFAULT '',
  internalKey INT(9) NOT NULL DEFAULT 0,
  elementType INT(1) NOT NULL DEFAULT 0,
  elementId INT(10) NOT NULL DEFAULT 0,
  lasthit INT(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (id),
  UNIQUE INDEX ix_element_id (elementType, elementId, sid)
)
ENGINE = MYISAM
AUTO_INCREMENT = 731
AVG_ROW_LENGTH = 64
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Contains data about locked elements.';

--
-- Описание для таблицы modx_active_user_sessions
--
DROP TABLE IF EXISTS modx_active_user_sessions;
CREATE TABLE modx_active_user_sessions (
  sid VARCHAR(32) NOT NULL DEFAULT '',
  internalKey INT(9) NOT NULL DEFAULT 0,
  lasthit INT(20) NOT NULL DEFAULT 0,
  ip VARCHAR(50) NOT NULL DEFAULT '',
  PRIMARY KEY (sid)
)
ENGINE = MYISAM
AVG_ROW_LENGTH = 52
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Contains data about valid user sessions.';

--
-- Описание для таблицы modx_active_users
--
DROP TABLE IF EXISTS modx_active_users;
CREATE TABLE modx_active_users (
  sid VARCHAR(32) NOT NULL DEFAULT '',
  internalKey INT(9) NOT NULL DEFAULT 0,
  username VARCHAR(50) NOT NULL DEFAULT '',
  lasthit INT(20) NOT NULL DEFAULT 0,
  action VARCHAR(10) NOT NULL DEFAULT '',
  id INT(10) DEFAULT NULL,
  PRIMARY KEY (sid)
)
ENGINE = MYISAM
AVG_ROW_LENGTH = 68
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Contains data about last user action.';

--
-- Описание для таблицы modx_categories
--
DROP TABLE IF EXISTS modx_categories;
CREATE TABLE modx_categories (
  id INT(11) NOT NULL AUTO_INCREMENT,
  category VARCHAR(45) NOT NULL DEFAULT '',
  PRIMARY KEY (id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 11
AVG_ROW_LENGTH = 21
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Categories to be used snippets,tv,chunks, etc';

--
-- Описание для таблицы modx_data_feedback
--
DROP TABLE IF EXISTS modx_data_feedback;
CREATE TABLE modx_data_feedback (
  id INT(11) NOT NULL,
  date VARCHAR(50) NOT NULL,
  phone VARCHAR(20) NOT NULL,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  id_product INT(11) NOT NULL DEFAULT 0,
  name_product TEXT NOT NULL,
  price VARCHAR(100) NOT NULL,
  ip VARCHAR(50) NOT NULL,
  url TEXT NOT NULL,
  count INT(11) NOT NULL DEFAULT 1,
  sum TEXT NOT NULL,
  currency VARCHAR(20) NOT NULL,
  comment TEXT NOT NULL,
  user_comment TEXT NOT NULL,
  status INT(11) NOT NULL DEFAULT 0,
  additional_values TEXT NOT NULL,
  type_module VARCHAR(20) NOT NULL
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы modx_data_feedback_config
--
DROP TABLE IF EXISTS modx_data_feedback_config;
CREATE TABLE modx_data_feedback_config (
  id INT(11) NOT NULL,
  type_module VARCHAR(20) NOT NULL,
  name TEXT NOT NULL,
  value TEXT NOT NULL
)
ENGINE = INNODB
AVG_ROW_LENGTH = 1365
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы modx_document_groups
--
DROP TABLE IF EXISTS modx_document_groups;
CREATE TABLE modx_document_groups (
  id INT(10) NOT NULL AUTO_INCREMENT,
  document_group INT(10) NOT NULL DEFAULT 0,
  document INT(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (id),
  INDEX document (document),
  INDEX document_group (document_group)
)
ENGINE = MYISAM
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Contains data used for access permissions.';

--
-- Описание для таблицы modx_documentgroup_names
--
DROP TABLE IF EXISTS modx_documentgroup_names;
CREATE TABLE modx_documentgroup_names (
  id INT(10) NOT NULL AUTO_INCREMENT,
  name VARCHAR(245) NOT NULL DEFAULT '',
  private_memgroup TINYINT(4) DEFAULT 0 COMMENT 'determine whether the document group is private to manager users',
  private_webgroup TINYINT(4) DEFAULT 0 COMMENT 'determines whether the document is private to web users',
  PRIMARY KEY (id),
  UNIQUE INDEX name (name)
)
ENGINE = MYISAM
AUTO_INCREMENT = 3
AVG_ROW_LENGTH = 20
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Contains data used for access permissions.';

--
-- Описание для таблицы modx_event_log
--
DROP TABLE IF EXISTS modx_event_log;
CREATE TABLE modx_event_log (
  id INT(11) NOT NULL AUTO_INCREMENT,
  eventid INT(11) DEFAULT 0,
  createdon INT(11) NOT NULL DEFAULT 0,
  type TINYINT(4) NOT NULL DEFAULT 1 COMMENT '1- information, 2 - warning, 3- error',
  user INT(11) NOT NULL DEFAULT 0 COMMENT 'link to user table',
  usertype TINYINT(4) NOT NULL DEFAULT 0 COMMENT '0 - manager, 1 - web',
  source VARCHAR(50) NOT NULL DEFAULT '',
  description TEXT DEFAULT NULL,
  PRIMARY KEY (id),
  INDEX user (user)
)
ENGINE = MYISAM
AUTO_INCREMENT = 43
AVG_ROW_LENGTH = 881
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Stores event and error logs';

--
-- Описание для таблицы modx_keyword_xref
--
DROP TABLE IF EXISTS modx_keyword_xref;
CREATE TABLE modx_keyword_xref (
  content_id INT(11) NOT NULL DEFAULT 0,
  keyword_id INT(11) NOT NULL DEFAULT 0,
  INDEX content_id (content_id),
  INDEX keyword_id (keyword_id)
)
ENGINE = MYISAM
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Cross reference bewteen keywords and content';

--
-- Описание для таблицы modx_log_history
--
DROP TABLE IF EXISTS modx_log_history;
CREATE TABLE modx_log_history (
  id INT(11) NOT NULL AUTO_INCREMENT,
  user_name VARCHAR(100) NOT NULL,
  ip VARCHAR(100) DEFAULT NULL,
  stamp INT(11) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 13
AVG_ROW_LENGTH = 16384
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы modx_manager_log
--
DROP TABLE IF EXISTS modx_manager_log;
CREATE TABLE modx_manager_log (
  id INT(10) NOT NULL AUTO_INCREMENT,
  timestamp INT(20) NOT NULL DEFAULT 0,
  internalKey INT(10) NOT NULL DEFAULT 0,
  username VARCHAR(255) DEFAULT NULL,
  action INT(10) NOT NULL DEFAULT 0,
  itemid VARCHAR(10) DEFAULT '0',
  itemname VARCHAR(255) DEFAULT NULL,
  message VARCHAR(255) NOT NULL DEFAULT '',
  PRIMARY KEY (id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 1870
AVG_ROW_LENGTH = 46
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Contains a record of user interaction.';

--
-- Описание для таблицы modx_manager_users
--
DROP TABLE IF EXISTS modx_manager_users;
CREATE TABLE modx_manager_users (
  id INT(10) NOT NULL AUTO_INCREMENT,
  username VARCHAR(100) NOT NULL DEFAULT '',
  password VARCHAR(100) NOT NULL DEFAULT '',
  PRIMARY KEY (id),
  UNIQUE INDEX username (username)
)
ENGINE = MYISAM
AUTO_INCREMENT = 3
AVG_ROW_LENGTH = 68
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Contains login information for backend users.';

--
-- Описание для таблицы modx_member_groups
--
DROP TABLE IF EXISTS modx_member_groups;
CREATE TABLE modx_member_groups (
  id INT(10) NOT NULL AUTO_INCREMENT,
  user_group INT(10) NOT NULL DEFAULT 0,
  member INT(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (id),
  UNIQUE INDEX ix_group_member (user_group, member)
)
ENGINE = MYISAM
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Contains data used for access permissions.';

--
-- Описание для таблицы modx_membergroup_access
--
DROP TABLE IF EXISTS modx_membergroup_access;
CREATE TABLE modx_membergroup_access (
  id INT(10) NOT NULL AUTO_INCREMENT,
  membergroup INT(10) NOT NULL DEFAULT 0,
  documentgroup INT(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Contains data used for access permissions.';

--
-- Описание для таблицы modx_membergroup_names
--
DROP TABLE IF EXISTS modx_membergroup_names;
CREATE TABLE modx_membergroup_names (
  id INT(10) NOT NULL AUTO_INCREMENT,
  name VARCHAR(245) NOT NULL DEFAULT '',
  PRIMARY KEY (id),
  UNIQUE INDEX name (name)
)
ENGINE = MYISAM
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Contains data used for access permissions.';

--
-- Описание для таблицы modx_site_content
--
DROP TABLE IF EXISTS modx_site_content;
CREATE TABLE modx_site_content (
  id INT(10) NOT NULL AUTO_INCREMENT,
  type VARCHAR(20) NOT NULL DEFAULT 'document',
  contentType VARCHAR(50) NOT NULL DEFAULT 'text/html',
  pagetitle VARCHAR(255) NOT NULL DEFAULT '',
  longtitle VARCHAR(255) NOT NULL DEFAULT '',
  description VARCHAR(255) NOT NULL DEFAULT '',
  alias VARCHAR(245) DEFAULT '',
  link_attributes VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Link attriubtes',
  published INT(1) NOT NULL DEFAULT 0,
  pub_date INT(20) NOT NULL DEFAULT 0,
  unpub_date INT(20) NOT NULL DEFAULT 0,
  parent INT(10) NOT NULL DEFAULT 0,
  isfolder INT(1) NOT NULL DEFAULT 0,
  introtext TEXT DEFAULT NULL COMMENT 'Used to provide quick summary of the document',
  content MEDIUMTEXT DEFAULT NULL,
  richtext TINYINT(1) NOT NULL DEFAULT 1,
  template INT(10) NOT NULL DEFAULT 0,
  menuindex INT(10) NOT NULL DEFAULT 0,
  searchable INT(1) NOT NULL DEFAULT 1,
  cacheable INT(1) NOT NULL DEFAULT 1,
  createdby INT(10) NOT NULL DEFAULT 0,
  createdon INT(20) NOT NULL DEFAULT 0,
  editedby INT(10) NOT NULL DEFAULT 0,
  editedon INT(20) NOT NULL DEFAULT 0,
  deleted INT(1) NOT NULL DEFAULT 0,
  deletedon INT(20) NOT NULL DEFAULT 0,
  deletedby INT(10) NOT NULL DEFAULT 0,
  publishedon INT(20) NOT NULL DEFAULT 0 COMMENT 'Date the document was published',
  publishedby INT(10) NOT NULL DEFAULT 0 COMMENT 'ID of user who published the document',
  menutitle VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Menu title',
  donthit TINYINT(1) NOT NULL DEFAULT 0 COMMENT 'Disable page hit count',
  haskeywords TINYINT(1) NOT NULL DEFAULT 0 COMMENT 'has links to keywords',
  hasmetatags TINYINT(1) NOT NULL DEFAULT 0 COMMENT 'has links to meta tags',
  privateweb TINYINT(1) NOT NULL DEFAULT 0 COMMENT 'Private web document',
  privatemgr TINYINT(1) NOT NULL DEFAULT 0 COMMENT 'Private manager document',
  content_dispo TINYINT(1) NOT NULL DEFAULT 0 COMMENT '0-inline, 1-attachment',
  hidemenu TINYINT(1) NOT NULL DEFAULT 0 COMMENT 'Hide document from menu',
  alias_visible INT(2) NOT NULL DEFAULT 1,
  PRIMARY KEY (id),
  INDEX aliasidx (alias),
  FULLTEXT INDEX content_ft_idx (pagetitle, description, content),
  INDEX id (id),
  INDEX parent (parent),
  INDEX typeidx (type)
)
ENGINE = MYISAM
AUTO_INCREMENT = 6
AVG_ROW_LENGTH = 92
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Contains the site document tree.';

--
-- Описание для таблицы modx_site_content_metatags
--
DROP TABLE IF EXISTS modx_site_content_metatags;
CREATE TABLE modx_site_content_metatags (
  content_id INT(11) NOT NULL DEFAULT 0,
  metatag_id INT(11) NOT NULL DEFAULT 0,
  INDEX content_id (content_id),
  INDEX metatag_id (metatag_id)
)
ENGINE = MYISAM
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Reference table between meta tags and content';

--
-- Описание для таблицы modx_site_htmlsnippets
--
DROP TABLE IF EXISTS modx_site_htmlsnippets;
CREATE TABLE modx_site_htmlsnippets (
  id INT(10) NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL DEFAULT '',
  description VARCHAR(255) NOT NULL DEFAULT 'Chunk',
  editor_type INT(11) NOT NULL DEFAULT 0 COMMENT '0-plain text,1-rich text,2-code editor',
  editor_name VARCHAR(50) NOT NULL DEFAULT 'none',
  category INT(11) NOT NULL DEFAULT 0 COMMENT 'category id',
  cache_type TINYINT(1) NOT NULL DEFAULT 0 COMMENT 'Cache option',
  snippet MEDIUMTEXT DEFAULT NULL,
  locked TINYINT(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 14
AVG_ROW_LENGTH = 645
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Contains the site chunks.';

--
-- Описание для таблицы modx_site_keywords
--
DROP TABLE IF EXISTS modx_site_keywords;
CREATE TABLE modx_site_keywords (
  id INT(11) NOT NULL AUTO_INCREMENT,
  keyword VARCHAR(40) NOT NULL DEFAULT '',
  PRIMARY KEY (id),
  UNIQUE INDEX keyword (keyword)
)
ENGINE = MYISAM
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Site keyword list';

--
-- Описание для таблицы modx_site_metatags
--
DROP TABLE IF EXISTS modx_site_metatags;
CREATE TABLE modx_site_metatags (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL DEFAULT '',
  tag VARCHAR(50) NOT NULL DEFAULT '' COMMENT 'tag name',
  tagvalue VARCHAR(255) NOT NULL DEFAULT '',
  http_equiv TINYINT(4) NOT NULL DEFAULT 0 COMMENT '1 - use http_equiv tag style, 0 - use name',
  PRIMARY KEY (id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Site meta tags';

--
-- Описание для таблицы modx_site_module_access
--
DROP TABLE IF EXISTS modx_site_module_access;
CREATE TABLE modx_site_module_access (
  id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  module INT(11) NOT NULL DEFAULT 0,
  usergroup INT(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Module users group access permission';

--
-- Описание для таблицы modx_site_module_depobj
--
DROP TABLE IF EXISTS modx_site_module_depobj;
CREATE TABLE modx_site_module_depobj (
  id INT(11) NOT NULL AUTO_INCREMENT,
  module INT(11) NOT NULL DEFAULT 0,
  resource INT(11) NOT NULL DEFAULT 0,
  type INT(2) NOT NULL DEFAULT 0 COMMENT '10-chunks, 20-docs, 30-plugins, 40-snips, 50-tpls, 60-tvs',
  PRIMARY KEY (id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Module Dependencies';

--
-- Описание для таблицы modx_site_modules
--
DROP TABLE IF EXISTS modx_site_modules;
CREATE TABLE modx_site_modules (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL DEFAULT '',
  description VARCHAR(255) NOT NULL DEFAULT '0',
  editor_type INT(11) NOT NULL DEFAULT 0 COMMENT '0-plain text,1-rich text,2-code editor',
  disabled TINYINT(4) NOT NULL DEFAULT 0,
  category INT(11) NOT NULL DEFAULT 0 COMMENT 'category id',
  wrap TINYINT(4) NOT NULL DEFAULT 0,
  locked TINYINT(4) NOT NULL DEFAULT 0,
  icon VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'url to module icon',
  enable_resource TINYINT(4) NOT NULL DEFAULT 0 COMMENT 'enables the resource file feature',
  resourcefile VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'a physical link to a resource file',
  createdon INT(11) NOT NULL DEFAULT 0,
  editedon INT(11) NOT NULL DEFAULT 0,
  guid VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'globally unique identifier',
  enable_sharedparams TINYINT(4) NOT NULL DEFAULT 0,
  properties TEXT DEFAULT NULL,
  modulecode MEDIUMTEXT DEFAULT NULL COMMENT 'module boot up code',
  PRIMARY KEY (id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 3
AVG_ROW_LENGTH = 1068
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Site Modules';

--
-- Описание для таблицы modx_site_plugin_events
--
DROP TABLE IF EXISTS modx_site_plugin_events;
CREATE TABLE modx_site_plugin_events (
  pluginid INT(10) NOT NULL,
  evtid INT(10) NOT NULL DEFAULT 0,
  priority INT(10) NOT NULL DEFAULT 0 COMMENT 'determines plugin run order',
  PRIMARY KEY (pluginid, evtid)
)
ENGINE = MYISAM
AVG_ROW_LENGTH = 13
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Links to system events';

--
-- Описание для таблицы modx_site_plugins
--
DROP TABLE IF EXISTS modx_site_plugins;
CREATE TABLE modx_site_plugins (
  id INT(10) NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL DEFAULT '',
  description VARCHAR(255) NOT NULL DEFAULT 'Plugin',
  editor_type INT(11) NOT NULL DEFAULT 0 COMMENT '0-plain text,1-rich text,2-code editor',
  category INT(11) NOT NULL DEFAULT 0 COMMENT 'category id',
  cache_type TINYINT(1) NOT NULL DEFAULT 0 COMMENT 'Cache option',
  plugincode MEDIUMTEXT DEFAULT NULL,
  locked TINYINT(4) NOT NULL DEFAULT 0,
  properties TEXT DEFAULT NULL COMMENT 'Default Properties',
  disabled TINYINT(4) NOT NULL DEFAULT 0 COMMENT 'Disables the plugin',
  moduleguid VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'GUID of module from which to import shared parameters',
  PRIMARY KEY (id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 9
AVG_ROW_LENGTH = 1459
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Contains the site plugins.';

--
-- Описание для таблицы modx_site_snippets
--
DROP TABLE IF EXISTS modx_site_snippets;
CREATE TABLE modx_site_snippets (
  id INT(10) NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL DEFAULT '',
  description VARCHAR(255) NOT NULL DEFAULT 'Snippet',
  editor_type INT(11) NOT NULL DEFAULT 0 COMMENT '0-plain text,1-rich text,2-code editor',
  category INT(11) NOT NULL DEFAULT 0 COMMENT 'category id',
  cache_type TINYINT(1) NOT NULL DEFAULT 0 COMMENT 'Cache option',
  snippet MEDIUMTEXT DEFAULT NULL,
  locked TINYINT(4) NOT NULL DEFAULT 0,
  properties TEXT DEFAULT NULL COMMENT 'Default Properties',
  moduleguid VARCHAR(32) NOT NULL DEFAULT '' COMMENT 'GUID of module from which to import shared parameters',
  PRIMARY KEY (id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 20
AVG_ROW_LENGTH = 249
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Contains the site snippets.';

--
-- Описание для таблицы modx_site_templates
--
DROP TABLE IF EXISTS modx_site_templates;
CREATE TABLE modx_site_templates (
  id INT(10) NOT NULL AUTO_INCREMENT,
  templatename VARCHAR(100) NOT NULL DEFAULT '',
  description VARCHAR(255) NOT NULL DEFAULT 'Template',
  editor_type INT(11) NOT NULL DEFAULT 0 COMMENT '0-plain text,1-rich text,2-code editor',
  category INT(11) NOT NULL DEFAULT 0 COMMENT 'category id',
  icon VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'url to icon file',
  template_type INT(11) NOT NULL DEFAULT 0 COMMENT '0-page,1-content',
  content MEDIUMTEXT DEFAULT NULL,
  locked TINYINT(4) NOT NULL DEFAULT 0,
  selectable TINYINT(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 8
AVG_ROW_LENGTH = 4742
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Contains the site templates.';

--
-- Описание для таблицы modx_site_tmplvar_access
--
DROP TABLE IF EXISTS modx_site_tmplvar_access;
CREATE TABLE modx_site_tmplvar_access (
  id INT(10) NOT NULL AUTO_INCREMENT,
  tmplvarid INT(10) NOT NULL DEFAULT 0,
  documentgroup INT(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Contains data used for template variable access permissions.';

--
-- Описание для таблицы modx_site_tmplvar_contentvalues
--
DROP TABLE IF EXISTS modx_site_tmplvar_contentvalues;
CREATE TABLE modx_site_tmplvar_contentvalues (
  id INT(11) NOT NULL AUTO_INCREMENT,
  tmplvarid INT(10) NOT NULL DEFAULT 0 COMMENT 'Template Variable id',
  contentid INT(10) NOT NULL DEFAULT 0 COMMENT 'Site Content Id',
  value MEDIUMTEXT DEFAULT NULL,
  PRIMARY KEY (id),
  INDEX idx_id (contentid),
  INDEX idx_tmplvarid (tmplvarid),
  UNIQUE INDEX ix_tvid_contentid (tmplvarid, contentid),
  FULLTEXT INDEX value_ft_idx (value)
)
ENGINE = MYISAM
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Site Template Variables Content Values Link Table'
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы modx_site_tmplvar_templates
--
DROP TABLE IF EXISTS modx_site_tmplvar_templates;
CREATE TABLE modx_site_tmplvar_templates (
  tmplvarid INT(10) NOT NULL DEFAULT 0 COMMENT 'Template Variable id',
  templateid INT(11) NOT NULL DEFAULT 0,
  rank INT(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (tmplvarid, templateid)
)
ENGINE = MYISAM
AVG_ROW_LENGTH = 13
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Site Template Variables Templates Link Table';

--
-- Описание для таблицы modx_site_tmplvars
--
DROP TABLE IF EXISTS modx_site_tmplvars;
CREATE TABLE modx_site_tmplvars (
  id INT(11) NOT NULL AUTO_INCREMENT,
  type VARCHAR(50) NOT NULL DEFAULT '',
  name VARCHAR(50) NOT NULL DEFAULT '',
  caption VARCHAR(80) NOT NULL DEFAULT '',
  description VARCHAR(255) NOT NULL DEFAULT '',
  editor_type INT(11) NOT NULL DEFAULT 0 COMMENT '0-plain text,1-rich text,2-code editor',
  category INT(11) NOT NULL DEFAULT 0 COMMENT 'category id',
  locked TINYINT(4) NOT NULL DEFAULT 0,
  elements TEXT DEFAULT NULL,
  rank INT(11) NOT NULL DEFAULT 0,
  display VARCHAR(20) NOT NULL DEFAULT '' COMMENT 'Display Control',
  display_params TEXT DEFAULT NULL COMMENT 'Display Control Properties',
  default_text TEXT DEFAULT NULL,
  PRIMARY KEY (id),
  INDEX indx_rank (rank)
)
ENGINE = MYISAM
AUTO_INCREMENT = 5
AVG_ROW_LENGTH = 114
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Site Template Variables';

--
-- Описание для таблицы modx_system_eventnames
--
DROP TABLE IF EXISTS modx_system_eventnames;
CREATE TABLE modx_system_eventnames (
  id INT(10) NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL DEFAULT '',
  service TINYINT(4) NOT NULL DEFAULT 0 COMMENT 'System Service number',
  groupname VARCHAR(20) NOT NULL DEFAULT '',
  PRIMARY KEY (id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 1036
AVG_ROW_LENGTH = 35
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'System Event Names.';

--
-- Описание для таблицы modx_system_settings
--
DROP TABLE IF EXISTS modx_system_settings;
CREATE TABLE modx_system_settings (
  setting_name VARCHAR(50) NOT NULL DEFAULT '',
  setting_value TEXT DEFAULT NULL,
  PRIMARY KEY (setting_name)
)
ENGINE = MYISAM
AVG_ROW_LENGTH = 32
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Contains Content Manager settings.';

--
-- Описание для таблицы modx_user_attributes
--
DROP TABLE IF EXISTS modx_user_attributes;
CREATE TABLE modx_user_attributes (
  id INT(10) NOT NULL AUTO_INCREMENT,
  internalKey INT(10) NOT NULL DEFAULT 0,
  fullname VARCHAR(100) NOT NULL DEFAULT '',
  role INT(10) NOT NULL DEFAULT 0,
  email VARCHAR(100) NOT NULL DEFAULT '',
  phone VARCHAR(100) NOT NULL DEFAULT '',
  mobilephone VARCHAR(100) NOT NULL DEFAULT '',
  blocked INT(1) NOT NULL DEFAULT 0,
  blockeduntil INT(11) NOT NULL DEFAULT 0,
  blockedafter INT(11) NOT NULL DEFAULT 0,
  logincount INT(11) NOT NULL DEFAULT 0,
  lastlogin INT(11) NOT NULL DEFAULT 0,
  thislogin INT(11) NOT NULL DEFAULT 0,
  failedlogincount INT(10) NOT NULL DEFAULT 0,
  sessionid VARCHAR(100) NOT NULL DEFAULT '',
  dob INT(10) NOT NULL DEFAULT 0,
  gender INT(1) NOT NULL DEFAULT 0 COMMENT '0 - unknown, 1 - Male 2 - female',
  country VARCHAR(5) NOT NULL DEFAULT '',
  street VARCHAR(255) NOT NULL DEFAULT '',
  city VARCHAR(255) NOT NULL DEFAULT '',
  state VARCHAR(25) NOT NULL DEFAULT '',
  zip VARCHAR(25) NOT NULL DEFAULT '',
  fax VARCHAR(100) NOT NULL DEFAULT '',
  photo VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'link to photo',
  comment TEXT DEFAULT NULL,
  PRIMARY KEY (id),
  INDEX userid (internalKey)
)
ENGINE = MYISAM
AUTO_INCREMENT = 3
AVG_ROW_LENGTH = 84
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Contains information about the backend users.';

--
-- Описание для таблицы modx_user_messages
--
DROP TABLE IF EXISTS modx_user_messages;
CREATE TABLE modx_user_messages (
  id INT(10) NOT NULL AUTO_INCREMENT,
  type VARCHAR(15) NOT NULL DEFAULT '',
  subject VARCHAR(60) NOT NULL DEFAULT '',
  message TEXT DEFAULT NULL,
  sender INT(10) NOT NULL DEFAULT 0,
  recipient INT(10) NOT NULL DEFAULT 0,
  private TINYINT(4) NOT NULL DEFAULT 0,
  postdate INT(20) NOT NULL DEFAULT 0,
  messageread TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Contains messages for the Content Manager messaging system.';

--
-- Описание для таблицы modx_user_roles
--
DROP TABLE IF EXISTS modx_user_roles;
CREATE TABLE modx_user_roles (
  id INT(10) NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL DEFAULT '',
  description VARCHAR(255) NOT NULL DEFAULT '',
  frames INT(1) NOT NULL DEFAULT 0,
  home INT(1) NOT NULL DEFAULT 0,
  view_document INT(1) NOT NULL DEFAULT 0,
  new_document INT(1) NOT NULL DEFAULT 0,
  save_document INT(1) NOT NULL DEFAULT 0,
  publish_document INT(1) NOT NULL DEFAULT 0,
  delete_document INT(1) NOT NULL DEFAULT 0,
  empty_trash INT(1) NOT NULL DEFAULT 0,
  action_ok INT(1) NOT NULL DEFAULT 0,
  logout INT(1) NOT NULL DEFAULT 0,
  help INT(1) NOT NULL DEFAULT 0,
  messages INT(1) NOT NULL DEFAULT 0,
  new_user INT(1) NOT NULL DEFAULT 0,
  edit_user INT(1) NOT NULL DEFAULT 0,
  logs INT(1) NOT NULL DEFAULT 0,
  edit_parser INT(1) NOT NULL DEFAULT 0,
  save_parser INT(1) NOT NULL DEFAULT 0,
  edit_template INT(1) NOT NULL DEFAULT 0,
  settings INT(1) NOT NULL DEFAULT 0,
  credits INT(1) NOT NULL DEFAULT 0,
  new_template INT(1) NOT NULL DEFAULT 0,
  save_template INT(1) NOT NULL DEFAULT 0,
  delete_template INT(1) NOT NULL DEFAULT 0,
  edit_snippet INT(1) NOT NULL DEFAULT 0,
  new_snippet INT(1) NOT NULL DEFAULT 0,
  save_snippet INT(1) NOT NULL DEFAULT 0,
  delete_snippet INT(1) NOT NULL DEFAULT 0,
  edit_chunk INT(1) NOT NULL DEFAULT 0,
  new_chunk INT(1) NOT NULL DEFAULT 0,
  save_chunk INT(1) NOT NULL DEFAULT 0,
  delete_chunk INT(1) NOT NULL DEFAULT 0,
  empty_cache INT(1) NOT NULL DEFAULT 0,
  edit_document INT(1) NOT NULL DEFAULT 0,
  change_password INT(1) NOT NULL DEFAULT 0,
  error_dialog INT(1) NOT NULL DEFAULT 0,
  about INT(1) NOT NULL DEFAULT 0,
  file_manager INT(1) NOT NULL DEFAULT 0,
  assets_files INT(1) NOT NULL DEFAULT 0,
  assets_images INT(1) NOT NULL DEFAULT 0,
  save_user INT(1) NOT NULL DEFAULT 0,
  delete_user INT(1) NOT NULL DEFAULT 0,
  save_password INT(11) NOT NULL DEFAULT 0,
  edit_role INT(1) NOT NULL DEFAULT 0,
  save_role INT(1) NOT NULL DEFAULT 0,
  delete_role INT(1) NOT NULL DEFAULT 0,
  new_role INT(1) NOT NULL DEFAULT 0,
  access_permissions INT(1) NOT NULL DEFAULT 0,
  bk_manager INT(1) NOT NULL DEFAULT 0,
  new_plugin INT(1) NOT NULL DEFAULT 0,
  edit_plugin INT(1) NOT NULL DEFAULT 0,
  save_plugin INT(1) NOT NULL DEFAULT 0,
  delete_plugin INT(1) NOT NULL DEFAULT 0,
  new_module INT(1) NOT NULL DEFAULT 0,
  edit_module INT(1) NOT NULL DEFAULT 0,
  save_module INT(1) NOT NULL DEFAULT 0,
  delete_module INT(1) NOT NULL DEFAULT 0,
  exec_module INT(1) NOT NULL DEFAULT 0,
  view_eventlog INT(1) NOT NULL DEFAULT 0,
  delete_eventlog INT(1) NOT NULL DEFAULT 0,
  manage_metatags INT(1) NOT NULL DEFAULT 0 COMMENT 'manage site meta tags and keywords',
  edit_doc_metatags INT(1) NOT NULL DEFAULT 0 COMMENT 'edit document meta tags and keywords',
  new_web_user INT(1) NOT NULL DEFAULT 0,
  edit_web_user INT(1) NOT NULL DEFAULT 0,
  save_web_user INT(1) NOT NULL DEFAULT 0,
  delete_web_user INT(1) NOT NULL DEFAULT 0,
  web_access_permissions INT(1) NOT NULL DEFAULT 0,
  view_unpublished INT(1) NOT NULL DEFAULT 0,
  import_static INT(1) NOT NULL DEFAULT 0,
  export_static INT(1) NOT NULL DEFAULT 0,
  remove_locks INT(1) NOT NULL DEFAULT 0,
  display_locks INT(1) NOT NULL DEFAULT 0,
  change_resourcetype INT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 4
AVG_ROW_LENGTH = 278
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Contains information describing the user roles.';

--
-- Описание для таблицы modx_user_settings
--
DROP TABLE IF EXISTS modx_user_settings;
CREATE TABLE modx_user_settings (
  user INT(11) NOT NULL,
  setting_name VARCHAR(50) NOT NULL DEFAULT '',
  setting_value TEXT DEFAULT NULL,
  PRIMARY KEY (user, setting_name),
  INDEX setting_name (setting_name),
  INDEX user (user)
)
ENGINE = MYISAM
AVG_ROW_LENGTH = 156
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Contains backend user settings.';

--
-- Описание для таблицы modx_web_groups
--
DROP TABLE IF EXISTS modx_web_groups;
CREATE TABLE modx_web_groups (
  id INT(10) NOT NULL AUTO_INCREMENT,
  webgroup INT(10) NOT NULL DEFAULT 0,
  webuser INT(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (id),
  UNIQUE INDEX ix_group_user (webgroup, webuser)
)
ENGINE = MYISAM
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Contains data used for web access permissions.';

--
-- Описание для таблицы modx_web_user_attributes
--
DROP TABLE IF EXISTS modx_web_user_attributes;
CREATE TABLE modx_web_user_attributes (
  id INT(10) NOT NULL AUTO_INCREMENT,
  internalKey INT(10) NOT NULL DEFAULT 0,
  fullname VARCHAR(100) NOT NULL DEFAULT '',
  role INT(10) NOT NULL DEFAULT 0,
  email VARCHAR(100) NOT NULL DEFAULT '',
  phone VARCHAR(100) NOT NULL DEFAULT '',
  mobilephone VARCHAR(100) NOT NULL DEFAULT '',
  blocked INT(1) NOT NULL DEFAULT 0,
  blockeduntil INT(11) NOT NULL DEFAULT 0,
  blockedafter INT(11) NOT NULL DEFAULT 0,
  logincount INT(11) NOT NULL DEFAULT 0,
  lastlogin INT(11) NOT NULL DEFAULT 0,
  thislogin INT(11) NOT NULL DEFAULT 0,
  failedlogincount INT(10) NOT NULL DEFAULT 0,
  sessionid VARCHAR(100) NOT NULL DEFAULT '',
  dob INT(10) NOT NULL DEFAULT 0,
  gender INT(1) NOT NULL DEFAULT 0 COMMENT '0 - unknown, 1 - Male 2 - female',
  country VARCHAR(25) NOT NULL DEFAULT '',
  street VARCHAR(255) NOT NULL DEFAULT '',
  city VARCHAR(255) NOT NULL DEFAULT '',
  state VARCHAR(25) NOT NULL DEFAULT '',
  zip VARCHAR(25) NOT NULL DEFAULT '',
  fax VARCHAR(100) NOT NULL DEFAULT '',
  photo VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'link to photo',
  comment TEXT DEFAULT NULL,
  PRIMARY KEY (id),
  INDEX userid (internalKey)
)
ENGINE = MYISAM
AUTO_INCREMENT = 10
AVG_ROW_LENGTH = 188
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Contains information for web users.';

--
-- Описание для таблицы modx_web_user_settings
--
DROP TABLE IF EXISTS modx_web_user_settings;
CREATE TABLE modx_web_user_settings (
  webuser INT(11) NOT NULL,
  setting_name VARCHAR(50) NOT NULL DEFAULT '',
  setting_value TEXT DEFAULT NULL,
  PRIMARY KEY (webuser, setting_name),
  INDEX setting_name (setting_name),
  INDEX webuserid (webuser)
)
ENGINE = MYISAM
AVG_ROW_LENGTH = 24
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Contains web user settings.';

--
-- Описание для таблицы modx_web_users
--
DROP TABLE IF EXISTS modx_web_users;
CREATE TABLE modx_web_users (
  id INT(10) NOT NULL AUTO_INCREMENT,
  username VARCHAR(100) NOT NULL DEFAULT '',
  password VARCHAR(100) NOT NULL DEFAULT '',
  cachepwd VARCHAR(100) NOT NULL DEFAULT '' COMMENT 'Store new unconfirmed password',
  PRIMARY KEY (id),
  UNIQUE INDEX username (username)
)
ENGINE = MYISAM
AUTO_INCREMENT = 10
AVG_ROW_LENGTH = 60
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы modx_webgroup_access
--
DROP TABLE IF EXISTS modx_webgroup_access;
CREATE TABLE modx_webgroup_access (
  id INT(10) NOT NULL AUTO_INCREMENT,
  webgroup INT(10) NOT NULL DEFAULT 0,
  documentgroup INT(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 3
AVG_ROW_LENGTH = 13
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Contains data used for web access permissions.';

--
-- Описание для таблицы modx_webgroup_names
--
DROP TABLE IF EXISTS modx_webgroup_names;
CREATE TABLE modx_webgroup_names (
  id INT(10) NOT NULL AUTO_INCREMENT,
  name VARCHAR(245) NOT NULL DEFAULT '',
  PRIMARY KEY (id),
  UNIQUE INDEX name (name)
)
ENGINE = MYISAM
AUTO_INCREMENT = 3
AVG_ROW_LENGTH = 20
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Contains data used for web access permissions.';

-- 
-- Вывод данных для таблицы modx_active_user_locks
--
INSERT INTO modx_active_user_locks VALUES
(725, 'htg7qq8giilekvm20k9qmondr2', 2, 3, 7, 1494345083),
(715, 'htg7qq8giilekvm20k9qmondr2', 2, 4, 19, 1494344669),
(704, 'htg7qq8giilekvm20k9qmondr2', 2, 3, 4, 1494343406),
(642, 'htg7qq8giilekvm20k9qmondr2', 2, 4, 12, 1494337494);

-- 
-- Вывод данных для таблицы modx_active_user_sessions
--
INSERT INTO modx_active_user_sessions VALUES
('htg7qq8giilekvm20k9qmondr2', 2, 1494345252, '127.0.0.1');

-- 
-- Вывод данных для таблицы modx_active_users
--
INSERT INTO modx_active_users VALUES
('htg7qq8giilekvm20k9qmondr2', 2, 'ipra', 1494345203, '67', 5),
('4ffhtombonta7f5p8krffjusr2', 1, 'admin', 1494185199, '2', NULL),
('ridh8840orhpkue9oh319dkos7', 2, 'ipra', 1494182124, '22', 12);

-- 
-- Вывод данных для таблицы modx_categories
--
INSERT INTO modx_categories VALUES
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

-- 
-- Вывод данных для таблицы modx_data_feedback
--

-- Таблица ibase_woch.modx_data_feedback не содержит данных

-- 
-- Вывод данных для таблицы modx_data_feedback_config
--
INSERT INTO modx_data_feedback_config VALUES
(1, 'ONE_CLICK', 'id_tv_price', ''),
(2, 'ONE_CLICK', 'currency', 'UAH'),
(3, 'ONE_CLICK', 'email_manager', ''),
(4, 'ONE_CLICK', 'color_status', '#C5CAFE~#B1F2FC~#F3FDB0~#FAB5B4~#9CEDA0'),
(5, 'BACK_CALL', 'email_manager', ''),
(6, 'FEEDBACK', 'email_manager', ''),
(7, '', 'cap_symbols', '1234567890'),
(8, '', 'cap_num_symbols', '4'),
(9, '', 'cap_height', '100'),
(10, '', 'cap_width', '200'),
(11, '', 'cap_fontsize', '50'),
(12, '', 'amount_on_page', '15');

-- 
-- Вывод данных для таблицы modx_document_groups
--

-- Таблица ibase_woch.modx_document_groups не содержит данных

-- 
-- Вывод данных для таблицы modx_documentgroup_names
--
INSERT INTO modx_documentgroup_names VALUES
(2, 'webusers', 0, 1);

-- 
-- Вывод данных для таблицы modx_event_log
--
INSERT INTO modx_event_log VALUES
(1, 0, 1492324115, 3, 1, 0, 'Файл конфигурации все еще доступен для записи', 'Злоумышленники потенциально могут нанести вред вашему сайту. <strong>Серьёзно.</strong> Пожалуйста, установите права доступа к файлу конфигурации (/manager/includes/config.inc.php) в режим ''Только для чтения'''),
(2, 0, 1492344026, 3, 1, 0, 'Файл конфигурации все еще доступен для записи', 'Злоумышленники потенциально могут нанести вред вашему сайту. <strong>Серьёзно.</strong> Пожалуйста, установите права доступа к файлу конфигурации (/manager/includes/config.inc.php) в режим ''Только для чтения'''),
(3, 0, 1492344083, 3, 1, 0, 'Файл конфигурации все еще доступен для записи', 'Злоумышленники потенциально могут нанести вред вашему сайту. <strong>Серьёзно.</strong> Пожалуйста, установите права доступа к файлу конфигурации (/manager/includes/config.inc.php) в режим ''Только для чтения'''),
(4, 0, 1492344157, 3, 1, 0, 'Файл конфигурации все еще доступен для записи', 'Злоумышленники потенциально могут нанести вред вашему сайту. <strong>Серьёзно.</strong> Пожалуйста, установите права доступа к файлу конфигурации (/manager/includes/config.inc.php) в режим ''Только для чтения'''),
(5, 0, 1492344325, 3, 1, 0, 'Файл конфигурации все еще доступен для записи', 'Злоумышленники потенциально могут нанести вред вашему сайту. <strong>Серьёзно.</strong> Пожалуйста, установите права доступа к файлу конфигурации (/manager/includes/config.inc.php) в режим ''Только для чтения'''),
(6, 0, 1492435919, 3, 1, 0, 'Файл конфигурации все еще доступен для записи', 'Злоумышленники потенциально могут нанести вред вашему сайту. <strong>Серьёзно.</strong> Пожалуйста, установите права доступа к файлу конфигурации (/manager/includes/config.inc.php) в режим ''Только для чтения'''),
(7, 0, 1492444099, 3, 0, 1, 'Snippet - loginza / PHP Parse Error', '<b>Trying to get property of non-object</b><br />\n<h2 style="color:red">&laquo; MODX Parse Error &raquo;</h2><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;">Error : include_once(C:\\OpenServer\\domains\\modx.ua\\assets\\snippets\\modxloginza\\profiletpl.php): failed to open stream: No such file or directory</div>\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Error information</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>ErrorType[num]</td>\n\t\t<td>WARNING[2]</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>File</td>\n\t\t<td>C:\\OpenServer\\domains\\modx.ua\\assets\\snippets\\modxloginza\\snippet.loginza.php</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Line</td>\n\t\t<td>8</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Source</td>\n\t\t<td>include_once MODX_BASE_PATH.''assets/snippets/modxloginza/profiletpl.php''; //шаблон профиля\n</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Current Snippet</td>\n\t\t<td>loginza</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Basic info</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>REQUEST_URI</td>\n\t\t<td>http://modx.ua/login.html</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Resource</td>\n\t\t<td>[4] <a href="http://modx.ua/login.html" target="_blank">Вход</a></td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Referer</td>\n\t\t<td>http://modx.ua/</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>User Agent</td>\n\t\t<td>Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>IP</td>\n\t\t<td>127.0.0.1</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Current time</td>\n\t\t<td>2017-04-17 18:48:19</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Benchmarks</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>MySQL</td>\n\t\t<td>0.0022 s (3 Requests)</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>PHP</td>\n\t\t<td>0.1063 s</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Total</td>\n\t\t<td>0.1086 s</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Memory</td>\n\t\t<td>1.6446914672852 mb</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th>Backtrace</th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->executeParser</strong>()<br />index.php on line 128</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2141</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2234</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DocumentParser->parseDocumentSource</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 668</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->evalSnippets</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 2003</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DocumentParser->_get_snip_result</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 1408</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->evalSnippet</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 1466</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>eval</strong>()<br />manager/includes/document.parser.class.inc.php on line 1360</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>require</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php(1360) : eval()''d code on line 1</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>include_once</strong>()<br />assets/snippets/modxloginza/snippet.loginza.php on line 8</td>\n\t</tr>\n</table>\n'),
(8, 0, 1492444399, 3, 1, 0, 'Файл конфигурации все еще доступен для записи', 'Злоумышленники потенциально могут нанести вред вашему сайту. <strong>Серьёзно.</strong> Пожалуйста, установите права доступа к файлу конфигурации (/manager/includes/config.inc.php) в режим ''Только для чтения'''),
(9, 0, 1492512078, 3, 1, 0, 'Системные файлы были изменены.', 'Вы включили проверку системных файлов на наличие изменений, характерных для взломанных сайтов. Это не значит, что сайт был взломан, но желательно просмотреть измененные файлы.(index.php, .htaccess, manager/index.php, manager/includes/config.inc.php) index.php, .htaccess, manager/index.php, manager/includes/config.inc.php'),
(10, 0, 1492512078, 3, 1, 0, 'Файл конфигурации все еще доступен для записи', 'Злоумышленники потенциально могут нанести вред вашему сайту. <strong>Серьёзно.</strong> Пожалуйста, установите права доступа к файлу конфигурации (/manager/includes/config.inc.php) в режим ''Только для чтения'''),
(11, 0, 1492774056, 3, 2, 0, 'Системные файлы были изменены.', 'Вы включили проверку системных файлов на наличие изменений, характерных для взломанных сайтов. Это не значит, что сайт был взломан, но желательно просмотреть измененные файлы.(index.php, .htaccess, manager/index.php, manager/includes/config.inc.php) index.php, .htaccess, manager/index.php, manager/includes/config.inc.php'),
(12, 0, 1492774057, 3, 2, 0, 'Файл конфигурации все еще доступен для записи', 'Злоумышленники потенциально могут нанести вред вашему сайту. <strong>Серьёзно.</strong> Пожалуйста, установите права доступа к файлу конфигурации (/manager/includes/config.inc.php) в режим ''Только для чтения'''),
(13, 0, 1493375769, 3, 2, 0, 'Системные файлы были изменены.', 'Вы включили проверку системных файлов на наличие изменений, характерных для взломанных сайтов. Это не значит, что сайт был взломан, но желательно просмотреть измененные файлы.(index.php, .htaccess, manager/index.php, manager/includes/config.inc.php) index.php, .htaccess, manager/index.php, manager/includes/config.inc.php'),
(14, 0, 1493464325, 3, 1, 0, 'Файл конфигурации все еще доступен для записи', 'Злоумышленники потенциально могут нанести вред вашему сайту. <strong>Серьёзно.</strong> Пожалуйста, установите права доступа к файлу конфигурации (/manager/includes/config.inc.php) в режим ''Только для чтения'''),
(15, 0, 1493499100, 3, 0, 1, 'SQL Query / Execution of a query to the database f', '<h2 style="color:red">&laquo; MODX Parse Error &raquo;</h2><h3 style="color:red">Execution of a query to the database failed - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ''@yandex.ru FROM modx_web_user_attributes'' at line 1</h3><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;">SQL &gt; <span id="sqlHolder">SELECT igorded1991@yandex.ru FROM modx_web_user_attributes   </span></div>\n<table class="grid">\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Basic info</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>REQUEST_URI</td>\n\t\t<td>http://modx/exist_login.php</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Resource</td>\n\t\t<td>[1] <a href="http://modx/" target="_blank">Главная</a></td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Referer</td>\n\t\t<td>http://modx/registration.html</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>User Agent</td>\n\t\t<td>Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 YaBrowser/17.3.1.840 Yowser/2.5 Safari/537.36</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>IP</td>\n\t\t<td>127.0.0.1</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Current time</td>\n\t\t<td>2017-04-29 23:51:40</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Benchmarks</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>MySQL</td>\n\t\t<td>0.1690 s (3 Requests)</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>PHP</td>\n\t\t<td>0.1351 s</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Total</td>\n\t\t<td>0.3042 s</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Memory</td>\n\t\t<td>1.6425247192383 mb</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th>Backtrace</th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td><strong>DBAPI->select</strong>(string $var1, string $var2)<br />exist_login.php on line 40</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DBAPI->query</strong>(string $var1)<br />manager/includes/extenders/dbapi.mysqli.class.inc.php on line 161</td>\n\t</tr>\n</table>\n'),
(16, 0, 1493499102, 3, 0, 1, 'SQL Query / Execution of a query to the database f', '<h2 style="color:red">&laquo; MODX Parse Error &raquo;</h2><h3 style="color:red">Execution of a query to the database failed - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ''FROM modx_web_user_attributes'' at line 1</h3><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;">SQL &gt; <span id="sqlHolder">SELECT  FROM modx_web_user_attributes   </span></div>\n<table class="grid">\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Basic info</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>REQUEST_URI</td>\n\t\t<td>http://modx/exist_login.php</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Resource</td>\n\t\t<td>[1] <a href="http://modx/" target="_blank">Главная</a></td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Referer</td>\n\t\t<td>http://modx/registration.html</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>User Agent</td>\n\t\t<td>Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 YaBrowser/17.3.1.840 Yowser/2.5 Safari/537.36</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>IP</td>\n\t\t<td>127.0.0.1</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Current time</td>\n\t\t<td>2017-04-29 23:51:42</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Benchmarks</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>MySQL</td>\n\t\t<td>0.1695 s (3 Requests)</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>PHP</td>\n\t\t<td>0.1285 s</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Total</td>\n\t\t<td>0.2980 s</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Memory</td>\n\t\t<td>1.6426086425781 mb</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th>Backtrace</th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td><strong>DBAPI->select</strong>('''', string $var2)<br />exist_login.php on line 40</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DBAPI->query</strong>(string $var1)<br />manager/includes/extenders/dbapi.mysqli.class.inc.php on line 161</td>\n\t</tr>\n</table>\n'),
(17, 0, 1493499114, 3, 0, 1, 'SQL Query / Execution of a query to the database f', '<h2 style="color:red">&laquo; MODX Parse Error &raquo;</h2><h3 style="color:red">Execution of a query to the database failed - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ''FROM modx_web_user_attributes'' at line 1</h3><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;">SQL &gt; <span id="sqlHolder">SELECT  FROM modx_web_user_attributes   </span></div>\n<table class="grid">\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Basic info</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>REQUEST_URI</td>\n\t\t<td>http://modx/exist_login.php</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Resource</td>\n\t\t<td>[1] <a href="http://modx/" target="_blank">Главная</a></td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Referer</td>\n\t\t<td>http://modx/registration.html</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>User Agent</td>\n\t\t<td>Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 YaBrowser/17.3.1.840 Yowser/2.5 Safari/537.36</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>IP</td>\n\t\t<td>127.0.0.1</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Current time</td>\n\t\t<td>2017-04-29 23:51:54</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Benchmarks</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>MySQL</td>\n\t\t<td>0.1703 s (3 Requests)</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>PHP</td>\n\t\t<td>0.1228 s</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Total</td>\n\t\t<td>0.2931 s</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Memory</td>\n\t\t<td>1.6426086425781 mb</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th>Backtrace</th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td><strong>DBAPI->select</strong>('''', string $var2)<br />exist_login.php on line 40</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DBAPI->query</strong>(string $var1)<br />manager/includes/extenders/dbapi.mysqli.class.inc.php on line 161</td>\n\t</tr>\n</table>\n'),
(18, 0, 1493499464, 3, 0, 1, 'SQL Query / Execution of a query to the database f', '<h2 style="color:red">&laquo; MODX Parse Error &raquo;</h2><h3 style="color:red">Execution of a query to the database failed - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ''@yandex.ru'' at line 1</h3><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;">SQL &gt; <span id="sqlHolder">SELECT email FROM modx_web_user_attributes WHERE email = igorded1991@yandex.ru  </span></div>\n<table class="grid">\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Basic info</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>REQUEST_URI</td>\n\t\t<td>http://modx/exist_login.php</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Resource</td>\n\t\t<td>[1] <a href="http://modx/" target="_blank">Главная</a></td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Referer</td>\n\t\t<td>http://modx/registration.html</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>User Agent</td>\n\t\t<td>Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 YaBrowser/17.3.1.840 Yowser/2.5 Safari/537.36</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>IP</td>\n\t\t<td>127.0.0.1</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Current time</td>\n\t\t<td>2017-04-29 23:57:44</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Benchmarks</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>MySQL</td>\n\t\t<td>0.1676 s (3 Requests)</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>PHP</td>\n\t\t<td>0.1441 s</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Total</td>\n\t\t<td>0.3116 s</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Memory</td>\n\t\t<td>1.6422729492188 mb</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th>Backtrace</th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td><strong>DBAPI->select</strong>(''email'', string $var2, string $var3)<br />exist_login.php on line 40</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DBAPI->query</strong>(string $var1)<br />manager/includes/extenders/dbapi.mysqli.class.inc.php on line 161</td>\n\t</tr>\n</table>\n'),
(19, 0, 1494179550, 3, 2, 0, 'Системные файлы были изменены.', 'Вы включили проверку системных файлов на наличие изменений, характерных для взломанных сайтов. Это не значит, что сайт был взломан, но желательно просмотреть измененные файлы.(index.php, .htaccess, manager/index.php, manager/includes/config.inc.php) index.php, .htaccess, manager/index.php, manager/includes/config.inc.php'),
(20, 0, 1494179550, 3, 2, 0, 'Файл конфигурации все еще доступен для записи', 'Злоумышленники потенциально могут нанести вред вашему сайту. <strong>Серьёзно.</strong> Пожалуйста, установите права доступа к файлу конфигурации (/manager/includes/config.inc.php) в режим ''Только для чтения'''),
(21, 0, 1494180869, 3, 2, 0, 'Системные файлы были изменены.', 'Вы включили проверку системных файлов на наличие изменений, характерных для взломанных сайтов. Это не значит, что сайт был взломан, но желательно просмотреть измененные файлы.(index.php, .htaccess, manager/index.php, manager/includes/config.inc.php) index.php, .htaccess, manager/index.php, manager/includes/config.inc.php'),
(22, 0, 1494180869, 3, 2, 0, 'Файл конфигурации все еще доступен для записи', 'Злоумышленники потенциально могут нанести вред вашему сайту. <strong>Серьёзно.</strong> Пожалуйста, установите права доступа к файлу конфигурации (/manager/includes/config.inc.php) в режим ''Только для чтения'''),
(23, 0, 1494180902, 3, 2, 0, 'Системные файлы были изменены.', 'Вы включили проверку системных файлов на наличие изменений, характерных для взломанных сайтов. Это не значит, что сайт был взломан, но желательно просмотреть измененные файлы.(index.php, .htaccess, manager/index.php, manager/includes/config.inc.php) index.php, .htaccess, manager/index.php, manager/includes/config.inc.php'),
(24, 0, 1494180902, 3, 2, 0, 'Файл конфигурации все еще доступен для записи', 'Злоумышленники потенциально могут нанести вред вашему сайту. <strong>Серьёзно.</strong> Пожалуйста, установите права доступа к файлу конфигурации (/manager/includes/config.inc.php) в режим ''Только для чтения'''),
(25, 0, 1494182118, 3, 2, 0, 'Системные файлы были изменены.', 'Вы включили проверку системных файлов на наличие изменений, характерных для взломанных сайтов. Это не значит, что сайт был взломан, но желательно просмотреть измененные файлы.(index.php, .htaccess, manager/index.php, manager/includes/config.inc.php) index.php, .htaccess, manager/index.php, manager/includes/config.inc.php'),
(26, 0, 1494182118, 3, 2, 0, 'Файл конфигурации все еще доступен для записи', 'Злоумышленники потенциально могут нанести вред вашему сайту. <strong>Серьёзно.</strong> Пожалуйста, установите права доступа к файлу конфигурации (/manager/includes/config.inc.php) в режим ''Только для чтения'''),
(27, 0, 1494326239, 3, 2, 0, 'Системные файлы были изменены.', 'Вы включили проверку системных файлов на наличие изменений, характерных для взломанных сайтов. Это не значит, что сайт был взломан, но желательно просмотреть измененные файлы.(index.php, .htaccess, manager/index.php, manager/includes/config.inc.php) index.php, .htaccess, manager/index.php, manager/includes/config.inc.php'),
(28, 0, 1494326239, 3, 2, 0, 'Файл конфигурации все еще доступен для записи', 'Злоумышленники потенциально могут нанести вред вашему сайту. <strong>Серьёзно.</strong> Пожалуйста, установите права доступа к файлу конфигурации (/manager/includes/config.inc.php) в режим ''Только для чтения'''),
(29, 0, 1494333304, 3, 6, 1, 'Snippet - test / PHP Parse Error', '<h2 style="color:red">&laquo; MODX Parse Error &raquo;</h2><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;">Error : syntax error, unexpected ''echo'' (T_ECHO)</div><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;"><br />\n<b>Parse error</b>:  syntax error, unexpected ''echo'' (T_ECHO) in <b>C:\\OpenServer\\domains\\woch.loc\\manager\\includes\\document.parser.class.inc.php(1360) : eval()''d code</b> on line <b>2</b><br />\n</div>\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Error information</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>ErrorType[num]</td>\n\t\t<td>PARSING ERROR[4]</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>File</td>\n\t\t<td>C:\\OpenServer\\domains\\woch.loc\\manager\\includes\\document.parser.class.inc.php(1360) : eval()''d code</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Line</td>\n\t\t<td>2</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Source</td>\n\t\t<td>Snippet</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Current Snippet</td>\n\t\t<td>test</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Basic info</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>REQUEST_URI</td>\n\t\t<td>http://woch.loc/</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Resource</td>\n\t\t<td>[1] <a href="http://woch.loc/" target="_blank">Главная</a></td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Referer</td>\n\t\t<td>http://woch.loc/login.html</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>User Agent</td>\n\t\t<td>Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>IP</td>\n\t\t<td>127.0.0.1</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Current time</td>\n\t\t<td>2017-05-09 15:35:04</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Benchmarks</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>MySQL</td>\n\t\t<td>0.2061 s (6 Requests)</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>PHP</td>\n\t\t<td>0.1738 s</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Total</td>\n\t\t<td>0.3800 s</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Memory</td>\n\t\t<td>2.265007019043 mb</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th>Backtrace</th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->executeParser</strong>()<br />index.php on line 128</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2141</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2234</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DocumentParser->parseDocumentSource</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 668</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->evalSnippets</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 2003</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DocumentParser->_get_snip_result</strong>(''test'')<br />manager/includes/document.parser.class.inc.php on line 1408</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->evalSnippet</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 1466</td>\n\t</tr>\n</table>\n'),
(30, 0, 1494333438, 3, 6, 1, 'Snippet - test / PHP Parse Error', '<h2 style="color:red">&laquo; MODX Parse Error &raquo;</h2><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;">Error : syntax error, unexpected ''echo'' (T_ECHO)</div><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;"><br />\n<b>Parse error</b>:  syntax error, unexpected ''echo'' (T_ECHO) in <b>C:\\OpenServer\\domains\\woch.loc\\manager\\includes\\document.parser.class.inc.php(1360) : eval()''d code</b> on line <b>2</b><br />\n</div>\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Error information</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>ErrorType[num]</td>\n\t\t<td>PARSING ERROR[4]</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>File</td>\n\t\t<td>C:\\OpenServer\\domains\\woch.loc\\manager\\includes\\document.parser.class.inc.php(1360) : eval()''d code</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Line</td>\n\t\t<td>2</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Source</td>\n\t\t<td>Snippet</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Current Snippet</td>\n\t\t<td>test</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Basic info</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>REQUEST_URI</td>\n\t\t<td>http://woch.loc/</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Resource</td>\n\t\t<td>[1] <a href="http://woch.loc/" target="_blank">Главная</a></td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Referer</td>\n\t\t<td>http://woch.loc/login.html</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>User Agent</td>\n\t\t<td>Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>IP</td>\n\t\t<td>127.0.0.1</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Current time</td>\n\t\t<td>2017-05-09 15:37:18</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Benchmarks</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>MySQL</td>\n\t\t<td>0.2084 s (6 Requests)</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>PHP</td>\n\t\t<td>0.0591 s</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Total</td>\n\t\t<td>0.2675 s</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Memory</td>\n\t\t<td>2.2656936645508 mb</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th>Backtrace</th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->executeParser</strong>()<br />index.php on line 128</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2141</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2234</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DocumentParser->parseDocumentSource</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 668</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->evalSnippets</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 2003</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DocumentParser->_get_snip_result</strong>(''test'')<br />manager/includes/document.parser.class.inc.php on line 1408</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->evalSnippet</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 1466</td>\n\t</tr>\n</table>\n'),
(31, 0, 1494333562, 3, 6, 1, 'Snippet - test / PHP Parse Error', '<h2 style="color:red">&laquo; MODX Parse Error &raquo;</h2><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;">Error : syntax error, unexpected '']''</div><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;"><br />\n<b>Parse error</b>:  syntax error, unexpected '']'' in <b>C:\\OpenServer\\domains\\woch.loc\\manager\\includes\\document.parser.class.inc.php(1360) : eval()''d code</b> on line <b>1</b><br />\n</div>\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Error information</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>ErrorType[num]</td>\n\t\t<td>PARSING ERROR[4]</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>File</td>\n\t\t<td>C:\\OpenServer\\domains\\woch.loc\\manager\\includes\\document.parser.class.inc.php(1360) : eval()''d code</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Line</td>\n\t\t<td>1</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Source</td>\n\t\t<td>Snippet</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Current Snippet</td>\n\t\t<td>test</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Basic info</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>REQUEST_URI</td>\n\t\t<td>http://woch.loc/</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Resource</td>\n\t\t<td>[1] <a href="http://woch.loc/" target="_blank">Главная</a></td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Referer</td>\n\t\t<td>http://woch.loc/login.html</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>User Agent</td>\n\t\t<td>Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>IP</td>\n\t\t<td>127.0.0.1</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Current time</td>\n\t\t<td>2017-05-09 15:39:22</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Benchmarks</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>MySQL</td>\n\t\t<td>0.2062 s (6 Requests)</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>PHP</td>\n\t\t<td>0.0721 s</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Total</td>\n\t\t<td>0.2783 s</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Memory</td>\n\t\t<td>2.265007019043 mb</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th>Backtrace</th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->executeParser</strong>()<br />index.php on line 128</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2141</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2234</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DocumentParser->parseDocumentSource</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 668</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->evalSnippets</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 2003</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DocumentParser->_get_snip_result</strong>(''test'')<br />manager/includes/document.parser.class.inc.php on line 1408</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->evalSnippet</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 1466</td>\n\t</tr>\n</table>\n'),
(32, 0, 1494333583, 3, 6, 1, 'Snippet - test / PHP Parse Error', '<h2 style="color:red">&laquo; MODX Parse Error &raquo;</h2><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;">Error : syntax error, unexpected '']''</div><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;"><br />\n<b>Parse error</b>:  syntax error, unexpected '']'' in <b>C:\\OpenServer\\domains\\woch.loc\\manager\\includes\\document.parser.class.inc.php(1360) : eval()''d code</b> on line <b>1</b><br />\n</div>\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Error information</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>ErrorType[num]</td>\n\t\t<td>PARSING ERROR[4]</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>File</td>\n\t\t<td>C:\\OpenServer\\domains\\woch.loc\\manager\\includes\\document.parser.class.inc.php(1360) : eval()''d code</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Line</td>\n\t\t<td>1</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Source</td>\n\t\t<td>Snippet</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Current Snippet</td>\n\t\t<td>test</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Basic info</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>REQUEST_URI</td>\n\t\t<td>http://woch.loc/</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Resource</td>\n\t\t<td>[1] <a href="http://woch.loc/" target="_blank">Главная</a></td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Referer</td>\n\t\t<td>http://woch.loc/login.html</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>User Agent</td>\n\t\t<td>Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>IP</td>\n\t\t<td>127.0.0.1</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Current time</td>\n\t\t<td>2017-05-09 15:39:43</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Benchmarks</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>MySQL</td>\n\t\t<td>0.2166 s (6 Requests)</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>PHP</td>\n\t\t<td>0.0712 s</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Total</td>\n\t\t<td>0.2878 s</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Memory</td>\n\t\t<td>2.265007019043 mb</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th>Backtrace</th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->executeParser</strong>()<br />index.php on line 128</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2141</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2234</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DocumentParser->parseDocumentSource</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 668</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->evalSnippets</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 2003</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DocumentParser->_get_snip_result</strong>(''test'')<br />manager/includes/document.parser.class.inc.php on line 1408</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->evalSnippet</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 1466</td>\n\t</tr>\n</table>\n'),
(33, 0, 1494333595, 3, 6, 1, 'Snippet - test / PHP Parse Error', '<h2 style="color:red">&laquo; MODX Parse Error &raquo;</h2><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;">Error : syntax error, unexpected '']''</div><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;"><br />\n<b>Parse error</b>:  syntax error, unexpected '']'' in <b>C:\\OpenServer\\domains\\woch.loc\\manager\\includes\\document.parser.class.inc.php(1360) : eval()''d code</b> on line <b>1</b><br />\n</div>\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Error information</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>ErrorType[num]</td>\n\t\t<td>PARSING ERROR[4]</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>File</td>\n\t\t<td>C:\\OpenServer\\domains\\woch.loc\\manager\\includes\\document.parser.class.inc.php(1360) : eval()''d code</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Line</td>\n\t\t<td>1</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Source</td>\n\t\t<td>Snippet</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Current Snippet</td>\n\t\t<td>test</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Basic info</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>REQUEST_URI</td>\n\t\t<td>http://woch.loc/</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Resource</td>\n\t\t<td>[1] <a href="http://woch.loc/" target="_blank">Главная</a></td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Referer</td>\n\t\t<td>http://woch.loc/manager/index.php?a=1&amp;amp;f=menu</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>User Agent</td>\n\t\t<td>Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>IP</td>\n\t\t<td>127.0.0.1</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Current time</td>\n\t\t<td>2017-05-09 15:39:55</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Benchmarks</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>MySQL</td>\n\t\t<td>0.1511 s (3 Requests)</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>PHP</td>\n\t\t<td>0.0655 s</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Total</td>\n\t\t<td>0.2166 s</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Memory</td>\n\t\t<td>2.2656631469727 mb</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th>Backtrace</th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->executeParser</strong>()<br />index.php on line 128</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2141</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2234</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DocumentParser->parseDocumentSource</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 668</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->evalSnippets</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 2003</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DocumentParser->_get_snip_result</strong>(''test'')<br />manager/includes/document.parser.class.inc.php on line 1408</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->evalSnippet</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 1466</td>\n\t</tr>\n</table>\n'),
(34, 0, 1494333642, 3, 6, 1, 'Snippet - test / PHP Parse Error', '<h2 style="color:red">&laquo; MODX Parse Error &raquo;</h2><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;">Error : syntax error, unexpected '']''</div><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;"><br />\n<b>Parse error</b>:  syntax error, unexpected '']'' in <b>C:\\OpenServer\\domains\\woch.loc\\manager\\includes\\document.parser.class.inc.php(1360) : eval()''d code</b> on line <b>1</b><br />\n</div>\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Error information</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>ErrorType[num]</td>\n\t\t<td>PARSING ERROR[4]</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>File</td>\n\t\t<td>C:\\OpenServer\\domains\\woch.loc\\manager\\includes\\document.parser.class.inc.php(1360) : eval()''d code</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Line</td>\n\t\t<td>1</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Source</td>\n\t\t<td>Snippet</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Current Snippet</td>\n\t\t<td>test</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Basic info</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>REQUEST_URI</td>\n\t\t<td>http://woch.loc/</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Resource</td>\n\t\t<td>[1] <a href="http://woch.loc/" target="_blank">Главная</a></td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Referer</td>\n\t\t<td>http://woch.loc/manager/index.php?a=1&amp;amp;f=menu</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>User Agent</td>\n\t\t<td>Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>IP</td>\n\t\t<td>127.0.0.1</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Current time</td>\n\t\t<td>2017-05-09 15:40:42</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Benchmarks</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>MySQL</td>\n\t\t<td>0.2169 s (6 Requests)</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>PHP</td>\n\t\t<td>0.0767 s</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Total</td>\n\t\t<td>0.2936 s</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Memory</td>\n\t\t<td>2.2649765014648 mb</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th>Backtrace</th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->executeParser</strong>()<br />index.php on line 128</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2141</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2234</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DocumentParser->parseDocumentSource</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 668</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->evalSnippets</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 2003</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DocumentParser->_get_snip_result</strong>(''test'')<br />manager/includes/document.parser.class.inc.php on line 1408</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->evalSnippet</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 1466</td>\n\t</tr>\n</table>\n'),
(35, 0, 1494336121, 3, 8, 1, 'Snippet - UserAuthorization / PHP Parse Error', '<h2 style="color:red">&laquo; MODX Parse Error &raquo;</h2><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;">Error : syntax error, unexpected ''waves'' (T_STRING), expecting '','' or '';''</div><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;"><br />\n<b>Parse error</b>:  syntax error, unexpected ''waves'' (T_STRING), expecting '','' or '';'' in <b>C:\\OpenServer\\domains\\woch.loc\\manager\\includes\\document.parser.class.inc.php(1360) : eval()''d code</b> on line <b>8</b><br />\n</div>\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Error information</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>ErrorType[num]</td>\n\t\t<td>PARSING ERROR[4]</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>File</td>\n\t\t<td>C:\\OpenServer\\domains\\woch.loc\\manager\\includes\\document.parser.class.inc.php(1360) : eval()''d code</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Line</td>\n\t\t<td>8</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Source</td>\n\t\t<td>Snippet</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Current Snippet</td>\n\t\t<td>UserAuthorization</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Basic info</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>REQUEST_URI</td>\n\t\t<td>http://woch.loc/</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Resource</td>\n\t\t<td>[1] <a href="http://woch.loc/" target="_blank">Главная</a></td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Referer</td>\n\t\t<td>http://woch.loc/login.html</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>User Agent</td>\n\t\t<td>Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>IP</td>\n\t\t<td>127.0.0.1</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Current time</td>\n\t\t<td>2017-05-09 16:22:01</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Benchmarks</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>MySQL</td>\n\t\t<td>0.2164 s (6 Requests)</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>PHP</td>\n\t\t<td>0.0913 s</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Total</td>\n\t\t<td>0.3077 s</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Memory</td>\n\t\t<td>2.2656936645508 mb</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th>Backtrace</th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->executeParser</strong>()<br />index.php on line 128</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2141</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2234</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DocumentParser->parseDocumentSource</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 668</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->evalSnippets</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 2003</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DocumentParser->_get_snip_result</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 1408</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->evalSnippet</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 1466</td>\n\t</tr>\n</table>\n'),
(36, 0, 1494336123, 3, 8, 1, 'Snippet - UserAuthorization / PHP Parse Error', '<h2 style="color:red">&laquo; MODX Parse Error &raquo;</h2><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;">Error : syntax error, unexpected ''waves'' (T_STRING), expecting '','' or '';''</div><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;"><br />\n<b>Parse error</b>:  syntax error, unexpected ''waves'' (T_STRING), expecting '','' or '';'' in <b>C:\\OpenServer\\domains\\woch.loc\\manager\\includes\\document.parser.class.inc.php(1360) : eval()''d code</b> on line <b>8</b><br />\n</div>\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Error information</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>ErrorType[num]</td>\n\t\t<td>PARSING ERROR[4]</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>File</td>\n\t\t<td>C:\\OpenServer\\domains\\woch.loc\\manager\\includes\\document.parser.class.inc.php(1360) : eval()''d code</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Line</td>\n\t\t<td>8</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Source</td>\n\t\t<td>Snippet</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Current Snippet</td>\n\t\t<td>UserAuthorization</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Basic info</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>REQUEST_URI</td>\n\t\t<td>http://woch.loc/</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Resource</td>\n\t\t<td>[1] <a href="http://woch.loc/" target="_blank">Главная</a></td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Referer</td>\n\t\t<td>http://woch.loc/login.html</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>User Agent</td>\n\t\t<td>Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>IP</td>\n\t\t<td>127.0.0.1</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Current time</td>\n\t\t<td>2017-05-09 16:22:03</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Benchmarks</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>MySQL</td>\n\t\t<td>0.1499 s (3 Requests)</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>PHP</td>\n\t\t<td>0.0728 s</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Total</td>\n\t\t<td>0.2228 s</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Memory</td>\n\t\t<td>2.265007019043 mb</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th>Backtrace</th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->executeParser</strong>()<br />index.php on line 128</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2141</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2234</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DocumentParser->parseDocumentSource</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 668</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->evalSnippets</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 2003</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DocumentParser->_get_snip_result</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 1408</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->evalSnippet</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 1466</td>\n\t</tr>\n</table>\n'),
(37, 0, 1494336186, 3, 8, 1, 'Snippet - UserAuthorization / PHP Parse Error', '<h2 style="color:red">&laquo; MODX Parse Error &raquo;</h2><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;">Error : syntax error, unexpected ''else'' (T_ELSE)</div><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;"><br />\n<b>Parse error</b>:  syntax error, unexpected ''else'' (T_ELSE) in <b>C:\\OpenServer\\domains\\woch.loc\\manager\\includes\\document.parser.class.inc.php(1360) : eval()''d code</b> on line <b>4</b><br />\n</div>\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Error information</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>ErrorType[num]</td>\n\t\t<td>PARSING ERROR[4]</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>File</td>\n\t\t<td>C:\\OpenServer\\domains\\woch.loc\\manager\\includes\\document.parser.class.inc.php(1360) : eval()''d code</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Line</td>\n\t\t<td>4</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Source</td>\n\t\t<td>Snippet</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Current Snippet</td>\n\t\t<td>UserAuthorization</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Basic info</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>REQUEST_URI</td>\n\t\t<td>http://woch.loc/</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Resource</td>\n\t\t<td>[1] <a href="http://woch.loc/" target="_blank">Главная</a></td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Referer</td>\n\t\t<td>http://woch.loc/login.html</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>User Agent</td>\n\t\t<td>Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>IP</td>\n\t\t<td>127.0.0.1</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Current time</td>\n\t\t<td>2017-05-09 16:23:06</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Benchmarks</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>MySQL</td>\n\t\t<td>0.2080 s (6 Requests)</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>PHP</td>\n\t\t<td>0.0728 s</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Total</td>\n\t\t<td>0.2808 s</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Memory</td>\n\t\t<td>2.265007019043 mb</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th>Backtrace</th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->executeParser</strong>()<br />index.php on line 128</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2141</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2234</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DocumentParser->parseDocumentSource</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 668</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->evalSnippets</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 2003</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DocumentParser->_get_snip_result</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 1408</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->evalSnippet</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 1466</td>\n\t</tr>\n</table>\n'),
(38, 0, 1494336213, 3, 8, 1, 'Snippet - UserAuthorization / PHP Parse Error', '<h2 style="color:red">&laquo; MODX Parse Error &raquo;</h2><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;">Error : syntax error, unexpected ''waves'' (T_STRING), expecting '','' or '';''</div><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;"><br />\n<b>Parse error</b>:  syntax error, unexpected ''waves'' (T_STRING), expecting '','' or '';'' in <b>C:\\OpenServer\\domains\\woch.loc\\manager\\includes\\document.parser.class.inc.php(1360) : eval()''d code</b> on line <b>5</b><br />\n</div>\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Error information</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>ErrorType[num]</td>\n\t\t<td>PARSING ERROR[4]</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>File</td>\n\t\t<td>C:\\OpenServer\\domains\\woch.loc\\manager\\includes\\document.parser.class.inc.php(1360) : eval()''d code</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Line</td>\n\t\t<td>5</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Source</td>\n\t\t<td>Snippet</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Current Snippet</td>\n\t\t<td>UserAuthorization</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Basic info</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>REQUEST_URI</td>\n\t\t<td>http://woch.loc/</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Resource</td>\n\t\t<td>[1] <a href="http://woch.loc/" target="_blank">Главная</a></td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Referer</td>\n\t\t<td>http://woch.loc/login.html</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>User Agent</td>\n\t\t<td>Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>IP</td>\n\t\t<td>127.0.0.1</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Current time</td>\n\t\t<td>2017-05-09 16:23:33</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Benchmarks</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>MySQL</td>\n\t\t<td>0.2169 s (6 Requests)</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>PHP</td>\n\t\t<td>0.0807 s</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Total</td>\n\t\t<td>0.2976 s</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Memory</td>\n\t\t<td>2.265007019043 mb</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th>Backtrace</th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->executeParser</strong>()<br />index.php on line 128</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2141</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2234</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DocumentParser->parseDocumentSource</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 668</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->evalSnippets</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 2003</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DocumentParser->_get_snip_result</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 1408</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->evalSnippet</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 1466</td>\n\t</tr>\n</table>\n'),
(39, 0, 1494336248, 3, 8, 1, 'Snippet - UserAuthorization / PHP Parse Error', '<h2 style="color:red">&laquo; MODX Parse Error &raquo;</h2><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;">Error : syntax error, unexpected end of file</div><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;"><br />\n<b>Parse error</b>:  syntax error, unexpected end of file in <b>C:\\OpenServer\\domains\\woch.loc\\manager\\includes\\document.parser.class.inc.php(1360) : eval()''d code</b> on line <b>5</b><br />\n</div>\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Error information</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>ErrorType[num]</td>\n\t\t<td>PARSING ERROR[4]</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>File</td>\n\t\t<td>C:\\OpenServer\\domains\\woch.loc\\manager\\includes\\document.parser.class.inc.php(1360) : eval()''d code</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Line</td>\n\t\t<td>5</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Source</td>\n\t\t<td>Snippet</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Current Snippet</td>\n\t\t<td>UserAuthorization</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Basic info</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>REQUEST_URI</td>\n\t\t<td>http://woch.loc/</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Resource</td>\n\t\t<td>[1] <a href="http://woch.loc/" target="_blank">Главная</a></td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Referer</td>\n\t\t<td>http://woch.loc/login.html</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>User Agent</td>\n\t\t<td>Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>IP</td>\n\t\t<td>127.0.0.1</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Current time</td>\n\t\t<td>2017-05-09 16:24:08</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Benchmarks</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>MySQL</td>\n\t\t<td>0.2068 s (6 Requests)</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>PHP</td>\n\t\t<td>0.0768 s</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Total</td>\n\t\t<td>0.2835 s</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Memory</td>\n\t\t<td>2.265007019043 mb</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th>Backtrace</th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->executeParser</strong>()<br />index.php on line 128</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2141</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2234</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DocumentParser->parseDocumentSource</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 668</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->evalSnippets</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 2003</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DocumentParser->_get_snip_result</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 1408</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->evalSnippet</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 1466</td>\n\t</tr>\n</table>\n'),
(40, 0, 1494342803, 3, 9, 1, 'Snippet - UserAuthorization / PHP Parse Error', '<h2 style="color:red">&laquo; MODX Parse Error &raquo;</h2><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;">Error : syntax error, unexpected ''col'' (T_STRING), expecting '','' or '';''</div><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;"><br />\n<b>Parse error</b>:  syntax error, unexpected ''col'' (T_STRING), expecting '','' or '';'' in <b>C:\\OpenServer\\domains\\woch.loc\\manager\\includes\\document.parser.class.inc.php(1360) : eval()''d code</b> on line <b>3</b><br />\n</div>\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Error information</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>ErrorType[num]</td>\n\t\t<td>PARSING ERROR[4]</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>File</td>\n\t\t<td>C:\\OpenServer\\domains\\woch.loc\\manager\\includes\\document.parser.class.inc.php(1360) : eval()''d code</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Line</td>\n\t\t<td>3</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Source</td>\n\t\t<td>Snippet</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Current Snippet</td>\n\t\t<td>UserAuthorization</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Basic info</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>REQUEST_URI</td>\n\t\t<td>http://woch.loc/</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Resource</td>\n\t\t<td>[1] <a href="http://woch.loc/" target="_blank">Главная</a></td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Referer</td>\n\t\t<td>http://loginza.ru/api/redirect?rnd=0.826642331175087</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>User Agent</td>\n\t\t<td>Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>IP</td>\n\t\t<td>127.0.0.1</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Current time</td>\n\t\t<td>2017-05-09 18:13:23</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Benchmarks</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>MySQL</td>\n\t\t<td>0.2161 s (6 Requests)</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>PHP</td>\n\t\t<td>0.0806 s</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Total</td>\n\t\t<td>0.2968 s</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Memory</td>\n\t\t<td>2.2654800415039 mb</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th>Backtrace</th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->executeParser</strong>()<br />index.php on line 128</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2141</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2234</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DocumentParser->parseDocumentSource</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 668</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->evalSnippets</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 2003</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DocumentParser->_get_snip_result</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 1408</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->evalSnippet</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 1466</td>\n\t</tr>\n</table>\n'),
(41, 0, 1494344480, 3, 9, 1, 'Snippet - personal_area / PHP Parse Error', '<h2 style="color:red">&laquo; MODX Parse Error &raquo;</h2><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;">Error : syntax error, unexpected ''circle'' (T_STRING), expecting '','' or '';''</div><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;"><br />\n<b>Parse error</b>:  syntax error, unexpected ''circle'' (T_STRING), expecting '','' or '';'' in <b>C:\\OpenServer\\domains\\woch.loc\\manager\\includes\\document.parser.class.inc.php(1360) : eval()''d code</b> on line <b>8</b><br />\n</div>\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Error information</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>ErrorType[num]</td>\n\t\t<td>PARSING ERROR[4]</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>File</td>\n\t\t<td>C:\\OpenServer\\domains\\woch.loc\\manager\\includes\\document.parser.class.inc.php(1360) : eval()''d code</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Line</td>\n\t\t<td>8</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Source</td>\n\t\t<td>Snippet</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Current Snippet</td>\n\t\t<td>personal_area</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Basic info</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>REQUEST_URI</td>\n\t\t<td>http://woch.loc/</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Resource</td>\n\t\t<td>[1] <a href="http://woch.loc/" target="_blank">Главная</a></td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Referer</td>\n\t\t<td>http://loginza.ru/api/redirect?rnd=0.826642331175087</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>User Agent</td>\n\t\t<td>Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>IP</td>\n\t\t<td>127.0.0.1</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Current time</td>\n\t\t<td>2017-05-09 18:41:20</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Benchmarks</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>MySQL</td>\n\t\t<td>0.2066 s (6 Requests)</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>PHP</td>\n\t\t<td>0.0783 s</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Total</td>\n\t\t<td>0.2849 s</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Memory</td>\n\t\t<td>2.2654800415039 mb</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th>Backtrace</th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->executeParser</strong>()<br />index.php on line 128</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2141</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2234</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DocumentParser->parseDocumentSource</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 668</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->evalSnippets</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 2003</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DocumentParser->_get_snip_result</strong>(''personal_area'')<br />manager/includes/document.parser.class.inc.php on line 1408</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->evalSnippet</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 1466</td>\n\t</tr>\n</table>\n'),
(42, 0, 1494344542, 3, 9, 1, 'Snippet - personal_area / PHP Parse Error', '<h2 style="color:red">&laquo; MODX Parse Error &raquo;</h2><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;">Error : syntax error, unexpected ''circle'' (T_STRING), expecting '','' or '';''</div><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;"><br />\n<b>Parse error</b>:  syntax error, unexpected ''circle'' (T_STRING), expecting '','' or '';'' in <b>C:\\OpenServer\\domains\\woch.loc\\manager\\includes\\document.parser.class.inc.php(1360) : eval()''d code</b> on line <b>8</b><br />\n</div>\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Error information</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>ErrorType[num]</td>\n\t\t<td>PARSING ERROR[4]</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>File</td>\n\t\t<td>C:\\OpenServer\\domains\\woch.loc\\manager\\includes\\document.parser.class.inc.php(1360) : eval()''d code</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Line</td>\n\t\t<td>8</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Source</td>\n\t\t<td>Snippet</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Current Snippet</td>\n\t\t<td>personal_area</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Basic info</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>REQUEST_URI</td>\n\t\t<td>http://woch.loc/</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Resource</td>\n\t\t<td>[1] <a href="http://woch.loc/" target="_blank">Главная</a></td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Referer</td>\n\t\t<td>http://loginza.ru/api/redirect?rnd=0.826642331175087</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>User Agent</td>\n\t\t<td>Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>IP</td>\n\t\t<td>127.0.0.1</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Current time</td>\n\t\t<td>2017-05-09 18:42:22</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Benchmarks</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>MySQL</td>\n\t\t<td>0.2159 s (6 Requests)</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>PHP</td>\n\t\t<td>0.0805 s</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Total</td>\n\t\t<td>0.2964 s</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Memory</td>\n\t\t<td>2.2654800415039 mb</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th>Backtrace</th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->executeParser</strong>()<br />index.php on line 128</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DocumentParser->prepareResponse</strong>()<br />manager/includes/document.parser.class.inc.php on line 2141</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->outputContent</strong>()<br />manager/includes/document.parser.class.inc.php on line 2234</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DocumentParser->parseDocumentSource</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 668</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->evalSnippets</strong>(string $var1)<br />manager/includes/document.parser.class.inc.php on line 2003</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DocumentParser->_get_snip_result</strong>(''personal_area'')<br />manager/includes/document.parser.class.inc.php on line 1408</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td><strong>DocumentParser->evalSnippet</strong>(string $var1, array $var2)<br />manager/includes/document.parser.class.inc.php on line 1466</td>\n\t</tr>\n</table>\n');

-- 
-- Вывод данных для таблицы modx_keyword_xref
--

-- Таблица ibase_woch.modx_keyword_xref не содержит данных

-- 
-- Вывод данных для таблицы modx_log_history
--
INSERT INTO modx_log_history VALUES
(1, '', '127.0.0.1', 1492444195),
(2, '', '127.0.0.1', 1493377251),
(3, '', '127.0.0.1', 1494179638),
(4, '', '127.0.0.1', 1494180844),
(5, '', '127.0.0.1', 1494327577),
(6, '', '127.0.0.1', 1494327700),
(7, '', '127.0.0.1', 1494327792),
(8, '', '127.0.0.1', 1494332930),
(9, '', '127.0.0.1', 1494332990),
(10, '', '127.0.0.1', 1494334119),
(11, '', '127.0.0.1', 1494335413),
(12, '', '127.0.0.1', 1494336606);

-- 
-- Вывод данных для таблицы modx_manager_log
--
INSERT INTO modx_manager_log VALUES
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
(984, 1492717428, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
(985, 1492769180, 1, 'admin', 76, '-', '-', 'Element management'),
(986, 1492769196, 1, 'admin', 78, '5', 'header', 'Editing Chunk (HTML Snippet)'),
(987, 1492769206, 1, 'admin', 79, '5', 'header', 'Saving Chunk (HTML Snippet)'),
(988, 1492769206, 1, 'admin', 76, '-', '-', 'Element management'),
(989, 1492769216, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
(990, 1492769221, 1, 'admin', 76, '-', '-', 'Element management'),
(991, 1492769227, 1, 'admin', 16, '6', 'registration', 'Editing template'),
(992, 1492769285, 1, 'admin', 76, '-', '-', 'Element management'),
(993, 1492769288, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
(994, 1492769302, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
(995, 1492769302, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
(996, 1492769342, 1, 'admin', 20, '6', 'registration', 'Saving template'),
(997, 1492769342, 1, 'admin', 16, '6', 'registration', 'Editing template'),
(998, 1492769468, 1, 'admin', 20, '6', 'registration', 'Saving template'),
(999, 1492769468, 1, 'admin', 16, '6', 'registration', 'Editing template'),
(1000, 1492769567, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
(1001, 1492769567, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
(1002, 1492769576, 1, 'admin', 20, '6', 'registration', 'Saving template'),
(1003, 1492769576, 1, 'admin', 16, '6', 'registration', 'Editing template'),
(1004, 1492769694, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
(1005, 1492769694, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
(1006, 1492769902, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
(1007, 1492769902, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
(1008, 1492770001, 1, 'admin', 75, '-', '-', 'User/ role management'),
(1009, 1492770006, 1, 'admin', 11, '-', 'Новый пользователь', 'Creating a user'),
(1010, 1492770063, 1, 'admin', 32, '-', 'ipra', 'Saving user'),
(1011, 1492770092, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
(1012, 1492770092, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
(1013, 1492774055, 2, 'ipra', 58, '-', 'MODX', 'Logged in'),
(1014, 1492774071, 2, 'ipra', 99, '-', '-', 'Manage Web Users'),
(1015, 1492774085, 2, 'ipra', 86, '-', '-', 'Role management'),
(1016, 1492774088, 2, 'ipra', 40, '-', '-', 'Editing Access Permissions'),
(1017, 1492774090, 2, 'ipra', 91, '-', '-', 'Editing Web Access Permissions'),
(1018, 1492774092, 2, 'ipra', 75, '-', '-', 'User/ role management'),
(1019, 1492774102, 2, 'ipra', 106, '-', '-', 'Viewing Modules'),
(1020, 1492774104, 2, 'ipra', 112, '1', 'Doc Manager', 'Execute module'),
(1021, 1492774110, 2, 'ipra', 27, '1', 'Home', 'Editing resource'),
(1022, 1492774120, 2, 'ipra', 5, '1', 'Главная', 'Saving resource'),
(1023, 1492774123, 2, 'ipra', 3, '1', 'Главная', 'Viewing data for resource'),
(1024, 1492774630, 2, 'ipra', 76, '-', '-', 'Element management'),
(1025, 1492771119, 1, 'admin', 76, '-', '-', 'Element management'),
(1026, 1492774747, 2, 'ipra', 76, '-', '-', 'Element management'),
(1027, 1492774755, 2, 'ipra', 16, '5', 'Авторизация', 'Editing template'),
(1028, 1492774765, 2, 'ipra', 16, '5', 'Авторизация', 'Editing template'),
(1029, 1492774770, 2, 'ipra', 76, '-', '-', 'Element management'),
(1030, 1492771175, 1, 'admin', 99, '-', '-', 'Manage Web Users'),
(1031, 1492774785, 2, 'ipra', 16, '3', 'Home', 'Editing template'),
(1032, 1492771186, 1, 'admin', 88, '2', 'igor', 'Editing web user'),
(1033, 1492774821, 2, 'ipra', 76, '-', '-', 'Element management'),
(1034, 1492774823, 2, 'ipra', 16, '6', 'registration', 'Editing template'),
(1035, 1492774839, 2, 'ipra', 76, '-', '-', 'Element management'),
(1036, 1492774842, 2, 'ipra', 16, '5', 'Авторизация', 'Editing template'),
(1037, 1492771252, 1, 'admin', 89, '2', 'igor', 'Saving web user'),
(1038, 1492771267, 1, 'admin', 8, '-', '-', 'Logged out'),
(1039, 1492774879, 2, 'ipra', 76, '-', '-', 'Element management'),
(1040, 1492774882, 2, 'ipra', 16, '3', 'Home', 'Editing template'),
(1041, 1492774904, 2, 'ipra', 76, '-', '-', 'Element management'),
(1042, 1492774906, 2, 'ipra', 16, '6', 'registration', 'Editing template'),
(1043, 1492774913, 2, 'ipra', 76, '-', '-', 'Element management'),
(1044, 1492771315, 1, 'admin', 58, '-', 'MODX', 'Logged in'),
(1045, 1492774930, 2, 'ipra', 20, '5', 'Авторизация', 'Saving template'),
(1046, 1492774932, 2, 'ipra', 76, '-', '-', 'Element management'),
(1047, 1492771326, 1, 'admin', 99, '-', '-', 'Manage Web Users'),
(1048, 1492771337, 1, 'admin', 75, '-', '-', 'User/ role management'),
(1049, 1492771346, 1, 'admin', 12, '1', 'admin', 'Editing user'),
(1050, 1492774967, 2, 'ipra', 16, '5', 'Авторизация', 'Editing template'),
(1051, 1492771379, 1, 'admin', 32, '1', 'admin', 'Saving user'),
(1052, 1492771399, 1, 'admin', 99, '-', '-', 'Manage Web Users'),
(1053, 1492771405, 1, 'admin', 88, '2', 'igor', 'Editing web user'),
(1054, 1492771423, 1, 'admin', 89, '2', 'igor', 'Saving web user'),
(1055, 1492775034, 2, 'ipra', 20, '5', 'Авторизация', 'Saving template'),
(1056, 1492775036, 2, 'ipra', 76, '-', '-', 'Element management'),
(1057, 1492775054, 2, 'ipra', 16, '5', 'Авторизация', 'Editing template'),
(1058, 1492771467, 1, 'admin', 99, '-', '-', 'Manage Web Users'),
(1059, 1492775080, 2, 'ipra', 20, '5', 'Авторизация', 'Saving template'),
(1060, 1492775083, 2, 'ipra', 76, '-', '-', 'Element management'),
(1061, 1492771477, 1, 'admin', 91, '-', '-', 'Editing Web Access Permissions'),
(1062, 1492775104, 2, 'ipra', 16, '5', 'Авторизация', 'Editing template'),
(1063, 1492775115, 2, 'ipra', 76, '-', '-', 'Element management'),
(1064, 1492771512, 1, 'admin', 92, '-', '-', 'Editing Access Permissions'),
(1065, 1492775120, 2, 'ipra', 22, '12', 'loginza', 'Editing Snippet'),
(1066, 1492771514, 1, 'admin', 91, '-', '-', 'Editing Web Access Permissions'),
(1067, 1492771525, 1, 'admin', 86, '-', '-', 'Role management'),
(1068, 1492771543, 1, 'admin', 35, '2', 'Editor', 'Editing role'),
(1069, 1492771549, 1, 'admin', 86, '-', '-', 'Role management'),
(1070, 1492771557, 1, 'admin', 40, '-', '-', 'Editing Access Permissions'),
(1071, 1492771650, 1, 'admin', 76, '-', '-', 'Element management'),
(1072, 1492771666, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
(1073, 1492771685, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
(1074, 1492771687, 1, 'admin', 76, '-', '-', 'Element management'),
(1075, 1492771720, 1, 'admin', 16, '5', 'Авторизация', 'Editing template'),
(1076, 1492771728, 1, 'admin', 76, '-', '-', 'Element management'),
(1077, 1492771733, 1, 'admin', 16, '6', 'registration', 'Editing template'),
(1078, 1492771753, 1, 'admin', 20, '6', 'registration', 'Saving template'),
(1079, 1492771755, 1, 'admin', 76, '-', '-', 'Element management'),
(1080, 1492771799, 1, 'admin', 16, '6', 'registration', 'Editing template'),
(1081, 1492771851, 1, 'admin', 20, '6', 'registration', 'Saving template'),
(1082, 1492771852, 1, 'admin', 16, '6', 'registration', 'Editing template'),
(1083, 1492775483, 2, 'ipra', 76, '-', '-', 'Element management'),
(1084, 1492771982, 1, 'admin', 76, '-', '-', 'Element management'),
(1085, 1492771987, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
(1086, 1492772088, 1, 'admin', 79, '8', 'exist_login', 'Saving Chunk (HTML Snippet)'),
(1087, 1492772090, 1, 'admin', 76, '-', '-', 'Element management'),
(1088, 1492772126, 1, 'admin', 78, '8', 'exist_login', 'Editing Chunk (HTML Snippet)'),
(1089, 1492772196, 1, 'admin', 20, '6', 'registration', 'Saving template'),
(1090, 1492772197, 1, 'admin', 16, '6', 'registration', 'Editing template'),
(1091, 1492772201, 1, 'admin', 79, '8', 'reg_validation', 'Saving Chunk (HTML Snippet)'),
(1092, 1492772202, 1, 'admin', 78, '8', 'reg_validation', 'Editing Chunk (HTML Snippet)'),
(1093, 1492772280, 1, 'admin', 79, '8', 'reg_validation', 'Saving Chunk (HTML Snippet)'),
(1094, 1492772281, 1, 'admin', 78, '8', 'reg_validation', 'Editing Chunk (HTML Snippet)'),
(1095, 1492775904, 2, 'ipra', 16, '5', 'Авторизация', 'Editing template'),
(1096, 1492775945, 2, 'ipra', 20, '5', 'Авторизация', 'Saving template'),
(1097, 1492775946, 2, 'ipra', 76, '-', '-', 'Element management'),
(1098, 1492775972, 2, 'ipra', 16, '5', 'Авторизация', 'Editing template'),
(1099, 1492776142, 2, 'ipra', 20, '5', 'Авторизация', 'Saving template'),
(1100, 1492776143, 2, 'ipra', 16, '5', 'Авторизация', 'Editing template'),
(1101, 1492776250, 2, 'ipra', 20, '5', 'Авторизация', 'Saving template'),
(1102, 1492776251, 2, 'ipra', 16, '5', 'Авторизация', 'Editing template'),
(1103, 1492776283, 2, 'ipra', 20, '5', 'Авторизация', 'Saving template'),
(1104, 1492776283, 2, 'ipra', 16, '5', 'Авторизация', 'Editing template'),
(1105, 1492776317, 2, 'ipra', 20, '5', 'Авторизация', 'Saving template'),
(1106, 1492776317, 2, 'ipra', 16, '5', 'Авторизация', 'Editing template'),
(1107, 1492773028, 1, 'admin', 20, '6', 'registration', 'Saving template'),
(1108, 1492773029, 1, 'admin', 16, '6', 'registration', 'Editing template'),
(1109, 1492773032, 1, 'admin', 79, '8', 'reg_validation', 'Saving Chunk (HTML Snippet)'),
(1110, 1492773033, 1, 'admin', 78, '8', 'reg_validation', 'Editing Chunk (HTML Snippet)'),
(1111, 1492773270, 1, 'admin', 79, '8', 'reg_validation', 'Saving Chunk (HTML Snippet)'),
(1112, 1492773271, 1, 'admin', 78, '8', 'reg_validation', 'Editing Chunk (HTML Snippet)'),
(1113, 1492773284, 1, 'admin', 20, '6', 'registration', 'Saving template'),
(1114, 1492773285, 1, 'admin', 16, '6', 'registration', 'Editing template'),
(1115, 1492776992, 2, 'ipra', 76, '-', '-', 'Element management'),
(1116, 1492777005, 2, 'ipra', 78, '5', 'header', 'Editing Chunk (HTML Snippet)'),
(1117, 1492777015, 2, 'ipra', 76, '-', '-', 'Element management'),
(1118, 1492777018, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1119, 1492777032, 2, 'ipra', 76, '-', '-', 'Element management'),
(1120, 1492777096, 2, 'ipra', 20, '5', 'Авторизация', 'Saving template'),
(1121, 1492777097, 2, 'ipra', 16, '5', 'Авторизация', 'Editing template'),
(1122, 1492777136, 2, 'ipra', 20, '5', 'Авторизация', 'Saving template'),
(1123, 1492777136, 2, 'ipra', 16, '5', 'Авторизация', 'Editing template'),
(1124, 1492777155, 2, 'ipra', 76, '-', '-', 'Element management'),
(1125, 1492773552, 1, 'admin', 79, '8', 'reg_validation', 'Saving Chunk (HTML Snippet)'),
(1126, 1492773553, 1, 'admin', 78, '8', 'reg_validation', 'Editing Chunk (HTML Snippet)'),
(1127, 1492777163, 2, 'ipra', 76, '-', '-', 'Element management'),
(1128, 1492773592, 1, 'admin', 79, '8', 'reg_validation', 'Saving Chunk (HTML Snippet)'),
(1129, 1492773593, 1, 'admin', 78, '8', 'reg_validation', 'Editing Chunk (HTML Snippet)'),
(1130, 1492773619, 1, 'admin', 79, '8', 'reg_validation', 'Saving Chunk (HTML Snippet)'),
(1131, 1492773619, 1, 'admin', 78, '8', 'reg_validation', 'Editing Chunk (HTML Snippet)'),
(1132, 1492773648, 1, 'admin', 79, '8', 'reg_validation', 'Saving Chunk (HTML Snippet)'),
(1133, 1492773649, 1, 'admin', 78, '8', 'reg_validation', 'Editing Chunk (HTML Snippet)'),
(1134, 1492774391, 1, 'admin', 79, '8', 'reg_validation', 'Saving Chunk (HTML Snippet)'),
(1135, 1492774392, 1, 'admin', 78, '8', 'reg_validation', 'Editing Chunk (HTML Snippet)'),
(1136, 1492774441, 1, 'admin', 20, '6', 'registration', 'Saving template'),
(1137, 1492774441, 1, 'admin', 16, '6', 'registration', 'Editing template'),
(1138, 1492888438, 1, 'admin', 58, '-', 'MODX', 'Logged in'),
(1139, 1492928526, 1, 'admin', 76, '-', '-', 'Element management'),
(1140, 1492928538, 1, 'admin', 78, '8', 'reg_validation', 'Editing Chunk (HTML Snippet)'),
(1141, 1493012748, 1, 'admin', 76, '-', '-', 'Element management'),
(1142, 1493012757, 1, 'admin', 78, '8', 'reg_validation', 'Editing Chunk (HTML Snippet)'),
(1143, 1493013359, 1, 'admin', 79, '8', 'reg_validation', 'Saving Chunk (HTML Snippet)'),
(1144, 1493013359, 1, 'admin', 78, '8', 'reg_validation', 'Editing Chunk (HTML Snippet)'),
(1145, 1493016729, 1, 'admin', 78, '8', 'reg_validation', 'Editing Chunk (HTML Snippet)'),
(1146, 1493060399, 1, 'admin', 78, '8', 'reg_validation', 'Editing Chunk (HTML Snippet)'),
(1147, 1493375767, 2, 'ipra', 58, '-', 'MODX', 'Logged in'),
(1148, 1493375776, 2, 'ipra', 76, '-', '-', 'Element management'),
(1149, 1493375789, 2, 'ipra', 16, '5', 'Авторизация', 'Editing template'),
(1150, 1493375842, 2, 'ipra', 20, '5', 'Авторизация', 'Saving template'),
(1151, 1493375842, 2, 'ipra', 16, '5', 'Авторизация', 'Editing template'),
(1152, 1493375864, 2, 'ipra', 16, '5', 'Авторизация', 'Editing template'),
(1153, 1493375869, 2, 'ipra', 76, '-', '-', 'Element management'),
(1154, 1493375874, 2, 'ipra', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(1155, 1493375908, 2, 'ipra', 79, '-', 'autoriz', 'Saving Chunk (HTML Snippet)'),
(1156, 1493375908, 2, 'ipra', 78, '9', 'autoriz', 'Editing Chunk (HTML Snippet)'),
(1157, 1493375921, 2, 'ipra', 20, '5', 'Авторизация', 'Saving template'),
(1158, 1493375921, 2, 'ipra', 16, '5', 'Авторизация', 'Editing template'),
(1159, 1493376090, 2, 'ipra', 76, '-', '-', 'Element management'),
(1160, 1493376093, 2, 'ipra', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(1161, 1493376121, 2, 'ipra', 79, '-', 'test', 'Saving Chunk (HTML Snippet)'),
(1162, 1493376125, 2, 'ipra', 76, '-', '-', 'Element management'),
(1163, 1493376162, 2, 'ipra', 20, '5', 'Авторизация', 'Saving template'),
(1164, 1493376163, 2, 'ipra', 16, '5', 'Авторизация', 'Editing template'),
(1165, 1493377304, 2, 'ipra', 76, '-', '-', 'Element management'),
(1166, 1493377311, 2, 'ipra', 78, '9', 'autoriz', 'Editing Chunk (HTML Snippet)'),
(1167, 1493377917, 1, 'admin', 58, '-', 'MODX', 'Logged in'),
(1168, 1493378036, 1, 'admin', 76, '-', '-', 'Element management'),
(1169, 1493378046, 1, 'admin', 16, '6', 'registration', 'Editing template'),
(1170, 1493378056, 1, 'admin', 27, '5', 'Регистрация', 'Editing resource'),
(1171, 1493378058, 1, 'admin', 76, '-', '-', 'Element management'),
(1172, 1493378063, 1, 'admin', 16, '6', 'registration', 'Editing template'),
(1173, 1493392035, 1, 'admin', 16, '6', 'registration', 'Editing template'),
(1174, 1493396642, 1, 'admin', 16, '6', 'registration', 'Editing template'),
(1175, 1493401671, 1, 'admin', 76, '-', '-', 'Element management'),
(1176, 1493401726, 1, 'admin', 23, '-', 'Новый сниппет', 'Creating a new Snippet'),
(1177, 1493402032, 1, 'admin', 76, '-', '-', 'Element management'),
(1178, 1493402040, 1, 'admin', 22, '6', 'eForm', 'Editing Snippet'),
(1179, 1493402180, 1, 'admin', 76, '-', '-', 'Element management'),
(1180, 1493403272, 1, 'admin', 22, '16', 'exist_orAdd_user', 'Editing Snippet'),
(1181, 1493403382, 1, 'admin', 76, '-', '-', 'Element management'),
(1182, 1493403391, 1, 'admin', 19, '-', 'Новый шаблон', 'Creating a new template'),
(1183, 1493403633, 1, 'admin', 20, '-', 'exisEmail', 'Saving template'),
(1184, 1493403634, 1, 'admin', 76, '-', '-', 'Element management'),
(1185, 1493403688, 1, 'admin', 76, '-', '-', 'Element management'),
(1186, 1493403699, 1, 'admin', 16, '7', 'exisEmail', 'Editing template'),
(1187, 1493403705, 1, 'admin', 21, '7', 'exisEmail', 'Deleting template'),
(1188, 1493403709, 1, 'admin', 76, '-', '-', 'Element management'),
(1189, 1493403712, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource'),
(1190, 1493403934, 1, 'admin', 27, '1', 'Главная', 'Editing resource'),
(1191, 1493403980, 1, 'admin', 27, '1', 'Главная', 'Editing resource'),
(1192, 1493403986, 1, 'admin', 3, '1', 'Главная', 'Viewing data for resource'),
(1193, 1493413518, 1, 'admin', 76, '-', '-', 'Element management'),
(1194, 1493413531, 1, 'admin', 76, '-', '-', 'Element management'),
(1195, 1493413542, 1, 'admin', 76, '-', '-', 'Element management'),
(1196, 1493413569, 1, 'admin', 301, '4', 'Мета тайтл', 'Edit Template Variable'),
(1197, 1493413607, 1, 'admin', 76, '-', '-', 'Element management'),
(1198, 1493413613, 1, 'admin', 16, '3', 'Home', 'Editing template'),
(1199, 1493413736, 1, 'admin', 76, '-', '-', 'Element management'),
(1200, 1493413743, 1, 'admin', 16, '6', 'registration', 'Editing template'),
(1201, 1493413757, 1, 'admin', 27, '1', 'Главная', 'Editing resource'),
(1202, 1493413770, 1, 'admin', 76, '-', '-', 'Element management'),
(1203, 1493413787, 1, 'admin', 16, '3', 'Home', 'Editing template'),
(1204, 1493448167, 1, 'admin', 99, '-', '-', 'Manage Web Users'),
(1205, 1493464321, 1, 'admin', 58, '-', 'MODX', 'Logged in'),
(1206, 1493464360, 1, 'admin', 76, '-', '-', 'Element management'),
(1207, 1493464381, 1, 'admin', 99, '-', '-', 'Manage Web Users'),
(1208, 1493464400, 1, 'admin', 88, '4', 'Test', 'Editing web user'),
(1209, 1493464427, 1, 'admin', 99, '-', '-', 'Manage Web Users'),
(1210, 1493464432, 1, 'admin', 88, '2', 'igor', 'Editing web user'),
(1211, 1493464517, 1, 'admin', 99, '-', '-', 'Manage Web Users'),
(1212, 1493464555, 1, 'admin', 27, '5', 'Регистрация', 'Editing resource'),
(1213, 1493464792, 1, 'admin', 3, '5', 'Регистрация', 'Viewing data for resource'),
(1214, 1493464806, 1, 'admin', 27, '1', 'Главная', 'Editing resource'),
(1215, 1493464817, 1, 'admin', 3, '1', 'Главная', 'Viewing data for resource'),
(1216, 1493464834, 1, 'admin', 76, '-', '-', 'Element management'),
(1217, 1493464855, 1, 'admin', 16, '6', 'registration', 'Editing template'),
(1218, 1493465137, 1, 'admin', 20, '6', 'registration', 'Saving template'),
(1219, 1493465138, 1, 'admin', 76, '-', '-', 'Element management'),
(1220, 1493465166, 1, 'admin', 76, '-', '-', 'Element management'),
(1221, 1493465183, 1, 'admin', 22, '16', 'exist_orAdd_user', 'Editing Snippet'),
(1222, 1493466225, 1, 'admin', 16, '6', 'registration', 'Editing template'),
(1223, 1493466239, 1, 'admin', 20, '6', 'registration', 'Saving template'),
(1224, 1493466240, 1, 'admin', 76, '-', '-', 'Element management'),
(1225, 1493466271, 1, 'admin', 16, '6', 'registration', 'Editing template'),
(1226, 1493495511, 1, 'admin', 76, '-', '-', 'Element management'),
(1227, 1493495518, 1, 'admin', 16, '6', 'registration', 'Editing template'),
(1228, 1493495535, 1, 'admin', 76, '-', '-', 'Element management'),
(1229, 1493495567, 1, 'admin', 78, '8', 'reg_validation', 'Editing Chunk (HTML Snippet)'),
(1230, 1493495624, 1, 'admin', 76, '-', '-', 'Element management'),
(1231, 1493495639, 1, 'admin', 16, '6', 'registration', 'Editing template'),
(1232, 1493495673, 1, 'admin', 79, '8', 'reg_validation', 'Saving Chunk (HTML Snippet)'),
(1233, 1493495673, 1, 'admin', 78, '8', 'reg_validation', 'Editing Chunk (HTML Snippet)'),
(1234, 1493495686, 1, 'admin', 76, '-', '-', 'Element management'),
(1235, 1493495693, 1, 'admin', 22, '16', 'exist_orAdd_user', 'Editing Snippet'),
(1236, 1493495799, 1, 'admin', 24, '16', 'exist_orAdd_user', 'Saving Snippet'),
(1237, 1493495799, 1, 'admin', 22, '16', 'exist_orAdd_user', 'Editing Snippet'),
(1238, 1493495963, 1, 'admin', 76, '-', '-', 'Element management'),
(1239, 1493495993, 1, 'admin', 16, '6', 'registration', 'Editing template'),
(1240, 1493496102, 1, 'admin', 24, '16', 'exist_orAdd_user', 'Saving Snippet'),
(1241, 1493496103, 1, 'admin', 22, '16', 'exist_orAdd_user', 'Editing Snippet'),
(1242, 1493496248, 1, 'admin', 79, '8', 'reg_validation', 'Saving Chunk (HTML Snippet)'),
(1243, 1493496249, 1, 'admin', 78, '8', 'reg_validation', 'Editing Chunk (HTML Snippet)'),
(1244, 1493497172, 1, 'admin', 20, '6', 'registration', 'Saving template'),
(1245, 1493497173, 1, 'admin', 76, '-', '-', 'Element management'),
(1246, 1493497386, 1, 'admin', 24, '16', 'exist_orAdd_user', 'Saving Snippet'),
(1247, 1493497387, 1, 'admin', 22, '16', 'exist_orAdd_user', 'Editing Snippet'),
(1248, 1493497395, 1, 'admin', 24, '16', 'exist_orAdd_user', 'Saving Snippet'),
(1249, 1493497396, 1, 'admin', 76, '-', '-', 'Element management'),
(1250, 1493497425, 1, 'admin', 16, '6', 'registration', 'Editing template'),
(1251, 1493497635, 1, 'admin', 20, '6', 'registration', 'Saving template'),
(1252, 1493497635, 1, 'admin', 16, '6', 'registration', 'Editing template'),
(1253, 1493497991, 1, 'admin', 99, '-', '-', 'Manage Web Users'),
(1254, 1493500175, 1, 'admin', 4, '-', 'Новый ресурс', 'Creating a resource'),
(1255, 1493500219, 1, 'admin', 76, '-', '-', 'Element management'),
(1256, 1493500232, 1, 'admin', 22, '6', 'eForm', 'Editing Snippet'),
(1257, 1493500624, 1, 'admin', 76, '-', '-', 'Element management'),
(1258, 1493500630, 1, 'admin', 22, '16', 'exist_orAdd_user', 'Editing Snippet'),
(1259, 1493500667, 1, 'admin', 24, '16', 'exist_orAdd_user', 'Saving Snippet'),
(1260, 1493500668, 1, 'admin', 22, '16', 'exist_orAdd_user', 'Editing Snippet'),
(1261, 1493500685, 1, 'admin', 24, '16', 'exist_orAdd_user', 'Saving Snippet'),
(1262, 1493500686, 1, 'admin', 22, '16', 'exist_orAdd_user', 'Editing Snippet'),
(1263, 1493500782, 1, 'admin', 24, '16', 'exist_orAdd_user', 'Saving Snippet'),
(1264, 1493500783, 1, 'admin', 22, '16', 'exist_orAdd_user', 'Editing Snippet'),
(1265, 1493500830, 1, 'admin', 24, '16', 'exist_orAdd_user', 'Saving Snippet'),
(1266, 1493500831, 1, 'admin', 22, '16', 'exist_orAdd_user', 'Editing Snippet'),
(1267, 1493500929, 1, 'admin', 79, '8', 'reg_validation', 'Saving Chunk (HTML Snippet)'),
(1268, 1493500929, 1, 'admin', 78, '8', 'reg_validation', 'Editing Chunk (HTML Snippet)'),
(1269, 1493501554, 1, 'admin', 24, '16', 'exist_orAdd_user', 'Saving Snippet'),
(1270, 1493501555, 1, 'admin', 22, '16', 'exist_orAdd_user', 'Editing Snippet'),
(1271, 1493501687, 1, 'admin', 24, '16', 'exist_orAdd_user', 'Saving Snippet'),
(1272, 1493501687, 1, 'admin', 22, '16', 'exist_orAdd_user', 'Editing Snippet'),
(1273, 1493501769, 1, 'admin', 24, '16', 'exist_orAdd_user', 'Saving Snippet'),
(1274, 1493501770, 1, 'admin', 76, '-', '-', 'Element management'),
(1275, 1493502372, 1, 'admin', 22, '16', 'exist_orAdd_user', 'Editing Snippet'),
(1276, 1493502405, 1, 'admin', 79, '8', 'reg_validation', 'Saving Chunk (HTML Snippet)'),
(1277, 1493502405, 1, 'admin', 78, '8', 'reg_validation', 'Editing Chunk (HTML Snippet)'),
(1278, 1493502469, 1, 'admin', 24, '16', 'exist_orAdd_user', 'Saving Snippet'),
(1279, 1493502470, 1, 'admin', 76, '-', '-', 'Element management'),
(1280, 1493502481, 1, 'admin', 22, '16', 'exist_orAdd_user', 'Editing Snippet'),
(1281, 1493502531, 1, 'admin', 24, '16', 'exist_orAdd_user', 'Saving Snippet'),
(1282, 1493502532, 1, 'admin', 76, '-', '-', 'Element management'),
(1283, 1493502618, 1, 'admin', 22, '16', 'exist_orAdd_user', 'Editing Snippet'),
(1284, 1493503268, 1, 'admin', 20, '6', 'registration', 'Saving template'),
(1285, 1493503268, 1, 'admin', 16, '6', 'registration', 'Editing template'),
(1286, 1493503301, 1, 'admin', 79, '8', 'reg_validation', 'Saving Chunk (HTML Snippet)'),
(1287, 1493503302, 1, 'admin', 78, '8', 'reg_validation', 'Editing Chunk (HTML Snippet)'),
(1288, 1493503430, 1, 'admin', 20, '6', 'registration', 'Saving template'),
(1289, 1493503431, 1, 'admin', 16, '6', 'registration', 'Editing template'),
(1290, 1493503637, 1, 'admin', 20, '6', 'registration', 'Saving template'),
(1291, 1493503638, 1, 'admin', 16, '6', 'registration', 'Editing template'),
(1292, 1493503694, 1, 'admin', 20, '6', 'registration', 'Saving template'),
(1293, 1493503695, 1, 'admin', 16, '6', 'registration', 'Editing template'),
(1294, 1493503996, 1, 'admin', 24, '16', 'exist_orAdd_user', 'Saving Snippet'),
(1295, 1493503997, 1, 'admin', 76, '-', '-', 'Element management'),
(1296, 1493504026, 1, 'admin', 22, '16', 'exist_orAdd_user', 'Editing Snippet'),
(1297, 1493504056, 1, 'admin', 24, '16', 'exist_orAdd_user', 'Saving Snippet'),
(1298, 1493504057, 1, 'admin', 76, '-', '-', 'Element management'),
(1299, 1493504078, 1, 'admin', 20, '6', 'registration', 'Saving template'),
(1300, 1493504079, 1, 'admin', 16, '6', 'registration', 'Editing template'),
(1301, 1493504269, 1, 'admin', 22, '16', 'exist_orAdd_user', 'Editing Snippet'),
(1302, 1493504374, 1, 'admin', 24, '16', 'exist_orAdd_user', 'Saving Snippet'),
(1303, 1493504375, 1, 'admin', 22, '16', 'exist_orAdd_user', 'Editing Snippet'),
(1304, 1493504522, 1, 'admin', 20, '6', 'registration', 'Saving template'),
(1305, 1493504523, 1, 'admin', 16, '6', 'registration', 'Editing template'),
(1306, 1493504583, 1, 'admin', 79, '8', 'reg_validation', 'Saving Chunk (HTML Snippet)'),
(1307, 1493504583, 1, 'admin', 78, '8', 'reg_validation', 'Editing Chunk (HTML Snippet)'),
(1308, 1493504634, 1, 'admin', 24, '16', 'exist_orAdd_user', 'Saving Snippet'),
(1309, 1493504635, 1, 'admin', 22, '16', 'exist_orAdd_user', 'Editing Snippet'),
(1310, 1493504675, 1, 'admin', 24, '16', 'exist_orAdd_user', 'Saving Snippet'),
(1311, 1493504676, 1, 'admin', 22, '16', 'exist_orAdd_user', 'Editing Snippet'),
(1312, 1493504764, 1, 'admin', 76, '-', '-', 'Element management'),
(1313, 1493717063, 1, 'admin', 76, '-', '-', 'Element management'),
(1314, 1493717069, 1, 'admin', 16, '6', 'registration', 'Editing template'),
(1315, 1493717142, 1, 'admin', 75, '-', '-', 'User/ role management'),
(1316, 1493717153, 1, 'admin', 76, '-', '-', 'Element management'),
(1317, 1493717167, 1, 'admin', 78, '10', 'test', 'Editing Chunk (HTML Snippet)'),
(1318, 1493717176, 1, 'admin', 76, '-', '-', 'Element management'),
(1319, 1493717184, 1, 'admin', 78, '8', 'reg_validation', 'Editing Chunk (HTML Snippet)'),
(1320, 1493717187, 1, 'admin', 79, '8', 'reg_validation', 'Saving Chunk (HTML Snippet)'),
(1321, 1493717188, 1, 'admin', 76, '-', '-', 'Element management'),
(1322, 1493717191, 1, 'admin', 78, '8', 'reg_validation', 'Editing Chunk (HTML Snippet)'),
(1323, 1493717347, 1, 'admin', 76, '-', '-', 'Element management'),
(1324, 1493717413, 1, 'admin', 22, '16', 'exist_orAdd_user', 'Editing Snippet'),
(1325, 1493718479, 1, 'admin', 20, '6', 'registration', 'Saving template'),
(1326, 1493718480, 1, 'admin', 16, '6', 'registration', 'Editing template'),
(1327, 1493718534, 1, 'admin', 20, '6', 'registration', 'Saving template'),
(1328, 1493718535, 1, 'admin', 16, '6', 'registration', 'Editing template'),
(1329, 1493718577, 1, 'admin', 20, '6', 'registration', 'Saving template'),
(1330, 1493718578, 1, 'admin', 16, '6', 'registration', 'Editing template'),
(1331, 1493718594, 1, 'admin', 20, '6', 'registration', 'Saving template'),
(1332, 1493718594, 1, 'admin', 16, '6', 'registration', 'Editing template'),
(1333, 1493718632, 1, 'admin', 24, '16', 'exist_orAdd_user', 'Saving Snippet'),
(1334, 1493718636, 1, 'admin', 76, '-', '-', 'Element management'),
(1335, 1493718665, 1, 'admin', 22, '16', 'exist_orAdd_user', 'Editing Snippet'),
(1336, 1493718716, 1, 'admin', 24, '16', 'exist_orAdd_user', 'Saving Snippet'),
(1337, 1493718716, 1, 'admin', 22, '16', 'exist_orAdd_user', 'Editing Snippet'),
(1338, 1493718783, 1, 'admin', 24, '16', 'exist_orAdd_user', 'Saving Snippet'),
(1339, 1493718784, 1, 'admin', 22, '16', 'exist_orAdd_user', 'Editing Snippet'),
(1340, 1493718809, 1, 'admin', 24, '16', 'exist_orAdd_user', 'Saving Snippet'),
(1341, 1493718809, 1, 'admin', 22, '16', 'exist_orAdd_user', 'Editing Snippet'),
(1342, 1493718834, 1, 'admin', 24, '16', 'exist_orAdd_user', 'Saving Snippet'),
(1343, 1493718835, 1, 'admin', 22, '16', 'exist_orAdd_user', 'Editing Snippet'),
(1344, 1493718849, 1, 'admin', 20, '6', 'registration', 'Saving template'),
(1345, 1493718850, 1, 'admin', 16, '6', 'registration', 'Editing template'),
(1346, 1493719001, 1, 'admin', 24, '16', 'exist_orAdd_user', 'Saving Snippet'),
(1347, 1493719001, 1, 'admin', 22, '16', 'exist_orAdd_user', 'Editing Snippet'),
(1348, 1493719051, 1, 'admin', 20, '6', 'registration', 'Saving template'),
(1349, 1493719051, 1, 'admin', 16, '6', 'registration', 'Editing template'),
(1350, 1493719086, 1, 'admin', 24, '16', 'exist_orAdd_user', 'Saving Snippet'),
(1351, 1493719087, 1, 'admin', 22, '16', 'exist_orAdd_user', 'Editing Snippet'),
(1352, 1493719099, 1, 'admin', 79, '8', 'reg_validation', 'Saving Chunk (HTML Snippet)'),
(1353, 1493719099, 1, 'admin', 76, '-', '-', 'Element management'),
(1354, 1493719114, 1, 'admin', 78, '8', 'reg_validation', 'Editing Chunk (HTML Snippet)'),
(1355, 1493719196, 1, 'admin', 20, '6', 'registration', 'Saving template'),
(1356, 1493719196, 1, 'admin', 16, '6', 'registration', 'Editing template'),
(1357, 1493719337, 1, 'admin', 79, '8', 'reg_validation', 'Saving Chunk (HTML Snippet)'),
(1358, 1493719337, 1, 'admin', 78, '8', 'reg_validation', 'Editing Chunk (HTML Snippet)'),
(1359, 1493735888, 1, 'admin', 78, '8', 'reg_validation', 'Editing Chunk (HTML Snippet)'),
(1360, 1493735889, 1, 'admin', 22, '16', 'exist_orAdd_user', 'Editing Snippet'),
(1361, 1493735894, 1, 'admin', 16, '6', 'registration', 'Editing template'),
(1362, 1493748724, 1, 'admin', 78, '8', 'reg_validation', 'Editing Chunk (HTML Snippet)'),
(1363, 1493748726, 1, 'admin', 22, '16', 'exist_orAdd_user', 'Editing Snippet'),
(1364, 1493748728, 1, 'admin', 16, '6', 'registration', 'Editing template'),
(1365, 1493749508, 1, 'admin', 76, '-', '-', 'Element management'),
(1366, 1493749515, 1, 'admin', 16, '6', 'registration', 'Editing template'),
(1367, 1493750392, 1, 'admin', 99, '-', '-', 'Manage Web Users'),
(1368, 1493750419, 1, 'admin', 91, '-', '-', 'Editing Web Access Permissions'),
(1369, 1493750527, 1, 'admin', 92, '-', '-', 'Editing Access Permissions'),
(1370, 1493750528, 1, 'admin', 91, '-', '-', 'Editing Web Access Permissions'),
(1371, 1493750539, 1, 'admin', 92, '-', '-', 'Editing Access Permissions'),
(1372, 1493750540, 1, 'admin', 91, '-', '-', 'Editing Web Access Permissions'),
(1373, 1493751959, 1, 'admin', 76, '-', '-', 'Element management'),
(1374, 1493752082, 1, 'admin', 16, '6', 'registration', 'Editing template'),
(1375, 1493752163, 1, 'admin', 76, '-', '-', 'Element management'),
(1376, 1493752189, 1, 'admin', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(1377, 1493752241, 1, 'admin', 79, '-', 'reg_tpl', 'Saving Chunk (HTML Snippet)'),
(1378, 1493752242, 1, 'admin', 76, '-', '-', 'Element management'),
(1379, 1493752263, 1, 'admin', 20, '6', 'registration', 'Saving template'),
(1380, 1493752264, 1, 'admin', 16, '6', 'registration', 'Editing template'),
(1381, 1493752451, 1, 'admin', 78, '11', 'reg_tpl', 'Editing Chunk (HTML Snippet)'),
(1382, 1493753692, 1, 'admin', 99, '-', '-', 'Manage Web Users'),
(1383, 1493753701, 1, 'admin', 88, '4', 'Test', 'Editing web user'),
(1384, 1493753778, 1, 'admin', 89, '4', 'Test', 'Saving web user'),
(1385, 1493753779, 1, 'admin', 99, '-', '-', 'Manage Web Users'),
(1386, 1493753788, 1, 'admin', 88, '4', 'Test', 'Editing web user'),
(1387, 1493753821, 1, 'admin', 89, '4', 'Test', 'Saving web user'),
(1388, 1493754777, 1, 'admin', 76, '-', '-', 'Element management'),
(1389, 1493754840, 1, 'admin', 22, '15', 'WebSignup', 'Editing Snippet'),
(1390, 1493760342, 1, 'admin', 79, '11', 'reg_tpl', 'Saving Chunk (HTML Snippet)'),
(1391, 1493760343, 1, 'admin', 78, '11', 'reg_tpl', 'Editing Chunk (HTML Snippet)'),
(1392, 1493760432, 1, 'admin', 79, '11', 'reg_tpl', 'Saving Chunk (HTML Snippet)'),
(1393, 1493760433, 1, 'admin', 78, '11', 'reg_tpl', 'Editing Chunk (HTML Snippet)'),
(1394, 1493760481, 1, 'admin', 79, '11', 'reg_tpl', 'Saving Chunk (HTML Snippet)'),
(1395, 1493760482, 1, 'admin', 78, '11', 'reg_tpl', 'Editing Chunk (HTML Snippet)'),
(1396, 1493760507, 1, 'admin', 79, '11', 'reg_tpl', 'Saving Chunk (HTML Snippet)'),
(1397, 1493760510, 1, 'admin', 78, '11', 'reg_tpl', 'Editing Chunk (HTML Snippet)'),
(1398, 1493760665, 1, 'admin', 79, '11', 'reg_tpl', 'Saving Chunk (HTML Snippet)'),
(1399, 1493760665, 1, 'admin', 78, '11', 'reg_tpl', 'Editing Chunk (HTML Snippet)'),
(1400, 1493760879, 1, 'admin', 24, '15', 'WebSignup', 'Saving Snippet'),
(1401, 1493760880, 1, 'admin', 76, '-', '-', 'Element management'),
(1402, 1493760889, 1, 'admin', 99, '-', '-', 'Manage Web Users'),
(1403, 1493760893, 1, 'admin', 88, '4', 'Test', 'Editing web user'),
(1404, 1493760927, 1, 'admin', 99, '-', '-', 'Manage Web Users'),
(1405, 1493760962, 1, 'admin', 79, '11', 'reg_tpl', 'Saving Chunk (HTML Snippet)'),
(1406, 1493760963, 1, 'admin', 78, '11', 'reg_tpl', 'Editing Chunk (HTML Snippet)'),
(1407, 1493762340, 1, 'admin', 79, '11', 'reg_tpl', 'Saving Chunk (HTML Snippet)'),
(1408, 1493762341, 1, 'admin', 78, '11', 'reg_tpl', 'Editing Chunk (HTML Snippet)'),
(1409, 1493763053, 1, 'admin', 20, '6', 'registration', 'Saving template'),
(1410, 1493763054, 1, 'admin', 16, '6', 'registration', 'Editing template'),
(1411, 1493763170, 1, 'admin', 99, '-', '-', 'Manage Web Users'),
(1412, 1493763185, 1, 'admin', 99, '-', '-', 'Manage Web Users'),
(1413, 1493763197, 1, 'admin', 75, '-', '-', 'User/ role management'),
(1414, 1493763200, 1, 'admin', 99, '-', '-', 'Manage Web Users'),
(1415, 1493763221, 1, 'admin', 91, '-', '-', 'Editing Web Access Permissions'),
(1416, 1493763237, 1, 'admin', 20, '6', 'registration', 'Saving template'),
(1417, 1493763241, 1, 'admin', 16, '6', 'registration', 'Editing template'),
(1418, 1493763337, 1, 'admin', 99, '-', '-', 'Manage Web Users'),
(1419, 1493763350, 1, 'admin', 99, '-', '-', 'Manage Web Users'),
(1420, 1494169886, 1, 'admin', 58, '-', 'MODX', 'Logged in'),
(1421, 1494169893, 1, 'admin', 76, '-', '-', 'Element management'),
(1422, 1494169906, 1, 'admin', 78, '8', 'reg_validation', 'Editing Chunk (HTML Snippet)'),
(1423, 1494169936, 1, 'admin', 76, '-', '-', 'Element management'),
(1424, 1494169939, 1, 'admin', 78, '8', 'reg_validation', 'Editing Chunk (HTML Snippet)'),
(1425, 1494169988, 1, 'admin', 76, '-', '-', 'Element management'),
(1426, 1494179549, 2, 'ipra', 58, '-', 'MODX', 'Logged in'),
(1427, 1494179562, 2, 'ipra', 112, '1', 'Doc Manager', 'Execute module'),
(1428, 1494179564, 2, 'ipra', 112, '2', 'Extras', 'Execute module'),
(1429, 1494179665, 2, 'ipra', 76, '-', '-', 'Element management'),
(1430, 1494179669, 2, 'ipra', 16, '5', 'Авторизация', 'Editing template'),
(1431, 1494179672, 2, 'ipra', 76, '-', '-', 'Element management'),
(1432, 1494179677, 2, 'ipra', 22, '6', 'eForm', 'Editing Snippet'),
(1433, 1494179699, 2, 'ipra', 22, '6', 'eForm', 'Editing Snippet'),
(1434, 1494179701, 2, 'ipra', 76, '-', '-', 'Element management'),
(1435, 1494179709, 2, 'ipra', 16, '5', 'Авторизация', 'Editing template'),
(1436, 1494180104, 2, 'ipra', 76, '-', '-', 'Element management'),
(1437, 1494180108, 2, 'ipra', 78, '10', 'test', 'Editing Chunk (HTML Snippet)'),
(1438, 1494180128, 2, 'ipra', 79, '10', 'test', 'Saving Chunk (HTML Snippet)'),
(1439, 1494180129, 2, 'ipra', 76, '-', '-', 'Element management'),
(1440, 1494180161, 2, 'ipra', 22, '12', 'loginza', 'Editing Snippet'),
(1441, 1494180174, 2, 'ipra', 27, '4', 'Вход', 'Editing resource'),
(1442, 1494180179, 2, 'ipra', 106, '-', '-', 'Viewing Modules'),
(1443, 1494180182, 2, 'ipra', 76, '-', '-', 'Element management'),
(1444, 1494180185, 2, 'ipra', 16, '6', 'registration', 'Editing template'),
(1445, 1494180187, 2, 'ipra', 76, '-', '-', 'Element management'),
(1446, 1494180189, 2, 'ipra', 16, '5', 'Авторизация', 'Editing template'),
(1447, 1494180202, 2, 'ipra', 76, '-', '-', 'Element management'),
(1448, 1494180212, 2, 'ipra', 78, '9', 'autoriz', 'Editing Chunk (HTML Snippet)'),
(1449, 1494180218, 2, 'ipra', 76, '-', '-', 'Element management'),
(1450, 1494180255, 2, 'ipra', 78, '9', 'autoriz', 'Editing Chunk (HTML Snippet)'),
(1451, 1494180256, 2, 'ipra', 76, '-', '-', 'Element management'),
(1452, 1494180259, 2, 'ipra', 16, '6', 'registration', 'Editing template'),
(1453, 1494180260, 2, 'ipra', 76, '-', '-', 'Element management'),
(1454, 1494180261, 2, 'ipra', 16, '5', 'Авторизация', 'Editing template'),
(1455, 1494180330, 2, 'ipra', 76, '-', '-', 'Element management'),
(1456, 1494180339, 2, 'ipra', 16, '6', 'registration', 'Editing template'),
(1457, 1494180340, 2, 'ipra', 76, '-', '-', 'Element management'),
(1458, 1494180342, 2, 'ipra', 16, '5', 'Авторизация', 'Editing template'),
(1459, 1494180349, 2, 'ipra', 76, '-', '-', 'Element management'),
(1460, 1494180350, 2, 'ipra', 78, '9', 'autoriz', 'Editing Chunk (HTML Snippet)'),
(1461, 1494180388, 2, 'ipra', 20, '5', 'Авторизация', 'Saving template'),
(1462, 1494180389, 2, 'ipra', 16, '5', 'Авторизация', 'Editing template'),
(1463, 1494180392, 2, 'ipra', 16, '5', 'Авторизация', 'Editing template'),
(1464, 1494180398, 2, 'ipra', 76, '-', '-', 'Element management'),
(1465, 1494180401, 2, 'ipra', 78, '9', 'autoriz', 'Editing Chunk (HTML Snippet)'),
(1466, 1494180403, 2, 'ipra', 76, '-', '-', 'Element management'),
(1467, 1494180407, 2, 'ipra', 78, '9', 'autoriz', 'Editing Chunk (HTML Snippet)'),
(1468, 1494180409, 2, 'ipra', 76, '-', '-', 'Element management'),
(1469, 1494180416, 2, 'ipra', 78, '9', 'autoriz', 'Editing Chunk (HTML Snippet)'),
(1470, 1494180419, 2, 'ipra', 80, '9', 'autoriz', 'Deleting Chunk (HTML Snippet)'),
(1471, 1494180419, 2, 'ipra', 76, '-', '-', 'Element management'),
(1472, 1494180467, 2, 'ipra', 22, '12', 'loginza', 'Editing Snippet'),
(1473, 1494180516, 2, 'ipra', 24, '12', 'loginza', 'Saving Snippet'),
(1474, 1494180517, 2, 'ipra', 22, '12', 'loginza', 'Editing Snippet'),
(1475, 1494180552, 2, 'ipra', 24, '12', 'loginza', 'Saving Snippet'),
(1476, 1494180553, 2, 'ipra', 22, '12', 'loginza', 'Editing Snippet'),
(1477, 1494180588, 2, 'ipra', 24, '12', 'loginza', 'Saving Snippet'),
(1478, 1494180589, 2, 'ipra', 22, '12', 'loginza', 'Editing Snippet'),
(1479, 1494180868, 2, 'ipra', 58, '-', 'MODX', 'Logged in'),
(1480, 1494180871, 2, 'ipra', 8, '-', '-', 'Logged out'),
(1481, 1494180900, 2, 'ipra', 58, '-', 'MODX', 'Logged in'),
(1482, 1494180908, 2, 'ipra', 76, '-', '-', 'Element management'),
(1483, 1494180915, 2, 'ipra', 76, '-', '-', 'Element management'),
(1484, 1494180922, 2, 'ipra', 76, '-', '-', 'Element management'),
(1485, 1494180968, 2, 'ipra', 76, '-', '-', 'Element management'),
(1486, 1494180972, 2, 'ipra', 76, '-', '-', 'Element management'),
(1487, 1494181150, 2, 'ipra', 26, '-', '-', 'Refreshing site'),
(1488, 1494181153, 2, 'ipra', 76, '-', '-', 'Element management'),
(1489, 1494181157, 2, 'ipra', 76, '-', '-', 'Element management'),
(1490, 1494181162, 2, 'ipra', 91, '-', '-', 'Editing Web Access Permissions'),
(1491, 1494181163, 2, 'ipra', 40, '-', '-', 'Editing Access Permissions'),
(1492, 1494181165, 2, 'ipra', 86, '-', '-', 'Role management'),
(1493, 1494181169, 2, 'ipra', 99, '-', '-', 'Manage Web Users'),
(1494, 1494181177, 2, 'ipra', 75, '-', '-', 'User/ role management'),
(1495, 1494181193, 2, 'ipra', 76, '-', '-', 'Element management'),
(1496, 1494181445, 2, 'ipra', 76, '-', '-', 'Element management'),
(1497, 1494181946, 2, 'ipra', 75, '-', '-', 'User/ role management'),
(1498, 1494182117, 2, 'ipra', 58, '-', 'MODX', 'Logged in'),
(1499, 1494182120, 2, 'ipra', 76, '-', '-', 'Element management'),
(1500, 1494182124, 2, 'ipra', 22, '12', 'loginza', 'Editing Snippet'),
(1501, 1494326237, 2, 'ipra', 58, '-', 'MODX', 'Logged in'),
(1502, 1494326244, 2, 'ipra', 76, '-', '-', 'Element management'),
(1503, 1494326246, 2, 'ipra', 16, '3', 'Home', 'Editing template'),
(1504, 1494326279, 2, 'ipra', 76, '-', '-', 'Element management'),
(1505, 1494326288, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1506, 1494326303, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1507, 1494326304, 2, 'ipra', 76, '-', '-', 'Element management'),
(1508, 1494326407, 2, 'ipra', 78, '5', 'header', 'Editing Chunk (HTML Snippet)'),
(1509, 1494326517, 2, 'ipra', 79, '5', 'header', 'Saving Chunk (HTML Snippet)'),
(1510, 1494326517, 2, 'ipra', 76, '-', '-', 'Element management'),
(1511, 1494326520, 2, 'ipra', 78, '5', 'header', 'Editing Chunk (HTML Snippet)'),
(1512, 1494326527, 2, 'ipra', 79, '5', 'header', 'Saving Chunk (HTML Snippet)'),
(1513, 1494326527, 2, 'ipra', 76, '-', '-', 'Element management'),
(1514, 1494326986, 2, 'ipra', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(1515, 1494327046, 2, 'ipra', 79, '-', 'SideNav', 'Saving Chunk (HTML Snippet)'),
(1516, 1494327047, 2, 'ipra', 76, '-', '-', 'Element management'),
(1517, 1494327050, 2, 'ipra', 78, '12', 'SideNav', 'Editing Chunk (HTML Snippet)'),
(1518, 1494327061, 2, 'ipra', 78, '12', 'SideNav', 'Editing Chunk (HTML Snippet)'),
(1519, 1494327065, 2, 'ipra', 76, '-', '-', 'Element management'),
(1520, 1494327069, 2, 'ipra', 16, '5', 'Авторизация', 'Editing template'),
(1521, 1494327148, 2, 'ipra', 78, '12', 'SideNav', 'Editing Chunk (HTML Snippet)'),
(1522, 1494327151, 2, 'ipra', 76, '-', '-', 'Element management'),
(1523, 1494327174, 2, 'ipra', 78, '4', 'footer', 'Editing Chunk (HTML Snippet)'),
(1524, 1494327227, 2, 'ipra', 20, '5', 'Авторизация', 'Saving template'),
(1525, 1494327227, 2, 'ipra', 16, '5', 'Авторизация', 'Editing template'),
(1526, 1494327254, 2, 'ipra', 20, '5', 'Авторизация', 'Saving template'),
(1527, 1494327254, 2, 'ipra', 16, '5', 'Авторизация', 'Editing template'),
(1528, 1494327273, 2, 'ipra', 79, '12', 'SideNav', 'Saving Chunk (HTML Snippet)'),
(1529, 1494327274, 2, 'ipra', 78, '12', 'SideNav', 'Editing Chunk (HTML Snippet)'),
(1530, 1494327426, 2, 'ipra', 76, '-', '-', 'Element management'),
(1531, 1494327432, 2, 'ipra', 22, '12', 'loginza', 'Editing Snippet'),
(1532, 1494327551, 2, 'ipra', 24, '12', 'loginza', 'Saving Snippet'),
(1533, 1494327552, 2, 'ipra', 76, '-', '-', 'Element management'),
(1534, 1494327554, 2, 'ipra', 22, '12', 'loginza', 'Editing Snippet'),
(1535, 1494327686, 2, 'ipra', 24, '12', 'loginza', 'Saving Snippet'),
(1536, 1494327686, 2, 'ipra', 22, '12', 'loginza', 'Editing Snippet'),
(1537, 1494327755, 2, 'ipra', 24, '12', 'loginza', 'Saving Snippet'),
(1538, 1494327756, 2, 'ipra', 22, '12', 'loginza', 'Editing Snippet'),
(1539, 1494327859, 2, 'ipra', 24, '12', 'loginza', 'Saving Snippet'),
(1540, 1494327859, 2, 'ipra', 22, '12', 'loginza', 'Editing Snippet'),
(1541, 1494327975, 2, 'ipra', 24, '12', 'loginza', 'Saving Snippet'),
(1542, 1494327975, 2, 'ipra', 22, '12', 'loginza', 'Editing Snippet'),
(1543, 1494328049, 2, 'ipra', 24, '12', 'loginza', 'Saving Snippet'),
(1544, 1494328050, 2, 'ipra', 22, '12', 'loginza', 'Editing Snippet'),
(1545, 1494328066, 2, 'ipra', 24, '12', 'loginza', 'Saving Snippet'),
(1546, 1494328067, 2, 'ipra', 22, '12', 'loginza', 'Editing Snippet'),
(1547, 1494328098, 2, 'ipra', 24, '12', 'loginza', 'Saving Snippet'),
(1548, 1494328099, 2, 'ipra', 22, '12', 'loginza', 'Editing Snippet'),
(1549, 1494328447, 2, 'ipra', 24, '12', 'loginza', 'Saving Snippet'),
(1550, 1494328447, 2, 'ipra', 22, '12', 'loginza', 'Editing Snippet'),
(1551, 1494331503, 2, 'ipra', 76, '-', '-', 'Element management'),
(1552, 1494331505, 2, 'ipra', 16, '3', 'Home', 'Editing template'),
(1553, 1494331523, 2, 'ipra', 20, '3', 'Home', 'Saving template'),
(1554, 1494331524, 2, 'ipra', 16, '3', 'Home', 'Editing template'),
(1555, 1494332545, 2, 'ipra', 16, '5', 'Авторизация', 'Editing template'),
(1556, 1494332578, 2, 'ipra', 76, '-', '-', 'Element management'),
(1557, 1494332581, 2, 'ipra', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(1558, 1494332642, 2, 'ipra', 79, '-', 'authorization', 'Saving Chunk (HTML Snippet)'),
(1559, 1494332643, 2, 'ipra', 76, '-', '-', 'Element management'),
(1560, 1494332654, 2, 'ipra', 20, '5', 'Авторизация', 'Saving template'),
(1561, 1494332654, 2, 'ipra', 16, '5', 'Авторизация', 'Editing template'),
(1562, 1494332660, 2, 'ipra', 78, '13', 'authorization', 'Editing Chunk (HTML Snippet)'),
(1563, 1494332848, 2, 'ipra', 24, '12', 'loginza', 'Saving Snippet'),
(1564, 1494332848, 2, 'ipra', 22, '12', 'loginza', 'Editing Snippet'),
(1565, 1494332904, 2, 'ipra', 24, '12', 'loginza', 'Saving Snippet'),
(1566, 1494332905, 2, 'ipra', 22, '12', 'loginza', 'Editing Snippet'),
(1567, 1494333095, 2, 'ipra', 78, '13', 'authorization', 'Editing Chunk (HTML Snippet)'),
(1568, 1494333098, 2, 'ipra', 76, '-', '-', 'Element management'),
(1569, 1494333105, 2, 'ipra', 23, '-', 'Новый сниппет', 'Creating a new Snippet'),
(1570, 1494333130, 2, 'ipra', 24, '-', 'test', 'Saving Snippet'),
(1571, 1494333131, 2, 'ipra', 76, '-', '-', 'Element management'),
(1572, 1494333133, 2, 'ipra', 22, '17', 'test', 'Editing Snippet'),
(1573, 1494333155, 2, 'ipra', 20, '3', 'Home', 'Saving template'),
(1574, 1494333155, 2, 'ipra', 16, '3', 'Home', 'Editing template'),
(1575, 1494333183, 2, 'ipra', 24, '17', 'test', 'Saving Snippet'),
(1576, 1494333183, 2, 'ipra', 22, '17', 'test', 'Editing Snippet'),
(1577, 1494333270, 2, 'ipra', 24, '17', 'test', 'Saving Snippet'),
(1578, 1494333271, 2, 'ipra', 22, '17', 'test', 'Editing Snippet'),
(1579, 1494333278, 2, 'ipra', 24, '12', 'loginza', 'Saving Snippet'),
(1580, 1494333279, 2, 'ipra', 22, '12', 'loginza', 'Editing Snippet'),
(1581, 1494333292, 2, 'ipra', 24, '12', 'loginza', 'Saving Snippet'),
(1582, 1494333292, 2, 'ipra', 22, '12', 'loginza', 'Editing Snippet'),
(1583, 1494333301, 2, 'ipra', 24, '12', 'loginza', 'Saving Snippet'),
(1584, 1494333302, 2, 'ipra', 22, '12', 'loginza', 'Editing Snippet'),
(1585, 1494333316, 2, 'ipra', 24, '12', 'loginza', 'Saving Snippet'),
(1586, 1494333317, 2, 'ipra', 22, '12', 'loginza', 'Editing Snippet'),
(1587, 1494333362, 2, 'ipra', 24, '12', 'loginza', 'Saving Snippet'),
(1588, 1494333362, 2, 'ipra', 22, '12', 'loginza', 'Editing Snippet'),
(1589, 1494333420, 2, 'ipra', 24, '12', 'loginza', 'Saving Snippet'),
(1590, 1494333421, 2, 'ipra', 22, '12', 'loginza', 'Editing Snippet'),
(1591, 1494333432, 2, 'ipra', 24, '12', 'loginza', 'Saving Snippet'),
(1592, 1494333432, 2, 'ipra', 22, '12', 'loginza', 'Editing Snippet'),
(1593, 1494333488, 2, 'ipra', 24, '17', 'test', 'Saving Snippet'),
(1594, 1494333488, 2, 'ipra', 22, '17', 'test', 'Editing Snippet'),
(1595, 1494333522, 2, 'ipra', 24, '12', 'loginza', 'Saving Snippet'),
(1596, 1494333523, 2, 'ipra', 22, '12', 'loginza', 'Editing Snippet'),
(1597, 1494333559, 2, 'ipra', 24, '17', 'test', 'Saving Snippet'),
(1598, 1494333559, 2, 'ipra', 22, '17', 'test', 'Editing Snippet'),
(1599, 1494333581, 2, 'ipra', 24, '17', 'test', 'Saving Snippet'),
(1600, 1494333581, 2, 'ipra', 22, '17', 'test', 'Editing Snippet'),
(1601, 1494333588, 2, 'ipra', 22, '12', 'loginza', 'Editing Snippet'),
(1602, 1494333626, 2, 'ipra', 24, '17', 'test', 'Saving Snippet'),
(1603, 1494333626, 2, 'ipra', 22, '17', 'test', 'Editing Snippet'),
(1604, 1494333634, 2, 'ipra', 24, '17', 'test', 'Saving Snippet'),
(1605, 1494333635, 2, 'ipra', 22, '17', 'test', 'Editing Snippet'),
(1606, 1494333639, 2, 'ipra', 24, '17', 'test', 'Saving Snippet'),
(1607, 1494333640, 2, 'ipra', 22, '17', 'test', 'Editing Snippet'),
(1608, 1494333660, 2, 'ipra', 24, '17', 'test', 'Saving Snippet'),
(1609, 1494333660, 2, 'ipra', 22, '17', 'test', 'Editing Snippet'),
(1610, 1494333669, 2, 'ipra', 20, '3', 'Home', 'Saving template'),
(1611, 1494333670, 2, 'ipra', 16, '3', 'Home', 'Editing template'),
(1612, 1494334471, 2, 'ipra', 24, '17', 'test', 'Saving Snippet'),
(1613, 1494334471, 2, 'ipra', 22, '17', 'test', 'Editing Snippet'),
(1614, 1494334486, 2, 'ipra', 20, '3', 'Home', 'Saving template'),
(1615, 1494334486, 2, 'ipra', 16, '3', 'Home', 'Editing template'),
(1616, 1494334538, 2, 'ipra', 24, '17', 'test', 'Saving Snippet'),
(1617, 1494334539, 2, 'ipra', 22, '17', 'test', 'Editing Snippet'),
(1618, 1494334571, 2, 'ipra', 24, '17', 'test', 'Saving Snippet'),
(1619, 1494334571, 2, 'ipra', 22, '17', 'test', 'Editing Snippet'),
(1620, 1494335342, 2, 'ipra', 24, '17', 'test', 'Saving Snippet'),
(1621, 1494335342, 2, 'ipra', 22, '17', 'test', 'Editing Snippet'),
(1622, 1494335623, 2, 'ipra', 76, '-', '-', 'Element management'),
(1623, 1494335628, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1624, 1494335650, 2, 'ipra', 22, '17', 'test', 'Editing Snippet'),
(1625, 1494335653, 2, 'ipra', 76, '-', '-', 'Element management'),
(1626, 1494335684, 2, 'ipra', 78, '13', 'authorization', 'Editing Chunk (HTML Snippet)'),
(1627, 1494335687, 2, 'ipra', 76, '-', '-', 'Element management'),
(1628, 1494335689, 2, 'ipra', 23, '-', 'Новый сниппет', 'Creating a new Snippet'),
(1629, 1494335986, 2, 'ipra', 24, '-', 'UserAuthorization', 'Saving Snippet'),
(1630, 1494335986, 2, 'ipra', 22, '18', 'UserAuthorization', 'Editing Snippet'),
(1631, 1494336095, 2, 'ipra', 24, '18', 'UserAuthorization', 'Saving Snippet'),
(1632, 1494336096, 2, 'ipra', 22, '18', 'UserAuthorization', 'Editing Snippet'),
(1633, 1494336118, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1634, 1494336118, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1635, 1494336184, 2, 'ipra', 24, '18', 'UserAuthorization', 'Saving Snippet'),
(1636, 1494336185, 2, 'ipra', 22, '18', 'UserAuthorization', 'Editing Snippet'),
(1637, 1494336210, 2, 'ipra', 24, '18', 'UserAuthorization', 'Saving Snippet'),
(1638, 1494336211, 2, 'ipra', 22, '18', 'UserAuthorization', 'Editing Snippet'),
(1639, 1494336245, 2, 'ipra', 24, '18', 'UserAuthorization', 'Saving Snippet'),
(1640, 1494336246, 2, 'ipra', 22, '18', 'UserAuthorization', 'Editing Snippet'),
(1641, 1494336278, 2, 'ipra', 24, '18', 'UserAuthorization', 'Saving Snippet'),
(1642, 1494336278, 2, 'ipra', 22, '18', 'UserAuthorization', 'Editing Snippet'),
(1643, 1494336362, 2, 'ipra', 24, '18', 'UserAuthorization', 'Saving Snippet'),
(1644, 1494336363, 2, 'ipra', 22, '18', 'UserAuthorization', 'Editing Snippet'),
(1645, 1494336399, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1646, 1494336400, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1647, 1494336441, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1648, 1494336441, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1649, 1494336485, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1650, 1494336485, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1651, 1494336784, 2, 'ipra', 24, '18', 'UserAuthorization', 'Saving Snippet'),
(1652, 1494336784, 2, 'ipra', 23, '-', 'Новый сниппет', 'Creating a new Snippet'),
(1653, 1494336794, 2, 'ipra', 76, '-', '-', 'Element management'),
(1654, 1494336796, 2, 'ipra', 22, '18', 'UserAuthorization', 'Editing Snippet'),
(1655, 1494336807, 2, 'ipra', 24, '18', 'UserAuthorization', 'Saving Snippet'),
(1656, 1494336808, 2, 'ipra', 22, '18', 'UserAuthorization', 'Editing Snippet'),
(1657, 1494336899, 2, 'ipra', 24, '18', 'UserAuthorization', 'Saving Snippet'),
(1658, 1494336900, 2, 'ipra', 22, '18', 'UserAuthorization', 'Editing Snippet'),
(1659, 1494337026, 2, 'ipra', 24, '18', 'UserAuthorization', 'Saving Snippet'),
(1660, 1494337027, 2, 'ipra', 22, '18', 'UserAuthorization', 'Editing Snippet'),
(1661, 1494337070, 2, 'ipra', 24, '18', 'UserAuthorization', 'Saving Snippet'),
(1662, 1494337071, 2, 'ipra', 22, '18', 'UserAuthorization', 'Editing Snippet'),
(1663, 1494337185, 2, 'ipra', 24, '18', 'UserAuthorization', 'Saving Snippet'),
(1664, 1494337185, 2, 'ipra', 22, '18', 'UserAuthorization', 'Editing Snippet'),
(1665, 1494337208, 2, 'ipra', 24, '18', 'UserAuthorization', 'Saving Snippet'),
(1666, 1494337209, 2, 'ipra', 22, '18', 'UserAuthorization', 'Editing Snippet'),
(1667, 1494337220, 2, 'ipra', 24, '18', 'UserAuthorization', 'Saving Snippet'),
(1668, 1494337221, 2, 'ipra', 22, '18', 'UserAuthorization', 'Editing Snippet'),
(1669, 1494337273, 2, 'ipra', 24, '18', 'UserAuthorization', 'Saving Snippet'),
(1670, 1494337274, 2, 'ipra', 22, '18', 'UserAuthorization', 'Editing Snippet'),
(1671, 1494337313, 2, 'ipra', 24, '18', 'UserAuthorization', 'Saving Snippet'),
(1672, 1494337313, 2, 'ipra', 22, '18', 'UserAuthorization', 'Editing Snippet'),
(1673, 1494337356, 2, 'ipra', 76, '-', '-', 'Element management'),
(1674, 1494337363, 2, 'ipra', 16, '3', 'Home', 'Editing template'),
(1675, 1494337376, 2, 'ipra', 20, '3', 'Home', 'Saving template'),
(1676, 1494337376, 2, 'ipra', 76, '-', '-', 'Element management'),
(1677, 1494337383, 2, 'ipra', 78, '4', 'footer', 'Editing Chunk (HTML Snippet)'),
(1678, 1494337418, 2, 'ipra', 79, '4', 'footer', 'Saving Chunk (HTML Snippet)'),
(1679, 1494337419, 2, 'ipra', 78, '4', 'footer', 'Editing Chunk (HTML Snippet)'),
(1680, 1494337441, 2, 'ipra', 24, '12', 'loginza', 'Saving Snippet'),
(1681, 1494337442, 2, 'ipra', 22, '12', 'loginza', 'Editing Snippet'),
(1682, 1494337456, 2, 'ipra', 76, '-', '-', 'Element management'),
(1683, 1494337463, 2, 'ipra', 16, '5', 'Авторизация', 'Editing template'),
(1684, 1494337493, 2, 'ipra', 24, '12', 'loginza', 'Saving Snippet'),
(1685, 1494337494, 2, 'ipra', 22, '12', 'loginza', 'Editing Snippet'),
(1686, 1494337561, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1687, 1494337561, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1688, 1494337627, 2, 'ipra', 24, '18', 'UserAuthorization', 'Saving Snippet'),
(1689, 1494337627, 2, 'ipra', 22, '18', 'UserAuthorization', 'Editing Snippet'),
(1690, 1494337737, 2, 'ipra', 24, '18', 'UserAuthorization', 'Saving Snippet'),
(1691, 1494337737, 2, 'ipra', 22, '18', 'UserAuthorization', 'Editing Snippet'),
(1692, 1494337750, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1693, 1494337751, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1694, 1494337830, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1695, 1494337831, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1696, 1494337866, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1697, 1494337866, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1698, 1494337967, 2, 'ipra', 24, '18', 'UserAuthorization', 'Saving Snippet'),
(1699, 1494337967, 2, 'ipra', 22, '18', 'UserAuthorization', 'Editing Snippet'),
(1700, 1494337986, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1701, 1494337986, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1702, 1494338049, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1703, 1494338049, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1704, 1494338084, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1705, 1494338085, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1706, 1494338193, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1707, 1494338193, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1708, 1494338342, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1709, 1494338342, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1710, 1494338368, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1711, 1494338368, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1712, 1494338437, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1713, 1494338438, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1714, 1494338477, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1715, 1494338478, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1716, 1494338525, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1717, 1494338526, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1718, 1494338663, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1719, 1494338664, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1720, 1494338718, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1721, 1494338719, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1722, 1494338763, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1723, 1494338763, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1724, 1494338828, 2, 'ipra', 76, '-', '-', 'Element management'),
(1725, 1494338832, 2, 'ipra', 78, '5', 'header', 'Editing Chunk (HTML Snippet)'),
(1726, 1494338997, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1727, 1494338998, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1728, 1494339032, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1729, 1494339032, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1730, 1494339278, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1731, 1494339278, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1732, 1494339303, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1733, 1494339303, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1734, 1494339357, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1735, 1494339357, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1736, 1494339405, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1737, 1494339405, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1738, 1494339425, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1739, 1494339426, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1740, 1494339478, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1741, 1494339479, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1742, 1494339508, 2, 'ipra', 76, '-', '-', 'Element management'),
(1743, 1494339511, 2, 'ipra', 78, '4', 'footer', 'Editing Chunk (HTML Snippet)'),
(1744, 1494339519, 2, 'ipra', 79, '4', 'footer', 'Saving Chunk (HTML Snippet)'),
(1745, 1494339520, 2, 'ipra', 78, '4', 'footer', 'Editing Chunk (HTML Snippet)'),
(1746, 1494339661, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1747, 1494339662, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1748, 1494339725, 2, 'ipra', 24, '18', 'UserAuthorization', 'Saving Snippet'),
(1749, 1494339726, 2, 'ipra', 22, '18', 'UserAuthorization', 'Editing Snippet'),
(1750, 1494339742, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1751, 1494339742, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1752, 1494339831, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1753, 1494339831, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1754, 1494339852, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1755, 1494339853, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1756, 1494339871, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1757, 1494339872, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1758, 1494339901, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1759, 1494339902, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1760, 1494339923, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1761, 1494339923, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1762, 1494340190, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1763, 1494340191, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1764, 1494340207, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1765, 1494340207, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1766, 1494340270, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1767, 1494340270, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1768, 1494340363, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1769, 1494340363, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1770, 1494342579, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1771, 1494342579, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1772, 1494342669, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1773, 1494342669, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1774, 1494342717, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1775, 1494342718, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1776, 1494342758, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1777, 1494342758, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1778, 1494342792, 2, 'ipra', 24, '18', 'UserAuthorization', 'Saving Snippet'),
(1779, 1494342792, 2, 'ipra', 22, '18', 'UserAuthorization', 'Editing Snippet'),
(1780, 1494342796, 2, 'ipra', 79, '4', 'footer', 'Saving Chunk (HTML Snippet)'),
(1781, 1494342796, 2, 'ipra', 78, '4', 'footer', 'Editing Chunk (HTML Snippet)'),
(1782, 1494342800, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1783, 1494342801, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1784, 1494342815, 2, 'ipra', 24, '18', 'UserAuthorization', 'Saving Snippet'),
(1785, 1494342816, 2, 'ipra', 22, '18', 'UserAuthorization', 'Editing Snippet'),
(1786, 1494342869, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1787, 1494342870, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1788, 1494342878, 2, 'ipra', 24, '18', 'UserAuthorization', 'Saving Snippet'),
(1789, 1494342878, 2, 'ipra', 22, '18', 'UserAuthorization', 'Editing Snippet'),
(1790, 1494342914, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1791, 1494342915, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1792, 1494342938, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1793, 1494342939, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1794, 1494342949, 2, 'ipra', 106, '-', '-', 'Viewing Modules'),
(1795, 1494342949, 2, 'ipra', 76, '-', '-', 'Element management'),
(1796, 1494342955, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1797, 1494343146, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1798, 1494343146, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1799, 1494343207, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1800, 1494343208, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1801, 1494343246, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1802, 1494343247, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1803, 1494343272, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1804, 1494343273, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1805, 1494343299, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1806, 1494343299, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1807, 1494343349, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1808, 1494343349, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1809, 1494343406, 2, 'ipra', 79, '4', 'footer', 'Saving Chunk (HTML Snippet)'),
(1810, 1494343407, 2, 'ipra', 78, '4', 'footer', 'Editing Chunk (HTML Snippet)'),
(1811, 1494343479, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1812, 1494343480, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1813, 1494343653, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1814, 1494343653, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1815, 1494343711, 2, 'ipra', 24, '18', 'UserAuthorization', 'Saving Snippet'),
(1816, 1494343712, 2, 'ipra', 22, '18', 'UserAuthorization', 'Editing Snippet'),
(1817, 1494344100, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1818, 1494344101, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1819, 1494344212, 2, 'ipra', 24, '18', 'UserAuthorization', 'Saving Snippet'),
(1820, 1494344213, 2, 'ipra', 22, '18', 'UserAuthorization', 'Editing Snippet'),
(1821, 1494344217, 2, 'ipra', 76, '-', '-', 'Element management'),
(1822, 1494344223, 2, 'ipra', 23, '-', 'Новый сниппет', 'Creating a new Snippet'),
(1823, 1494344284, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1824, 1494344285, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1825, 1494344307, 2, 'ipra', 76, '-', '-', 'Element management'),
(1826, 1494344315, 2, 'ipra', 22, '18', 'UserAuthorization', 'Editing Snippet'),
(1827, 1494344475, 2, 'ipra', 24, '-', 'personal_area', 'Saving Snippet'),
(1828, 1494344476, 2, 'ipra', 22, '19', 'personal_area', 'Editing Snippet'),
(1829, 1494344539, 2, 'ipra', 24, '19', 'personal_area', 'Saving Snippet'),
(1830, 1494344540, 2, 'ipra', 22, '19', 'personal_area', 'Editing Snippet'),
(1831, 1494344589, 2, 'ipra', 24, '19', 'personal_area', 'Saving Snippet'),
(1832, 1494344589, 2, 'ipra', 22, '19', 'personal_area', 'Editing Snippet'),
(1833, 1494344669, 2, 'ipra', 24, '19', 'personal_area', 'Saving Snippet'),
(1834, 1494344669, 2, 'ipra', 22, '19', 'personal_area', 'Editing Snippet'),
(1835, 1494344818, 2, 'ipra', 24, '18', 'UserAuthorization', 'Saving Snippet'),
(1836, 1494344819, 2, 'ipra', 22, '18', 'UserAuthorization', 'Editing Snippet'),
(1837, 1494344905, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1838, 1494344906, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1839, 1494344918, 2, 'ipra', 76, '-', '-', 'Element management'),
(1840, 1494344920, 2, 'ipra', 22, '18', 'UserAuthorization', 'Editing Snippet'),
(1841, 1494344933, 2, 'ipra', 76, '-', '-', 'Element management'),
(1842, 1494344947, 2, 'ipra', 22, '18', 'UserAuthorization', 'Editing Snippet'),
(1843, 1494344951, 2, 'ipra', 76, '-', '-', 'Element management'),
(1844, 1494344961, 2, 'ipra', 16, '3', 'Home', 'Editing template'),
(1845, 1494344967, 2, 'ipra', 76, '-', '-', 'Element management'),
(1846, 1494344969, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1847, 1494344982, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1848, 1494344983, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1849, 1494345004, 2, 'ipra', 76, '-', '-', 'Element management'),
(1850, 1494345007, 2, 'ipra', 22, '18', 'UserAuthorization', 'Editing Snippet'),
(1851, 1494345045, 2, 'ipra', 24, '18', 'UserAuthorization', 'Saving Snippet'),
(1852, 1494345046, 2, 'ipra', 76, '-', '-', 'Element management'),
(1853, 1494345048, 2, 'ipra', 22, '18', 'UserAuthorization', 'Editing Snippet'),
(1854, 1494345083, 2, 'ipra', 79, '7', 'NAV', 'Saving Chunk (HTML Snippet)'),
(1855, 1494345083, 2, 'ipra', 78, '7', 'NAV', 'Editing Chunk (HTML Snippet)'),
(1856, 1494345090, 2, 'ipra', 24, '18', 'UserAuthorization', 'Saving Snippet'),
(1857, 1494345091, 2, 'ipra', 22, '18', 'UserAuthorization', 'Editing Snippet'),
(1858, 1494345156, 2, 'ipra', 76, '-', '-', 'Element management'),
(1859, 1494345159, 2, 'ipra', 16, '5', 'Авторизация', 'Editing template'),
(1860, 1494345169, 2, 'ipra', 20, '5', 'Авторизация', 'Saving template'),
(1861, 1494345169, 2, 'ipra', 76, '-', '-', 'Element management'),
(1862, 1494345174, 2, 'ipra', 78, '13', 'authorization', 'Editing Chunk (HTML Snippet)'),
(1863, 1494345183, 2, 'ipra', 76, '-', '-', 'Element management'),
(1864, 1494345186, 2, 'ipra', 78, '12', 'SideNav', 'Editing Chunk (HTML Snippet)'),
(1865, 1494345192, 2, 'ipra', 80, '12', 'SideNav', 'Deleting Chunk (HTML Snippet)'),
(1866, 1494345193, 2, 'ipra', 76, '-', '-', 'Element management'),
(1867, 1494345197, 2, 'ipra', 16, '5', 'Авторизация', 'Editing template'),
(1868, 1494345202, 2, 'ipra', 20, '5', 'Авторизация', 'Saving template'),
(1869, 1494345203, 2, 'ipra', 76, '-', '-', 'Element management');

-- 
-- Вывод данных для таблицы modx_manager_users
--
INSERT INTO modx_manager_users VALUES
(1, 'admin', '$P$B6qh0ndIEG0ZyUlpGpvMEGsNHM9VTB/'),
(2, 'ipra', '$P$BTkPVHUbAfTAiESBpWePSH8dDasTxJ0');

-- 
-- Вывод данных для таблицы modx_member_groups
--

-- Таблица ibase_woch.modx_member_groups не содержит данных

-- 
-- Вывод данных для таблицы modx_membergroup_access
--

-- Таблица ibase_woch.modx_membergroup_access не содержит данных

-- 
-- Вывод данных для таблицы modx_membergroup_names
--

-- Таблица ibase_woch.modx_membergroup_names не содержит данных

-- 
-- Вывод данных для таблицы modx_site_content
--
INSERT INTO modx_site_content VALUES
(1, 'document', 'text/html', 'Главная', '', '', 'index', '', 1, 0, 0, 0, 1, '', '<p>Главной особенностью сайта является возможность следить за товаром пока вы заняты. Мы предоставляем вам возможность установить надзирателя за товаром (или группой товаров). Особенностью является <span id="orfo-misgrammed-1" class="orfo-misgrammed">то</span> что вам не нужно заходить на страницу товара и смотреть не упала на него ли цена, а просто ждать оповещения от нас на вашу почту. Но это еще не всё<span id="orfo-misgrammed-2" class="orfo-misgrammed">!. </span>Вы так же можете написать название товара и желаемую сумму, а мы вас <span id="orfo-misgrammed-3" class="orfo-misgrammed">предупредим</span> когда такой товар появиться.</p>', 1, 3, 0, 1, 1, 1, 1130304721, 2, 1492774118, 0, 0, 0, 1130304721, 1, '', 0, 0, 0, 0, 0, 0, 0, 1),
(4, 'document', 'text/html', 'Вход', '', '', 'login', 'login', 1, 0, 0, 0, 0, '', '', 1, 5, 1, 1, 1, 1, 1492328160, 1, 1492328177, 0, 0, 0, 1492328160, 1, '', 0, 0, 0, 0, 0, 0, 0, 1),
(5, 'document', 'text/html', 'Регистрация', '', '', 'registration', '', 1, 0, 0, 0, 0, '', '', 1, 6, 2, 1, 1, 1, 1492511052, 1, 1492511052, 0, 0, 0, 1492511052, 1, '', 0, 0, 0, 0, 0, 0, 0, 1);

-- 
-- Вывод данных для таблицы modx_site_content_metatags
--

-- Таблица ibase_woch.modx_site_content_metatags не содержит данных

-- 
-- Вывод данных для таблицы modx_site_htmlsnippets
--
INSERT INTO modx_site_htmlsnippets VALUES
(1, 'eFeedbackForm', 'eFeedbackForm Шаблон формы обратной связи', 0, 'none', 3, 0, '<p><span style="color:#900;">[+validationmessage+]</span></p>\r\n\r\n<form  class="eform" method="post" action="[~[*id*]~]">\r\n\r\n<input type="hidden" name="formid" value="feedbackForm" />\r\n<input value="" name="special" class="special" type="text" eform="Спец:date:0"  style="display:none;" />\r\n<p>\r\n    <input type="text" name="name" id="name" class="grid_3" value=""  eform="Имя:string:1"/>\r\n    <label for="name">Ваше имя</label>\r\n</p>\r\n            \r\n<p>\r\n    <input type="text" name="email" id="email" class="grid_3" value="" eform="E-mail:email:1" />\r\n    <label for="email">Ваш E-mail</label>\r\n</p>\r\n            \r\n<p>\r\n    <input type="text" name="phone" id="subject" class="grid_3" value="" eform="Номер телефона:string:1"/>\r\n    <label for="subject">Номер телефона</label>\r\n</p>\r\n            \r\n<p>\r\n    <textarea name="comments" id="message" class="grid_6" cols="50" rows="10" eform="Текст сообщения:string:1"></textarea>\r\n</p>\r\n<p>Введите код с картинки: <br />\r\n    <input type="text" class="ver" name="vericode" /><img class="feed" src="[+verimageurl+]" alt="Введите код" />\r\n</p>            \r\n<p>\r\n    <input type="submit" name="submit" class="subeform grid_2" value="Отправить сообщение"/>\r\n </p>\r\n\r\n</form>\r\n\r\n\r\n \r\n\r\n', 0),
(2, 'eFeedbackReport', 'eFeedbackReport  шаблон отправки на почту', 0, 'none', 3, 0, '<p>Прислано человеком, с именем: [+name+] . Подробности ниже:</p>\r\n<table>\r\n<tr valign="top"><td>Имя:</td><td>[+name+]</td></tr>\r\n<tr valign="top"><td>E-mail:</td><td>[+email+]</td></tr>\r\n<tr valign="top"><td>Номер телефона:</td><td>[+phone+]</td></tr>\r\n<tr valign="top"><td>Текст сообщения:</td><td>[+comments+]</td></tr>\r\n</table>\r\n<p>Можно использовать ссылку для ответа: <a href="mailto:[+email+]?subject=RE:[+subject+]">[+email+]</a></p>\r\n\r\n', 0),
(3, 'feedback', 'форма обратной связи', 0, 'none', 3, 0, '[!eForm? &formid=`feedbackForm` &subject=`Сообщение с сайта` &tpl=`eFeedbackForm` &report=`eFeedbackReport` &gotoid=`[*id*]` &vericode=`1` !] \r\n\r\n', 0),
(4, 'footer', 'низ сайта', 2, 'none', 4, 0, '<footer class="page-footer orange">\r\n    <div class="container">\r\n      <div class="row">\r\n        <div class="col l6 s12">\r\n          <h5 class="white-text">Поддержка сайта</h5>\r\n          <p class="grey-text text-lighten-4">2017</p>\r\n        </div>\r\n        <div class="col l3 s12">\r\n          <h5 class="white-text">Капков Илья</h5>\r\n          <ul>\r\n            <li><p class="grey-text text-lighten-4">Главный программист по обработке содержимого поддерживаемых сервисов</p></li>\r\n          </ul>\r\n        </div>\r\n        <div class="col l3 s12">\r\n          <h5 class="white-text">Диденко Игорь</h5>\r\n          <ul>\r\n            <li><p class="grey-text text-lighten-4">Гланый программист по герерации запросов к поддерживаемым сервисам</p></li>\r\n          </ul>\r\n        </div>\r\n      </div>\r\n    </div>\r\n    <div class="footer-copyright">\r\n      <div class="container">\r\n      Курсовая работа 2017\r\n      </div>\r\n    </div>\r\n  </footer>\r\n\r\n\r\n  <!--  Scripts-->\r\n  <script src="/assets/js/jquery/jquery.min.js"></script>\r\n  <script src="/assets/js/wotch/materialize.js"></script>\r\n  <script src="/assets/js/wotch/init.js"></script>\r\n  <script src="/assets/js/wotch/login.js"></script>\r\n  <script>\r\n  \t$(".user-menu").sideNav();\r\n  </script>\r\n  </body>\r\n</html>', 0),
(5, 'header', 'шапка', 2, 'none', 4, 0, '<!DOCTYPE html>\r\n\t<html lang="ru">\r\n\t<head>\r\n\t<meta http-equiv="Content-Type" content="text/html; charset=[(modx_charset)]" /> \r\n\t<title>[*pagetitle*]</title>\r\n\t[*noIndex*]\r\n\t<meta name="keywords" content="[*keyw*]" />\r\n\t<meta name="description" content="[*desc*]" />\r\n\t<base href="[(site_url)]"/>\r\n\t<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">\r\n\t<link href="/assets/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>\r\n  \t<link href="/assets/css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>\r\n\t<link rel="shortcut icon" href="/assets/images/favicon.png" type="image/x-icon">\r\n</head>\r\n<body>', 0),
(6, 'mm_rules', 'Default ManagerManager rules.', 0, 'none', 5, 0, '// more example rules are in assets/plugins/managermanager/example_mm_rules.inc.php\r\n// example of how PHP is allowed - check that a TV named documentTags exists before creating rule\r\n\r\nmm_widget_showimagetvs(); // Показываем превью ТВ\r\n\r\nmm_createTab(''Для SEO'', ''seo'', '''', '''', '''', '''');\r\nmm_moveFieldsToTab(''titl,keyw,desc,seoOverride,noIndex,sitemap_changefreq,sitemap_priority,sitemap_exclude'', ''seo'', '''', '''');\r\nmm_widget_tags(''keyw'','',''); // Give blog tag editing capabilities to the ''documentTags (3)'' TV\r\n\r\n\r\n//mm_createTab(''Изображения'', ''photos'', '''', '''', '''', ''850'');\r\n//mm_moveFieldsToTab(''images,photos'', ''photos'', '''', '''');\r\n\r\n//mm_hideFields(''longtitle,description,link_attributes,menutitle,content'', '''', ''6,7'');\r\n\r\n//mm_hideTemplates(''0,5,8,9,11,12'', ''2,3'');\r\n\r\n//mm_hideTabs(''settings, access'', ''2'');\r\n\r\n//mm_widget_evogallery(1, Галерея, ''1,2,3'', 3);   // подключаем галерею \r\n//mm_galleryLink($fields, $roles, $templates, $moduleid);\r\n//mm_widget_evogallery($moduleid, $title, $roles, $templates);\r\n', 0),
(7, 'NAV', 'навбар', 2, 'none', 0, 0, '<nav class="light-blue lighten-1" role="navigation">\r\n    <div class="nav-wrapper container">\r\n\t\t<a id="logo-container" href="#" class="brand-logo"><img src="/assets/images/logo.png"></a>\r\n      <ul class="right hide-on-med-and-down">\r\n        <li><a href="[(site_url)]">Главная</a></li>\r\n        <li><a href="#">Надзератель</a></li>\r\n        <li><a href="#">Принцип работы</a></li>\r\n        <li><a href="#">О нас</a></li>\r\n        [!UserAuthorization? &url=`[(site_url)]login.html`!]\r\n      </ul>\r\n\r\n      <ul id="nav-mobile" class="side-nav">\r\n\t\t<li><a href="[(site_url)]">Главная</a></li>\r\n        <li><a href="#">Надзератель</a></li>\r\n        <li><a href="#">Принцип работы</a></li>\r\n        <li><a href="#">О нас</a></li>\r\n       [!UserAuthorization? &url=`[(site_url)]login.html`!]\r\n      </ul>\r\n      <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>\r\n\t\t[!personal_area!]\r\n    </div>\r\n</nav>', 0),
(8, 'reg_validation', 'Проверка существования логина emaila', 2, 'none', 0, 0, '<script>\r\n\t\r\n\t$(document).ready(function(){\r\n        $("#password1").pwdMeter();\r\n    });\r\n\t\r\n\t$(document).ready(function(){\r\n        $("#password2").pwdCompare();\r\n    });\r\n\t\r\n\tfunction validationEmail(input) {\r\n\t\t$.post(\r\n\t\t  "/assets/snippets/exist_orAdd_user.php",\r\n\t\t  {\r\n\t\t\temail: input.value\r\n\t\t  },\r\n\t\t  onAjaxSuccess\r\n\t\t);\r\n\t}\r\n\t\r\n\tfunction onAjaxSuccess(data) {\r\n\t\t\r\n\t\t// Здесь мы получаем данные, отправленные сервером.\r\n\t\tif(data == ''yes'') {\r\n\t\t\tdocument.getElementById(''emailex'').style.visibility = "hidden";\r\n\t\t}\r\n\t\telse if(data == ''no''){\r\n\t\t\tdocument.getElementById(''emailex'').style.visibility = "visible";\r\n\t\t}\r\n\t}\r\n\t\r\n\tfunction validationPassword(input) {\r\n\t\t\r\n\t\tvar idMPsw;\r\n\t\tif(input.id == ''password1'') {\r\n\t\t\tidMPsw = ''pwdMeter'';\r\n\t\t}\r\n\t\telse if(input.id == ''password2'') {\r\n\t\t\tidMPsw = ''pwdCompare'';\r\n\t\t}\r\n\t\t\r\n\t\tif(input.value == '''') {\r\n\t\t\tdocument.getElementById(idMPsw).style.visibility = "hidden";\r\n\t\t\t$(''#''+idMPsw).text('''');\r\n\t\t}\r\n\t\telse {\r\n\t\t\tdocument.getElementById(idMPsw).style.visibility = "visible";\r\n\t\t}\r\n\t\t\r\n\t}\r\n\t\r\n</script>', 0),
(10, 'test', '', 2, 'none', 0, 0, '<h1>BEBEBE</h1>', 0),
(11, 'reg_tpl', 'html формы регистрации', 2, 'none', 0, 0, '<div class="container_login">\r\n<div class="row">\r\n    <form class="col s12" action="[+action+]" method="POST">\r\n      <div class="row">\r\n        <div class="input-field col s6">\r\n\t\t  <i class="material-icons prefix light-blue-text">account_circle</i>\r\n          <input id="first_name" type="text" class="validate" name="username" value="[+username+]">\r\n          <label for="first_name">Логин</label>\r\n        </div>\r\n        <div class="input-field col s6">\r\n          <input id="last_name" type="text" class="validate" name="fullname" value="[+fullname+]">\r\n          <label for="last_name">Полное имя</label>\r\n        </div>\r\n      </div>\r\n      <div class="row">\r\n        <div class="input-field col s12">\r\n\t\t  <i class="material-icons prefix light-blue-text">email</i>\r\n          <input id="email" type="email" class="validate" onblur="validationEmail(this)" name="email" value="[+email+]">\r\n\t\t  <label for="email">Email <span id="emailex" style="color: red;">Пользователь с таким Email уже зарегестрирован!</span></label>\r\n        </div>\r\n      </div>\r\n\t\t<div class="row">\r\n        <div class="input-field col s12">\r\n\t\t  <i class="material-icons prefix light-blue-text">phone</i>\r\n          <input id="icon_telephone" type="tel" class="validate" name="phone" value="[+phone+]">\r\n\t\t  <label for="phone">Номер телефона</label>\r\n        </div>\r\n      </div>\r\n      <div class="row">\r\n        <div class="input-field col s12">\r\n\t\t  <i class="material-icons prefix light-blue-text">lock</i>\r\n          <input id="password1" type="password" class="validate" oninput="validationPassword(this)" name="password">\r\n\t\t  <label for="password1">Пароль <span id="pwdMeter" class="neutral"></span></label>\r\n        </div>\r\n      </div>\r\n\t\t<div class="row">\r\n        <div class="input-field col s12">\r\n\t\t  <i class="material-icons prefix light-blue-text">lock</i>\r\n          <input id="password2" type="password" class="validate" oninput="validationPassword(this)" name="password2">\r\n          <label for="password2">Повторите пароль <span id="pwdCompare"></span></label>\r\n        </div>\r\n      </div>\r\n\t\t<div class="row">\r\n\t\t\t<p><img src="manager/includes/veriword.php" alt="Код проверки" /></p>\r\n\t\t\t<div class="input-field col s12">\r\n\t\t\t\t<i class="material-icons prefix light-blue-text">input</i>\r\n\t\t\t\t<input id="capcha" type="text" class="validate" name="formcode">\r\n\t\t\t\t<label for="capcha">Введите код с картинки</label>\r\n\t\t\t</div>\r\n\t\t</div>\r\n\t\t<div id="buttonReg" class="right-align">\r\n\t\t\t<input class="waves-effect waves-light btn light-green" type="submit" value="Регистрация">\r\n\t\t</div>\r\n    </form>\r\n  </div>\r\n</div>', 0),
(13, 'authorization', 'форма авторизации', 2, 'none', 0, 0, '<div>\r\n\t<div class="container_login">\r\n\t\t\t<div class="row">\r\n\t\t\t\t<form class="col s12" id="autoriz">\r\n\t\t\t\t\t<div class="row">\r\n\t\t\t\t\t\t<div class="input-field col s12">\r\n\t\t\t\t\t\t\t<i class="material-icons prefix light-blue-text">account_circle</i>\r\n\t\t\t\t\t\t\t<input id="icon_prefix" type="text" class="validate">\r\n\t\t\t\t\t\t\t<label for="icon_prefix">Email</label>\r\n\t\t\t\t\t\t</div>\r\n\t\t\t\t\t\t<div class="input-field col s12">\r\n\t\t\t\t\t\t\t<i class="material-icons prefix light-blue-text">lock</i>\r\n\t\t\t\t\t\t\t<input id="icon_telephone" type="tel" class="validate">\r\n\t\t\t\t\t\t\t<label for="icon_telephone">Пароль</label>\r\n\t\t\t\t\t\t</div>\r\n\t\t\t\t\t</div>\r\n\t\t\t\t\t<div class="row">\r\n\t\t\t\t\t\t<div class="col s6">\r\n\t\t\t\t\t\t\t<input class="waves-effect waves-light btn light-green" type="submit" value="Войти">\r\n\t\t\t\t\t\t</div>\r\n\t\t\t\t\t\t<div class="col s6 right-align">\r\n\t\t\t\t\t\t\t<a href="[(site_url)]registration.html">Регистрация</a>\r\n\t\t\t\t\t\t</div>\r\n\t\t\t\t\t\t<div class="right-align">\r\n\t\t\t\t\t\t\t[!loginza? &type=`profile`!]\r\n\t\t\t\t\t\t</div>\r\n\t\t\t\t\t</div>\r\n\t\t\t\t</form>\r\n\t\t\t</div>\r\n\t</div>\r\n</div>', 0);

-- 
-- Вывод данных для таблицы modx_site_keywords
--

-- Таблица ibase_woch.modx_site_keywords не содержит данных

-- 
-- Вывод данных для таблицы modx_site_metatags
--

-- Таблица ibase_woch.modx_site_metatags не содержит данных

-- 
-- Вывод данных для таблицы modx_site_module_access
--

-- Таблица ibase_woch.modx_site_module_access не содержит данных

-- 
-- Вывод данных для таблицы modx_site_module_depobj
--

-- Таблица ibase_woch.modx_site_module_depobj не содержит данных

-- 
-- Вывод данных для таблицы modx_site_modules
--
INSERT INTO modx_site_modules VALUES
(1, 'Doc Manager', '<strong>1.1</strong> Quickly perform bulk updates to the Documents in your site including templates, publishing details, and permissions', 0, 0, 6, 0, 0, '', 0, '', 0, 0, 'docman435243542tf542t5t', 1, '', ' \n/**\n * Doc Manager\n * \n * Quickly perform bulk updates to the Documents in your site including templates, publishing details, and permissions\n * \n * @category\tmodule\n * @version \t1.1\n * @license \thttp://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)\n * @internal\t@properties\n * @internal\t@guid docman435243542tf542t5t\t\n * @internal\t@shareparams 1\n * @internal\t@dependencies requires files located at /assets/modules/docmanager/\n * @internal\t@modx_category Manager and Admin\n * @internal    @installset base, sample\n * @lastupdate  09/04/2016\n */\n\ninclude_once(MODX_BASE_PATH.''assets/modules/docmanager/classes/docmanager.class.php'');\ninclude_once(MODX_BASE_PATH.''assets/modules/docmanager/classes/dm_frontend.class.php'');\ninclude_once(MODX_BASE_PATH.''assets/modules/docmanager/classes/dm_backend.class.php'');\n\n$dm = new DocManager($modx);\n$dmf = new DocManagerFrontend($dm, $modx);\n$dmb = new DocManagerBackend($dm, $modx);\n\n$dm->ph = $dm->getLang();\n$dm->ph[''theme''] = $dm->getTheme();\n$dm->ph[''ajax.endpoint''] = MODX_SITE_URL.''assets/modules/docmanager/tv.ajax.php'';\n$dm->ph[''datepicker.offset''] = $modx->config[''datepicker_offset''];\n$dm->ph[''datetime.format''] = $modx->config[''datetime_format''];\n\nif (isset($_POST[''tabAction''])) {\n    $dmb->handlePostback();\n} else {\n    $dmf->getViews();\n    echo $dm->parseTemplate(''main.tpl'', $dm->ph);\n}'),
(2, 'Extras', '<strong>0.1.3</strong> first repository for MODX EVO', 0, 0, 6, 0, 0, '', 0, '', 0, 0, 'store435243542tf542t5t', 1, '', ' \r\n/**\r\n * Extras\r\n * \r\n * first repository for MODX EVO\r\n * \r\n * @category\tmodule\r\n * @version \t0.1.3\r\n * @internal\t@properties\r\n * @internal\t@guid store435243542tf542t5t\t\r\n * @internal\t@shareparams 1\r\n * @internal\t@dependencies requires files located at /assets/modules/store/\r\n * @internal\t@modx_category Manager and Admin\r\n * @internal    @installset base, sample\r\n * @lastupdate  25/11/2016\r\n */\r\n\r\n//AUTHORS: Bumkaka & Dmi3yy \r\ninclude_once(''../assets/modules/store/core.php'');');

-- 
-- Вывод данных для таблицы modx_site_plugin_events
--
INSERT INTO modx_site_plugin_events VALUES
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

-- 
-- Вывод данных для таблицы modx_site_plugins
--
INSERT INTO modx_site_plugins VALUES
(1, 'CodeMirror', '<strong>1.4</strong> JavaScript library that can be used to create a relatively pleasant editor interface based on CodeMirror 5.12', 0, 6, 0, '\r\n/**\r\n * CodeMirror\r\n *\r\n * JavaScript library that can be used to create a relatively pleasant editor interface based on CodeMirror 5.12\r\n *\r\n * @category    plugin\r\n * @version     1.4\r\n * @license     http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)\r\n * @package     modx\r\n * @internal    @events OnDocFormRender,OnChunkFormRender,OnModFormRender,OnPluginFormRender,OnSnipFormRender,OnTempFormRender,OnRichTextEditorInit\r\n * @internal    @modx_category Manager and Admin\r\n * @internal    @properties &theme=Theme;list;default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light;default &indentUnit=Indent unit;int;4 &tabSize=The width of a tab character;int;4 &lineWrapping=lineWrapping;list;true,false;true &matchBrackets=matchBrackets;list;true,false;true &activeLine=activeLine;list;true,false;false &emmet=emmet;list;true,false;true &search=search;list;true,false;false &indentWithTabs=indentWithTabs;list;true,false;true &undoDepth=undoDepth;int;200 &historyEventDelay=historyEventDelay;int;1250\r\n * @internal    @installset base\r\n * @reportissues https://github.com/modxcms/evolution\r\n * @documentation Official docs https://codemirror.net/doc/manual.html\r\n * @author      hansek from http://www.modxcms.cz\r\n * @author      update Mihanik71\r\n * @author      update Deesen\r\n * @lastupdate  11/04/2016\r\n */\r\n\r\n$_CM_BASE = ''assets/plugins/codemirror/'';\r\n\r\n$_CM_URL = $modx->config[''site_url''] . $_CM_BASE;\r\n\r\nrequire(MODX_BASE_PATH. $_CM_BASE .''codemirror.plugin.php'');', 0, '&theme=Theme;list;default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light;default &indentUnit=Indent unit;int;4 &tabSize=The width of a tab character;int;4 &lineWrapping=lineWrapping;list;true,false;true &matchBrackets=matchBrackets;list;true,false;true &activeLine=activeLine;list;true,false;false &emmet=emmet;list;true,false;true &search=search;list;true,false;false &indentWithTabs=indentWithTabs;list;true,false;true &undoDepth=undoDepth;int;200 &historyEventDelay=historyEventDelay;int;1250', 0, ''),
(2, 'ElementsInTree', '<strong>1.5.7</strong> Get access to all Elements and Modules inside Manager sidebar', 0, 6, 0, 'require MODX_BASE_PATH.''assets/plugins/elementsintree/plugin.elementsintree.php'';\n', 0, '&tabTreeTitle=Tree Tab Title;text;Site Tree;;Custom title of Site Tree tab. &useIcons=Use icons in tabs;list;yes,no;yes;;Icons available in MODX version 1.2 or newer. &treeButtonsInTab=Tree Buttons in tab;list;yes,no;yes;;Move Tree Buttons into Site Tree tab. &unifyFrames=Unify Frames;list;yes,no;yes;;Unify Tree and Main frame style. Right now supports MODxRE2 theme only.', 1, ''),
(3, 'FileSource', '<strong>0.1</strong> Save snippet and plugins to file', 0, 6, 0, 'require MODX_BASE_PATH.''assets/plugins/filesource/plugin.filesource.php'';', 0, '', 0, ''),
(4, 'Forgot Manager Login', '<strong>1.1.6</strong> Resets your manager login when you forget your password via email confirmation', 0, 6, 0, 'require MODX_BASE_PATH.''assets/plugins/forgotmanagerlogin/plugin.forgotmanagerlogin.php'';', 0, '', 0, ''),
(5, 'ManagerManager', '<strong>0.6.2</strong> Customize the MODX Manager to offer bespoke admin functions for end users or manipulate the display of document fields in the manager.', 0, 6, 0, '\n/**\n * ManagerManager\n *\n * Customize the MODX Manager to offer bespoke admin functions for end users or manipulate the display of document fields in the manager.\n *\n * @category plugin\n * @version 0.6.2\n * @license http://creativecommons.org/licenses/GPL/2.0/ GNU Public License (GPL v2)\n * @internal @properties &remove_deprecated_tv_types_pref=Remove deprecated TV types;list;yes,no;yes &config_chunk=Configuration Chunk;text;mm_rules\n * @internal @events OnDocFormRender,OnDocFormPrerender,OnBeforeDocFormSave,OnDocFormSave,OnDocDuplicate,OnPluginFormRender,OnTVFormRender\n * @internal @modx_category Manager and Admin\n * @internal @installset base\n * @internal @legacy_names Image TV Preview, Show Image TVs\n * @reportissues https://github.com/DivanDesign/MODXEvo.plugin.ManagerManager/\n * @documentation README [+site_url+]assets/plugins/managermanager/readme.html\n * @documentation Official docs http://code.divandesign.biz/modx/managermanager\n * @link        Latest version http://code.divandesign.biz/modx/managermanager\n * @link        Additional tools http://code.divandesign.biz/modx\n * @link        Full changelog http://code.divandesign.biz/modx/managermanager/changelog\n * @author      Inspired by: HideEditor plugin by Timon Reinhard and Gildas; HideManagerFields by Brett @ The Man Can!\n * @author      DivanDesign studio http://www.DivanDesign.biz\n * @author      Nick Crossland http://www.rckt.co.uk\n * @author      Many others\n * @lastupdate  06/03/2016\n */\n\n// Run the main code\ninclude($modx->config[''base_path''].''assets/plugins/managermanager/mm.inc.php'');', 0, '&remove_deprecated_tv_types_pref=Remove deprecated TV types;list;yes,no;yes &config_chunk=Configuration Chunk;text;mm_rules', 0, ''),
(6, 'Quick Manager+', '<strong>1.5.6</strong> Enables QuickManager+ front end content editing support', 0, 6, 0, '\n/**\n * Quick Manager+\n * \n * Enables QuickManager+ front end content editing support\n *\n * @category \tplugin\n * @version \t1.5.6\n * @license \thttp://www.gnu.org/copyleft/gpl.html GNU Public License (GPL v3)\n * @internal    @properties &jqpath=Path to jQuery;text;assets/js/jquery.min.js &loadmanagerjq=Load jQuery in manager;list;true,false;false &loadfrontendjq=Load jQuery in front-end;list;true,false;true &noconflictjq=jQuery noConflict mode in front-end;list;true,false;true &loadtb=Load modal box in front-end;list;true,false;true &tbwidth=Modal box window width;text;80% &tbheight=Modal box window height;text;90% &hidefields=Hide document fields from front-end editors;text;parent &hidetabs=Hide document tabs from front-end editors;text; &hidesections=Hide document sections from front-end editors;text; &addbutton=Show add document here button;list;true,false;true &tpltype=New document template type;list;parent,id,selected;parent &tplid=New document template id;int;3 &custombutton=Custom buttons;textarea; &managerbutton=Show go to manager button;list;true,false;true &logout=Logout to;list;manager,front-end;manager &disabled=Plugin disabled on documents;text; &autohide=Autohide toolbar;list;true,false;true &editbuttons=Inline edit buttons;list;true,false;false &editbclass=Edit button CSS class;text;qm-edit &newbuttons=Inline new resource buttons;list;true,false;false &newbclass=New resource button CSS class;text;qm-new &tvbuttons=Inline template variable buttons;list;true,false;false &tvbclass=Template variable button CSS class;text;qm-tv\n * @internal\t@events OnParseDocument,OnWebPagePrerender,OnDocFormPrerender,OnDocFormSave,OnManagerLogout \n * @internal\t@modx_category Manager and Admin\n * @internal    @legacy_names QM+,QuickEdit\n * @internal    @installset base, sample\n * @internal    @disabled 1\n * @reportissues https://github.com/modxcms/evolution\n * @documentation Official docs [+site_url+]assets/plugins/qm/readme.html\n * @link        http://www.maagit.fi/modx/quickmanager-plus\n * @author      Mikko Lammi\n * @author      Since 2011: yama, dmi3yy, segr\n * @lastupdate  31/03/2014\n */\n\n// In manager\nif (!$modx->checkSession()) return;\n\n$show = TRUE;\n\nif ($disabled  != '''') {\n    $arr = array_filter(array_map(''intval'', explode('','', $disabled)));\n    if (in_array($modx->documentIdentifier, $arr)) {\n        $show = FALSE;\n    }\n}\n\nif ($show) {\n    // Replace [*#tv*] with QM+ edit TV button placeholders\n    if ($tvbuttons == ''true'') {\n        if ($modx->event->name == ''OnParseDocument'') {\n             $output = &$modx->documentOutput;\n             $output = preg_replace(''~\\[\\*#(.*?)\\*\\]~'', ''<!-- ''.$tvbclass.'' $1 -->[*$1*]'', $output);\n             $modx->documentOutput = $output;\n         }\n     }\n    include_once($modx->config[''base_path''].''assets/plugins/qm/qm.inc.php'');\n    $qm = new Qm($modx, $jqpath, $loadmanagerjq, $loadfrontendjq, $noconflictjq, $loadtb, $tbwidth, $tbheight, $hidefields, $hidetabs, $hidesections, $addbutton, $tpltype, $tplid, $custombutton, $managerbutton, $logout, $autohide, $editbuttons, $editbclass, $newbuttons, $newbclass, $tvbuttons, $tvbclass);\n}\n', 0, '&jqpath=Path to jQuery;text;assets/js/jquery.min.js &loadmanagerjq=Load jQuery in manager;list;true,false;false &loadfrontendjq=Load jQuery in front-end;list;true,false;true &noconflictjq=jQuery noConflict mode in front-end;list;true,false;true &loadtb=Load modal box in front-end;list;true,false;true &tbwidth=Modal box window width;text;80% &tbheight=Modal box window height;text;90% &hidefields=Hide document fields from front-end editors;text;parent &hidetabs=Hide document tabs from front-end editors;text; &hidesections=Hide document sections from front-end editors;text; &addbutton=Show add document here button;list;true,false;true &tpltype=New document template type;list;parent,id,selected;parent &tplid=New document template id;int;3 &custombutton=Custom buttons;textarea; &managerbutton=Show go to manager button;list;true,false;true &logout=Logout to;list;manager,front-end;manager &disabled=Plugin disabled on documents;text; &autohide=Autohide toolbar;list;true,false;true &editbuttons=Inline edit buttons;list;true,false;false &editbclass=Edit button CSS class;text;qm-edit &newbuttons=Inline new resource buttons;list;true,false;false &newbclass=New resource button CSS class;text;qm-new &tvbuttons=Inline template variable buttons;list;true,false;false &tvbclass=Template variable button CSS class;text;qm-tv', 1, ''),
(7, 'TinyMCE4', '<strong>4.3.7.2</strong> Javascript WYSIWYG editor', 0, 6, 0, 'require MODX_BASE_PATH.''assets/plugins/tinymce4/plugin.tinymce.php'';', 0, '&styleFormats=Custom Style Formats;textarea;Title,cssClass|Title2,cssClass &customParams=Custom Parameters <b>(Be careful or leave empty!)</b>;textarea; &entityEncoding=Entity Encoding;list;named,numeric,raw;named &entities=Entities;text; &pathOptions=Path Options;list;Site config,Absolute path,Root relative,URL,No convert;Site config &resizing=Advanced Resizing;list;true,false;false &disabledButtons=Disabled Buttons;text; &webTheme=Web Theme;test;webuser &webPlugins=Web Plugins;text; &webButtons1=Web Buttons 1;text;bold italic underline strikethrough removeformat alignleft aligncenter alignright &webButtons2=Web Buttons 2;text;link unlink image undo redo &webButtons3=Web Buttons 3;text; &webButtons4=Web Buttons 4;text; &webAlign=Web Toolbar Alignment;list;ltr,rtl;ltr &width=Width;text;100% &height=Height;text;400px &introtextRte=<b>Introtext RTE</b><br/>add richtext-features to "introtext";list;enabled,disabled;disabled &inlineMode=<b>Inline-Mode</b>;list;enabled,disabled;disabled &inlineTheme=<b>Inline-Mode</b><br/>Theme;text;inline &browser_spellcheck=<b>Browser Spellcheck</b><br/>At least one dictionary must be installed inside your browser;list;enabled,disabled;disabled', 0, ''),
(8, 'TransAlias', '<strong>1.0.4</strong> Human readible URL translation supporting multiple languages and overrides', 0, 6, 0, 'require MODX_BASE_PATH.''assets/plugins/transalias/plugin.transalias.php'';', 0, '&table_name=Trans table;list;common,russian,dutch,german,czech,utf8,utf8lowercase;russian &char_restrict=Restrict alias to;list;lowercase alphanumeric,alphanumeric,legal characters;lowercase alphanumeric &remove_periods=Remove Periods;list;Yes,No;No &word_separator=Word Separator;list;dash,underscore,none;dash &override_tv=Override TV name;string;', 0, '');

-- 
-- Вывод данных для таблицы modx_site_snippets
--
INSERT INTO modx_site_snippets VALUES
(1, 'alterTitle', '<strong>1</strong> Pagetitle если Longtitle пуст', 0, 7, 0, '\r\n//[[alterTitle? &id = `[+id+]`]] к примеру для вывода в Ditto\r\n$id = isset($id) ? (int) $id : 0;\r\nif ($id) {\r\n\t$arr = $modx->getPageInfo($id,1,''pagetitle,longtitle'');\r\n} else {\r\n\t$arr[''pagetitle''] = $modx->documentObject[''pagetitle''];\r\n\t$arr[''longtitle''] = $modx->documentObject[''longtitle''];\r\n}\r\n$title = strip_tags(strlen($arr[''longtitle'']) ? $arr[''longtitle''] : $arr[''pagetitle'']); \r\nreturn $title;\r\n?>\r\n', 0, '', ''),
(2, 'Breadcrumbs', '<strong>1.0.5</strong> Configurable breadcrumb page-trail navigation', 0, 8, 0, 'return require MODX_BASE_PATH.''assets/snippets/breadcrumbs/snippet.breadcrumbs.php'';', 0, '', ''),
(3, 'Ditto', '<strong>2.1.2</strong> Summarizes and lists pages to create blogs, catalogs, PR archives, bio listings and more', 0, 9, 0, 'return require MODX_BASE_PATH.''assets/snippets/ditto/snippet.ditto.php'';', 0, '', ''),
(4, 'DocInfo', '<strong>1</strong> Берем любое поле из любого документа (меньше запросов по сравнению с GetField)', 0, 7, 0, 'return require MODX_BASE_PATH.''assets/snippets/docinfo/snippet.docinfo.php'';', 0, '', ''),
(5, 'DocLister', '<strong>2.3.0</strong> Snippet to display the information of the tables by the description rules. The main goal - replacing Ditto and CatalogView', 0, 9, 0, 'return require MODX_BASE_PATH.''assets/snippets/DocLister/snippet.DocLister.php'';', 0, '', ''),
(6, 'eForm', '<strong>1.4.8</strong> Robust form parser/processor with validation, multiple sending options, chunk/page support for forms and reports, and file uploads', 0, 3, 0, 'return require MODX_BASE_PATH.''assets/snippets/eform/snippet.eform.php'';', 0, '', ''),
(7, 'FirstChildRedirect', '<strong>2.0</strong> Automatically redirects to the first child of a Container Resource', 0, 8, 0, 'return require MODX_BASE_PATH.''assets/snippets/firstchildredirect/snippet.firstchildredirect.php'';', 0, '', ''),
(8, 'if', '<strong>1.3</strong> A simple conditional snippet. Allows for eq/neq/lt/gt/etc logic within templates, resources, chunks, etc.', 0, 8, 0, 'return require MODX_BASE_PATH.''assets/snippets/if/snippet.if.php'';', 0, '', ''),
(9, 'phpthumb', '<strong>1.3</strong> PHPThumb creates thumbnails and altered images on the fly and caches them', 0, 9, 0, 'return require MODX_BASE_PATH.''assets/snippets/phpthumb/snippet.phpthumb.php'';\r\n', 0, '', ''),
(10, 'UltimateParent', '<strong>2.0</strong> Travels up the document tree from a specified document and returns its "ultimate" non-root parent', 0, 8, 0, 'return require MODX_BASE_PATH.''assets/snippets/ultimateparent/snippet.ultimateparent.php'';', 0, '', ''),
(11, 'Wayfinder', '<strong>2.0.5</strong> Completely template-driven and highly flexible menu builder', 0, 8, 0, 'return require MODX_BASE_PATH.''assets/snippets/wayfinder/snippet.wayfinder.php'';\n', 0, '', ''),
(12, 'loginza', '<strong>0.5</strong> Log in via social networks. Uses in his work and snippet WebLogin', 0, 3, 0, 'return require MODX_BASE_PATH.''assets/snippets/modxloginza/snippet.loginza.php'';', 0, '{}', ' '),
(13, 'WebChangePwd', '<strong>1.0</strong> Allows Web User to change their password from the front-end of the website', 0, 10, 0, 'return require MODX_BASE_PATH.''assets/snippets/weblogin/snippet.webchangepwd.php'';', 0, '', ''),
(14, 'WebLogin', '<strong>1.1</strong> Allows webusers to login to protected pages in the website, supporting multiple user groups', 0, 10, 0, 'return require MODX_BASE_PATH.''assets/snippets/weblogin/snippet.weblogin.php'';', 0, '&loginhomeid=Login Home Id;string; &logouthomeid=Logout Home Id;string; &logintext=Login Button Text;string; &logouttext=Logout Button Text;string; &tpl=Template;string;', ''),
(15, 'WebSignup', '<strong>1.1</strong> Basic Web User account creation/signup system', 0, 10, 0, 'return require MODX_BASE_PATH.''assets/snippets/weblogin/snippet.websignup.php'';', 0, '{\r\n  "tpl": [\r\n    {\r\n      "label": "Template",\r\n      "type": "string",\r\n      "value": "",\r\n      "default": "",\r\n      "desc": ""\r\n    }\r\n  ]\r\n}', ' '),
(16, 'exist_orAdd_user', 'Проверяет существование или добавление пользователя', 0, 0, 0, 'return require MODX_BASE_PATH.''assets/snippets/exist_orAdd_user.php'';', 0, '{}', ' '),
(17, 'test', '', 0, 0, 0, '\r\nsession_start();\r\n\techo $_SESSION[''webUserphoto''];', 0, '{}', ' '),
(18, 'UserAuthorization', '', 0, 0, 0, '\r\nsession_start();\r\nif(isset($_SESSION[''webFullname'']) && isset($_SESSION[''webUserphoto'']))\r\n\techo "<li><div class=''chip lime''>\r\n\t\t\t\t<a href=''#'' data-activates=''slide-out'' class=''user-menu''>\r\n\t\t\t\t<img src=''{$_SESSION[''webUserphoto'']}'' alt=''Contact Person''>\r\n\t\t\t\t{$_SESSION[''webFullname'']}</a>\r\n  \t\t\t</div></li>";\r\nelse\r\n\techo "<li><a class=''waves-effect waves-light btn light-green'' href=''{$url}''>Вход</a></li>";', 0, '{}', ' '),
(19, 'personal_area', 'личный кабинет', 0, 0, 0, '\r\nsession_start();\r\nif(isset($_SESSION[''webFullname'']) && isset($_SESSION[''webUserphoto''])){\r\n\techo "<ul id=''slide-out'' class=''side-nav''>\r\n\t\t\t<li><div class=''userView''>\r\n\t\t\t  <div class=''background''>\r\n\t\t\t\t<img src=''/assets/images/user_setting.jpg''>\r\n\t\t\t  </div>\r\n\t\t\t  <a href=''#!user''><img class=''circle'' src=''{$_SESSION[''webUserphoto'']}''></a>\r\n\t\t\t  <a href=''#!name''><span class=''white-text name''>{$_SESSION[''webFullname'']}</span></a>\r\n\t\t\t  <a href=''#!email''><span class=''white-text email''>{$_SESSION[''webEmail'']}</span></a>\r\n\t\t\t</div></li>\r\n\t\t\t<li><a href=''#!''><i class=''material-icons''>cloud</i>First Link With Icon</a></li>\r\n\t\t\t<li><a href=''#!''>Second Link</a></li>\r\n\t\t\t<li><div class=''divider''></div></li>\r\n\t\t\t<li><a class=''subheader''>Subheader</a></li>\r\n\t\t\t<li><a class=''waves-effect'' href=''#!''>Third Link With Waves</a></li>\r\n\t\t  </ul>";\r\n}', 0, '{}', ' ');

-- 
-- Вывод данных для таблицы modx_site_templates
--
INSERT INTO modx_site_templates VALUES
(3, 'Home', '', 0, 0, '', 0, '{{header}}\r\n{{NAV}}\r\n<div id="index-banner" class="parallax-container">\r\n    <div class="section no-pad-bot">\r\n      <div class="center">\r\n        <div class="row center">\r\n          <a href="#" id="download-button" class="btn-large waves-effect waves-light teal lighten-1 buttonf">БЫТЬ ПЕРВЫМ</a>\r\n        </div>\r\n        <br><br>\r\n\r\n      </div>\r\n    </div>\r\n    <div class="parallax"><img src="[(site_url)]assets/images/1.png" alt="Unsplashed background img 1"></div>\r\n  </div>\r\n  \r\n  <div class="section no-pad-bot" id="index-banner">\r\n    <div class="container">\r\n      <br><br>\r\n      <h1 class="header center orange-text">Как это работает?</h1>\r\n      <div class="row center">\r\n        <h5 class="header col s12 light">[*content*]</h5>\r\n      </div>\r\n      <br><br>\r\n\r\n    </div>\r\n  </div>\r\n\r\n\r\n  <div class="container">\r\n    <div class="section">\r\n\r\n      <!--   Icon Section   -->\r\n      \r\n<div class="row">\r\n        \r\n\t\r\n        <div class="col s12 m4">\r\n          <div class="icon-block">\r\n            <h2 class="center light-blue-text"><i class="material-icons">supervisor_account</i></h2>\r\n            <h5 class="center">Пользователи</h5>\r\n\r\n            <p class="light"><b>Нас уже (...)</b></p>\r\n            <p class="light"><b>Количество надзерателей (...)</b></p>\r\n          </div>\r\n        </div>\r\n\r\n        <div class="col s12 m4">\r\n          <div class="icon-block">\r\n            <h2 class="center light-blue-text"><i class="material-icons">settings</i></h2>\r\n            <h5 class="center">Планы на будущее</h5>\r\n\r\n            <p class="light"><b>Сделать сайт!</b></p>\r\n          </div>\r\n        </div>\r\n\r\n\t\t<div class="col s12 m4">\r\n\t\t\t  <div class="icon-block">\r\n\t\t\t\t<h2 class="center light-blue-text"><i class="material-icons">visibility</i></h2>\r\n\t\t\t\t<h5 class="center">Поддерживаемые сайты</h5>\r\n\t\t\t\t  <div class="chip">\r\n\t\t\t\t\t<img src="assets/images/olx.png" alt="Contact Person">\r\n\t\t\t\t\tOLX - на стадии разработки\r\n  \t\t\t\t</div>\r\n\t\t\t  </div>\r\n\t\t\t</div>\r\n\t\t  </div>\r\n\r\n    </div>\r\n    <br><br>\r\n\r\n    <div class="section">\r\n\r\n    </div>\r\n  </div>\r\n{{footer}}', 0, 1),
(4, 'MODX startup - Bootstrap', '<strong>1.0</strong> Sample template in Bootstrap', 0, 1, '', 0, '<!DOCTYPE html>\n<html lang="[(lang_code)]">\n<head>\t\n\t<base href="[(site_url)]" />\n\t<meta charset="[(modx_charset)]" />\n\t<meta name="viewport" content="width=device-width, initial-scale=1">\n\t<meta http-equiv="X-UA-Compatible" content="IE=edge">\n\t<title>[*pagetitle*] / [(site_name)]</title>\n\t<@IF:[*description:isntEmpty*]><meta name="description" content="[*description*]"><@ENDIF>\n\t\n\t<link href="[(site_url)]<@IF:[*id:isnt(1)*]>[~[*id*]~]<@ENDIF>" rel="canonical">\n\t<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet" type="text/css">\t\n\t<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">\n\t<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">\n\t\n\t<style> \n\thtml, body{background:#eee; font-family:''Open Sans'',sans-serif; line-height:1.8; font-size:14px;}\n\ta:focus{outline:none; outline-offset:0;}\n\th1{margin-top:15px;}\n\n\t.logo{float:left;}\n\t.logo img{max-width:200px; margin:10px 0; display:block; height:50px; width:auto;}\n\t.dropdown-menu{border-radius:0; border:0;}\n\t.dropdown-menu > li > a{padding-top:5px; padding-bottom:5px;}\n\n\t.navbar-collapse.collapse.in{border-bottom:10px solid #eee;}\n\t.navbar{min-height:0; background:#fff; margin-bottom:0;}\n\t.navbar.nav{margin-left:0;}\n\t.navbar.nav ul{padding-left:0;}\n\t.navbar-nav{margin:0;}\n\t.navbar-toggle{background:#fff; border:2px solid #eee; border-radius:0; position:fixed; z-index:99; right:0; top:7px; padding:12px 10px; margin-right:10px;}\n\t.navbar .navbar-toggle .icon-bar{background-color:#333;}\n\n\t.nav li a{text-transform:uppercase; color:#333; font-weight:500; font-size:110%;}\n\t.nav li li a{text-transform:none; font-weight:normal; font-size:100%;}\n\n\t.navbar{border:none; border-radius:0;}\n\t#navbar{padding:0;}\n\tul.nav > li > a:hover{background-color:#f5f5f5;}\n\n\t.affix{top:0px; width:100%; z-index:1000; background-color:#eee;}\n\t.affix + .affspacer{display:block; height:50px;}\n\n\t.box-shadow{-webkit-box-shadow:0 6px 12px rgba(0,0,0,.175); box-shadow:0 6px 12px rgba(0,0,0,.175);}\n\n\t.container {max-width:970px; margin:0 12px;}\n\t.top .col-sm-12{padding-left:0; padding-right:0;}\n\n\t#ajaxSearch_input,\n\t#username,\n\t#password{width:100%!important;}\n\t#forgotpsswd{clear:both;}\n\tinput.button[type="submit"]{display:block;}\n\tlabel.checkbox{display:inline-block; margin-left:10px;}\n\tlabel, legend{font-weight:400;}\n\t#ajaxSearch_form { position:relative; }\n\t#searchClose { display:none !important; }\n    #indicator { position:absolute; top:9px; right:12px; z-index:10; opacity:.75; }\n\n\th2{font-size:22px;}\n\t.bread{padding:1em 0 0 0;}\n\t.mem{color:#aaa; text-align:center; padding:1em 0 2em;}\n\n\tsection.main .container{background-color:#fff; padding-bottom:20px;}\n\tfooter.footer .container{background-color:#000; color:#fff; line-height:40px;}\n\n\tsection.main ul{list-style:none; margin:0 0 1em 0; padding:0;}\n\tsection.main ul li{padding-left:1em;}\n\tsection.main ul li:before{content:''\\2022''; position:absolute; line-height:1.85em; margin-left:-1em;}\n\n\t.footer{text-align:center;}\n\t.footer .text-right{text-align:center;}\n\n\t/* JOT */\n\t.jot-comment{padding:5px 10px;}\n\t.jot-row-author{background-color:#dddddd;}\n\t.jot-row-alt{background-color:#f9f9f9;}\n\t.jot-row{background-color:#eeeeee;}\n\t.jot-row-up{border:1px solid #333!important;}\n\t.jot-row-up.panel-primary > .panel-heading{background-color:#333!important; border-color:#333!important;}\n\t.jot-extra{font-size:75%;}\n\t.jot-poster{font-size:inherit!important;}\n\n\t.ditto_summaryPost img{max-width:100%; height:auto; margin:10px 0 5px; display:block;}\n\t.ditto_summaryPost{padding-top:10px; padding-bottom:15px; border-bottom:1px solid #eee;}\n\n\t/* Larger than mobile */\n\t@media (min-width:320px) {\n\n\t}\n\n\t/* Larger than phablet */\n\t@media (min-width:480px) {\n\n\t}\n\n\t/* Larger than tablet */\n\t@media (min-width:768px) {\n\n\t\t.container{margin:0 auto;}\n\t\t.logo{padding-left:15px;}\n\t\t.logo img{ max-width:240px; margin:0; display:block; height:100px;}\n\n\t\t.navbar{background:transparent;}\n\t\t.navbar.affix{background:#eee;}\n\t\t.navbar-collapse.collapse.in{border-bottom:0;}\n\n\t\t.footer{text-align:left;}\n\t\t.footer .text-right{text-align:right;}\n\n\t\t.col-lg-1, .col-lg-10, .col-lg-11, .col-lg-12, .col-lg-2, .col-lg-3, .col-lg-4, .col-lg-5, .col-lg-6, .col-lg-7, .col-lg-8, .col-lg-9, .col-md-1, .col-md-10, .col-md-11, .col-md-12, .col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9, .col-sm-1, .col-sm-10, .col-sm-11, .col-sm-12, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9, .col-xs-1, .col-xs-10, .col-xs-11, .col-xs-12, .col-xs-2, .col-xs-3, .col-xs-4, .col-xs-5, .col-xs-6, .col-xs-7, .col-xs-8, .col-xs-9 {padding-left:35px; padding-right:35px;}\n\n\t}\n\t</style>\n\t\n\t<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>\n</head>\n<body>\n\t<section class="top">\n\t\t<div class="container">\n\t\t\t<div class="row">\n\t\t\t\t<div class="col-sm-12" itemscope itemtype="http://schema.org/Organization">\n\n\t\t\t\t\t<a class="logo" href="[~[(site_start)]~]" title="[(site_name)]" itemprop="url">\n\t\t\t\t\t\t<img src="[(site_url)]assets/images/modx-logo.png" itemprop="logo" width="240" height="100" alt="[(site_name)]" />\n\t\t\t\t\t</a>\n\n\t\t\t\t\t<div class="clearfix"></div>\n\n\t\t\t\t\t<nav class="navbar" role="navigation" data-spy="affix" data-offset-top="100">\n\n\t\t\t\t\t\t<div class="navbar-header">\n\t\t\t\t\t\t\t<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">\n\t\t\t\t\t\t\t\t<span class="sr-only">Toggle navigation</span>\n\t\t\t\t\t\t\t\t<span class="icon-bar"></span>\n\t\t\t\t\t\t\t\t<span class="icon-bar"></span>\n\t\t\t\t\t\t\t\t<span class="icon-bar"></span>\n\t\t\t\t\t\t\t</button>\n\t\t\t\t\t\t</div>\n\t\t\t\t\t\t<div id="navbar" class="navbar-collapse collapse">\n\t\t\t\t\t\t\t[[Wayfinder? \n\t\t\t\t\t\t\t&startId=`0` \n\t\t\t\t\t\t\t&level=`2` \n\t\t\t\t\t\t\t&removeNewLines=`1`\n\t\t\t\t\t\t\t&outerTpl=`@CODE:<ul class="nav navbar-nav">[+wf.wrapper+]</ul>`\n\t\t\t\t\t\t\t&rowTpl=`@CODE:<li[+wf.classes+]><a href="[+wf.link+]" [+wf.attributes+]>[+wf.linktext+]</a>[+wf.wrapper+]</li>`\n\t\t\t\t\t\t\t&innerTpl=`@CODE:<ul class="dropdown-menu">[+wf.wrapper+]</ul>`\n\t\t\t\t\t\t\t&innerRowTpl=`@CODE:<li[+wf.classes+]><a href="[+wf.link+]">[+wf.linktext+]</a></li>`\n\t\t\t\t\t\t\t&parentRowTpl=`@CODE:<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" title="[+wf.title+]">[+wf.linktext+] <b class="caret"></b></a>[+wf.wrapper+]</li>`\n\t\t\t\t\t\t\t&activeParentRowTpl=`@CODE:<li class="dropdown active"><a class="dropdown-toggle" data-toggle="dropdown" href="#" title="[+wf.title+]">[+wf.linktext+] <b class="caret"></b></a>[+wf.wrapper+]</li>`\n\t\t\t\t\t\t\t]]\n\t\t\t\t\t\t</div>\n\n\t\t\t\t\t</nav>\n\t\t\t\t\t<div class="affspacer"></div>\n\n\t\t\t\t</div>\n\t\t\t</div>\n\t\t</div>\n\t\t</section>\n\n\t\t<section class="main">\n\t\t\t<div class="container">\n\n\t\t\t\t<div class="row">\n\t\t\t\t\t<div class="col-sm-12">\n\t\t\t\t\t\t<div class="bread">\n\t\t\t\t\t\t\t[[Breadcrumbs]]\n\t\t\t\t\t\t</div>\n\t\t\t\t\t</div>\n\t\t\t\t</div>\n\n\t\t\t\t<div class="row">\n\n\t\t\t\t\t<div class="col-sm-8">\n\t\t\t\t\t\t<h1>[*#longtitle*]</h1>\n\t\t\t\t\t\t[*#content*]\n\t\t\t\t\t</div>\n\n\t\t\t\t\t<aside class="col-sm-4">\n\t\t\t\t\t\t<div class="search">\n\t\t\t\t\t\t\t<h2>Search</h2>\n\t\t\t\t\t\t\t[!AjaxSearch? \n\t\t\t\t\t\t\t&ajaxSearch=`1` \n\t\t\t\t\t\t\t&addJscript=`0` \n\t\t\t\t\t\t\t&showIntro=`0` \n\t\t\t\t\t\t\t&ajaxMax=`5` \n\t\t\t\t\t\t\t&extract=`1`\n\t\t\t\t\t\t\t&jscript=`jquery`\n\t\t\t\t\t\t\t&tplInput=`AjaxSearch_tplInput`\n\t\t\t\t\t\t\t&tplAjaxGrpResult=`AjaxSearch_tplAjaxGrpResult`\n\t\t\t\t\t\t\t&tplAjaxResults=`AjaxSearch_tplAjaxResults`\n\t\t\t\t\t\t\t&tplAjaxResult=`AjaxSearch_tplAjaxResult`\n\t\t\t\t\t\t\t&showResults=`1`\n\t\t\t\t\t\t\t&liveSearch=`0`\n\t\t\t\t\t\t\t!]\n\t\t\t\t\t\t</div>\n\n\t\t\t\t\t\t<h2>News:</h2>\n\t\t\t\t\t\t[[DocLister? \n\t\t\t\t\t\t&parents=`2` \n\t\t\t\t\t\t&display=`2`\n\t\t\t\t\t\t&total=`20` \n\t\t\t\t\t\t&removeChunk=`Comments` \n\t\t\t\t\t\t&tpl=`nl_sidebar`\n\t\t\t\t\t\t]]\n\n\t\t\t\t\t\t<div>\n\t\t\t\t\t\t\t<h2>Most Recent:</h2>\n\n\t\t\t\t\t\t\t<ul>\n\t\t\t\t\t\t\t\t[[DocLister? \n\t\t\t\t\t\t\t\t&showInMenuOnly=`1` \n\t\t\t\t\t\t\t\t&parents=`0`\n\t\t\t\t\t\t\t\t&display=`5`\n\t\t\t\t\t\t\t\t&tpl=`@CODE:<li><a href="[+url+]" title="[+pagetitle+]">[+pagetitle+]</a> <span class="date">[+date+]</span></li>`\n\t\t\t\t\t\t\t\t]]\n\t\t\t\t\t\t\t</ul>\n\n\t\t\t\t\t\t</div>\n\t\t\t\t\t\t<br/>\n\t\t\t\t\t\t<h2>Login:</h2>\n\t\t\t\t\t\t<div>\n\t\t\t\t\t\t\t[!WebLogin? \n\t\t\t\t\t\t\t&tpl=`WebLogin_tplForm` \n\t\t\t\t\t\t\t&loginhomeid=`[(site_start)]`\n\t\t\t\t\t\t\t&focusInput=`0`\n\t\t\t\t\t\t\t!]\n\t\t\t\t\t\t</div>\n\n\t\t\t\t\t</aside>\n\t\t\t\t</div>\n\t\t\t</div>\n\n\t\t</section>\n\n\t\t<footer class="footer">\n\t\t\t<div class="container">\n\t\t\t\t<div class="row">\n\t\t\t\t\t<div class="col-sm-6">\n\t\t\t\t\t\t<a href="https://modx.com" title="Learn more about MODX">MODX</a> Starter-Template &copy;2006-[[$_SERVER[''REQUEST_TIME'']:dateFormat=`Y` ]]\n\t\t\t\t\t</div>\n\t\t\t\t\t<div class="col-sm-6 text-right">\n\t\t\t\t\t\tBuilt with <a href="http://www.getbootstrap.com" target="_blank">Bootstrap</a> framework.\n\t\t\t\t\t</div>\n\t\t\t\t</div>\n\t\t\t</div>\n\t\t</footer>\n\n\t\t<div class="container mem">\n\t\t\t<small>Memory: [^m^], MySQL: [^qt^], [^q^] request(s), PHP: [^p^], total: [^t^], document retrieved from [^s^]. </small>\n\t</div>\n\n\t<!-- Scripts\n\t–––––––––––––––––––––––––––––––––––––––––––––––––– -->\t\n\n\t<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>\n\t<!--[if lt IE 9]>\n\t\t<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>\n\t\t<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>\n\t<![endif]-->\n\t\n</body>\n</html>', 0, 1),
(5, 'Авторизация', ' login', 0, 0, '', 0, '{{header}}\r\n{{NAV}}\r\n{{authorization}}\r\n{{footer}}', 0, 1),
(6, 'registration', 'Форма регистрации', 0, 0, '', 0, '{{header}}\r\n{{NAV}}\r\n[!WebSignup? \r\n&tpl=`reg_tpl`\r\n&groups=`webusers`\r\n&useCaptcha=`1`\r\n!]\r\n{{footer}}\r\n<script src="/assets/js/jquery.pwdMeter.js"></script>\r\n{{reg_validation}}', 0, 1);

-- 
-- Вывод данных для таблицы modx_site_tmplvar_access
--

-- Таблица ibase_woch.modx_site_tmplvar_access не содержит данных

-- 
-- Вывод данных для таблицы modx_site_tmplvar_contentvalues
--

-- Таблица ibase_woch.modx_site_tmplvar_contentvalues не содержит данных

-- 
-- Вывод данных для таблицы modx_site_tmplvar_templates
--
INSERT INTO modx_site_tmplvar_templates VALUES
(4, 3, 0),
(1, 3, 0),
(2, 3, 0),
(3, 3, 0);

-- 
-- Вывод данных для таблицы modx_site_tmplvars
--
INSERT INTO modx_site_tmplvars VALUES
(1, 'textarea', 'desc', 'Мета дескрипшин', 'Мета дескрипшин', 0, 2, 0, '', 0, '', '', '[*introtext*]'),
(2, 'text', 'keyw', 'Ключевые слова', 'Ключевые слова', 0, 2, 0, '', 0, '', '', '[*pagetitle*]'),
(3, 'checkbox', 'noIndex', 'Индексировать страницу', 'Управление URL', 0, 2, 0, 'Нет==<meta name="robots" content="noindex, nofollow">', 0, '', '', ''),
(4, 'text', 'titl', 'Мета тайтл', 'Мета тайтл', 0, 2, 0, '', 0, '', '', '[*pagetitle*] - [(site_name)]');

-- 
-- Вывод данных для таблицы modx_system_eventnames
--
INSERT INTO modx_system_eventnames VALUES
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

-- 
-- Вывод данных для таблицы modx_system_settings
--
INSERT INTO modx_system_settings VALUES
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
('sys_files_checksum', 'a:4:{s:36:"C:/OpenServer/domains/modx/index.php";s:32:"c16a5692a22a2b08c6def0c52c9f5616";s:36:"C:/OpenServer/domains/modx/.htaccess";s:32:"bc36bc59752f0852a763c5b50be6dc1e";s:44:"C:/OpenServer/domains/modx/manager/index.php";s:32:"236f68dad4d8ac0166aa78290b107f1f";s:58:"C:/OpenServer/domains/modx/manager/includes/config.inc.php";s:32:"3a4ce62945fdaa91ced4251e8db8c14e";}');

-- 
-- Вывод данных для таблицы modx_user_attributes
--
INSERT INTO modx_user_attributes VALUES
(1, 1, 'Igor Didenko', 1, 'igorded1991@yandex.ru', '+380969063656', '+380969063656', 0, 0, 0, 15, 1493464321, 1494169886, 0, '4ffhtombonta7f5p8krffjusr2', 0, 0, '81', 'Meleshkina bla bla bla', 'Berlin', 'Sachsen', '500505', '', '', ''),
(2, 2, 'ipra', 1, 'iprahtc@gmail.com', '', '', 0, 0, 0, 7, 1494182117, 1494326237, 0, 'htg7qq8giilekvm20k9qmondr2', 0, 0, '', '', '', '', '', '', '', '');

-- 
-- Вывод данных для таблицы modx_user_messages
--

-- Таблица ibase_woch.modx_user_messages не содержит данных

-- 
-- Вывод данных для таблицы modx_user_roles
--
INSERT INTO modx_user_roles VALUES
(2, 'Editor', 'Limited to managing content', 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1),
(3, 'Publisher', 'Editor with expanded permissions including manage users, update Elements and site settings', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1),
(1, 'Administrator', 'Site administrators have full access to all functions', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- 
-- Вывод данных для таблицы modx_user_settings
--
INSERT INTO modx_user_settings VALUES
(2, 'allow_manager_access', '1'),
(2, 'which_browser', 'default'),
(2, 'tinymce4_custom_plugins', 'advlist autolink lists link image charmap print preview hr anchor pagebreak searchreplace wordcount visualblocks visualchars code fullscreen spellchecker insertdatetime media nonbreaking save table contextmenu directionality emoticons template paste textcolor codesample colorpicker textpattern imagetools paste modxlink youtube'),
(2, 'tinymce4_custom_buttons1', 'undo redo | cut copy paste | searchreplace | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent blockquote | styleselect'),
(2, 'tinymce4_custom_buttons2', 'link unlink anchor image media codesample table | hr removeformat | subscript superscript charmap | nonbreaking | visualchars visualblocks print preview fullscreen code'),
(2, 'tinymce4_blockFormats', 'Paragraph=p;Header 1=h1;Header 2=h2;Header 3=h3'),
(1, 'allow_manager_access', '1'),
(1, 'which_browser', 'default'),
(1, 'tinymce4_custom_plugins', 'advlist autolink lists link image charmap print preview hr anchor pagebreak searchreplace wordcount visualblocks visualchars code fullscreen spellchecker insertdatetime media nonbreaking save table contextmenu directionality emoticons template paste textcolor codesample colorpicker textpattern imagetools paste modxlink youtube'),
(1, 'tinymce4_custom_buttons1', 'undo redo | cut copy paste | searchreplace | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent blockquote | styleselect'),
(1, 'tinymce4_custom_buttons2', 'link unlink anchor image media codesample table | hr removeformat | subscript superscript charmap | nonbreaking | visualchars visualblocks print preview fullscreen code'),
(1, 'tinymce4_blockFormats', 'Paragraph=p;Header 1=h1;Header 2=h2;Header 3=h3');

-- 
-- Вывод данных для таблицы modx_web_groups
--

-- Таблица ibase_woch.modx_web_groups не содержит данных

-- 
-- Вывод данных для таблицы modx_web_user_attributes
--
INSERT INTO modx_web_user_attributes VALUES
(9, 9, 'ipra ipra', 0, 'iprahtc2@gmail.com', '', '', 0, 0, 0, 1, 0, 1494336605, 0, 'htg7qq8giilekvm20k9qmondr2', 0, 0, '', '', '', '', '', '', 'https://lh6.googleusercontent.com/-AydlRuQ83ks/AAAAAAAAAAI/AAAAAAAAAAs/QujaliZPb6w/photo.jpg?sz=50', ''),
(2, 2, 'Igor Didenko', 0, 'igorded1991@yandex.ru', '+380969063656', '+380969063656', 0, 0, 0, 0, 0, 0, 0, '', 680734800, 1, '81', 'Meleshkina bla bla bla', 'Berlin', 'Sachsen', '500505', '', '', ''),
(3, 3, 'Илья Капков', 0, 'iprahtc@gmail.com', '', '', 0, 0, 0, 1, 0, 1493377251, 0, 'd23u223me5hfcni52ke5n00sf2', 0, 1, '', '', '', '', '', '', 'https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg?sz=50', ''),
(4, 4, 'Test', 0, 'test@mail.ru', '', '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, '', '', '', '', '', '', '', '');

-- 
-- Вывод данных для таблицы modx_web_user_settings
--
INSERT INTO modx_web_user_settings VALUES
(4, 'login_home', '/');

-- 
-- Вывод данных для таблицы modx_web_users
--
INSERT INTO modx_web_users VALUES
(9, '109141084637326271700@plus.google.com', '0f9d94709990', ''),
(2, 'igor', '46a1d25ab3d6406bd569d24a50687f0f', ''),
(3, '117370189451020981061@plus.google.com', '0a011110bee4', ''),
(4, 'Test', '46a1d25ab3d6406bd569d24a50687f0f', '');

-- 
-- Вывод данных для таблицы modx_webgroup_access
--
INSERT INTO modx_webgroup_access VALUES
(2, 2, 2);

-- 
-- Вывод данных для таблицы modx_webgroup_names
--
INSERT INTO modx_webgroup_names VALUES
(2, 'webusers');

-- 
-- Восстановить предыдущий режим SQL (SQL mode)
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Включение внешних ключей
-- 
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;