<?php
	class Parse {
		//устанавливаем параметры поиска
		public $html = '';
		public $bloc = 'div.space h3 a strong';
		public $price = 'div.space p.price';
		public $silca = 'div.space h3.x-large a.marginright5';
		public $img = 'td a img.fleft';
		
		//выполняеться автоматически при создании объкта, тем самым подключает библиотеку
		public function __construct($url){
			include_once(__DIR__ .'simple_html_dom.php');
			//получаем HTML сайта
			$this->html = file_get_html($url);
		}
		
		//название товаров
		function name(){
			//разбираем HTML по блокам из переменной $bloc
			$name = $this->html->find($this->bloc);
			//возвращает массив строк или одну строку
			return $name;
		}
		function img(){
			//разбираем HTML по блокам из переменной $bloc
			$img = $this->html->find($this->img);
			//возвращает массив строк или одну строку
			return $img;
		}
		
		//цена товаров 
		function price(){
			//разбираем HTML по блокам из переменной $price
			$price = $this->html->find($this->price);
			return $price;
		}
		
		//цена товаров 
		function silca(){
			//разбираем HTML по блокам из переменной $silca
			$silcaAll = $this->html->find($this->silca);
			foreach($silcaAll as $ar){
				$silca[] = $ar->href;
			}
			return $silca;
		}
		
	}
	
	class UrlGenerate
	{
		private $search = "q-";//Начало строки поиска
		public $http = "https://www.olx.ua/";//Начало URL
		
		//Приведение строки поиска к подходящему к OLX виду
		private function convert($str)
		{
			//Проверяем все символы и записываем результат в search
			for($i = 0; $i < strlen($str); $i++)
			{
				if($str[$i] == ' ' || $str[$i] == '/')
					$this->search .= '-';
				elseif($str[$i] == '#')
					$this->search .= 'ht_';
				elseif((ord($str[$i]) >= 32 && ord($str[$i]) <= 64) ||
						(ord($str[$i]) >= 91 && ord($str[$i]) <= 96) ||
						(ord($str[$i]) >= 123 && ord($str[$i]) <= 126))
					$this->search .= '%'.dechex(ord($str[$i]));
				else
					$this->search .= $str[$i];
			}
		}
		
		/* //Конвертирование региона в транслит
		private function convertCity($str)
		{	
			//Получаем данные с файла city.json
			$open = file_get_contents('city.json'); 
			$decode = json_decode($open, TRUE);
			
			//Ищем совпадение по городам
			for($i = 0; $i < count($decode); $i++)
				if($decode[$i][$str] != NULL)
				{	
					$city = $decode[$i][$str];
					break;
				}
			//Возвращаем город если он найден или list
			if(empty($city))
				return "list";
			else
				return $city;
		} */
		
		//Конвертирование региона в транслит
		private function convertCity($str)
		{
			$city = file_get_contents(__DIR__ .'/city.json'); 
			$city = json_decode($city);
			if($city->{$str} == NULL)
				return 'list';
			else
				return $city->{$str};
		}
		
		//Генерируем URL
		public function generateurl($_search, $region = 'list', $start_price = NULL, $end_price = NULL)
		{
			//Для поиска на OLX
			$start = "search%5Bfilter_float_price%3Afrom%5D=";
			$end = "search%5Bfilter_float_price%3Ato%5D=";
			
			//Приводим строку поиска к подходящему к OLX виду
			$this->convert($_search);
			
			//Конвертируем регион в транслит
			$_region = $this->convertCity($region);
			//Дописываем регион к URL
			$this->http .= $_region.'/';
			
			//Дописываем строку поиска к URL
			$this->http .= $this->search.'/';
			if($start_price != NULL)
			{
				//Дописываем цену от к URL
				$this->http .= '?'.$start.$start_price.'/';
				if($end_price != NULL)
				{
					//Дописываем цену до к URL
					$this->http .= '&'.$end.$end_price.'/';
				}
			}
			return $this->http;
		}
		
	}
	
	$urlOlx = new UrlGenerate();
	$urlOlx_ = $urlOlx->generateurl($_GET['search']);
	$a = new Parse($urlOlx_);
	
	$array['name'] = $a->name();
	$array['price'] = $a->price();
	$array['silca'] = $a->silca();
	$array['img'] = $a->img();
	for($i = 0; $i<count($array['name']); $i++){
		$generateOLX['source'] = $site_use['site_name'];
		$generateOLX['name'] = $array['name'][$i]." ".$array['price'][$i];
		$generateOLX['url'] = $array['silca'][$i];
		$generateOLX['poster'] = $array['img'][$i];
		$outputArray[] = $generateOLX;
	}
	
	
?> 
