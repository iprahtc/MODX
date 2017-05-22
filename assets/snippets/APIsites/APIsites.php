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
	
	$pageCount = count($outputArray)/PAGE_COUNT;
	$pageCount = (int)$pageCount;
	if(count($outputArray)%PAGE_COUNT)
		$pageCount++;
	
	if($pageCount < $_GET['page'])
		$_GET['page'] = $pageCount;
	
	if(isset($_GET['page']) && !empty($_GET['page'])) {
		$page_end = $_GET['page']*PAGE_COUNT;
		$page_start = ($_GET['page']-1)*PAGE_COUNT;
	}
	else {
		$page_end = PAGE_COUNT;
		$page_start = 0;
		$_GET['page'] = 1;
	}
	
	for($i = 0; $i < count($outputArray) && $i < $page_end; $i++)
	{
		if($i >= $page_start) {
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

//Пагинация
if(count($_GET) == 1 || $pageCount < 2)
	return $output;
$output .= '<div class="row center">
	<ul class="pagination">';
//Удаляем предыдущий пейдж из гет запроса
$queryUri = preg_replace("/&page=.*/i", '', $_SERVER['REQUEST_URI']);

//Устанавливаем стрелочку влево типа дисейбл если выбрана первая страница, и актмвноё в другом случае
if($_GET['page'] == 1)
	$output .= '<li class="disabled"><a><i class="material-icons">chevron_left</i></a></li>';
else
	$output .= '<li class="waves-effect"><a href="'.$queryUri.'&amp;page='.($_GET['page']-1).'"><i class="material-icons">chevron_left</i></a></li>';

$pstart = ($_GET['page']%5) == 0 ? $_GET['page'] - 5 : $_GET['page'] - ($_GET['page']%5);
$pend = $pstart+5;

//выделяем активную страницу
for($i = $pstart+1; $i <= $pend && $i <= $pageCount; $i++) {
	if($i == $_GET['page'])
		$output .= '<li class="active"><a>'.$i.'</a></li>';
	else
		$output .= '<li class="waves-effect"><a href="'.$queryUri.'&amp;page='.$i.'">'.$i.'</a></li>';
}

//Делаем неактивной если последняя страница
if($_GET['page'] == $pageCount)
	$output .= '<li class="disabled"><a><i class="material-icons">chevron_right</i></a></li>';
else
	$output .= '<li class="waves-effect"><a href="'.$queryUri.'&amp;page='.($_GET['page']+1).'"><i class="material-icons">chevron_right</i></a></li>
	</ul>
</div>';

return $output;
