--
-- Скрипт сгенерирован Devart dbForge Studio for MySQL, Версия 7.2.58.0
-- Домашняя страница продукта: http://www.devart.com/ru/dbforge/mysql/studio
-- Дата скрипта: 16.04.2017 16:13:41
-- Версия сервера: 5.6.34
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
USE wotch;

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
AUTO_INCREMENT = 158
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
AUTO_INCREMENT = 10
AVG_ROW_LENGTH = 21
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Categories to be used snippets,tv,chunks, etc';

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
AUTO_INCREMENT = 1
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
AUTO_INCREMENT = 6
AVG_ROW_LENGTH = 448
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
AUTO_INCREMENT = 464
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
AUTO_INCREMENT = 2
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
AUTO_INCREMENT = 5
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
AUTO_INCREMENT = 8
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
AUTO_INCREMENT = 12
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
AUTO_INCREMENT = 6
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
AUTO_INCREMENT = 2
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
AUTO_INCREMENT = 1
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
AUTO_INCREMENT = 1
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
AUTO_INCREMENT = 1
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
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Contains data used for web access permissions.';

-- 
-- Вывод данных для таблицы modx_active_user_locks
--

-- Таблица wotch.modx_active_user_locks не содержит данных

-- 
-- Вывод данных для таблицы modx_active_user_sessions
--
INSERT INTO modx_active_user_sessions VALUES
('2h7pl151prljm4uhbmua8rol02', 1, 1492348113, '127.0.0.1');

-- 
-- Вывод данных для таблицы modx_active_users
--
INSERT INTO modx_active_users VALUES
('6l50frie37e5utnm86gs95ft26', 1, 'admin', 1492343774, '78', 7),
('tdbgbb9up2gf21e99a9lf5d2p5', 1, 'admin', 1492344058, '76', NULL),
('dulv0bnntsl9r1mt8p6u41nkn7', 1, 'admin', 1492344095, '76', NULL),
('clf88174742uo5lkqm4ipsgah0', 1, 'admin', 1492344302, '67', 1),
('2h7pl151prljm4uhbmua8rol02', 1, 'admin', 1492346835, '67', 7);

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
(9, 'Content');

-- 
-- Вывод данных для таблицы modx_document_groups
--

-- Таблица wotch.modx_document_groups не содержит данных

-- 
-- Вывод данных для таблицы modx_documentgroup_names
--

-- Таблица wotch.modx_documentgroup_names не содержит данных

-- 
-- Вывод данных для таблицы modx_event_log
--
INSERT INTO modx_event_log VALUES
(1, 0, 1492324115, 3, 1, 0, 'Файл конфигурации все еще доступен для записи', 'Злоумышленники потенциально могут нанести вред вашему сайту. <strong>Серьёзно.</strong> Пожалуйста, установите права доступа к файлу конфигурации (/manager/includes/config.inc.php) в режим ''Только для чтения'''),
(2, 0, 1492344026, 3, 1, 0, 'Файл конфигурации все еще доступен для записи', 'Злоумышленники потенциально могут нанести вред вашему сайту. <strong>Серьёзно.</strong> Пожалуйста, установите права доступа к файлу конфигурации (/manager/includes/config.inc.php) в режим ''Только для чтения'''),
(3, 0, 1492344083, 3, 1, 0, 'Файл конфигурации все еще доступен для записи', 'Злоумышленники потенциально могут нанести вред вашему сайту. <strong>Серьёзно.</strong> Пожалуйста, установите права доступа к файлу конфигурации (/manager/includes/config.inc.php) в режим ''Только для чтения'''),
(4, 0, 1492344157, 3, 1, 0, 'Файл конфигурации все еще доступен для записи', 'Злоумышленники потенциально могут нанести вред вашему сайту. <strong>Серьёзно.</strong> Пожалуйста, установите права доступа к файлу конфигурации (/manager/includes/config.inc.php) в режим ''Только для чтения'''),
(5, 0, 1492344325, 3, 1, 0, 'Файл конфигурации все еще доступен для записи', 'Злоумышленники потенциально могут нанести вред вашему сайту. <strong>Серьёзно.</strong> Пожалуйста, установите права доступа к файлу конфигурации (/manager/includes/config.inc.php) в режим ''Только для чтения''');

-- 
-- Вывод данных для таблицы modx_keyword_xref
--

-- Таблица wotch.modx_keyword_xref не содержит данных

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
(463, 1492346835, 1, 'admin', 76, '-', '-', 'Element management');

-- 
-- Вывод данных для таблицы modx_manager_users
--
INSERT INTO modx_manager_users VALUES
(1, 'admin', '$P$ByDOIeYHccHhXgSGXyjcQHkO.LwqNN.');

-- 
-- Вывод данных для таблицы modx_member_groups
--

-- Таблица wotch.modx_member_groups не содержит данных

-- 
-- Вывод данных для таблицы modx_membergroup_access
--

-- Таблица wotch.modx_membergroup_access не содержит данных

-- 
-- Вывод данных для таблицы modx_membergroup_names
--

-- Таблица wotch.modx_membergroup_names не содержит данных

-- 
-- Вывод данных для таблицы modx_site_content
--
INSERT INTO modx_site_content VALUES
(1, 'document', 'text/html', 'Home', '', '', 'index', '', 1, 0, 0, 0, 1, '', '<p>Главной особенностью сайта является возможность следить за товаром пока вы заняты. Мы предоставляем вам возможность установить надзирателя за товаром (или группой товаров). Особенностью является <span id="orfo-misgrammed-1" class="orfo-misgrammed">то</span> что вам не нужно заходить на страницу товара и смотреть не упала на него ли цена, а просто ждать оповещения от нас на вашу почту. Но это еще не всё<span id="orfo-misgrammed-2" class="orfo-misgrammed">!. </span>Вы так же можете написать название товара и желаемую сумму, а мы вас <span id="orfo-misgrammed-3" class="orfo-misgrammed">предупредим</span> когда такой товар появиться.</p>', 1, 3, 0, 1, 1, 1, 1130304721, 1, 1492325760, 0, 0, 0, 1130304721, 1, '', 0, 0, 0, 0, 0, 0, 0, 1),
(4, 'document', 'text/html', 'Вход', '', '', 'login', 'login', 1, 0, 0, 0, 0, '', '', 1, 5, 1, 1, 1, 1, 1492328160, 1, 1492328177, 0, 0, 0, 1492328160, 1, '', 0, 0, 0, 0, 0, 0, 0, 1);

-- 
-- Вывод данных для таблицы modx_site_content_metatags
--

-- Таблица wotch.modx_site_content_metatags не содержит данных

-- 
-- Вывод данных для таблицы modx_site_htmlsnippets
--
INSERT INTO modx_site_htmlsnippets VALUES
(1, 'eFeedbackForm', 'eFeedbackForm Шаблон формы обратной связи', 0, 'none', 3, 0, '<p><span style="color:#900;">[+validationmessage+]</span></p>\r\n\r\n<form  class="eform" method="post" action="[~[*id*]~]">\r\n\r\n<input type="hidden" name="formid" value="feedbackForm" />\r\n<input value="" name="special" class="special" type="text" eform="Спец:date:0"  style="display:none;" />\r\n<p>\r\n    <input type="text" name="name" id="name" class="grid_3" value=""  eform="Имя:string:1"/>\r\n    <label for="name">Ваше имя</label>\r\n</p>\r\n            \r\n<p>\r\n    <input type="text" name="email" id="email" class="grid_3" value="" eform="E-mail:email:1" />\r\n    <label for="email">Ваш E-mail</label>\r\n</p>\r\n            \r\n<p>\r\n    <input type="text" name="phone" id="subject" class="grid_3" value="" eform="Номер телефона:string:1"/>\r\n    <label for="subject">Номер телефона</label>\r\n</p>\r\n            \r\n<p>\r\n    <textarea name="comments" id="message" class="grid_6" cols="50" rows="10" eform="Текст сообщения:string:1"></textarea>\r\n</p>\r\n<p>Введите код с картинки: <br />\r\n    <input type="text" class="ver" name="vericode" /><img class="feed" src="[+verimageurl+]" alt="Введите код" />\r\n</p>            \r\n<p>\r\n    <input type="submit" name="submit" class="subeform grid_2" value="Отправить сообщение"/>\r\n </p>\r\n\r\n</form>\r\n\r\n\r\n \r\n\r\n', 0),
(2, 'eFeedbackReport', 'eFeedbackReport  шаблон отправки на почту', 0, 'none', 3, 0, '<p>Прислано человеком, с именем: [+name+] . Подробности ниже:</p>\r\n<table>\r\n<tr valign="top"><td>Имя:</td><td>[+name+]</td></tr>\r\n<tr valign="top"><td>E-mail:</td><td>[+email+]</td></tr>\r\n<tr valign="top"><td>Номер телефона:</td><td>[+phone+]</td></tr>\r\n<tr valign="top"><td>Текст сообщения:</td><td>[+comments+]</td></tr>\r\n</table>\r\n<p>Можно использовать ссылку для ответа: <a href="mailto:[+email+]?subject=RE:[+subject+]">[+email+]</a></p>\r\n\r\n', 0),
(3, 'feedback', 'форма обратной связи', 0, 'none', 3, 0, '[!eForm? &formid=`feedbackForm` &subject=`Сообщение с сайта` &tpl=`eFeedbackForm` &report=`eFeedbackReport` &gotoid=`[*id*]` &vericode=`1` !] \r\n\r\n', 0),
(4, 'footer', 'низ сайта', 2, 'none', 4, 0, '<footer class="page-footer orange">\r\n    <div class="container">\r\n      <div class="row">\r\n        <div class="col l6 s12">\r\n          <h5 class="white-text">Поддержка сайта</h5>\r\n          <p class="grey-text text-lighten-4">2017</p>\r\n        </div>\r\n        <div class="col l3 s12">\r\n          <h5 class="white-text">Капков Илья</h5>\r\n          <ul>\r\n            <li><p class="grey-text text-lighten-4">Главный программист по обработке содержимого поддерживаемых сервисов</p></li>\r\n          </ul>\r\n        </div>\r\n        <div class="col l3 s12">\r\n          <h5 class="white-text">Диденко Игорь</h5>\r\n          <ul>\r\n            <li><p class="grey-text text-lighten-4">Гланый программист по герерации запросов к поддерживаемым сервисам</p></li>\r\n          </ul>\r\n        </div>\r\n      </div>\r\n    </div>\r\n    <div class="footer-copyright">\r\n      <div class="container">\r\n      Курсовая работа 2017\r\n      </div>\r\n    </div>\r\n  </footer>\r\n\r\n\r\n  <!--  Scripts-->\r\n  <script src="/assets/js/jquery/jquery.min.js"></script>\r\n  <script src="/assets/js/wotch/materialize.js"></script>\r\n  <script src="/assets/js/wotch/init.js"></script>\r\n  <script src="/assets/js/wotch/login.js"></script>\r\n\r\n  </body>\r\n</html>', 0),
(5, 'header', 'шапка', 2, 'none', 4, 0, '<!DOCTYPE html>\r\n\t<html lang="ru">\r\n\t<head>\r\n\t<meta http-equiv="Content-Type" content="text/html; charset=[(modx_charset)]" /> \r\n\t<title>Главная</title>\r\n\t[*noIndex*]\r\n\t<meta name="keywords" content="[*keyw*]" />\r\n\t<meta name="description" content="[*desc*]" />\r\n\t<base href="[(site_url)]"/>\r\n\t<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">\r\n\t<link href="/assets/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>\r\n  \t<link href="/assets/css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>\r\n</head>\r\n<body>', 0),
(6, 'mm_rules', 'Default ManagerManager rules.', 0, 'none', 5, 0, '// more example rules are in assets/plugins/managermanager/example_mm_rules.inc.php\r\n// example of how PHP is allowed - check that a TV named documentTags exists before creating rule\r\n\r\nmm_widget_showimagetvs(); // Показываем превью ТВ\r\n\r\nmm_createTab(''Для SEO'', ''seo'', '''', '''', '''', '''');\r\nmm_moveFieldsToTab(''titl,keyw,desc,seoOverride,noIndex,sitemap_changefreq,sitemap_priority,sitemap_exclude'', ''seo'', '''', '''');\r\nmm_widget_tags(''keyw'','',''); // Give blog tag editing capabilities to the ''documentTags (3)'' TV\r\n\r\n\r\n//mm_createTab(''Изображения'', ''photos'', '''', '''', '''', ''850'');\r\n//mm_moveFieldsToTab(''images,photos'', ''photos'', '''', '''');\r\n\r\n//mm_hideFields(''longtitle,description,link_attributes,menutitle,content'', '''', ''6,7'');\r\n\r\n//mm_hideTemplates(''0,5,8,9,11,12'', ''2,3'');\r\n\r\n//mm_hideTabs(''settings, access'', ''2'');\r\n\r\n//mm_widget_evogallery(1, Галерея, ''1,2,3'', 3);   // подключаем галерею \r\n//mm_galleryLink($fields, $roles, $templates, $moduleid);\r\n//mm_widget_evogallery($moduleid, $title, $roles, $templates);\r\n', 0),
(7, 'NAV', 'навбар', 2, 'none', 0, 0, '<nav class="light-blue lighten-1" role="navigation">\r\n    <div class="nav-wrapper container"><a id="logo-container" href="#" class="brand-logo"><img src="/assets/images/logo2.png"></a>\r\n      <ul class="right hide-on-med-and-down">\r\n        <li><a href="[(site_url)]">Главная</a></li>\r\n        <li><a href="#">Надзератель</a></li>\r\n        <li><a href="#">Принцип работы</a></li>\r\n        <li><a href="#">О нас</a></li>\r\n        <li><a class="waves-effect waves-light btn light-green" href="#modal">Вход</a></li>\r\n      </ul>\r\n\r\n      <ul id="nav-mobile" class="side-nav">\r\n\t\t<li><a href="[(site_url)]">Главная</a></li>\r\n        <li><a href="#">Надзератель</a></li>\r\n        <li><a href="#">Принцип работы</a></li>\r\n        <li><a href="#">О нас</a></li>\r\n        <li><a class="waves-effect waves-light btn" href="#modal">Вход</a></li>\r\n      </ul>\r\n      <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>\r\n    </div>\r\n</nav>\r\n\r\n  <!-- Modal Structure -->\r\n  <div id="modal" class="modal container_login">\r\n    <div class="modal-content">\r\n\t\t<div class="row">\r\n\t\t\t<h5 class="center-align">Авторизация</h5>\r\n\t\t\t\t<form class="col s12">\r\n\t\t\t\t  <div class="row">\r\n\t\t\t\t\t<div class="input-field col s12">\r\n\t\t\t\t\t  <i class="material-icons prefix">account_circle</i>\r\n\t\t\t\t\t  <input id="icon_prefix" type="text" class="validate">\r\n\t\t\t\t\t  <label for="icon_prefix">Логин</label>\r\n\t\t\t\t\t</div>\r\n\t\t\t\t\t<div class="input-field col s12">\r\n\t\t\t\t\t  <i class="material-icons prefix">lock</i>\r\n\t\t\t\t\t  <input id="icon_telephone" type="password" class="validate">\r\n\t\t\t\t\t  <label for="icon_telephone">Пароль</label>\r\n\t\t\t\t\t</div>\r\n\t\t\t\t  </div>\r\n\t\t\t\t</form>\r\n\t\t\t </div>\r\n    </div>\r\n    <div class="modal-footer">\r\n      <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Войти</a>\r\n    </div>\r\n  </div>', 0);

-- 
-- Вывод данных для таблицы modx_site_keywords
--

-- Таблица wotch.modx_site_keywords не содержит данных

-- 
-- Вывод данных для таблицы modx_site_metatags
--

-- Таблица wotch.modx_site_metatags не содержит данных

-- 
-- Вывод данных для таблицы modx_site_module_access
--

-- Таблица wotch.modx_site_module_access не содержит данных

-- 
-- Вывод данных для таблицы modx_site_module_depobj
--

-- Таблица wotch.modx_site_module_depobj не содержит данных

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
(11, 'Wayfinder', '<strong>2.0.5</strong> Completely template-driven and highly flexible menu builder', 0, 8, 0, 'return require MODX_BASE_PATH.''assets/snippets/wayfinder/snippet.wayfinder.php'';\n', 0, '', '');

-- 
-- Вывод данных для таблицы modx_site_templates
--
INSERT INTO modx_site_templates VALUES
(3, 'Home', '', 0, 0, '', 0, '{{header}}\r\n{{NAV}}\r\n<div id="index-banner" class="parallax-container">\r\n    <div class="section no-pad-bot">\r\n      <div class="center">\r\n        <div class="row center">\r\n          <a href="#" id="download-button" class="btn-large waves-effect waves-light teal lighten-1 buttonf">БЫТЬ ПЕРВЫМ</a>\r\n        </div>\r\n        <br><br>\r\n\r\n      </div>\r\n    </div>\r\n    <div class="parallax"><img src="[(site_url)]assets/images/1.png" alt="Unsplashed background img 1"></div>\r\n  </div>\r\n  \r\n  <div class="section no-pad-bot" id="index-banner">\r\n    <div class="container">\r\n      <br><br>\r\n      <h1 class="header center orange-text">Как это работает?</h1>\r\n      <div class="row center">\r\n        <h5 class="header col s12 light">[*content*]</h5>\r\n      </div>\r\n      <br><br>\r\n\r\n    </div>\r\n  </div>\r\n\r\n\r\n  <div class="container">\r\n    <div class="section">\r\n\r\n      <!--   Icon Section   -->\r\n      \r\n<div class="row">\r\n        \r\n\t\r\n        <div class="col s12 m4">\r\n          <div class="icon-block">\r\n            <h2 class="center light-blue-text"><i class="material-icons">supervisor_account</i></h2>\r\n            <h5 class="center">Пользователи</h5>\r\n\r\n            <p class="light"><b>Нас уже (...)</b></p>\r\n            <p class="light"><b>Количество надзерателей (...)</b></p>\r\n          </div>\r\n        </div>\r\n\r\n        <div class="col s12 m4">\r\n          <div class="icon-block">\r\n            <h2 class="center light-blue-text"><i class="material-icons">settings</i></h2>\r\n            <h5 class="center">Планы на будущее</h5>\r\n\r\n            <p class="light"><b>Сделать сайт!</b></p>\r\n          </div>\r\n        </div>\r\n\r\n\t\t<div class="col s12 m4">\r\n\t\t\t  <div class="icon-block">\r\n\t\t\t\t<h2 class="center light-blue-text"><i class="material-icons">visibility</i></h2>\r\n\t\t\t\t<h5 class="center">Поддерживаемые сайты</h5>\r\n\t\t\t\t  <div class="chip">\r\n\t\t\t\t\t<img src="assets/images/olx.png" alt="Contact Person">\r\n\t\t\t\t\tOLX - на стадии разработки\r\n  \t\t\t\t</div>\r\n\t\t\t  </div>\r\n\t\t\t</div>\r\n\t\t  </div>\r\n\r\n    </div>\r\n    <br><br>\r\n\r\n    <div class="section">\r\n\r\n    </div>\r\n  </div>\r\n{{footer}}', 0, 1),
(4, 'MODX startup - Bootstrap', '<strong>1.0</strong> Sample template in Bootstrap', 0, 1, '', 0, '<!DOCTYPE html>\n<html lang="[(lang_code)]">\n<head>\t\n\t<base href="[(site_url)]" />\n\t<meta charset="[(modx_charset)]" />\n\t<meta name="viewport" content="width=device-width, initial-scale=1">\n\t<meta http-equiv="X-UA-Compatible" content="IE=edge">\n\t<title>[*pagetitle*] / [(site_name)]</title>\n\t<@IF:[*description:isntEmpty*]><meta name="description" content="[*description*]"><@ENDIF>\n\t\n\t<link href="[(site_url)]<@IF:[*id:isnt(1)*]>[~[*id*]~]<@ENDIF>" rel="canonical">\n\t<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet" type="text/css">\t\n\t<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">\n\t<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">\n\t\n\t<style> \n\thtml, body{background:#eee; font-family:''Open Sans'',sans-serif; line-height:1.8; font-size:14px;}\n\ta:focus{outline:none; outline-offset:0;}\n\th1{margin-top:15px;}\n\n\t.logo{float:left;}\n\t.logo img{max-width:200px; margin:10px 0; display:block; height:50px; width:auto;}\n\t.dropdown-menu{border-radius:0; border:0;}\n\t.dropdown-menu > li > a{padding-top:5px; padding-bottom:5px;}\n\n\t.navbar-collapse.collapse.in{border-bottom:10px solid #eee;}\n\t.navbar{min-height:0; background:#fff; margin-bottom:0;}\n\t.navbar.nav{margin-left:0;}\n\t.navbar.nav ul{padding-left:0;}\n\t.navbar-nav{margin:0;}\n\t.navbar-toggle{background:#fff; border:2px solid #eee; border-radius:0; position:fixed; z-index:99; right:0; top:7px; padding:12px 10px; margin-right:10px;}\n\t.navbar .navbar-toggle .icon-bar{background-color:#333;}\n\n\t.nav li a{text-transform:uppercase; color:#333; font-weight:500; font-size:110%;}\n\t.nav li li a{text-transform:none; font-weight:normal; font-size:100%;}\n\n\t.navbar{border:none; border-radius:0;}\n\t#navbar{padding:0;}\n\tul.nav > li > a:hover{background-color:#f5f5f5;}\n\n\t.affix{top:0px; width:100%; z-index:1000; background-color:#eee;}\n\t.affix + .affspacer{display:block; height:50px;}\n\n\t.box-shadow{-webkit-box-shadow:0 6px 12px rgba(0,0,0,.175); box-shadow:0 6px 12px rgba(0,0,0,.175);}\n\n\t.container {max-width:970px; margin:0 12px;}\n\t.top .col-sm-12{padding-left:0; padding-right:0;}\n\n\t#ajaxSearch_input,\n\t#username,\n\t#password{width:100%!important;}\n\t#forgotpsswd{clear:both;}\n\tinput.button[type="submit"]{display:block;}\n\tlabel.checkbox{display:inline-block; margin-left:10px;}\n\tlabel, legend{font-weight:400;}\n\t#ajaxSearch_form { position:relative; }\n\t#searchClose { display:none !important; }\n    #indicator { position:absolute; top:9px; right:12px; z-index:10; opacity:.75; }\n\n\th2{font-size:22px;}\n\t.bread{padding:1em 0 0 0;}\n\t.mem{color:#aaa; text-align:center; padding:1em 0 2em;}\n\n\tsection.main .container{background-color:#fff; padding-bottom:20px;}\n\tfooter.footer .container{background-color:#000; color:#fff; line-height:40px;}\n\n\tsection.main ul{list-style:none; margin:0 0 1em 0; padding:0;}\n\tsection.main ul li{padding-left:1em;}\n\tsection.main ul li:before{content:''\\2022''; position:absolute; line-height:1.85em; margin-left:-1em;}\n\n\t.footer{text-align:center;}\n\t.footer .text-right{text-align:center;}\n\n\t/* JOT */\n\t.jot-comment{padding:5px 10px;}\n\t.jot-row-author{background-color:#dddddd;}\n\t.jot-row-alt{background-color:#f9f9f9;}\n\t.jot-row{background-color:#eeeeee;}\n\t.jot-row-up{border:1px solid #333!important;}\n\t.jot-row-up.panel-primary > .panel-heading{background-color:#333!important; border-color:#333!important;}\n\t.jot-extra{font-size:75%;}\n\t.jot-poster{font-size:inherit!important;}\n\n\t.ditto_summaryPost img{max-width:100%; height:auto; margin:10px 0 5px; display:block;}\n\t.ditto_summaryPost{padding-top:10px; padding-bottom:15px; border-bottom:1px solid #eee;}\n\n\t/* Larger than mobile */\n\t@media (min-width:320px) {\n\n\t}\n\n\t/* Larger than phablet */\n\t@media (min-width:480px) {\n\n\t}\n\n\t/* Larger than tablet */\n\t@media (min-width:768px) {\n\n\t\t.container{margin:0 auto;}\n\t\t.logo{padding-left:15px;}\n\t\t.logo img{ max-width:240px; margin:0; display:block; height:100px;}\n\n\t\t.navbar{background:transparent;}\n\t\t.navbar.affix{background:#eee;}\n\t\t.navbar-collapse.collapse.in{border-bottom:0;}\n\n\t\t.footer{text-align:left;}\n\t\t.footer .text-right{text-align:right;}\n\n\t\t.col-lg-1, .col-lg-10, .col-lg-11, .col-lg-12, .col-lg-2, .col-lg-3, .col-lg-4, .col-lg-5, .col-lg-6, .col-lg-7, .col-lg-8, .col-lg-9, .col-md-1, .col-md-10, .col-md-11, .col-md-12, .col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9, .col-sm-1, .col-sm-10, .col-sm-11, .col-sm-12, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9, .col-xs-1, .col-xs-10, .col-xs-11, .col-xs-12, .col-xs-2, .col-xs-3, .col-xs-4, .col-xs-5, .col-xs-6, .col-xs-7, .col-xs-8, .col-xs-9 {padding-left:35px; padding-right:35px;}\n\n\t}\n\t</style>\n\t\n\t<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>\n</head>\n<body>\n\t<section class="top">\n\t\t<div class="container">\n\t\t\t<div class="row">\n\t\t\t\t<div class="col-sm-12" itemscope itemtype="http://schema.org/Organization">\n\n\t\t\t\t\t<a class="logo" href="[~[(site_start)]~]" title="[(site_name)]" itemprop="url">\n\t\t\t\t\t\t<img src="[(site_url)]assets/images/modx-logo.png" itemprop="logo" width="240" height="100" alt="[(site_name)]" />\n\t\t\t\t\t</a>\n\n\t\t\t\t\t<div class="clearfix"></div>\n\n\t\t\t\t\t<nav class="navbar" role="navigation" data-spy="affix" data-offset-top="100">\n\n\t\t\t\t\t\t<div class="navbar-header">\n\t\t\t\t\t\t\t<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">\n\t\t\t\t\t\t\t\t<span class="sr-only">Toggle navigation</span>\n\t\t\t\t\t\t\t\t<span class="icon-bar"></span>\n\t\t\t\t\t\t\t\t<span class="icon-bar"></span>\n\t\t\t\t\t\t\t\t<span class="icon-bar"></span>\n\t\t\t\t\t\t\t</button>\n\t\t\t\t\t\t</div>\n\t\t\t\t\t\t<div id="navbar" class="navbar-collapse collapse">\n\t\t\t\t\t\t\t[[Wayfinder? \n\t\t\t\t\t\t\t&startId=`0` \n\t\t\t\t\t\t\t&level=`2` \n\t\t\t\t\t\t\t&removeNewLines=`1`\n\t\t\t\t\t\t\t&outerTpl=`@CODE:<ul class="nav navbar-nav">[+wf.wrapper+]</ul>`\n\t\t\t\t\t\t\t&rowTpl=`@CODE:<li[+wf.classes+]><a href="[+wf.link+]" [+wf.attributes+]>[+wf.linktext+]</a>[+wf.wrapper+]</li>`\n\t\t\t\t\t\t\t&innerTpl=`@CODE:<ul class="dropdown-menu">[+wf.wrapper+]</ul>`\n\t\t\t\t\t\t\t&innerRowTpl=`@CODE:<li[+wf.classes+]><a href="[+wf.link+]">[+wf.linktext+]</a></li>`\n\t\t\t\t\t\t\t&parentRowTpl=`@CODE:<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" title="[+wf.title+]">[+wf.linktext+] <b class="caret"></b></a>[+wf.wrapper+]</li>`\n\t\t\t\t\t\t\t&activeParentRowTpl=`@CODE:<li class="dropdown active"><a class="dropdown-toggle" data-toggle="dropdown" href="#" title="[+wf.title+]">[+wf.linktext+] <b class="caret"></b></a>[+wf.wrapper+]</li>`\n\t\t\t\t\t\t\t]]\n\t\t\t\t\t\t</div>\n\n\t\t\t\t\t</nav>\n\t\t\t\t\t<div class="affspacer"></div>\n\n\t\t\t\t</div>\n\t\t\t</div>\n\t\t</div>\n\t\t</section>\n\n\t\t<section class="main">\n\t\t\t<div class="container">\n\n\t\t\t\t<div class="row">\n\t\t\t\t\t<div class="col-sm-12">\n\t\t\t\t\t\t<div class="bread">\n\t\t\t\t\t\t\t[[Breadcrumbs]]\n\t\t\t\t\t\t</div>\n\t\t\t\t\t</div>\n\t\t\t\t</div>\n\n\t\t\t\t<div class="row">\n\n\t\t\t\t\t<div class="col-sm-8">\n\t\t\t\t\t\t<h1>[*#longtitle*]</h1>\n\t\t\t\t\t\t[*#content*]\n\t\t\t\t\t</div>\n\n\t\t\t\t\t<aside class="col-sm-4">\n\t\t\t\t\t\t<div class="search">\n\t\t\t\t\t\t\t<h2>Search</h2>\n\t\t\t\t\t\t\t[!AjaxSearch? \n\t\t\t\t\t\t\t&ajaxSearch=`1` \n\t\t\t\t\t\t\t&addJscript=`0` \n\t\t\t\t\t\t\t&showIntro=`0` \n\t\t\t\t\t\t\t&ajaxMax=`5` \n\t\t\t\t\t\t\t&extract=`1`\n\t\t\t\t\t\t\t&jscript=`jquery`\n\t\t\t\t\t\t\t&tplInput=`AjaxSearch_tplInput`\n\t\t\t\t\t\t\t&tplAjaxGrpResult=`AjaxSearch_tplAjaxGrpResult`\n\t\t\t\t\t\t\t&tplAjaxResults=`AjaxSearch_tplAjaxResults`\n\t\t\t\t\t\t\t&tplAjaxResult=`AjaxSearch_tplAjaxResult`\n\t\t\t\t\t\t\t&showResults=`1`\n\t\t\t\t\t\t\t&liveSearch=`0`\n\t\t\t\t\t\t\t!]\n\t\t\t\t\t\t</div>\n\n\t\t\t\t\t\t<h2>News:</h2>\n\t\t\t\t\t\t[[DocLister? \n\t\t\t\t\t\t&parents=`2` \n\t\t\t\t\t\t&display=`2`\n\t\t\t\t\t\t&total=`20` \n\t\t\t\t\t\t&removeChunk=`Comments` \n\t\t\t\t\t\t&tpl=`nl_sidebar`\n\t\t\t\t\t\t]]\n\n\t\t\t\t\t\t<div>\n\t\t\t\t\t\t\t<h2>Most Recent:</h2>\n\n\t\t\t\t\t\t\t<ul>\n\t\t\t\t\t\t\t\t[[DocLister? \n\t\t\t\t\t\t\t\t&showInMenuOnly=`1` \n\t\t\t\t\t\t\t\t&parents=`0`\n\t\t\t\t\t\t\t\t&display=`5`\n\t\t\t\t\t\t\t\t&tpl=`@CODE:<li><a href="[+url+]" title="[+pagetitle+]">[+pagetitle+]</a> <span class="date">[+date+]</span></li>`\n\t\t\t\t\t\t\t\t]]\n\t\t\t\t\t\t\t</ul>\n\n\t\t\t\t\t\t</div>\n\t\t\t\t\t\t<br/>\n\t\t\t\t\t\t<h2>Login:</h2>\n\t\t\t\t\t\t<div>\n\t\t\t\t\t\t\t[!WebLogin? \n\t\t\t\t\t\t\t&tpl=`WebLogin_tplForm` \n\t\t\t\t\t\t\t&loginhomeid=`[(site_start)]`\n\t\t\t\t\t\t\t&focusInput=`0`\n\t\t\t\t\t\t\t!]\n\t\t\t\t\t\t</div>\n\n\t\t\t\t\t</aside>\n\t\t\t\t</div>\n\t\t\t</div>\n\n\t\t</section>\n\n\t\t<footer class="footer">\n\t\t\t<div class="container">\n\t\t\t\t<div class="row">\n\t\t\t\t\t<div class="col-sm-6">\n\t\t\t\t\t\t<a href="https://modx.com" title="Learn more about MODX">MODX</a> Starter-Template &copy;2006-[[$_SERVER[''REQUEST_TIME'']:dateFormat=`Y` ]]\n\t\t\t\t\t</div>\n\t\t\t\t\t<div class="col-sm-6 text-right">\n\t\t\t\t\t\tBuilt with <a href="http://www.getbootstrap.com" target="_blank">Bootstrap</a> framework.\n\t\t\t\t\t</div>\n\t\t\t\t</div>\n\t\t\t</div>\n\t\t</footer>\n\n\t\t<div class="container mem">\n\t\t\t<small>Memory: [^m^], MySQL: [^qt^], [^q^] request(s), PHP: [^p^], total: [^t^], document retrieved from [^s^]. </small>\n\t</div>\n\n\t<!-- Scripts\n\t–––––––––––––––––––––––––––––––––––––––––––––––––– -->\t\n\n\t<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>\n\t<!--[if lt IE 9]>\n\t\t<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>\n\t\t<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>\n\t<![endif]-->\n\t\n</body>\n</html>', 0, 1),
(5, 'Авторизация', ' login', 0, 0, '', 0, '{{header}}\r\n{{NAV}}\r\n\t<div class="container_login">\r\n\t\t<div class="section">\r\n\t\t\t<div class="row">\r\n\t\t\t\t<form class="col s6">\r\n\t\t\t\t  <div class="row">\r\n\t\t\t\t\t<div class="input-field col s6">\r\n\t\t\t\t\t  <i class="material-icons prefix">account_circle</i>\r\n\t\t\t\t\t  <input id="icon_prefix" type="text" class="validate">\r\n\t\t\t\t\t  <label for="icon_prefix">First Name</label>\r\n\t\t\t\t\t</div>\r\n\t\t\t\t\t<div class="input-field col s6">\r\n\t\t\t\t\t  <i class="material-icons prefix">phone</i>\r\n\t\t\t\t\t  <input id="icon_telephone" type="tel" class="validate">\r\n\t\t\t\t\t  <label for="icon_telephone">Telephone</label>\r\n\t\t\t\t\t</div>\r\n\t\t\t\t  </div>\r\n\t\t\t\t</form>\r\n\t\t\t </div>\r\n\t\t</div>\r\n\t</div>', 0, 1);

-- 
-- Вывод данных для таблицы modx_site_tmplvar_access
--

-- Таблица wotch.modx_site_tmplvar_access не содержит данных

-- 
-- Вывод данных для таблицы modx_site_tmplvar_contentvalues
--

-- Таблица wotch.modx_site_tmplvar_contentvalues не содержит данных

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
('sys_files_checksum', 'a:4:{s:39:"C:/OpenServer/domains/modx.ua/index.php";s:32:"c16a5692a22a2b08c6def0c52c9f5616";s:39:"C:/OpenServer/domains/modx.ua/.htaccess";s:32:"ccdc15e95196739065744d1ac1621502";s:47:"C:/OpenServer/domains/modx.ua/manager/index.php";s:32:"236f68dad4d8ac0166aa78290b107f1f";s:61:"C:/OpenServer/domains/modx.ua/manager/includes/config.inc.php";s:32:"f1c604be50a50cf7d72bdc1084945dff";}');

-- 
-- Вывод данных для таблицы modx_user_attributes
--
INSERT INTO modx_user_attributes VALUES
(1, 1, 'Admin', 1, 'ipra-8@mail.ru', '', '', 0, 0, 0, 7, 1492344157, 1492344324, 0, '2h7pl151prljm4uhbmua8rol02', 0, 0, '', '', '', '', '', '', '', '');

-- 
-- Вывод данных для таблицы modx_user_messages
--

-- Таблица wotch.modx_user_messages не содержит данных

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

-- Таблица wotch.modx_user_settings не содержит данных

-- 
-- Вывод данных для таблицы modx_web_groups
--

-- Таблица wotch.modx_web_groups не содержит данных

-- 
-- Вывод данных для таблицы modx_web_user_attributes
--

-- Таблица wotch.modx_web_user_attributes не содержит данных

-- 
-- Вывод данных для таблицы modx_web_user_settings
--

-- Таблица wotch.modx_web_user_settings не содержит данных

-- 
-- Вывод данных для таблицы modx_web_users
--

-- Таблица wotch.modx_web_users не содержит данных

-- 
-- Вывод данных для таблицы modx_webgroup_access
--

-- Таблица wotch.modx_webgroup_access не содержит данных

-- 
-- Вывод данных для таблицы modx_webgroup_names
--

-- Таблица wotch.modx_webgroup_names не содержит данных

-- 
-- Восстановить предыдущий режим SQL (SQL mode)
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Включение внешних ключей
-- 
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;