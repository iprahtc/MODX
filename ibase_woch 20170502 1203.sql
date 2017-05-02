--
-- Скрипт сгенерирован Devart dbForge Studio for MySQL, Версия 7.2.58.0
-- Домашняя страница продукта: http://www.devart.com/ru/dbforge/mysql/studio
-- Дата скрипта: 02.05.2017 12:03:25
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
AUTO_INCREMENT = 488
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
AUTO_INCREMENT = 19
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
AUTO_INCREMENT = 3
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
AUTO_INCREMENT = 1313
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
AUTO_INCREMENT = 11
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
AUTO_INCREMENT = 17
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
AUTO_INCREMENT = 5
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
AUTO_INCREMENT = 5
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
(484, '4ffhtombonta7f5p8krffjusr2', 1, 1, 6, 1493504523),
(485, '4ffhtombonta7f5p8krffjusr2', 1, 3, 8, 1493504583);

-- 
-- Вывод данных для таблицы modx_active_user_sessions
--
INSERT INTO modx_active_user_sessions VALUES
('4ffhtombonta7f5p8krffjusr2', 1, 1493590299, '127.0.0.1');

-- 
-- Вывод данных для таблицы modx_active_users
--
INSERT INTO modx_active_users VALUES
('2i30onu4sru9chk6nhr2oehaj3', 1, 'admin', 1493448166, '99', NULL),
('4ffhtombonta7f5p8krffjusr2', 1, 'admin', 1493581899, '2', NULL),
('d23u223me5hfcni52ke5n00sf2', 2, 'ipra', 1493377311, '78', 9);

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
(18, 0, 1493499464, 3, 0, 1, 'SQL Query / Execution of a query to the database f', '<h2 style="color:red">&laquo; MODX Parse Error &raquo;</h2><h3 style="color:red">Execution of a query to the database failed - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ''@yandex.ru'' at line 1</h3><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;margin-bottom:15px;">SQL &gt; <span id="sqlHolder">SELECT email FROM modx_web_user_attributes WHERE email = igorded1991@yandex.ru  </span></div>\n<table class="grid">\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Basic info</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>REQUEST_URI</td>\n\t\t<td>http://modx/exist_login.php</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Resource</td>\n\t\t<td>[1] <a href="http://modx/" target="_blank">Главная</a></td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Referer</td>\n\t\t<td>http://modx/registration.html</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>User Agent</td>\n\t\t<td>Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 YaBrowser/17.3.1.840 Yowser/2.5 Safari/537.36</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>IP</td>\n\t\t<td>127.0.0.1</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Current time</td>\n\t\t<td>2017-04-29 23:57:44</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th width="100px" >Benchmarks</th>\n\t\t<th></th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td>MySQL</td>\n\t\t<td>0.1676 s (3 Requests)</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>PHP</td>\n\t\t<td>0.1441 s</td>\n\t</tr>\n\t<tr class="gridItem">\n\t\t<td>Total</td>\n\t\t<td>0.3116 s</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td>Memory</td>\n\t\t<td>1.6422729492188 mb</td>\n\t</tr>\n</table>\n<br />\n<table class="grid">\n\t<thead>\n\t<tr class="">\n\t\t<th>Backtrace</th>\n\t</tr>\n\t</thead>\n\t<tr class="gridItem">\n\t\t<td><strong>DBAPI->select</strong>(''email'', string $var2, string $var3)<br />exist_login.php on line 40</td>\n\t</tr>\n\t<tr class="gridAltItem">\n\t\t<td><strong>DBAPI->query</strong>(string $var1)<br />manager/includes/extenders/dbapi.mysqli.class.inc.php on line 161</td>\n\t</tr>\n</table>\n');

-- 
-- Вывод данных для таблицы modx_keyword_xref
--

-- Таблица ibase_woch.modx_keyword_xref не содержит данных

-- 
-- Вывод данных для таблицы modx_log_history
--
INSERT INTO modx_log_history VALUES
(1, '', '127.0.0.1', 1492444195),
(2, '', '127.0.0.1', 1493377251);

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
(1312, 1493504764, 1, 'admin', 76, '-', '-', 'Element management');

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
(4, 'footer', 'низ сайта', 2, 'none', 4, 0, '<footer class="page-footer orange">\r\n    <div class="container">\r\n      <div class="row">\r\n        <div class="col l6 s12">\r\n          <h5 class="white-text">Поддержка сайта</h5>\r\n          <p class="grey-text text-lighten-4">2017</p>\r\n        </div>\r\n        <div class="col l3 s12">\r\n          <h5 class="white-text">Капков Илья</h5>\r\n          <ul>\r\n            <li><p class="grey-text text-lighten-4">Главный программист по обработке содержимого поддерживаемых сервисов</p></li>\r\n          </ul>\r\n        </div>\r\n        <div class="col l3 s12">\r\n          <h5 class="white-text">Диденко Игорь</h5>\r\n          <ul>\r\n            <li><p class="grey-text text-lighten-4">Гланый программист по герерации запросов к поддерживаемым сервисам</p></li>\r\n          </ul>\r\n        </div>\r\n      </div>\r\n    </div>\r\n    <div class="footer-copyright">\r\n      <div class="container">\r\n      Курсовая работа 2017\r\n      </div>\r\n    </div>\r\n  </footer>\r\n\r\n\r\n  <!--  Scripts-->\r\n  <script src="/assets/js/jquery/jquery.min.js"></script>\r\n  <script src="/assets/js/wotch/materialize.js"></script>\r\n  <script src="/assets/js/wotch/init.js"></script>\r\n  <script src="/assets/js/wotch/login.js"></script>\r\n\r\n  </body>\r\n</html>', 0),
(5, 'header', 'шапка', 2, 'none', 4, 0, '<!DOCTYPE html>\r\n\t<html lang="ru">\r\n\t<head>\r\n\t<meta http-equiv="Content-Type" content="text/html; charset=[(modx_charset)]" /> \r\n\t<title>[*pagetitle*]</title>\r\n\t[*noIndex*]\r\n\t<meta name="keywords" content="[*keyw*]" />\r\n\t<meta name="description" content="[*desc*]" />\r\n\t<base href="[(site_url)]"/>\r\n\t<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">\r\n\t<link href="/assets/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>\r\n  \t<link href="/assets/css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>\r\n</head>\r\n<body>', 0),
(6, 'mm_rules', 'Default ManagerManager rules.', 0, 'none', 5, 0, '// more example rules are in assets/plugins/managermanager/example_mm_rules.inc.php\r\n// example of how PHP is allowed - check that a TV named documentTags exists before creating rule\r\n\r\nmm_widget_showimagetvs(); // Показываем превью ТВ\r\n\r\nmm_createTab(''Для SEO'', ''seo'', '''', '''', '''', '''');\r\nmm_moveFieldsToTab(''titl,keyw,desc,seoOverride,noIndex,sitemap_changefreq,sitemap_priority,sitemap_exclude'', ''seo'', '''', '''');\r\nmm_widget_tags(''keyw'','',''); // Give blog tag editing capabilities to the ''documentTags (3)'' TV\r\n\r\n\r\n//mm_createTab(''Изображения'', ''photos'', '''', '''', '''', ''850'');\r\n//mm_moveFieldsToTab(''images,photos'', ''photos'', '''', '''');\r\n\r\n//mm_hideFields(''longtitle,description,link_attributes,menutitle,content'', '''', ''6,7'');\r\n\r\n//mm_hideTemplates(''0,5,8,9,11,12'', ''2,3'');\r\n\r\n//mm_hideTabs(''settings, access'', ''2'');\r\n\r\n//mm_widget_evogallery(1, Галерея, ''1,2,3'', 3);   // подключаем галерею \r\n//mm_galleryLink($fields, $roles, $templates, $moduleid);\r\n//mm_widget_evogallery($moduleid, $title, $roles, $templates);\r\n', 0),
(7, 'NAV', 'навбар', 2, 'none', 0, 0, '<nav class="light-blue lighten-1" role="navigation">\r\n    <div class="nav-wrapper container"><a id="logo-container" href="#" class="brand-logo"><img src="/assets/images/logo2.png"></a>\r\n      <ul class="right hide-on-med-and-down">\r\n        <li><a href="[(site_url)]">Главная</a></li>\r\n        <li><a href="#">Надзератель</a></li>\r\n        <li><a href="#">Принцип работы</a></li>\r\n        <li><a href="#">О нас</a></li>\r\n        <li><a class="waves-effect waves-light btn light-green" href="[(site_url)]login.html">Вход</a></li>\r\n      </ul>\r\n\r\n      <ul id="nav-mobile" class="side-nav">\r\n\t\t<li><a href="[(site_url)]">Главная</a></li>\r\n        <li><a href="#">Надзератель</a></li>\r\n        <li><a href="#">Принцип работы</a></li>\r\n        <li><a href="#">О нас</a></li>\r\n        <li><a class="waves-effect waves-light btn light-green" href="[(site_url)]login.html">Вход</a></li>\r\n      </ul>\r\n      <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>\r\n    </div>\r\n</nav>', 0),
(8, 'reg_validation', 'Проверка существования логина emaila', 2, 'none', 0, 0, '<script>\r\n\t\r\n\t$(document).ready(function(){\r\n        $("#password1").pwdMeter();\r\n    });\r\n\t\r\n\t$(document).ready(function(){\r\n        $("#password2").pwdCompare();\r\n    });\r\n\t\r\n\tfunction validationEmail(input) {\r\n\t\t$.post(\r\n\t\t  "/assets/snippets/exist_orAdd_user.php",\r\n\t\t  {\r\n\t\t\temail: input.value\r\n\t\t  },\r\n\t\t  onAjaxSuccess\r\n\t\t);\r\n\t}\r\n\t\r\n\tfunction onAjaxSuccess(data) {\r\n\t\t\r\n\t\t// Здесь мы получаем данные, отправленные сервером.\r\n\t\tif(data == ''yes'') {\r\n\t\t\tdocument.getElementById(''emailex'').style.visibility = "hidden";\r\n\t\t}\r\n\t\telse if(data == ''no''){\r\n\t\t\tdocument.getElementById(''emailex'').style.visibility = "visible";\r\n\t\t}\r\n\t}\r\n\t\r\n\tfunction validationPassword(input) {\r\n\t\t\r\n\t\tvar idMPsw;\r\n\t\tif(input.id == ''password1'') {\r\n\t\t\tidMPsw = ''pwdMeter'';\r\n\t\t}\r\n\t\telse if(input.id == ''password2'') {\r\n\t\t\tidMPsw = ''pwdCompare'';\r\n\t\t}\r\n\t\t\r\n\t\tif(input.value == '''') {\r\n\t\t\tdocument.getElementById(idMPsw).style.visibility = "hidden";\r\n\t\t\t$(''#''+idMPsw).text('''');\r\n\t\t}\r\n\t\telse {\r\n\t\t\tdocument.getElementById(idMPsw).style.visibility = "visible";\r\n\t\t}\r\n\t\t\r\n\t}\r\n\t\r\n</script>', 0),
(9, 'autoriz', '', 2, 'none', 0, 0, '<form class="col s12" id="autoriz">\r\n\t<div class="row">\r\n\t\t<div class="input-field col s12">\r\n\t\t\t<i class="material-icons prefix light-blue-text">account_circle</i>\r\n\t\t\t<input id="icon_prefix" type="text" class="validate">\r\n\t\t\t<label for="icon_prefix">Email</label>\r\n\t\t</div>\r\n\t\t<div class="input-field col s12">\r\n\t\t\t<i class="material-icons prefix light-blue-text">lock</i>\r\n\t\t\t<input id="icon_telephone" type="tel" class="validate">\r\n\t\t\t<label for="icon_telephone">Пароль</label>\r\n\t\t</div>\r\n\t</div>\r\n\t<div class="row">\r\n\t\t<div class="col s6">\r\n\t\t\t<input class="waves-effect waves-light btn light-green" type="submit" value="Войти">\r\n\t\t</div>\r\n\t\t<div class="col s6 right-align">\r\n\t\t\t<a href="[(site_url)]registration.html">Регистрация</a>\r\n\t\t</div>\r\n\t\t<div class="right-align">\r\n\t\t\t[!loginza? &type=`profile`!]\r\n\t\t</div>\r\n\t</div>\r\n</form>', 0),
(10, 'test', '', 2, 'none', 0, 0, '<h1>ok</h1>', 0);

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
(15, 'WebSignup', '<strong>1.1</strong> Basic Web User account creation/signup system', 0, 10, 0, 'return require MODX_BASE_PATH.''assets/snippets/weblogin/snippet.websignup.php'';', 0, '&tpl=Template;string;', ''),
(16, 'exist_orAdd_user', 'Проверяет существование или добавление пользователя', 0, 0, 0, 'return require MODX_BASE_PATH.''assets/snippets/exist_orAdd_user.php'';', 0, '{}', ' ');

-- 
-- Вывод данных для таблицы modx_site_templates
--
INSERT INTO modx_site_templates VALUES
(3, 'Home', '', 0, 0, '', 0, '{{header}}\r\n{{NAV}}\r\n<div id="index-banner" class="parallax-container">\r\n    <div class="section no-pad-bot">\r\n      <div class="center">\r\n        <div class="row center">\r\n          <a href="#" id="download-button" class="btn-large waves-effect waves-light teal lighten-1 buttonf">БЫТЬ ПЕРВЫМ</a>\r\n        </div>\r\n        <br><br>\r\n\r\n      </div>\r\n    </div>\r\n    <div class="parallax"><img src="[(site_url)]assets/images/1.png" alt="Unsplashed background img 1"></div>\r\n  </div>\r\n  \r\n  <div class="section no-pad-bot" id="index-banner">\r\n    <div class="container">\r\n      <br><br>\r\n      <h1 class="header center orange-text">Как это работает?</h1>\r\n      <div class="row center">\r\n        <h5 class="header col s12 light">[*content*]</h5>\r\n      </div>\r\n      <br><br>\r\n\r\n    </div>\r\n  </div>\r\n\r\n\r\n  <div class="container">\r\n    <div class="section">\r\n\r\n      <!--   Icon Section   -->\r\n      \r\n<div class="row">\r\n        \r\n\t\r\n        <div class="col s12 m4">\r\n          <div class="icon-block">\r\n            <h2 class="center light-blue-text"><i class="material-icons">supervisor_account</i></h2>\r\n            <h5 class="center">Пользователи</h5>\r\n\r\n            <p class="light"><b>Нас уже (...)</b></p>\r\n            <p class="light"><b>Количество надзерателей (...)</b></p>\r\n          </div>\r\n        </div>\r\n\r\n        <div class="col s12 m4">\r\n          <div class="icon-block">\r\n            <h2 class="center light-blue-text"><i class="material-icons">settings</i></h2>\r\n            <h5 class="center">Планы на будущее</h5>\r\n\r\n            <p class="light"><b>Сделать сайт!</b></p>\r\n          </div>\r\n        </div>\r\n\r\n\t\t<div class="col s12 m4">\r\n\t\t\t  <div class="icon-block">\r\n\t\t\t\t<h2 class="center light-blue-text"><i class="material-icons">visibility</i></h2>\r\n\t\t\t\t<h5 class="center">Поддерживаемые сайты</h5>\r\n\t\t\t\t  <div class="chip">\r\n\t\t\t\t\t<img src="assets/images/olx.png" alt="Contact Person">\r\n\t\t\t\t\tOLX - на стадии разработки\r\n  \t\t\t\t</div>\r\n\t\t\t  </div>\r\n\t\t\t</div>\r\n\t\t  </div>\r\n\r\n    </div>\r\n    <br><br>\r\n\r\n    <div class="section">\r\n\r\n    </div>\r\n  </div>\r\n{{footer}}', 0, 1),
(4, 'MODX startup - Bootstrap', '<strong>1.0</strong> Sample template in Bootstrap', 0, 1, '', 0, '<!DOCTYPE html>\n<html lang="[(lang_code)]">\n<head>\t\n\t<base href="[(site_url)]" />\n\t<meta charset="[(modx_charset)]" />\n\t<meta name="viewport" content="width=device-width, initial-scale=1">\n\t<meta http-equiv="X-UA-Compatible" content="IE=edge">\n\t<title>[*pagetitle*] / [(site_name)]</title>\n\t<@IF:[*description:isntEmpty*]><meta name="description" content="[*description*]"><@ENDIF>\n\t\n\t<link href="[(site_url)]<@IF:[*id:isnt(1)*]>[~[*id*]~]<@ENDIF>" rel="canonical">\n\t<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet" type="text/css">\t\n\t<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">\n\t<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">\n\t\n\t<style> \n\thtml, body{background:#eee; font-family:''Open Sans'',sans-serif; line-height:1.8; font-size:14px;}\n\ta:focus{outline:none; outline-offset:0;}\n\th1{margin-top:15px;}\n\n\t.logo{float:left;}\n\t.logo img{max-width:200px; margin:10px 0; display:block; height:50px; width:auto;}\n\t.dropdown-menu{border-radius:0; border:0;}\n\t.dropdown-menu > li > a{padding-top:5px; padding-bottom:5px;}\n\n\t.navbar-collapse.collapse.in{border-bottom:10px solid #eee;}\n\t.navbar{min-height:0; background:#fff; margin-bottom:0;}\n\t.navbar.nav{margin-left:0;}\n\t.navbar.nav ul{padding-left:0;}\n\t.navbar-nav{margin:0;}\n\t.navbar-toggle{background:#fff; border:2px solid #eee; border-radius:0; position:fixed; z-index:99; right:0; top:7px; padding:12px 10px; margin-right:10px;}\n\t.navbar .navbar-toggle .icon-bar{background-color:#333;}\n\n\t.nav li a{text-transform:uppercase; color:#333; font-weight:500; font-size:110%;}\n\t.nav li li a{text-transform:none; font-weight:normal; font-size:100%;}\n\n\t.navbar{border:none; border-radius:0;}\n\t#navbar{padding:0;}\n\tul.nav > li > a:hover{background-color:#f5f5f5;}\n\n\t.affix{top:0px; width:100%; z-index:1000; background-color:#eee;}\n\t.affix + .affspacer{display:block; height:50px;}\n\n\t.box-shadow{-webkit-box-shadow:0 6px 12px rgba(0,0,0,.175); box-shadow:0 6px 12px rgba(0,0,0,.175);}\n\n\t.container {max-width:970px; margin:0 12px;}\n\t.top .col-sm-12{padding-left:0; padding-right:0;}\n\n\t#ajaxSearch_input,\n\t#username,\n\t#password{width:100%!important;}\n\t#forgotpsswd{clear:both;}\n\tinput.button[type="submit"]{display:block;}\n\tlabel.checkbox{display:inline-block; margin-left:10px;}\n\tlabel, legend{font-weight:400;}\n\t#ajaxSearch_form { position:relative; }\n\t#searchClose { display:none !important; }\n    #indicator { position:absolute; top:9px; right:12px; z-index:10; opacity:.75; }\n\n\th2{font-size:22px;}\n\t.bread{padding:1em 0 0 0;}\n\t.mem{color:#aaa; text-align:center; padding:1em 0 2em;}\n\n\tsection.main .container{background-color:#fff; padding-bottom:20px;}\n\tfooter.footer .container{background-color:#000; color:#fff; line-height:40px;}\n\n\tsection.main ul{list-style:none; margin:0 0 1em 0; padding:0;}\n\tsection.main ul li{padding-left:1em;}\n\tsection.main ul li:before{content:''\\2022''; position:absolute; line-height:1.85em; margin-left:-1em;}\n\n\t.footer{text-align:center;}\n\t.footer .text-right{text-align:center;}\n\n\t/* JOT */\n\t.jot-comment{padding:5px 10px;}\n\t.jot-row-author{background-color:#dddddd;}\n\t.jot-row-alt{background-color:#f9f9f9;}\n\t.jot-row{background-color:#eeeeee;}\n\t.jot-row-up{border:1px solid #333!important;}\n\t.jot-row-up.panel-primary > .panel-heading{background-color:#333!important; border-color:#333!important;}\n\t.jot-extra{font-size:75%;}\n\t.jot-poster{font-size:inherit!important;}\n\n\t.ditto_summaryPost img{max-width:100%; height:auto; margin:10px 0 5px; display:block;}\n\t.ditto_summaryPost{padding-top:10px; padding-bottom:15px; border-bottom:1px solid #eee;}\n\n\t/* Larger than mobile */\n\t@media (min-width:320px) {\n\n\t}\n\n\t/* Larger than phablet */\n\t@media (min-width:480px) {\n\n\t}\n\n\t/* Larger than tablet */\n\t@media (min-width:768px) {\n\n\t\t.container{margin:0 auto;}\n\t\t.logo{padding-left:15px;}\n\t\t.logo img{ max-width:240px; margin:0; display:block; height:100px;}\n\n\t\t.navbar{background:transparent;}\n\t\t.navbar.affix{background:#eee;}\n\t\t.navbar-collapse.collapse.in{border-bottom:0;}\n\n\t\t.footer{text-align:left;}\n\t\t.footer .text-right{text-align:right;}\n\n\t\t.col-lg-1, .col-lg-10, .col-lg-11, .col-lg-12, .col-lg-2, .col-lg-3, .col-lg-4, .col-lg-5, .col-lg-6, .col-lg-7, .col-lg-8, .col-lg-9, .col-md-1, .col-md-10, .col-md-11, .col-md-12, .col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9, .col-sm-1, .col-sm-10, .col-sm-11, .col-sm-12, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9, .col-xs-1, .col-xs-10, .col-xs-11, .col-xs-12, .col-xs-2, .col-xs-3, .col-xs-4, .col-xs-5, .col-xs-6, .col-xs-7, .col-xs-8, .col-xs-9 {padding-left:35px; padding-right:35px;}\n\n\t}\n\t</style>\n\t\n\t<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>\n</head>\n<body>\n\t<section class="top">\n\t\t<div class="container">\n\t\t\t<div class="row">\n\t\t\t\t<div class="col-sm-12" itemscope itemtype="http://schema.org/Organization">\n\n\t\t\t\t\t<a class="logo" href="[~[(site_start)]~]" title="[(site_name)]" itemprop="url">\n\t\t\t\t\t\t<img src="[(site_url)]assets/images/modx-logo.png" itemprop="logo" width="240" height="100" alt="[(site_name)]" />\n\t\t\t\t\t</a>\n\n\t\t\t\t\t<div class="clearfix"></div>\n\n\t\t\t\t\t<nav class="navbar" role="navigation" data-spy="affix" data-offset-top="100">\n\n\t\t\t\t\t\t<div class="navbar-header">\n\t\t\t\t\t\t\t<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">\n\t\t\t\t\t\t\t\t<span class="sr-only">Toggle navigation</span>\n\t\t\t\t\t\t\t\t<span class="icon-bar"></span>\n\t\t\t\t\t\t\t\t<span class="icon-bar"></span>\n\t\t\t\t\t\t\t\t<span class="icon-bar"></span>\n\t\t\t\t\t\t\t</button>\n\t\t\t\t\t\t</div>\n\t\t\t\t\t\t<div id="navbar" class="navbar-collapse collapse">\n\t\t\t\t\t\t\t[[Wayfinder? \n\t\t\t\t\t\t\t&startId=`0` \n\t\t\t\t\t\t\t&level=`2` \n\t\t\t\t\t\t\t&removeNewLines=`1`\n\t\t\t\t\t\t\t&outerTpl=`@CODE:<ul class="nav navbar-nav">[+wf.wrapper+]</ul>`\n\t\t\t\t\t\t\t&rowTpl=`@CODE:<li[+wf.classes+]><a href="[+wf.link+]" [+wf.attributes+]>[+wf.linktext+]</a>[+wf.wrapper+]</li>`\n\t\t\t\t\t\t\t&innerTpl=`@CODE:<ul class="dropdown-menu">[+wf.wrapper+]</ul>`\n\t\t\t\t\t\t\t&innerRowTpl=`@CODE:<li[+wf.classes+]><a href="[+wf.link+]">[+wf.linktext+]</a></li>`\n\t\t\t\t\t\t\t&parentRowTpl=`@CODE:<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" title="[+wf.title+]">[+wf.linktext+] <b class="caret"></b></a>[+wf.wrapper+]</li>`\n\t\t\t\t\t\t\t&activeParentRowTpl=`@CODE:<li class="dropdown active"><a class="dropdown-toggle" data-toggle="dropdown" href="#" title="[+wf.title+]">[+wf.linktext+] <b class="caret"></b></a>[+wf.wrapper+]</li>`\n\t\t\t\t\t\t\t]]\n\t\t\t\t\t\t</div>\n\n\t\t\t\t\t</nav>\n\t\t\t\t\t<div class="affspacer"></div>\n\n\t\t\t\t</div>\n\t\t\t</div>\n\t\t</div>\n\t\t</section>\n\n\t\t<section class="main">\n\t\t\t<div class="container">\n\n\t\t\t\t<div class="row">\n\t\t\t\t\t<div class="col-sm-12">\n\t\t\t\t\t\t<div class="bread">\n\t\t\t\t\t\t\t[[Breadcrumbs]]\n\t\t\t\t\t\t</div>\n\t\t\t\t\t</div>\n\t\t\t\t</div>\n\n\t\t\t\t<div class="row">\n\n\t\t\t\t\t<div class="col-sm-8">\n\t\t\t\t\t\t<h1>[*#longtitle*]</h1>\n\t\t\t\t\t\t[*#content*]\n\t\t\t\t\t</div>\n\n\t\t\t\t\t<aside class="col-sm-4">\n\t\t\t\t\t\t<div class="search">\n\t\t\t\t\t\t\t<h2>Search</h2>\n\t\t\t\t\t\t\t[!AjaxSearch? \n\t\t\t\t\t\t\t&ajaxSearch=`1` \n\t\t\t\t\t\t\t&addJscript=`0` \n\t\t\t\t\t\t\t&showIntro=`0` \n\t\t\t\t\t\t\t&ajaxMax=`5` \n\t\t\t\t\t\t\t&extract=`1`\n\t\t\t\t\t\t\t&jscript=`jquery`\n\t\t\t\t\t\t\t&tplInput=`AjaxSearch_tplInput`\n\t\t\t\t\t\t\t&tplAjaxGrpResult=`AjaxSearch_tplAjaxGrpResult`\n\t\t\t\t\t\t\t&tplAjaxResults=`AjaxSearch_tplAjaxResults`\n\t\t\t\t\t\t\t&tplAjaxResult=`AjaxSearch_tplAjaxResult`\n\t\t\t\t\t\t\t&showResults=`1`\n\t\t\t\t\t\t\t&liveSearch=`0`\n\t\t\t\t\t\t\t!]\n\t\t\t\t\t\t</div>\n\n\t\t\t\t\t\t<h2>News:</h2>\n\t\t\t\t\t\t[[DocLister? \n\t\t\t\t\t\t&parents=`2` \n\t\t\t\t\t\t&display=`2`\n\t\t\t\t\t\t&total=`20` \n\t\t\t\t\t\t&removeChunk=`Comments` \n\t\t\t\t\t\t&tpl=`nl_sidebar`\n\t\t\t\t\t\t]]\n\n\t\t\t\t\t\t<div>\n\t\t\t\t\t\t\t<h2>Most Recent:</h2>\n\n\t\t\t\t\t\t\t<ul>\n\t\t\t\t\t\t\t\t[[DocLister? \n\t\t\t\t\t\t\t\t&showInMenuOnly=`1` \n\t\t\t\t\t\t\t\t&parents=`0`\n\t\t\t\t\t\t\t\t&display=`5`\n\t\t\t\t\t\t\t\t&tpl=`@CODE:<li><a href="[+url+]" title="[+pagetitle+]">[+pagetitle+]</a> <span class="date">[+date+]</span></li>`\n\t\t\t\t\t\t\t\t]]\n\t\t\t\t\t\t\t</ul>\n\n\t\t\t\t\t\t</div>\n\t\t\t\t\t\t<br/>\n\t\t\t\t\t\t<h2>Login:</h2>\n\t\t\t\t\t\t<div>\n\t\t\t\t\t\t\t[!WebLogin? \n\t\t\t\t\t\t\t&tpl=`WebLogin_tplForm` \n\t\t\t\t\t\t\t&loginhomeid=`[(site_start)]`\n\t\t\t\t\t\t\t&focusInput=`0`\n\t\t\t\t\t\t\t!]\n\t\t\t\t\t\t</div>\n\n\t\t\t\t\t</aside>\n\t\t\t\t</div>\n\t\t\t</div>\n\n\t\t</section>\n\n\t\t<footer class="footer">\n\t\t\t<div class="container">\n\t\t\t\t<div class="row">\n\t\t\t\t\t<div class="col-sm-6">\n\t\t\t\t\t\t<a href="https://modx.com" title="Learn more about MODX">MODX</a> Starter-Template &copy;2006-[[$_SERVER[''REQUEST_TIME'']:dateFormat=`Y` ]]\n\t\t\t\t\t</div>\n\t\t\t\t\t<div class="col-sm-6 text-right">\n\t\t\t\t\t\tBuilt with <a href="http://www.getbootstrap.com" target="_blank">Bootstrap</a> framework.\n\t\t\t\t\t</div>\n\t\t\t\t</div>\n\t\t\t</div>\n\t\t</footer>\n\n\t\t<div class="container mem">\n\t\t\t<small>Memory: [^m^], MySQL: [^qt^], [^q^] request(s), PHP: [^p^], total: [^t^], document retrieved from [^s^]. </small>\n\t</div>\n\n\t<!-- Scripts\n\t–––––––––––––––––––––––––––––––––––––––––––––––––– -->\t\n\n\t<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>\n\t<!--[if lt IE 9]>\n\t\t<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>\n\t\t<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>\n\t<![endif]-->\n\t\n</body>\n</html>', 0, 1),
(5, 'Авторизация', ' login', 0, 0, '', 0, '{{header}}\r\n{{NAV}}\r\n<div>\r\n\t<div class="container_login">\r\n\t\t\t<div class="row">\r\n\t\t\t\t[!eForm? &formid=`autoriz` &tpl=`autoriz` &report=`test`!]\r\n\t\t\t</div>\r\n\t\t</div>\r\n\t</div>\r\n{{footer}}', 0, 1),
(6, 'registration', 'Форма регистрации', 0, 0, '', 0, '{{header}}\r\n{{NAV}}\r\n<div class="container_login">\r\n<div class="row">\r\n    <form class="col s12" action="/assets/snippets/exist_orAdd_user.php" method="POST">\r\n      <div class="row">\r\n        <div class="input-field col s6">\r\n\t\t  <i class="material-icons prefix light-blue-text">account_circle</i>\r\n          <input id="first_name" type="text" class="validate">\r\n          <label for="first_name">Имя</label>\r\n        </div>\r\n        <div class="input-field col s6">\r\n          <input id="last_name" type="text" class="validate">\r\n          <label for="last_name">Фамилия</label>\r\n        </div>\r\n      </div>\r\n      <div class="row">\r\n        <div class="input-field col s12">\r\n\t\t  <i class="material-icons prefix light-blue-text">email</i>\r\n          <input id="email" type="email" class="validate" onblur="validationEmail(this)">\r\n\t\t  <label for="email">Email <span id="emailex" style="color: red;">Пользователь с таким Email уже зарегестрирован!</span></label>\r\n        </div>\r\n      </div>\r\n      <div class="row">\r\n        <div class="input-field col s12">\r\n\t\t  <i class="material-icons prefix light-blue-text">lock</i>\r\n          <input id="password1" type="password" class="validate" oninput="validationPassword(this)">\r\n\t\t  <label for="password1">Пароль <span id="pwdMeter" class="neutral"></span></label>\r\n        </div>\r\n      </div>\r\n\t\t<div class="row">\r\n        <div class="input-field col s12">\r\n\t\t  <i class="material-icons prefix light-blue-text">lock</i>\r\n          <input id="password2" type="password" class="validate" oninput="validationPassword(this)">\r\n          <label for="password2">Повторите пароль <span id="pwdCompare"></span></label>\r\n        </div>\r\n      </div>\r\n\t\t<div id="buttonReg" class="right-align">\r\n\t\t\t<input class="waves-effect waves-light btn light-green" type="submit" value="Регистрация">\r\n\t\t</div>\r\n    </form>\r\n  </div>\r\n</div>\r\n{{footer}}\r\n<script src="/assets/js/jquery.pwdMeter.js"></script>\r\n{{reg_validation}}', 0, 1);

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
(1, 1, 'Igor Didenko', 1, 'igorded1991@yandex.ru', '+380969063656', '+380969063656', 0, 0, 0, 14, 1493377917, 1493464321, 0, '4ffhtombonta7f5p8krffjusr2', 0, 0, '81', 'Meleshkina bla bla bla', 'Berlin', 'Sachsen', '500505', '', '', ''),
(2, 2, 'ipra', 1, 'iprahtc@gmail.com', '', '', 0, 0, 0, 2, 1492774055, 1493375767, 0, 'd23u223me5hfcni52ke5n00sf2', 0, 0, '', '', '', '', '', '', '', '');

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
(1, 1, 'ipra ipra', 0, 'iprahtc2@gmail.com', '', '', 0, 0, 0, 1, 0, 1492444194, 0, 'tb41qb0rih3ucs5p6qo1rv8773', 0, 0, '', '', '', '', '', '', 'https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg?sz=50', ''),
(2, 2, 'Igor Didenko', 0, 'igorded1991@yandex.ru', '+380969063656', '+380969063656', 0, 0, 0, 0, 0, 0, 0, '', 680734800, 1, '81', 'Meleshkina bla bla bla', 'Berlin', 'Sachsen', '500505', '', '', ''),
(3, 3, 'Илья Капков', 0, 'iprahtc@gmail.com', '', '', 0, 0, 0, 1, 0, 1493377251, 0, 'd23u223me5hfcni52ke5n00sf2', 0, 1, '', '', '', '', '', '', 'https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg?sz=50', ''),
(4, 4, 'Test', 0, 'test@mail.ru', '', '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, '', '', '', '', '', '', '', NULL);

-- 
-- Вывод данных для таблицы modx_web_user_settings
--

-- Таблица ibase_woch.modx_web_user_settings не содержит данных

-- 
-- Вывод данных для таблицы modx_web_users
--
INSERT INTO modx_web_users VALUES
(1, '109141084637326271700@plus.google.com', '0f9d94709990', ''),
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