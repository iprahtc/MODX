<?php
/*
*	Поиск по названию
*/
if(count($_GET) == 2 && isset($_GET['search'])) {
	$postdata = http_build_query(
		array(
			'key' => '767705c0',
			'command' => 'search',
			'query' => $_GET['search'],
		)
	);


	$opts = array(
		'http' =>
		array(
			'method'  => 'POST',
			'content' => $postdata
		)
	);


	$context  = stream_context_create($opts);
	$data = json_decode(file_get_contents('http://api.seasonvar.ru/', false, $context), true);
}
//print_r($data);
//echo '<i class="material-icons">search</i>';
//$output .= '<input class="col s10" type="text" name="search" placeholder="Введите запрос для поиска">';
$chunk = $modx->getChunk('wotching_tpl');
$last_season = null;
for($i = 0; $i < count($data); $i++)
{
	$last_season = $data[$i];
	$last_season['source'] = 'seasonvar.ru';
	if($last_season['season'][0] > 0)
		$season = ' ('.$last_season['season'][0].' сезон)';
	else
		$season = '';
	$output .= $modx->parseText($chunk, array(
		'url' => $last_season['url'],
		'name' => $last_season['name'].$season,
		'poster' => $last_season['poster'],
		'description' => $last_season['description'],
		'source' => $last_season['source']
	), '[+', '+]');
}

return $output;
