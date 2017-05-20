<?php
define('MODX_API_MODE', true);
include_once 'manager/includes/config.inc.php';
include_once 'manager/includes/document.parser.class.inc.php';
$modx = new DocumentParser;
$modx->db->connect();
$modx->getSettings();
startCMSSession();
$modx->minParserPasses=2;

echo $modx->RunSnippet('form_site');
// вот тут мы выполняем сниппет по нашим данным
?>