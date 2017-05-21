<?php
/*
*	Поиск по названию
*/
define('MODX_API_MODE', true);
include_once $_SERVER['DOCUMENT_ROOT'].'/manager/includes/config.inc.php';
include_once $_SERVER['DOCUMENT_ROOT'].'/manager/includes/document.parser.class.inc.php';
$modx = new DocumentParser;
$modx->db->connect();
$modx->getSettings();
startCMSSession();
$modx->minParserPasses=2;

$isGet = (count($_GET) && (isset($_GET['sbmsearch']) || isset($_GET['action'])));
if($isGet) {
	$outputArray = array();

	$site_use = array();
	$res = $modx->db->select("site_name, site_api", "modx_site_use");

	while($row = $modx->db->getRow($res)) {
		$site_use = $row;
		if(file_exists($_SERVER['DOCUMENT_ROOT'].$row['site_api']) && $row['site_name'] == $_GET['site']) {
			require_once($_SERVER['DOCUMENT_ROOT'].$row['site_api']);
			break;
		}
	}
}

if(isset($_GET['sbmsearch'])) {
	$chunk = $modx->getChunk('wotching_tpl');
	for($i = 0; $i < count($outputArray); $i++)
	{
		$output .= $modx->parseText($chunk, array(
			'url' => $outputArray[$i]['url'],
			'name' => $outputArray[$i]['name'],
			'poster' => $outputArray[$i]['poster'],
			'description' => $outputArray[$i]['description'],
			'source' => $outputArray[$i]['source']
		), '[+', '+]');
	}
	return $output;
}
else if(isset($_GET['action'])) {
	$chunk = $modx->getChunk('preview_sz');
	for($i = 0; $i < count($outputArray) && $i < 4; $i++)
	{
		$chunk_out = $chunk;
		$chunk_out = str_replace("[+url+]", $outputArray[$i]['url'], $chunk_out);
		$chunk_out = str_replace("[+name+]", $outputArray[$i]['name'], $chunk_out);
		$chunk_out = str_replace("[+poster+]", $outputArray[$i]['poster'], $chunk_out);
		$output .= $chunk_out;
	}
	echo $output;
	exit();
}

return;
