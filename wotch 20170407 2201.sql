--
-- Скрипт сгенерирован Devart dbForge Studio for MySQL, Версия 7.2.53.0
-- Домашняя страница продукта: http://www.devart.com/ru/dbforge/mysql/studio
-- Дата скрипта: 07.04.2017 22:01:08
-- Версия сервера: 5.7.16
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
AUTO_INCREMENT = 1
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
AUTO_INCREMENT = 1
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
AUTO_INCREMENT = 3
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
AUTO_INCREMENT = 2
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
AUTO_INCREMENT = 7
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
AUTO_INCREMENT = 5
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
('g7k5r5hmcm1sjg7e6p9o565s07', 1, 1491595121, '127.0.0.1');

-- 
-- Вывод данных для таблицы modx_active_users
--
INSERT INTO modx_active_users VALUES
('g7k5r5hmcm1sjg7e6p9o565s07', 1, 'admin', 1491595121, '17', NULL);

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

-- Таблица wotch.modx_event_log не содержит данных

-- 
-- Вывод данных для таблицы modx_keyword_xref
--

-- Таблица wotch.modx_keyword_xref не содержит данных

-- 
-- Вывод данных для таблицы modx_manager_log
--
INSERT INTO modx_manager_log VALUES
(1, 1491595120, 1, 'admin', 58, '-', 'MODX', 'Logged in'),
(2, 1491595121, 1, 'admin', 17, '-', '-', 'Editing settings');

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
(1, 'document', 'text/html', 'Home', '', '', 'index', '', 1, 0, 0, 0, 0, '', '', 1, 3, 0, 1, 1, 1, 1130304721, 1, 1130304927, 0, 0, 0, 1130304721, 1, '', 0, 0, 0, 0, 0, 0, 0, 1);

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
(4, 'footer', 'низ сайта', 0, 'none', 4, 0, '<!--  Mem : [^m^], MySQL: [^qt^], [^q^] request(s), PHP: [^p^], total: [^t^], document from [^s^]. -->', 0),
(5, 'header', 'шапка', 0, 'none', 4, 0, '<meta http-equiv="Content-Type" content="text/html; charset=[(modx_charset)]" /> \r\n<title>[*titl*]</title>\r\n[*noIndex*]\r\n<meta name="keywords" content="[*keyw*]" />\r\n<meta name="description" content="[*desc*]" />\r\n<base href="[(site_url)]"/>\r\n', 0),
(6, 'mm_rules', 'Default ManagerManager rules.', 0, 'none', 5, 0, '// more example rules are in assets/plugins/managermanager/example_mm_rules.inc.php\r\n// example of how PHP is allowed - check that a TV named documentTags exists before creating rule\r\n\r\nmm_widget_showimagetvs(); // Показываем превью ТВ\r\n\r\nmm_createTab(''Для SEO'', ''seo'', '''', '''', '''', '''');\r\nmm_moveFieldsToTab(''titl,keyw,desc,seoOverride,noIndex,sitemap_changefreq,sitemap_priority,sitemap_exclude'', ''seo'', '''', '''');\r\nmm_widget_tags(''keyw'','',''); // Give blog tag editing capabilities to the ''documentTags (3)'' TV\r\n\r\n\r\n//mm_createTab(''Изображения'', ''photos'', '''', '''', '''', ''850'');\r\n//mm_moveFieldsToTab(''images,photos'', ''photos'', '''', '''');\r\n\r\n//mm_hideFields(''longtitle,description,link_attributes,menutitle,content'', '''', ''6,7'');\r\n\r\n//mm_hideTemplates(''0,5,8,9,11,12'', ''2,3'');\r\n\r\n//mm_hideTabs(''settings, access'', ''2'');\r\n\r\n//mm_widget_evogallery(1, Галерея, ''1,2,3'', 3);   // подключаем галерею \r\n//mm_galleryLink($fields, $roles, $templates, $moduleid);\r\n//mm_widget_evogallery($moduleid, $title, $roles, $templates);\r\n', 0);

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
(3, 'Home', '', 0, 0, '', 0, '{{header}}\r\n[*content*]\r\n{{footer}}', 0, 1),
(4, 'MODX startup - Bootstrap', '<strong>1.0</strong> Sample template in Bootstrap', 0, 1, '', 0, '<!DOCTYPE html>\n<html lang="[(lang_code)]">\n<head>\t\n\t<base href="[(site_url)]" />\n\t<meta charset="[(modx_charset)]" />\n\t<meta name="viewport" content="width=device-width, initial-scale=1">\n\t<meta http-equiv="X-UA-Compatible" content="IE=edge">\n\t<title>[*pagetitle*] / [(site_name)]</title>\n\t<@IF:[*description:isntEmpty*]><meta name="description" content="[*description*]"><@ENDIF>\n\t\n\t<link href="[(site_url)]<@IF:[*id:isnt(1)*]>[~[*id*]~]<@ENDIF>" rel="canonical">\n\t<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet" type="text/css">\t\n\t<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">\n\t<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">\n\t\n\t<style> \n\thtml, body{background:#eee; font-family:''Open Sans'',sans-serif; line-height:1.8; font-size:14px;}\n\ta:focus{outline:none; outline-offset:0;}\n\th1{margin-top:15px;}\n\n\t.logo{float:left;}\n\t.logo img{max-width:200px; margin:10px 0; display:block; height:50px; width:auto;}\n\t.dropdown-menu{border-radius:0; border:0;}\n\t.dropdown-menu > li > a{padding-top:5px; padding-bottom:5px;}\n\n\t.navbar-collapse.collapse.in{border-bottom:10px solid #eee;}\n\t.navbar{min-height:0; background:#fff; margin-bottom:0;}\n\t.navbar.nav{margin-left:0;}\n\t.navbar.nav ul{padding-left:0;}\n\t.navbar-nav{margin:0;}\n\t.navbar-toggle{background:#fff; border:2px solid #eee; border-radius:0; position:fixed; z-index:99; right:0; top:7px; padding:12px 10px; margin-right:10px;}\n\t.navbar .navbar-toggle .icon-bar{background-color:#333;}\n\n\t.nav li a{text-transform:uppercase; color:#333; font-weight:500; font-size:110%;}\n\t.nav li li a{text-transform:none; font-weight:normal; font-size:100%;}\n\n\t.navbar{border:none; border-radius:0;}\n\t#navbar{padding:0;}\n\tul.nav > li > a:hover{background-color:#f5f5f5;}\n\n\t.affix{top:0px; width:100%; z-index:1000; background-color:#eee;}\n\t.affix + .affspacer{display:block; height:50px;}\n\n\t.box-shadow{-webkit-box-shadow:0 6px 12px rgba(0,0,0,.175); box-shadow:0 6px 12px rgba(0,0,0,.175);}\n\n\t.container {max-width:970px; margin:0 12px;}\n\t.top .col-sm-12{padding-left:0; padding-right:0;}\n\n\t#ajaxSearch_input,\n\t#username,\n\t#password{width:100%!important;}\n\t#forgotpsswd{clear:both;}\n\tinput.button[type="submit"]{display:block;}\n\tlabel.checkbox{display:inline-block; margin-left:10px;}\n\tlabel, legend{font-weight:400;}\n\t#ajaxSearch_form { position:relative; }\n\t#searchClose { display:none !important; }\n    #indicator { position:absolute; top:9px; right:12px; z-index:10; opacity:.75; }\n\n\th2{font-size:22px;}\n\t.bread{padding:1em 0 0 0;}\n\t.mem{color:#aaa; text-align:center; padding:1em 0 2em;}\n\n\tsection.main .container{background-color:#fff; padding-bottom:20px;}\n\tfooter.footer .container{background-color:#000; color:#fff; line-height:40px;}\n\n\tsection.main ul{list-style:none; margin:0 0 1em 0; padding:0;}\n\tsection.main ul li{padding-left:1em;}\n\tsection.main ul li:before{content:''\\2022''; position:absolute; line-height:1.85em; margin-left:-1em;}\n\n\t.footer{text-align:center;}\n\t.footer .text-right{text-align:center;}\n\n\t/* JOT */\n\t.jot-comment{padding:5px 10px;}\n\t.jot-row-author{background-color:#dddddd;}\n\t.jot-row-alt{background-color:#f9f9f9;}\n\t.jot-row{background-color:#eeeeee;}\n\t.jot-row-up{border:1px solid #333!important;}\n\t.jot-row-up.panel-primary > .panel-heading{background-color:#333!important; border-color:#333!important;}\n\t.jot-extra{font-size:75%;}\n\t.jot-poster{font-size:inherit!important;}\n\n\t.ditto_summaryPost img{max-width:100%; height:auto; margin:10px 0 5px; display:block;}\n\t.ditto_summaryPost{padding-top:10px; padding-bottom:15px; border-bottom:1px solid #eee;}\n\n\t/* Larger than mobile */\n\t@media (min-width:320px) {\n\n\t}\n\n\t/* Larger than phablet */\n\t@media (min-width:480px) {\n\n\t}\n\n\t/* Larger than tablet */\n\t@media (min-width:768px) {\n\n\t\t.container{margin:0 auto;}\n\t\t.logo{padding-left:15px;}\n\t\t.logo img{ max-width:240px; margin:0; display:block; height:100px;}\n\n\t\t.navbar{background:transparent;}\n\t\t.navbar.affix{background:#eee;}\n\t\t.navbar-collapse.collapse.in{border-bottom:0;}\n\n\t\t.footer{text-align:left;}\n\t\t.footer .text-right{text-align:right;}\n\n\t\t.col-lg-1, .col-lg-10, .col-lg-11, .col-lg-12, .col-lg-2, .col-lg-3, .col-lg-4, .col-lg-5, .col-lg-6, .col-lg-7, .col-lg-8, .col-lg-9, .col-md-1, .col-md-10, .col-md-11, .col-md-12, .col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9, .col-sm-1, .col-sm-10, .col-sm-11, .col-sm-12, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9, .col-xs-1, .col-xs-10, .col-xs-11, .col-xs-12, .col-xs-2, .col-xs-3, .col-xs-4, .col-xs-5, .col-xs-6, .col-xs-7, .col-xs-8, .col-xs-9 {padding-left:35px; padding-right:35px;}\n\n\t}\n\t</style>\n\t\n\t<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>\n</head>\n<body>\n\t<section class="top">\n\t\t<div class="container">\n\t\t\t<div class="row">\n\t\t\t\t<div class="col-sm-12" itemscope itemtype="http://schema.org/Organization">\n\n\t\t\t\t\t<a class="logo" href="[~[(site_start)]~]" title="[(site_name)]" itemprop="url">\n\t\t\t\t\t\t<img src="[(site_url)]assets/images/modx-logo.png" itemprop="logo" width="240" height="100" alt="[(site_name)]" />\n\t\t\t\t\t</a>\n\n\t\t\t\t\t<div class="clearfix"></div>\n\n\t\t\t\t\t<nav class="navbar" role="navigation" data-spy="affix" data-offset-top="100">\n\n\t\t\t\t\t\t<div class="navbar-header">\n\t\t\t\t\t\t\t<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">\n\t\t\t\t\t\t\t\t<span class="sr-only">Toggle navigation</span>\n\t\t\t\t\t\t\t\t<span class="icon-bar"></span>\n\t\t\t\t\t\t\t\t<span class="icon-bar"></span>\n\t\t\t\t\t\t\t\t<span class="icon-bar"></span>\n\t\t\t\t\t\t\t</button>\n\t\t\t\t\t\t</div>\n\t\t\t\t\t\t<div id="navbar" class="navbar-collapse collapse">\n\t\t\t\t\t\t\t[[Wayfinder? \n\t\t\t\t\t\t\t&startId=`0` \n\t\t\t\t\t\t\t&level=`2` \n\t\t\t\t\t\t\t&removeNewLines=`1`\n\t\t\t\t\t\t\t&outerTpl=`@CODE:<ul class="nav navbar-nav">[+wf.wrapper+]</ul>`\n\t\t\t\t\t\t\t&rowTpl=`@CODE:<li[+wf.classes+]><a href="[+wf.link+]" [+wf.attributes+]>[+wf.linktext+]</a>[+wf.wrapper+]</li>`\n\t\t\t\t\t\t\t&innerTpl=`@CODE:<ul class="dropdown-menu">[+wf.wrapper+]</ul>`\n\t\t\t\t\t\t\t&innerRowTpl=`@CODE:<li[+wf.classes+]><a href="[+wf.link+]">[+wf.linktext+]</a></li>`\n\t\t\t\t\t\t\t&parentRowTpl=`@CODE:<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" title="[+wf.title+]">[+wf.linktext+] <b class="caret"></b></a>[+wf.wrapper+]</li>`\n\t\t\t\t\t\t\t&activeParentRowTpl=`@CODE:<li class="dropdown active"><a class="dropdown-toggle" data-toggle="dropdown" href="#" title="[+wf.title+]">[+wf.linktext+] <b class="caret"></b></a>[+wf.wrapper+]</li>`\n\t\t\t\t\t\t\t]]\n\t\t\t\t\t\t</div>\n\n\t\t\t\t\t</nav>\n\t\t\t\t\t<div class="affspacer"></div>\n\n\t\t\t\t</div>\n\t\t\t</div>\n\t\t</div>\n\t\t</section>\n\n\t\t<section class="main">\n\t\t\t<div class="container">\n\n\t\t\t\t<div class="row">\n\t\t\t\t\t<div class="col-sm-12">\n\t\t\t\t\t\t<div class="bread">\n\t\t\t\t\t\t\t[[Breadcrumbs]]\n\t\t\t\t\t\t</div>\n\t\t\t\t\t</div>\n\t\t\t\t</div>\n\n\t\t\t\t<div class="row">\n\n\t\t\t\t\t<div class="col-sm-8">\n\t\t\t\t\t\t<h1>[*#longtitle*]</h1>\n\t\t\t\t\t\t[*#content*]\n\t\t\t\t\t</div>\n\n\t\t\t\t\t<aside class="col-sm-4">\n\t\t\t\t\t\t<div class="search">\n\t\t\t\t\t\t\t<h2>Search</h2>\n\t\t\t\t\t\t\t[!AjaxSearch? \n\t\t\t\t\t\t\t&ajaxSearch=`1` \n\t\t\t\t\t\t\t&addJscript=`0` \n\t\t\t\t\t\t\t&showIntro=`0` \n\t\t\t\t\t\t\t&ajaxMax=`5` \n\t\t\t\t\t\t\t&extract=`1`\n\t\t\t\t\t\t\t&jscript=`jquery`\n\t\t\t\t\t\t\t&tplInput=`AjaxSearch_tplInput`\n\t\t\t\t\t\t\t&tplAjaxGrpResult=`AjaxSearch_tplAjaxGrpResult`\n\t\t\t\t\t\t\t&tplAjaxResults=`AjaxSearch_tplAjaxResults`\n\t\t\t\t\t\t\t&tplAjaxResult=`AjaxSearch_tplAjaxResult`\n\t\t\t\t\t\t\t&showResults=`1`\n\t\t\t\t\t\t\t&liveSearch=`0`\n\t\t\t\t\t\t\t!]\n\t\t\t\t\t\t</div>\n\n\t\t\t\t\t\t<h2>News:</h2>\n\t\t\t\t\t\t[[DocLister? \n\t\t\t\t\t\t&parents=`2` \n\t\t\t\t\t\t&display=`2`\n\t\t\t\t\t\t&total=`20` \n\t\t\t\t\t\t&removeChunk=`Comments` \n\t\t\t\t\t\t&tpl=`nl_sidebar`\n\t\t\t\t\t\t]]\n\n\t\t\t\t\t\t<div>\n\t\t\t\t\t\t\t<h2>Most Recent:</h2>\n\n\t\t\t\t\t\t\t<ul>\n\t\t\t\t\t\t\t\t[[DocLister? \n\t\t\t\t\t\t\t\t&showInMenuOnly=`1` \n\t\t\t\t\t\t\t\t&parents=`0`\n\t\t\t\t\t\t\t\t&display=`5`\n\t\t\t\t\t\t\t\t&tpl=`@CODE:<li><a href="[+url+]" title="[+pagetitle+]">[+pagetitle+]</a> <span class="date">[+date+]</span></li>`\n\t\t\t\t\t\t\t\t]]\n\t\t\t\t\t\t\t</ul>\n\n\t\t\t\t\t\t</div>\n\t\t\t\t\t\t<br/>\n\t\t\t\t\t\t<h2>Login:</h2>\n\t\t\t\t\t\t<div>\n\t\t\t\t\t\t\t[!WebLogin? \n\t\t\t\t\t\t\t&tpl=`WebLogin_tplForm` \n\t\t\t\t\t\t\t&loginhomeid=`[(site_start)]`\n\t\t\t\t\t\t\t&focusInput=`0`\n\t\t\t\t\t\t\t!]\n\t\t\t\t\t\t</div>\n\n\t\t\t\t\t</aside>\n\t\t\t\t</div>\n\t\t\t</div>\n\n\t\t</section>\n\n\t\t<footer class="footer">\n\t\t\t<div class="container">\n\t\t\t\t<div class="row">\n\t\t\t\t\t<div class="col-sm-6">\n\t\t\t\t\t\t<a href="https://modx.com" title="Learn more about MODX">MODX</a> Starter-Template &copy;2006-[[$_SERVER[''REQUEST_TIME'']:dateFormat=`Y` ]]\n\t\t\t\t\t</div>\n\t\t\t\t\t<div class="col-sm-6 text-right">\n\t\t\t\t\t\tBuilt with <a href="http://www.getbootstrap.com" target="_blank">Bootstrap</a> framework.\n\t\t\t\t\t</div>\n\t\t\t\t</div>\n\t\t\t</div>\n\t\t</footer>\n\n\t\t<div class="container mem">\n\t\t\t<small>Memory: [^m^], MySQL: [^qt^], [^q^] request(s), PHP: [^p^], total: [^t^], document retrieved from [^s^]. </small>\n\t</div>\n\n\t<!-- Scripts\n\t–––––––––––––––––––––––––––––––––––––––––––––––––– -->\t\n\n\t<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>\n\t<!--[if lt IE 9]>\n\t\t<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>\n\t\t<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>\n\t<![endif]-->\n\t\n</body>\n</html>', 0, 1);

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
(1, 3, 0),
(2, 3, 0),
(3, 3, 0),
(4, 3, 0);

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
('settings_version', ''),
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
('old_template', ''),
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
('rb_base_dir', ''),
('rb_base_url', ''),
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
('filemanager_path', ''),
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
('site_id', '58e7ef63778bf');

-- 
-- Вывод данных для таблицы modx_user_attributes
--
INSERT INTO modx_user_attributes VALUES
(1, 1, 'Admin', 1, 'ipra-8@mail.ru', '', '', 0, 0, 0, 1, 0, 1491595120, 0, 'g7k5r5hmcm1sjg7e6p9o565s07', 0, 0, '', '', '', '', '', '', '', '');

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