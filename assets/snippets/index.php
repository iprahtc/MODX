<?php
//Подключение к базе данных
	function connect_db() {
		$HOST = 'localhost';
		$USER = 'root';
		$PASSWORD = 'toor';
		$NAME_DB = 'wotch';
		$CHARSET = 'utf8';
		
		$dsn = "mysql:host=$HOST;dbname=$NAME_DB;charset=$CHARSET";
		$opt = [
			PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
			PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
			PDO::ATTR_EMULATE_PREPARES   => false,
		];
		
		try {
			$pdo = new PDO($dsn, $USER, $PASSWORD, $opt);
			return $pdo;
		}
		
		catch(PDOException $e){
			return 0;
		}
	}
	
	$pdo = connect_db();
	
	$sql = "SELECT email FROM modx_web_user_attributes uatr WHERE uatr.email = ?";
	$stmt = $pdo->prepare($sql);
	$stmt->execute(array($_POST['email']));
	$row = $stmt->fetch(PDO::FETCH_LAZY);
	
	/* echo "<pre>";
	var_dump($stmt->fetch(PDO::FETCH_LAZY));
	echo "</pre>"; */
	
	if(empty($_POST['email']) || empty($row['email']))
		echo "yes";
	else
		echo "no";
