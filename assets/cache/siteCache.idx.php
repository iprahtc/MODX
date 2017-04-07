<?php
$c=&$this->config;$c['settings_version']="";$c['manager_theme']="MODxRE2";$c['show_meta']="0";$c['server_offset_time']="0";$c['server_protocol']="http";$c['manager_language']="russian-UTF8";$c['modx_charset']="UTF-8";$c['site_name']="MODX Site By Dmi3yy";$c['site_start']="1";$c['error_page']="1";$c['unauthorized_page']="1";$c['site_status']="1";$c['site_unavailable_message']="The site is currently unavailable";$c['track_visitors']="0";$c['top_howmany']="10";$c['auto_template_logic']="parent";$c['default_template']="3";$c['old_template']="";$c['publish_default']="1";$c['cache_default']="1";$c['search_default']="1";$c['friendly_urls']="1";$c['friendly_url_prefix']="";$c['friendly_url_suffix']=".html";$c['friendly_alias_urls']="1";$c['use_alias_path']="1";$c['use_udperms']="1";$c['udperms_allowroot']="0";$c['failed_login_attempts']="3";$c['blocked_minutes']="60";$c['use_captcha']="0";$c['captcha_words']="0,1,2,3,4,5,6,7,8,9";$c['emailsender']="ipra-8@mail.ru";$c['email_method']="mail";$c['smtp_auth']="0";$c['smtp_host']="";$c['smtp_port']="25";$c['smtp_username']="";$c['emailsubject']="Your login details";$c['number_of_logs']="100";$c['number_of_messages']="30";$c['number_of_results']="20";$c['use_editor']="1";$c['use_browser']="1";$c['which_browser']="mcpuk";$c['rb_base_dir']="";$c['rb_base_url']="";$c['which_editor']="TinyMCE4";$c['fe_editor_lang']="russian-UTF8";$c['fck_editor_toolbar']="standard";$c['fck_editor_autolang']="0";$c['editor_css_path']="";$c['editor_css_selectors']="";$c['strip_image_paths']="1";$c['upload_images']="bmp,ico,gif,jpeg,jpg,png,psd,tif,tiff,svg";$c['upload_media']="au,avi,mp3,mp4,mpeg,mpg,wav,wmv";$c['upload_flash']="fla,flv,swf";$c['upload_files']="bmp,ico,gif,jpeg,jpg,png,psd,tif,tiff,fla,flv,swf,aac,au,avi,css,cache,doc,docx,gz,gzip,htaccess,htm,html,js,mp3,mp4,mpeg,mpg,ods,odp,odt,pdf,ppt,pptx,rar,tar,tgz,txt,wav,wmv,xls,xlsx,xml,z,zip,JPG,JPEG,PNG,GIF,svg";$c['upload_maxsize']="10485760";$c['new_file_permissions']="0644";$c['new_folder_permissions']="0755";$c['filemanager_path']="";$c['theme_refresher']="";$c['manager_layout']="4";$c['custom_contenttype']="application/rss+xml,application/pdf,application/vnd.ms-word,application/vnd.ms-excel,text/html,text/css,text/xml,text/javascript,text/plain,application/json";$c['auto_menuindex']="1";$c['session.cookie.lifetime']="604800";$c['mail_check_timeperiod']="600";$c['manager_direction']="ltr";$c['tinymce4_theme']="custom";$c['tree_show_protected']="0";$c['rss_url_news']="http://feeds.feedburner.com/modx-announce";$c['rss_url_security']="http://feeds.feedburner.com/modxsecurity";$c['validate_referer']="1";$c['datepicker_offset']="-10";$c['xhtml_urls']="0";$c['allow_duplicate_alias']="0";$c['automatic_alias']="1";$c['datetime_format']="dd-mm-YYYY";$c['warning_visibility']="0";$c['remember_last_tab']="1";$c['enable_bindings']="1";$c['seostrict']="1";$c['cache_type']="2";$c['maxImageWidth']="1600";$c['maxImageHeight']="1200";$c['thumbWidth']="150";$c['thumbHeight']="150";$c['thumbsDir']=".thumbs";$c['jpegQuality']="90";$c['denyZipDownload']="0";$c['denyExtensionRename']="0";$c['showHiddenFiles']="0";$c['docid_incrmnt_method']="0";$c['make_folders']="0";$c['tree_page_click']="27";$c['clean_uploaded_filename']="1";$c['site_id']="58e7ef63778bf";$this->aliasListing=array();$a=&$this->aliasListing;$d=&$this->documentListing;$m=&$this->documentMap;$d['index'] = 1;$a[1] = array('id' => 1, 'alias' => 'index', 'path' => '', 'parent' => 0, 'alias_visible' => 1, 'isfolder' => 0);$m[] = array('0' => '1');$c = &$this->contentTypes;$c = &$this->chunkCache;$c['eFeedbackForm'] = '<p><span style="color:#900;">[+validationmessage+]</span></p>

<form  class="eform" method="post" action="[~[*id*]~]">

<input type="hidden" name="formid" value="feedbackForm" />
<input value="" name="special" class="special" type="text" eform="Спец:date:0"  style="display:none;" />
<p>
    <input type="text" name="name" id="name" class="grid_3" value=""  eform="Имя:string:1"/>
    <label for="name">Ваше имя</label>
</p>
            
<p>
    <input type="text" name="email" id="email" class="grid_3" value="" eform="E-mail:email:1" />
    <label for="email">Ваш E-mail</label>
</p>
            
<p>
    <input type="text" name="phone" id="subject" class="grid_3" value="" eform="Номер телефона:string:1"/>
    <label for="subject">Номер телефона</label>
</p>
            
<p>
    <textarea name="comments" id="message" class="grid_6" cols="50" rows="10" eform="Текст сообщения:string:1"></textarea>
</p>
<p>Введите код с картинки: <br />
    <input type="text" class="ver" name="vericode" /><img class="feed" src="[+verimageurl+]" alt="Введите код" />
</p>            
<p>
    <input type="submit" name="submit" class="subeform grid_2" value="Отправить сообщение"/>
 </p>

</form>


 

';$c['eFeedbackReport'] = '<p>Прислано человеком, с именем: [+name+] . Подробности ниже:</p>
<table>
<tr valign="top"><td>Имя:</td><td>[+name+]</td></tr>
<tr valign="top"><td>E-mail:</td><td>[+email+]</td></tr>
<tr valign="top"><td>Номер телефона:</td><td>[+phone+]</td></tr>
<tr valign="top"><td>Текст сообщения:</td><td>[+comments+]</td></tr>
</table>
<p>Можно использовать ссылку для ответа: <a href="mailto:[+email+]?subject=RE:[+subject+]">[+email+]</a></p>

';$c['feedback'] = '[!eForm? &formid=`feedbackForm` &subject=`Сообщение с сайта` &tpl=`eFeedbackForm` &report=`eFeedbackReport` &gotoid=`[*id*]` &vericode=`1` !] 

';$c['footer'] = '<!--  Mem : [^m^], MySQL: [^qt^], [^q^] request(s), PHP: [^p^], total: [^t^], document from [^s^]. -->';$c['header'] = '<meta http-equiv="Content-Type" content="text/html; charset=[(modx_charset)]" /> 
<title>[*titl*]</title>
[*noIndex*]
<meta name="keywords" content="[*keyw*]" />
<meta name="description" content="[*desc*]" />
<base href="[(site_url)]"/>
';$c['mm_rules'] = '// more example rules are in assets/plugins/managermanager/example_mm_rules.inc.php
// example of how PHP is allowed - check that a TV named documentTags exists before creating rule

mm_widget_showimagetvs(); // Показываем превью ТВ

mm_createTab(\'Для SEO\', \'seo\', \'\', \'\', \'\', \'\');
mm_moveFieldsToTab(\'titl,keyw,desc,seoOverride,noIndex,sitemap_changefreq,sitemap_priority,sitemap_exclude\', \'seo\', \'\', \'\');
mm_widget_tags(\'keyw\',\',\'); // Give blog tag editing capabilities to the \'documentTags (3)\' TV


//mm_createTab(\'Изображения\', \'photos\', \'\', \'\', \'\', \'850\');
//mm_moveFieldsToTab(\'images,photos\', \'photos\', \'\', \'\');

//mm_hideFields(\'longtitle,description,link_attributes,menutitle,content\', \'\', \'6,7\');

//mm_hideTemplates(\'0,5,8,9,11,12\', \'2,3\');

//mm_hideTabs(\'settings, access\', \'2\');

//mm_widget_evogallery(1, Галерея, \'1,2,3\', 3);   // подключаем галерею 
//mm_galleryLink($fields, $roles, $templates, $moduleid);
//mm_widget_evogallery($moduleid, $title, $roles, $templates);
';$s=&$this->snippetCache;$s['alterTitle']='//[[alterTitle? &id = `[+id+]`]] к примеру для вывода в Ditto
$id = isset($id) ? (int) $id : 0;
if ($id) {
	$arr = $modx->getPageInfo($id,1,\'pagetitle,longtitle\');
} else {
	$arr[\'pagetitle\'] = $modx->documentObject[\'pagetitle\'];
	$arr[\'longtitle\'] = $modx->documentObject[\'longtitle\'];
}
$title = strip_tags(strlen($arr[\'longtitle\']) ? $arr[\'longtitle\'] : $arr[\'pagetitle\']); 
return $title;
?>';$s['Breadcrumbs']='return require MODX_BASE_PATH.\'assets/snippets/breadcrumbs/snippet.breadcrumbs.php\';';$s['Ditto']='return require MODX_BASE_PATH.\'assets/snippets/ditto/snippet.ditto.php\';';$s['DocInfo']='return require MODX_BASE_PATH.\'assets/snippets/docinfo/snippet.docinfo.php\';';$s['DocLister']='return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DocLister.php\';';$s['eForm']='return require MODX_BASE_PATH.\'assets/snippets/eform/snippet.eform.php\';';$s['FirstChildRedirect']='return require MODX_BASE_PATH.\'assets/snippets/firstchildredirect/snippet.firstchildredirect.php\';';$s['if']='return require MODX_BASE_PATH.\'assets/snippets/if/snippet.if.php\';';$s['phpthumb']='return require MODX_BASE_PATH.\'assets/snippets/phpthumb/snippet.phpthumb.php\';';$s['UltimateParent']='return require MODX_BASE_PATH.\'assets/snippets/ultimateparent/snippet.ultimateparent.php\';';$s['Wayfinder']='return require MODX_BASE_PATH.\'assets/snippets/wayfinder/snippet.wayfinder.php\';';$p=&$this->pluginCache;$p['CodeMirror']='/**
 * CodeMirror
 *
 * JavaScript library that can be used to create a relatively pleasant editor interface based on CodeMirror 5.12
 *
 * @category    plugin
 * @version     1.4
 * @license     http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)
 * @package     modx
 * @internal    @events OnDocFormRender,OnChunkFormRender,OnModFormRender,OnPluginFormRender,OnSnipFormRender,OnTempFormRender,OnRichTextEditorInit
 * @internal    @modx_category Manager and Admin
 * @internal    @properties &theme=Theme;list;default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light;default &indentUnit=Indent unit;int;4 &tabSize=The width of a tab character;int;4 &lineWrapping=lineWrapping;list;true,false;true &matchBrackets=matchBrackets;list;true,false;true &activeLine=activeLine;list;true,false;false &emmet=emmet;list;true,false;true &search=search;list;true,false;false &indentWithTabs=indentWithTabs;list;true,false;true &undoDepth=undoDepth;int;200 &historyEventDelay=historyEventDelay;int;1250
 * @internal    @installset base
 * @reportissues https://github.com/modxcms/evolution
 * @documentation Official docs https://codemirror.net/doc/manual.html
 * @author      hansek from http://www.modxcms.cz
 * @author      update Mihanik71
 * @author      update Deesen
 * @lastupdate  11/04/2016
 */

$_CM_BASE = \'assets/plugins/codemirror/\';

$_CM_URL = $modx->config[\'site_url\'] . $_CM_BASE;

require(MODX_BASE_PATH. $_CM_BASE .\'codemirror.plugin.php\');';$p['CodeMirrorProps']='&theme=Theme;list;default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light;default &indentUnit=Indent unit;int;4 &tabSize=The width of a tab character;int;4 &lineWrapping=lineWrapping;list;true,false;true &matchBrackets=matchBrackets;list;true,false;true &activeLine=activeLine;list;true,false;false &emmet=emmet;list;true,false;true &search=search;list;true,false;false &indentWithTabs=indentWithTabs;list;true,false;true &undoDepth=undoDepth;int;200 &historyEventDelay=historyEventDelay;int;1250 ';$p['FileSource']='require MODX_BASE_PATH.\'assets/plugins/filesource/plugin.filesource.php\';';$p['Forgot Manager Login']='require MODX_BASE_PATH.\'assets/plugins/forgotmanagerlogin/plugin.forgotmanagerlogin.php\';';$p['ManagerManager']='/**
 * ManagerManager
 *
 * Customize the MODX Manager to offer bespoke admin functions for end users or manipulate the display of document fields in the manager.
 *
 * @category plugin
 * @version 0.6.2
 * @license http://creativecommons.org/licenses/GPL/2.0/ GNU Public License (GPL v2)
 * @internal @properties &remove_deprecated_tv_types_pref=Remove deprecated TV types;list;yes,no;yes &config_chunk=Configuration Chunk;text;mm_rules
 * @internal @events OnDocFormRender,OnDocFormPrerender,OnBeforeDocFormSave,OnDocFormSave,OnDocDuplicate,OnPluginFormRender,OnTVFormRender
 * @internal @modx_category Manager and Admin
 * @internal @installset base
 * @internal @legacy_names Image TV Preview, Show Image TVs
 * @reportissues https://github.com/DivanDesign/MODXEvo.plugin.ManagerManager/
 * @documentation README [+site_url+]assets/plugins/managermanager/readme.html
 * @documentation Official docs http://code.divandesign.biz/modx/managermanager
 * @link        Latest version http://code.divandesign.biz/modx/managermanager
 * @link        Additional tools http://code.divandesign.biz/modx
 * @link        Full changelog http://code.divandesign.biz/modx/managermanager/changelog
 * @author      Inspired by: HideEditor plugin by Timon Reinhard and Gildas; HideManagerFields by Brett @ The Man Can!
 * @author      DivanDesign studio http://www.DivanDesign.biz
 * @author      Nick Crossland http://www.rckt.co.uk
 * @author      Many others
 * @lastupdate  06/03/2016
 */

// Run the main code
include($modx->config[\'base_path\'].\'assets/plugins/managermanager/mm.inc.php\');';$p['ManagerManagerProps']='&remove_deprecated_tv_types_pref=Remove deprecated TV types;list;yes,no;yes &config_chunk=Configuration Chunk;text;mm_rules ';$p['TinyMCE4']='require MODX_BASE_PATH.\'assets/plugins/tinymce4/plugin.tinymce.php\';';$p['TinyMCE4Props']='&styleFormats=Custom Style Formats;textarea;Title,cssClass|Title2,cssClass &customParams=Custom Parameters <b>(Be careful or leave empty!)</b>;textarea; &entityEncoding=Entity Encoding;list;named,numeric,raw;named &entities=Entities;text; &pathOptions=Path Options;list;Site config,Absolute path,Root relative,URL,No convert;Site config &resizing=Advanced Resizing;list;true,false;false &disabledButtons=Disabled Buttons;text; &webTheme=Web Theme;test;webuser &webPlugins=Web Plugins;text; &webButtons1=Web Buttons 1;text;bold italic underline strikethrough removeformat alignleft aligncenter alignright &webButtons2=Web Buttons 2;text;link unlink image undo redo &webButtons3=Web Buttons 3;text; &webButtons4=Web Buttons 4;text; &webAlign=Web Toolbar Alignment;list;ltr,rtl;ltr &width=Width;text;100% &height=Height;text;400px &introtextRte=<b>Introtext RTE</b><br/>add richtext-features to "introtext";list;enabled,disabled;disabled &inlineMode=<b>Inline-Mode</b>;list;enabled,disabled;disabled &inlineTheme=<b>Inline-Mode</b><br/>Theme;text;inline &browser_spellcheck=<b>Browser Spellcheck</b><br/>At least one dictionary must be installed inside your browser;list;enabled,disabled;disabled ';$p['TransAlias']='require MODX_BASE_PATH.\'assets/plugins/transalias/plugin.transalias.php\';';$p['TransAliasProps']='&table_name=Trans table;list;common,russian,dutch,german,czech,utf8,utf8lowercase;russian &char_restrict=Restrict alias to;list;lowercase alphanumeric,alphanumeric,legal characters;lowercase alphanumeric &remove_periods=Remove Periods;list;Yes,No;No &word_separator=Word Separator;list;dash,underscore,none;dash &override_tv=Override TV name;string; ';$e = &$this->pluginEvent;$e['OnBeforeDocFormSave']=array('ManagerManager');$e['OnBeforeManagerLogin']=array('Forgot Manager Login');$e['OnBeforePluginFormSave']=array('FileSource');$e['OnBeforeSnipFormSave']=array('FileSource');$e['OnChunkFormRender']=array('CodeMirror');$e['OnDocDuplicate']=array('ManagerManager');$e['OnDocFormPrerender']=array('ManagerManager');$e['OnDocFormRender']=array('ManagerManager','CodeMirror');$e['OnDocFormSave']=array('ManagerManager');$e['OnInterfaceSettingsRender']=array('TinyMCE4');$e['OnLoadWebDocument']=array('TinyMCE4');$e['OnLoadWebPageCache']=array('TinyMCE4');$e['OnManagerAuthentication']=array('Forgot Manager Login');$e['OnManagerLoginFormRender']=array('Forgot Manager Login');$e['OnModFormRender']=array('CodeMirror');$e['OnParseDocument']=array('TinyMCE4');$e['OnPluginFormPrerender']=array('FileSource');$e['OnPluginFormRender']=array('FileSource','ManagerManager','CodeMirror');$e['OnRichTextEditorInit']=array('TinyMCE4','CodeMirror');$e['OnRichTextEditorRegister']=array('TinyMCE4');$e['OnSnipFormPrerender']=array('FileSource');$e['OnSnipFormRender']=array('CodeMirror','FileSource');$e['OnStripAlias']=array('TransAlias');$e['OnTempFormRender']=array('CodeMirror');$e['OnTVFormRender']=array('ManagerManager');$e['OnWebPagePrerender']=array('TinyMCE4');