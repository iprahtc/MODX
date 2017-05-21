<?php
	
if($isGet) {
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

	$last_season = null;
	for($i = 0; $i < count($data); $i++) {
		$last_season = $data[$i];
		if(!isset($last_season['id']))
			break;
		$last_season['source'] = $site_use['name'];
		if($last_season['season'][0] > 0)
			$season = ' ('.$last_season['season'][0].' сезон)';
		else
			$season = '';
		$last_season['name'] .= $season;
		$outputArray[] = $last_season;
	}
}