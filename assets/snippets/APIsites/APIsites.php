<?php
/*
*	Поиск по названию
*/
define('PAGE_COUNT', 10);
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
	if(isset($_GET['page']) && !empty($_GET['page'])) {
		$page_end = $_GET['page']*PAGE_COUNT;
		$page_start = ($_GET['page']-1)*PAGE_COUNT;
	}
	else {
		$page_end = PAGE_COUNT;
		$page_start = 0;
	}
	for($i = 0; $i < count($outputArray) && $i < $page_end && $i >= $page_start; $i++)
	{
		if($outputArray[$i]['source'] == 'olx') {
			$output .= $modx->parseText($chunk, array(
				'url' => $outputArray[$i]['url'],
				'name' => '',
				'poster' => $outputArray[$i]['poster'],
				'description' => $outputArray[$i]['name'],
				'source' => $outputArray[$i]['source']
			), '[+', '+]');
		}
		else {
			$output .= $modx->parseText($chunk, array(
				'url' => $outputArray[$i]['url'],
				'name' => $outputArray[$i]['name'],
				'poster' => $outputArray[$i]['poster'],
				'description' => $outputArray[$i]['description'],
				'source' => $outputArray[$i]['source']
			), '[+', '+]');
		}
	}
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

if(count($_GET) == 1)
	return $output;

$chunk = $modx->getChunk('pagination');
$output .= $modx->parseText($chunk, array(
	'prev' => '#',
	'next' => '#',
	'ph1' => '#',
	'ph2' => '#',
	'ph3' => '#',
	'ph4' => '#',
	'ph5' => '#',
	'p1' => '1',
	'p2' => '2',
	'p3' => '3',
	'p4' => '4',
	'p5' => '5'
), '[+', '+]');

return $output;

return;
